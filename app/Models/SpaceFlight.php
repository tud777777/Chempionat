<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $flight_number
 * @property string $destination
 * @property string $launch_date
 * @property int $seats_available
 */
class SpaceFlight extends Model
{
    protected $fillable = [
        'flight_number',
        'destination',
        'launch_date',
        'seats_available',
    ];

}
