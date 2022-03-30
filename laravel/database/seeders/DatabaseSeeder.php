<?php

namespace Database\Seeders;

use App\Models\Document;
use App\Models\Option;
use App\Models\User;
use Illuminate\Database\Seeder;

class atabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
//        (new UsersTableSeeder())->run();
//        (new RoleTableSeeder())->run();
//         \App\Models\Document::factory(2000)->create();

//        $users = User::all();
//
//        foreach($users as $u) {
//            if($u->education_type != NULL)
//                var_dump(['ID' => $u->id, Option::findOrFail($u->education_type)]);
//        }


//        $documents = Document::all();
//
//        foreach($documents as $d) {
//            if($d->specialization != NULL && !is_numeric($d->specialization) && $d->specialization != " ") {
//                $speciality = Option::firstOrCreate([
//                    'type' => 7,
//                    'value' => $d->specialization,
//                ]);
//
//                $d->specialization = $speciality->id;
//                $d->save();
//            } else if($d->specialization == " " || $d->specialization == "") {
//                $d->specialization = NULL;
//                $d->save();
//            }
//        }

    }
}
