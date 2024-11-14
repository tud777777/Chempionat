<?php

namespace App\Http\Controllers;

use App\Http\Requests\SpaceFlightRequest;
use App\Models\SpaceFlight;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use function Laravel\Prompts\select;

class SpaceFlightController extends Controller
{
    /**
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return response()->json([
            'data' => SpaceFlight::query()->select(['flight_number','destination','launch_date','seats_available'])->get()
        ]);

    }

    /**
     * @param SpaceFlightRequest $request
     * @return JsonResponse
     */
    public function store(SpaceFlightRequest $request): JsonResponse
    {
        SpaceFlight::query()->create($request->validated());
        return response()->json([
            'data' => [
                'code' => 201,
                'message' => 'Космический полет создан'
            ]
        ],201);
    }

    public function book()
    {
        $flightNumber = request()->input('flight_number');
        $spaceFlight = SpaceFlight::query()->where('flight_number',$flightNumber)->first();
        if($spaceFlight==null){
            throw new NotFoundHttpException();
        }
        return $spaceFlight;
    }
}
