<?php

namespace App\Http\Controllers;

use App\Models\Client;
use Illuminate\Http\Request;

class ClientController extends Controller
{
    public function index()
    {
        return response()->json(Client::all());
    }

    public function store(Request $request)
    {
        $data = $request->all();
        $data['client_creatorid'] = auth('api')->user()->id;
        $client = Client::create($data);
        return response()->json($client, 201);
    }

    public function show($id)
    {
        $client = Client::find($id);
        if (!$client) {
            return response()->json(['error' => 'Client not found'], 404);
        }
        return response()->json($client);
    }

    public function update(Request $request, $id)
    {
        $client = Client::find($id);
        if (!$client) {
            return response()->json(['error' => 'Client not found'], 404);
        }
        $client->update($request->all());
        return response()->json($client);
    }

    public function destroy($id)
    {
        $client = Client::find($id);
        if (!$client) {
            return response()->json(['error' => 'Client not found'], 404);
        }
        $client->delete();
        return response()->json(['message' => 'Client deleted']);
    }
}
