<?php

use App\Http\Controllers\Api\DocumentController;
use App\Http\Controllers\Api\EventController;
use App\Http\Controllers\Api\OptionController;
use App\Http\Controllers\Api\RegulationController;
use App\Http\Controllers\Api\RoleController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('login', [AuthController::class, 'login'])->name('login');

Route::middleware('auth:api')->group(function () {
    Route::get('/me', [AuthController::class, 'me'])->name('me');
    Route::get('/logout', [AuthController::class, 'logout'])->name('logout');

    Route::resource('users', UserController::class)->only('index');

    Route::group(['middleware' => ['permission:options.create']], function () {
        Route::resource('options', OptionController::class)->only('store');
    });

    Route::group(['middleware' => ['permission:problems.create']], function () {
        Route::resource('problems', OptionController::class)->only('store');
    });

    Route::group(['middleware' => ['permission:options.update']], function () {
        Route::resource('options', OptionController::class)->only('update', 'show');
    });

    Route::group(['middleware' => ['permission:options.destroy']], function () {
        Route::resource('options', OptionController::class)->only('destroy');
    });

    Route::group(['middleware' => ['permission:archives.manage']], function () {
        Route::get('/archive/problems', [\App\Http\Controllers\Api\ProblemController::class, 'delete']);
    });


    Route::get('problems', [\App\Http\Controllers\Api\ProblemController::class, 'index']);

    Route::post('problems', [\App\Http\Controllers\Api\ProblemController::class, 'store']);

    Route::get('problems/{id}', [\App\Http\Controllers\Api\ProblemController::class, 'show']);
    Route::get('problems/{id}', [\App\Http\Controllers\Api\ProblemController::class, 'show']);

    Route::put('problems/{id}', [\App\Http\Controllers\Api\ProblemController::class, 'update']);

    Route::delete('problems/{id}', [\App\Http\Controllers\Api\ProblemController::class, 'destroy']);

    Route::resource('options', OptionController::class)->only('index');
});

