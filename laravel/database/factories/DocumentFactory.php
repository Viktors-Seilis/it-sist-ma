<?php

namespace Database\Factories;

use App\Models\Document;
use Illuminate\Database\Eloquent\Factories\Factory;

class DocumentFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Document::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'user' => 1,
            'document_type' => 1,
            'education_type' => 2,
            'issueDate' => $this->faker->date(),
            'validDate' => $this->faker->date(),
            'education_facility' => 7,
            'faculty' => 4,
            'program' => $this->faker->text,
            'specialization' => $this->faker->text,
            'qualification' => $this->faker->text,
            'courses' => $this->faker->text,
            'theme' => $this->faker->text,
            'hourCount' => $this->faker->numberBetween(0, 128),
        ];
    }
}
