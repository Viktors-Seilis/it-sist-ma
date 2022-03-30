<?php

namespace App\Http\Controllers\Api;

use App\Exports\DocumentsStatisticsExport;
use App\Http\Resources\UserListResource;
use App\Http\Resources\UserStatisticsResource;
use App\Models\Document;
use App\Models\Option;
use App\Models\Position;
use App\Sorts\SurnameSort;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Facades\Excel;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\AllowedSort;
use Spatie\QueryBuilder\QueryBuilder;

class UserController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @param  Request  $request
     * @return JsonResponse
     */
    public function index(Request $request): JsonResponse
    {
        $users = null;

        if($request->get('page')) {
            $users = QueryBuilder::for(User::class)
                ->allowedSorts([
                    AllowedSort::custom('name', new SurnameSort(), 'name'),
                    AllowedSort::custom('surname', new SurnameSort(), 'surname'),
                ])
                ->allowedFilters([
                    AllowedFilter::callback('name', function (Builder $query, $value) {
                        $query->whereRaw("CONCAT(name, ' ',surname) ILIKE '%{$value}%'");
                    }),
                ])->isAdmin()
                ->where('archived', 0)
                ->jsonPaginate();

            $users = UserListResource::collection($users);
        } else {
            $users = User::isAdmin()->get();
        }

        return $this->sendResponse($users, "User list");
    }

    public function archived(Request $request): JsonResponse
    {
        $users = null;

        if($request->get('page')) {
            $users = QueryBuilder::for(User::class)
                ->allowedSorts('name', 'surname')
                ->allowedFilters([
                    AllowedFilter::callback('name', function (Builder $query, $value) {
                        $query->whereRaw("name LIKE '{$value}%' OR surname LIKE '{$value}%'");
                    }),
                ])->isAdmin()
                ->where('archived', 1)
                ->jsonPaginate();

            $users = UserListResource::collection($users);
        } else {
            $users = User::isAdmin()->get();
        }


        return $this->sendResponse($users, "User list");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return JsonResponse
     */
    public function store(Request $request): JsonResponse
    {
//        return $this->sendResponse($request->all(), "test");

        $request->validate([
            'name' => 'required',
            'surname' => 'required',
            'personal_code' => [
                'required',
                'unique:users',
                'regex:/((0[1-9]|[1-2]\d|3[0-1])(0[1-9]|1[0-2])(\d{2})-(\d{5}))$/'
            ],
            'email' => 'required|unique:users',
            'roles' => 'required'
        ]);

        $user = User::create($request->except(['education_type', 'grade', 'qual']));

        if($request->education_type) {
            $education_type = Option::firstOrCreate([
                'type' => 1,
                'value' => $request->education_type,
            ]);

            $user->education_type = $education_type->id;
        }

        if($request->grade) {
            $grades = Option::firstOrCreate([
                'type' => 5,
                'value' => $request->grade
            ]);

            $user->grade = $grades->id;
        }

        if($request->qual) {
            $quals = Option::firstOrCreate([
                'type' => 6,
                'value' => $request->qual
            ]);

            $user->qual = $quals->id;
        }

//        if($request->education_type) {
//            $education_type = Option::firstOrCreate([
//                'value' => $request->education_type
//            ]);
//
//            $user->education_type = $education_type->id;
//        }

        if($request->positions) {
            foreach($request->positions as $pos) {
                if($pos['post'] != null) {
                    $name = Position::firstOrCreate([
                        'name' => $pos['post']
                    ]);

                    $dep = Option::firstOrCreate([
                        'type' => 4,
                        'value' => $pos['department']
                    ]);

                    $pos['department'] = $dep->id;

                    unset($pos['post']);

                    $user->positions()->attach($name->id, $pos);
                }
            }
        }

        $user->save();

        $user->assignRole($request->roles);

        return $this->sendResponse($user, 'user saved');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return JsonResponse
     */
    public function show(int $id): JsonResponse
    {
        return $this->sendResponse(new UserListResource(User::findOrFail($id)), 'returns user');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return JsonResponse
     */
    public function update(Request $request, int $id): JsonResponse
    {
//        return $this->sendResponse($request->all(), "test");

        $request->validate([
            'name' => 'required',
            'surname' => 'required',
            'personal_code' => [
                'required',
                Rule::unique('users')->ignore($id),
                'regex:/((0[1-9]|[1-2]\d|3[0-1])(0[1-9]|1[0-2])(\d{2})-(\d{5}))$/'
            ],
            'email' => 'required',
            'roles' => 'required'
        ]);

        $user = User::findOrFail($id);

        $user->update($request->except(['education_type', 'grade', 'qual']));

        if($request->education_type) {
            $education_type = Option::firstOrCreate([
                'type' => 1,
                'value' => $request->education_type,
            ]);

            $user->education_type = $education_type->id;
        }

        if($request->grade) {
            $grades = Option::firstOrCreate([
                'type' => 5,
                'value' => $request->grade
            ]);

            $user->grade = $grades->id;
        }

        if($request->qual) {
            $quals = Option::firstOrCreate([
                'type' => 6,
                'value' => $request->qual
            ]);

            $user->qual = $quals->id;
        }

//        if($request->education_type) {
//            $education_type = Option::firstOrCreate([
//                'value' => $request->education_type
//            ]);
//
//            $user->education_type = $education_type->id;
//        }

        if($request->positions) {
            $user->positions()->detach();
            foreach($request->positions as $pos) {
                if($pos['post'] != null) {
                    $name = Position::firstOrCreate([
                        'name' => $pos['post']
                    ]);

                    $dep = Option::firstOrCreate([
                        'type' => 4,
                        'value' => $pos['department']
                    ]);

                    $pos['department'] = $dep->id;

                    unset($pos['post']);

                    $user->positions()->attach($name->id, $pos);
                }
            }
        }

        $user->save();

        $user->syncRoles($request->roles);

        return $this->sendResponse($user, 'user updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return JsonResponse
     */
    public function destroy($id)
    {
        $user = User::findOrfail($id);

        $user->archived = true;

        $user->save();

        $apps = Document::where('user', $user->id)->get();

        foreach($apps as $app) {
            $app->archived = 1;
            $app->save();
        }

        return $this->sendResponse($apps, 'user archived');
    }

    public function delete($id)
    {
        $user = User::findOrfail($id);

        $apps = Document::where('user', $user->id)->get();

        $user->syncRoles();

        $user->save();

        foreach($apps as $app) {
            $app->delete();
        }

        $user->delete();

        return $this->sendResponse($apps, 'user deleted');
    }

    public function restore(int $id): JsonResponse
    {
        $user = User::findOrfail($id);

        $user->archived = false;

        $user->save();

        $apps = Document::where('user', $user->id)->get();

        foreach($apps as $app) {
            $app->archived = 0;
            $app->save();
        }

        return $this->sendResponse($user, 'user restored');
    }

    public function export_statistics() {
        return Excel::download(new DocumentsStatisticsExport(), 'statistics.xlsx');
    }

    public function statistics(Request $request): JsonResponse
    {
        $users = QueryBuilder::for(User::class)
            ->allowedFilters([
                AllowedFilter::callback('age', function (Builder $query, $value) {
                    $query->where(function($query) use ($value) {
                        $query->where('birthdate', '<=', Carbon::now()->subYears($value[0]));
                        $query->where('birthdate', '>=', Carbon::now()->subYears($value[1]));
                    });
                }),
                AllowedFilter::callback('gender', function (Builder $query, $value) {
                    $query->where(function($query) use ($value) {
                        if($value[0] !== false) {
                            $query->where('gender', $value[0]);
                        }

                        if($value[1] !== false) {
                            $query->orWhere('gender', $value[1] == 1 ? 0 : NULL);
                        }
                    });
                }),
            ])
            ->where('archived', '0')
            ->get();

        return $this->sendResponse($users, 'list returned');
    }

}
