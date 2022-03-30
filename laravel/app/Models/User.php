<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Auth;
use Laravel\Passport\HasApiTokens;
use Spatie\Permission\Traits\HasPermissions;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles, HasPermissions;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'surname',
        'full_name',
        'email',
        'password',
        'personal_code',
        'phone',
        'gender',
        'education_type',
        'grade',
        'qual',
        'edu',
        'rights',
        'courses',
        'short_courses',
        'status',
        'category',
        'comment',
        'agreement',
        'agreement_date',
        'birthdate'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function scopeIsAdmin(Builder $query) {
        if(Auth::user() !== null && Auth::user()->hasPermissionTo('users.update')) {
            return $query;
        }

        return $query->where('id', '=', Auth::user()->id);
    }

    public function positions() {
        return $this->belongsToMany(Position::class, 'user_positions', 'user_id', 'position_id')
            ->withPivot('department', 'start', 'end', 'type', 'position_id');
    }

    public function documents() {
        return $this->hasMany(Document::class, 'user', 'id')->where('archived', 0);
    }

}
