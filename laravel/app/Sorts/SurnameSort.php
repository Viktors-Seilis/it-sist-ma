<?php

namespace App\Sorts;

class SurnameSort implements \Spatie\QueryBuilder\Sorts\Sort
{
    public function __invoke(\Illuminate\Database\Eloquent\Builder $query, bool $descending, string $property)
    {
        $direction = $descending ? 'DESC' : 'ASC';

        $query->orderByRaw("LEFT({$property}, 1) {$direction}, {$property} {$direction}");
    }
}
