<?php

namespace App\Policies;

use App\Models\User;

class LunarMissionPolicy
{
    /**
     * @param User $user
     * @param \App\Models\LunarMission $mission
     * @return bool
     */
    public function manage(User $user, \App\Models\LunarMission $mission): bool
    {
        return $user->id === $mission->user_id;
    }
}
