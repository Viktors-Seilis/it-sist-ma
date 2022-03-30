<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\RegulationResource;
use App\Jobs\SendEmail;
use App\Models\Document;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Models\Regulation;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Mail;

class RegulationController extends BaseController
{
    public function index(): \Illuminate\Http\JsonResponse
    {
        $data = [];
        $data['documents'] = Regulation::where('type', 0)->get();
        $data['instructions'] = Regulation::where('type', 1)->get();

        return $this->sendResponse($data, 'return all regulations');
    }

    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $request->validate([
            'name' => 'required',
            'type' => 'required',
            'updated_at' => 'required',
            'file' => 'required',
        ]);

        $regulation = Regulation::create($request->all());

        if($request->file('file')) {
            $file = $request->file('file');
            $file->store('public/na');
            $regulation->file = $file->hashName();
        }

        $regulation->updated_at = $request->updated_at;

        $regulation->save(['timestamps' => false]);

        if($request->email == 1) {
            SendEmail::dispatch($request->name);
        }

        return $this->sendResponse($regulation, 'regulation created');
    }

    public function update(Request $request, $id)
    {
        $regulation = Regulation::findOrFail($id);

        $request->validate([
            'name' => 'required',
            'type' => 'required',
            'updated_at' => 'required',
        ]);

        $regulation->update($request->all());

        if($request->file('file')) {
            $file = $request->file('file');
            $file->store('public/na');
            $regulation->file = $file->hashName();
        }

        $regulation->updated_at = $request->updated_at;

        $regulation->save(['timestamps' => false]);

        if($request->email == 1) {
            SendEmail::dispatch($request->name);
        }

        return $this->sendResponse($request->email, 'regulation updated');
    }

    public function destroy($id)
    {
        $regulation = Regulation::findOrFail($id);
        $regulation->delete();

        return $this->sendResponse($regulation, 'regulation deleted');
    }

    public function show(int $id): JsonResponse
    {
        return $this->sendResponse(new RegulationResource(Regulation::findOrFail($id)), 'regulation returned');
    }
}
