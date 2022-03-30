<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return 'What are you looking for here? 🤔';
});

Route::get('/mailable', function () {
    $user = \App\Models\User::find(544);

//    return new App\Mail\RegulationUpdated(\App\Models\User::find(544),'Test 2');
});
