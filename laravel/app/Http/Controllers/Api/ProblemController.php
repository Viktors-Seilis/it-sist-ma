<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use App\Http\Resources\DocumentViewResource;
use App\Http\Resources\ProblemResource;
use App\Http\Resources\ProblemViewResource;
use App\Models\Document;
use App\Models\Option;
use App\Models\Problems;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;


class ProblemController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     */
    public function index()
    {
        $problem = Problems::paginate(10);
        return ProblemResource::collection($problem);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function store(Request $request)
    {
        $request->validate([
            'user' => 'required',
            'problem_name' => 'required',
            'problem_description' => 'required',
            'priority' => 'required',
            'room' => 'required',
            'due_date' => 'required',
        ]);

        $problem = Problems::create([

            'user' => $request->user,
            'problem_name' => $request->problem_name,
            'problem_description' => $request->problem_description,
            'priority' => $request->priority,
            'departments' => 1,
            'units' => 1,
            'room' => $request->room,
            'due_date' => $request->due_date,


        ]);
        if($request->departments) {
            $departments = Option::firstOrCreate([
                'type' => 4,
                'value' => $request->departments,
            ]);
            $problem->departments = $departments->id;
        }

            if($request->units) {
                $units = Option::firstOrCreate([
                    'type' => 13,
                    'value' => $request->units,
                ]);

                $problem->units = $units->id;
            }



            $problem->save();

            return $this->sendResponse($problem, 'Problem saved');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return JsonResponse
     */
    public function show($id): JsonResponse
    {
        return $this->sendResponse(new ProblemViewResource(Problems::findOrFail($id)), 'problem returned');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param  int  $id
     * @return JsonResponse
     */
    public function update(Request $request, $id)
    {

        $request->validate([
            'user' => 'required',
            'problem_name' => 'required',
            'problem_description' => 'required',
            'priority' => 'required',
            'room' => 'required',
            'due_date' => 'required',
        ]);

        $problem = Problems::findOrFail($id);

        $problem->user = $request->user;
        $problem->problem_name = $request->problem_name;
        $problem->problem_description = $request->problem_description;
        $problem->priority = $request->priority;
        $problem->room = $request->room;
        $problem->due_date = $request->due_date;
        if (!empty($problem->fixer)) {
            $problem->fixer = $problem->fixer;
        }


        if($request->departments) {
            $departments = Option::firstOrCreate([
                'type' => 4,
                'value' => $request->departments,
            ]);
            $problem->departments = $departments->id;
        }

            if($request->units) {
                $units = Option::firstOrCreate([
                    'type' => 13,
                    'value' => $request->units,
                ]);

                $problem->units = $units->id;
            }




        $problem->save();

        return $this->sendResponse($problem, 'Problem updated');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $problem = Problems::findOrfail($id);

        $problem->archived = true;

        $problem->save();

        return $this->sendResponse($problem, 'Problem archived');
    }
}
