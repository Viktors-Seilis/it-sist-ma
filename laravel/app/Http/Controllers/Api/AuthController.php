<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\UserResource;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\GuzzleException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\Api\BaseController as BaseController;
use App\Models\User;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AuthController extends BaseController
{
    /**
     * Login api
     *
     * @param  Request  $request
     * @return JsonResponse
     * @throws GuzzleException
     */
    public function login(Request $request): JsonResponse
    {
        $request->validate([
            'access_token' => 'required',
        ]);

        $client = new Client(['verify' => 'C:\php\extras\ssl\cacert.pem']); /*local only*/
//        $client = new Client();

        $response = $client->get('https://graph.microsoft.com/v1.0/me', [
            'headers' => [
                'Authorization' => 'Bearer '.$request->access_token,
            ]
        ]);

        if($response->getStatusCode() == 200) {
            $data = json_decode($response->getBody()->getContents());
            $user = User::whereRaw("lower(email) =  lower('{$data->mail}')")->first();

            if($user) {
                $user->token = $user->createToken('Personaldala')->accessToken;
                $success = new UserResource($user);
                return $this->sendResponse($success, 'User login successfully.');
            } else {
                return $this->sendError('Jūsu lietotājs netika atrasts sistēmā.', ['error' => 'Unauthorised']);
            }
        }

        return $this->sendError('Unauthorised.', ['error' => 'Unauthorised']);

    }

    public function me(Request $request): JsonResponse
    {
        $user = $request->user();
        $user->token = null;

        return $this->sendResponse(new UserResource($user), 'You are authenticated');
    }

    public function logout(Request $request): JsonResponse
    {
        return $this->sendResponse($request->user()->token()->revoke(), "You're token is revoked");
    }

}
