<?php

namespace App\Http\Requests;

use App\Rules\FirstLetterRule;
use Illuminate\Foundation\Http\FormRequest;

class SpaceFlightRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'flight_number' => [
                'required',
                'max:255',
                function ($attribute, $value, $fail) {
                    $this->AllUp($attribute, $value, $fail);
                }
            ],
            'destination' => [
                'required',
                'max:255',
                new FirstLetterRule()
            ],
            'launch_date' => 'required|date_format:Y-m-d',
            'seats_available' => 'required|min:1|numeric',
        ];
    }

    private function AllUp($attribute, $value, $fail)
    {
        if(mb_strtoupper($value) !== $value){
            $fail('только заглавные');
        }
    }
}
