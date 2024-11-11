<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use phpDocumentor\Reflection\Types\Collection;

/**
 *@property int $id
 *@property string $first_name
 *@property string $last_name
 *@property string $patronymic
 *@property string $email
 *@property string $password
 *@property string $birth_date
 *
 * @property-read string $fullName
 * @property-read \Illuminate\Database\Eloquent\Collection<LunarMission> $lunarMissions
 */
class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'first_name',
        'last_name',
        'patronymic',
        'email',
        'password',
        'birth_date'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function lunarMissions(): HasMany
    {
        return $this->hasMany(LunarMission::class, 'user_id', 'id');
    }
    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'password' => 'hashed',
        ];
    }


    /**
     * @return Attribute
     */
    public function fullName(): Attribute
    {
        return Attribute::get(function (){
            $this->first_name.' '.$this->last_name.' '.$this->patronymic;
        });
    }
}
