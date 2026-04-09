<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Client;
use App\Models\Project;
use App\Models\Task;

class DashboardController extends Controller
{
    public function stats()
    {
        return response()->json([
            'clients'          => Client::count(),
            'clients_active'   => Client::where('client_status', 'active')->count(),
            'clients_inactive' => Client::where('client_status', 'inactive')->count(),
            'projects'         => Project::count(),
            'tasks'            => Task::count(),
            'recent_clients'   => Client::orderBy('client_created', 'desc')
                                    ->limit(5)
                                    ->get(['client_id','client_company_name','client_phone','client_status','client_created']),
        ]);
    }
}