<?php

namespace App\Http\Controllers;

use App\Models\Ticket;
use Illuminate\Http\Request;

class TicketController extends Controller
{
    public function index()
    {
        return response()->json(Ticket::all());
    }

    public function store(Request $request)
    {
        $data = $request->all();
        $data['ticket_creatorid'] = auth('api')->user()->id;
        $ticket = Ticket::create($data);
        return response()->json($ticket, 201);
    }

    public function show($id)
    {
        $ticket = Ticket::find($id);
        if (!$ticket) {
            return response()->json(['error' => 'Ticket not found'], 404);
        }
        return response()->json($ticket);
    }

    public function update(Request $request, $id)
    {
        $ticket = Ticket::find($id);
        if (!$ticket) {
            return response()->json(['error' => 'Ticket not found'], 404);
        }
        $ticket->update($request->all());
        return response()->json($ticket);
    }

    public function destroy($id)
    {
        $ticket = Ticket::find($id);
        if (!$ticket) {
            return response()->json(['error' => 'Ticket not found'], 404);
        }
        $ticket->delete();
        return response()->json(['message' => 'Ticket deleted']);
    }
}
