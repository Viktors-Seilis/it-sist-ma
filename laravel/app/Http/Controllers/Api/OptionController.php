<?php

namespace App\Http\Controllers\Api;

use App\Models\Document;
use App\Models\Position;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

use App\Models\Option;
use Illuminate\Http\Response;

class OptionController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        $values = [];

        $values['document_types'] =
            [   'title' => 'Dokumentu tipi',
                'data' => Option::where('type', '0')->select('value as text', 'id as value')->orderBy('text')->get()
            ];
        $values['education_types'] =
            [   'title' => 'Izglītības veidi',
                'data' => Option::where('type', '1')->select('value as text', 'id as value')->orderBy('text')->get()
            ];
        $values['education_facility'] =
            [   'title' => 'Mācību iestādes',
                'data' => Option::where('type', '2')->select('value as text', 'id as value')->orderBy('text')->get()
            ];
        $values['faculty'] =
            [   'title' => 'Fakultātes',
                'data' => Option::where('type', '3')->select('value as text', 'id as value')->orderBy('text')->get()
            ];
        $values['departments'] =
            [   'title' => 'Nodaļas',
                'data' => Option::where('type', '4')->select('value as text', 'id as value')->orderBy('text')->get()
            ];
        $values['positions'] =
            [   'title' => 'Amati',
                'data' => Position::select('name as text', 'id as value')->orderBy('text')->get()
            ];
        $values['grades'] =
            [   'title' => 'Grādi',
                'data' => Option::where('type', '5')->select('value as text', 'id as value')->orderBy('text')->get()
            ];
        $values['quals'] =
            [   'title' => 'Kvalifikācijas',
                'data' => Option::where('type', '6')->select('value as text', 'id as value')->orderBy('text')->get()
            ];
        $values['specialities'] =
            [   'title' => 'Specialitātes',
                'data' => Option::where('type', '7')->select('value as text', 'id as value')->orderBy('text')->get()
            ];
        $values['courses'] =
            [   'title' => 'Kursi',
                'data' => Option::where('type', '9')->select('value as text', 'id as value')->orderBy('text')->get()
            ];
        $values['themes'] =
            [   'title' => 'Tēmas',
                'data' => Option::where('type', '10')->select('value as text', 'id as value')->orderBy('text')->get()
            ];
        $values['programs'] =
            [   'title' => 'Programmas',
                'data' => Option::where('type', '11')->select('value as text', 'id as value')->orderBy('text')->get()
            ];
        $values['places'] =
            [   'title' => 'Telpas/vietas',
                'data' => Option::where('type', '12')->select('value as text', 'id as value')->orderBy('text')->get()
            ];
        $values['units'] =
            [   'title' => 'Struktūrvienības',
                'data' => Option::where('type', '13')->select('value as text', 'id as value')->orderBy('text')->get()
            ];

        return $this->sendResponse($values, 'option list');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return JsonResponse
     */
    public function store(Request $request): JsonResponse
    {
        $request->validate([
            'type' => 'required|integer',
            'value' => 'required',
        ]);

        $option = Option::create([
            'type' => $request->type,
            'value' => $request->value,
        ]);

        return $this->sendResponse($option, 'option saved');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        return $this->sendResponse(Option::findOrFail($id), 'returns option');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        $option = Option::findOrfail($id);

        $option->update($request->all());

        return $this->sendResponse($option, 'option updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        $option = Option::findOrFail($id);
        try {
            $option->delete();
        } catch (\Illuminate\Database\QueryException $e) {
            $documents = Document::where('document_type', $option->id)
                ->orWhere('education_type', $option->id)
                ->orWhere('education_facility', $option->id)
                ->orWhere('faculty', $option->id)
                ->orWhere('program', $option->id)
                ->orWhere('specialization', $option->id)
                ->orWhere('qualification', $option->id)
                ->orWhere('courses', $option->id)
                ->orWhere('theme', $option->id)
                ->get();

            return $this->sendError($documents, 'unable to delete option', 403);
        }

        return $this->sendResponse($option, 'option deleted');
    }
}
