<?php

namespace App\Http\Requests;

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
            'flight_number' => 'required|max:255',
            'destination' => 'required|max:255',
            'launch_date' => 'required|date_format:Y-m-d',
            'seats_available' => 'required|min:1|numeric',
        ];
    }
}
