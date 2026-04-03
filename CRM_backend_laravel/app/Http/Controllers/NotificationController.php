<?php
namespace App\Http\Controllers;
use App\Models\Notification;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    public function index()
    {
        $userId = auth('api')->user()->id;
        $notifications = Notification::where('user_id', $userId)
            ->orderBy('created_at', 'desc')
            ->take(20)
            ->get();
        $unread = Notification::where('user_id', $userId)->where('is_read', false)->count();
        return response()->json(['notifications' => $notifications, 'unread' => $unread]);
    }

    public function markRead($id)
    {
        $notification = Notification::find($id);
        if ($notification) $notification->update(['is_read' => true]);
        return response()->json(['message' => 'Marked as read']);
    }

    public function markAllRead()
    {
        $userId = auth('api')->user()->id;
        Notification::where('user_id', $userId)->update(['is_read' => true]);
        return response()->json(['message' => 'All marked as read']);
    }

    public function store(Request $request)
    {
        $data = $request->all();
        $data['user_id'] = auth('api')->user()->id;
        $notification = Notification::create($data);
        return response()->json($notification, 201);
    }

    public function destroy($id)
    {
        Notification::find($id)?->delete();
        return response()->json(['message' => 'Deleted']);
    }
}
