<?php

namespace App\Http\Controllers;

use App\Http\Requests\LunarMissionRequest;
use App\Http\Resources\LunarMissionResource;
use App\Http\Resources\SearchMissionResource;
use App\Models\LunarMission;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Http\Response;

class LunarMissionController extends Controller
{
    /**
     * @return AnonymousResourceCollection
     */
    public function index(): AnonymousResourceCollection
    {
        return LunarMissionResource::collection(LunarMission::query()->get());
    }

    /**
     * @param LunarMissionRequest $request
     * @return JsonResponse
     */
    public function store(LunarMissionRequest $request)
    {

        /** @var User $user */
        $user = auth()->user();
        $user->lunarMissions()->create($request->validated()['mission']);
        return response()->json([
            'data' => [
                'code' => 201,
                'message' => "Миссия добавлена"
            ]
        ], 201);
    }


    /**
     * @param LunarMission $mission
     * @return LunarMissionResource
     */
    public function show(LunarMission $mission): LunarMissionResource
    {
        return LunarMissionResource::make($mission);
    }

    /**
     * @param LunarMission $mission
     * @return Response|string
     */
    public function delete(LunarMission $mission): \Illuminate\Http\Response|string
    {
        $mission->delete();
        return response()->noContent();
    }

    /**
     * @param LunarMissionRequest $request
     * @param LunarMission $mission
     * @return array[]
     */
    public function update(LunarMissionRequest $request, LunarMission $mission): array
    {
        $mission->update($request->validated()['mission']);
        return [
            'data' => [
                'code' => 200,
                "message" => "Миссия обновлена"
            ]
        ];
    }

    public function search()
    {
        $query = request()->input('query','');
        $mission = LunarMission::query()
            ->where('name','like','%'.$query.'%')
            ->orWhereJsonContains('spacecraft->crew', [["name" => $query]])
            ->get();
        return SearchMissionResource::collection($mission);
    }
}
