<?php

namespace App\Http\Resources;

use App\Models\LunarMission;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin LunarMission
 */
class SearchMissionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'type' => 'Mission',
            'name' => $this->name,
            'launch_details' => $this->launch_details['launch_date'],
            'landing_details' => $this->landing_details['landing_date'],
            'crew' => $this->spacecraft['crew'],
            'landing_site' => $this->landing_details['landing_site']['name'],
        ];
    }
}
