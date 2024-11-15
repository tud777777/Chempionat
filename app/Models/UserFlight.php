<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * @property int $id
 * @property int $user_id
 * @property int $flight_id
 */
class UserFlight extends Model
{
    protected $fillable = [
        'user_id',
        'flight_id',
    ];


}
