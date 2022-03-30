<?php

namespace App\Http\Resources;

use App\Models\Option;
use App\Models\Position;
use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class UserListResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'surname' => $this->surname,
            'email' => $this->email,
            'personal_code' => $this->personal_code,
            'phone' => $this->phone,
            'gender' => $this->gender,
            'edu' => $this->edu,
            'rights' => $this->rights,
            'courses' => $this->courses,
            'short_courses' => $this->short_courses,
            'status' => $this->status,
            'category' => $this->category,
            'comment' => $this->comment,
            'agreement' => $this->agreement,
            'agreement_date' => Carbon::create($this->agreement_date)->format('Y-m-d'),
            'birthdate' => Carbon::create($this->birthdate)->format('Y-m-d'),
            'education_type' => Option::where('id', $this->education_type)->first(),
            'grade' => Option::where('id', $this->grade)->first(),
            'qual' => Option::where('id', $this->qual)->first(),
            'positions' => $this->positions,
            'roles' => $this->getRoleNames(),
        ];
    }
}
