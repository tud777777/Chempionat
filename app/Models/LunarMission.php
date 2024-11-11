<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LunarMission extends Model
{
    protected $fillable = [
        'name',
        'launch_details',
        'landing_details',
        'spacecraft',
        'user_id'
    ];

    protected $casts =[
        'name' => 'string',
        'launch_details' => 'json',
        'landing_details' => 'json',
        'spacecraft' => 'json',
    ];
}
