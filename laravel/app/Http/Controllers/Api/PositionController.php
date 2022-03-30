<?php

namespace App\Http\Controllers\Api;

use App\Models\Position;
use App\Models\User;
use Illuminate\Http\Request;

class ositionController extends BaseController
{
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        return $this->sendResponse(Position::findOrFail($id), 'returns positions');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        $option = Position::findOrfail($id);

        $option->update($request->all());

        return $this->sendResponse($option, 'position updated');
    }

    public function destroy(Position $position) {
        try {
            $position->delete();
        } catch (\Illuminate\Database\QueryException $e) {
            $users = User::whereHas('positions', function ($query) use ($position) {
                $query->where('position_id', $position->id);
            })->get();

            return $this->sendError($users, 'unable to delete position', 403);
        }

        return $this->sendResponse($position, 'position deleted');
    }
}
