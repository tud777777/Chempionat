<?php

namespace App\Http\Controllers;

use App\Http\Requests\AuthRequest;
use App\Http\Requests\RegistrationRequest;
use App\Models\User;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\HttpKernel\Exception\NotAcceptableHttpException;

class AuthController extends Controller
{
    /**
     * @param RegistrationRequest $request
     * @return JsonResponse
     */
    public function registration(RegistrationRequest $request)
    {
        /** @var User $user */
        $user = User::query()->create($request->validated());

        return response()->json(['data' => [
            'user'=> [
                'name'=> $user->first_name.' '.$user->last_name.' '.$user->patronymic,
                'email'=> $user->email,
                ],
            'code' => 201,
            'message' => "Пользователь создан"
            ]
        ], 201);
    }


    /**
     * @param AuthRequest $request
     * @return JsonResponse
     */
    public function authorization(AuthRequest $request): JsonResponse
    {
        if(auth()->attempt($request->validated()))
        {
            /** @var User $user */
            $user = auth()->user();
            return response()->json(['data' => [
                'user'=> [
                    'name'=> $user->first_name.' '.$user->last_name.' '.$user->patronymic,
                    'birth_date' => $user->birth_date,
                    'email'=> $user->email,
                ],
                'token' => $user->createToken('token')->plainTextToken
            ]]);
        }

        return throw new AuthenticationException();
    }

    /**
     * @return Response
     */
    public function logout()
    {
        auth()->user()->currentAccessToken()->delete();
        return response()->noContent();
    }
}

