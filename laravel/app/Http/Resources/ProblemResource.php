<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class ProblemResource extends JsonResource
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
            'name' => $this->userObject->name,
            'surname' => $this->userObject->surname,
            'namefixer' => $this->fixerObject === null ? '' : $this->fixerObject->name,
            'surnamefixer' => $this->fixerObject === null ? '' : $this->fixerObject->surmane,
            'problem_name' => $this->problem_name,
            'problem_description' => $this->problem_description,
            'priority' => $this->priority,
            'departments' => $this->departmentsObject === null ? '' : $this->departmentsObject->value,
            'units' => $this->unitsObject === null ? '' : $this->unitsObject->value,
            'room' => $this->room,
            'due_date' => $this->due_date ? Carbon::create($this->due_date)->format('Y-m-d') : '',
            'created_at' => $this->created_at->format('Y-m-d'),

        ];
    }
}
