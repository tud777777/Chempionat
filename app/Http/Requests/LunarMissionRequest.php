<?php

namespace App\Http\Requests;

use App\Rules\FirstLetterRule;
use Illuminate\Foundation\Http\FormRequest;

class LunarMissionRequest extends FormRequest
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'mission'=> 'required',
            'mission.name' => [
                'required',
                'max:255',
                new FirstLetterRule()
            ],
            'mission.launch_details'=> 'required',
            'mission.launch_details.launch_date'=> 'required|date_format:Y-m-d',
            'mission.launch_details.launch_site'=> 'required',
            'mission.launch_details.launch_site.name'=> 'required',
            'mission.launch_details.launch_site.location'=> 'required',
            'mission.launch_details.launch_site.location.latitude'=> [
                'required',
                function ($attribute, $value, $fail) {
                    $this->valLat($attribute,$value,$fail);
                }
            ],
            'mission.launch_details.launch_site.location.longitude'=> [
                'required',
                function ($attribute, $value, $fail) {
                    $this->valLon($attribute,$value,$fail);
                }
            ],
            'mission.landing_details'=> 'required',
            'mission.landing_details.landing_date'=> 'required|date_format:Y-m-d',
            'mission.landing_details.landing_site'=> 'required',
            'mission.landing_details.landing_site.name'=> 'required',
            'mission.landing_details.landing_site.coordinates'=> 'required',
            'mission.landing_details.landing_site.coordinates.latitude'=> [
                'required',
                function ($attribute, $value, $fail) {
                    $this->valLat($attribute,$value,$fail);
                }
            ],
            'mission.landing_details.landing_site.coordinates.longitude'=> [
                'required',
                function ($attribute, $value, $fail) {
                    $this->valLon($attribute,$value,$fail);
                }
            ],
            'mission.spacecraft'=> 'required',
            'mission.spacecraft.command_module'=> 'required',
            'mission.spacecraft.lunar_module'=> 'required',
            'mission.spacecraft.crew'=> 'required|array',
            'mission.spacecraft.crew.*.name'=> 'required',
            'mission.spacecraft.crew.*.role'=> 'required',
        ];
    }

    private function valLat($attribute, $value, $fail)
    {
        $value = (float)$value;
        if($value<-90 || $value>90){
            $fail('неправильная latitude');
        }
    }

    private function valLon($attribute, $value, $fail)
    {
        $value = (float)$value;
        if($value<-180 || $value>180){
            $fail('неправильная longitude');
        }
    }
}
