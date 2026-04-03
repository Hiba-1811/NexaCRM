<?php
namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index()
    {
        return response()->json(User::all(['id', 'first_name', 'last_name', 'email', 'type', 'status', 'created']));
    }

    public function store(Request $request)
    {
        $data = $request->all();
        $data['password'] = bcrypt($request->password);
        $data['unique_id'] = 'USR' . rand(1000, 9999);
        $data['type'] = $request->type ?? 'admin';
        $data['created'] = now();
        $data['updated'] = now();
        $data['account_owner'] = 'no';
        $data['primary_admin'] = 'no';
        $data['pref_email_notifications'] = 'yes';
        $data['force_password_change'] = 'no';
        $data['notifications_system'] = 'yes';
        $data['notifications_new_project'] = 'yes';
        $data['notifications_projects_activity'] = 'yes';
        $data['notifications_billing_activity'] = 'yes';
        $data['notifications_new_assignement'] = 'yes';
        $data['notifications_leads_activity'] = 'yes';
        $data['notifications_tasks_activity'] = 'yes';
        $data['notifications_tickets_activity'] = 'yes';
        $data['notifications_reminders'] = 'yes';
        $user = User::create($data);
        return response()->json($user, 201);
    }

    public function update(Request $request, $id)
    {
        $user = User::find($id);
        if (!$user) return response()->json(['error' => 'Not found'], 404);
        $data = $request->all();
        if ($request->password) {
            $data['password'] = bcrypt($request->password);
        } else {
            unset($data['password']);
        }
        $user->update($data);
        return response()->json($user);
    }

    public function destroy($id)
    {
        $user = User::find($id);
        if (!$user) return response()->json(['error' => 'Not found'], 404);
        $user->delete();
        return response()->json(['message' => 'Deleted']);
    }
}
