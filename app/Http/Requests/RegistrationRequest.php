<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RegistrationRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'first_name' => 'required|string|max:255|regex:/^[А-ЯЁA-Z]/u',
            'last_name' => 'required|string|max:255|regex:/^[А-ЯЁA-Z]/u',
            'patronymic' => 'required|string|max:255|regex:/^[А-ЯЁA-Z]/u',
            'email' => 'required|email|max:255|unique:users,email',
            'password' => 'required|string|min:3|regex:/^(?=.{3,})(?=.*[a-zA-Z])(?=.*\d)$/',
            'birth_date' => 'required|string|max:255',
        ];
    }
}
