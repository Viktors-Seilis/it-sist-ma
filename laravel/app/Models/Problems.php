<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use PHPUnit\TextUI\CliArguments\Builder;

/**
 * @method static findOrFail(int $id)
 */
class Problems extends Model
{
    use HasFactory;

    protected $fillable = [
        'user',
        'problem_name',
        'problem_description',
        'priority',
        'departments',
        'units',
        'room',
        'due_date',
        'archived',
        'fixer',
    ];


    public function userObject() {
        return $this->belongsTo(User::Class, 'user', 'id');
    }

    public function departmentsObject() {
        return $this->belongsTo(Option::Class, 'departments', 'id')->where('type', '=', '4');
    }

    public function unitsObject() {
        return $this->belongsTo(Option::Class, 'units', 'id')->where('type', '=', '13');
    }
    public function fixerObject() {
        return $this->belongsTo(User::Class, 'fixer', 'id');
    }


    public function scopeIsAdmin(Builder $query) {
            return $query;
        }
}
