<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\TaskController;

Route::prefix('auth')->group(function () {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('logout', [AuthController::class, 'logout'])->middleware('auth:api');
    Route::post('refresh', [AuthController::class, 'refresh'])->middleware('auth:api');
    Route::get('me', [AuthController::class, 'me'])->middleware('auth:api');
});

Route::middleware('auth:api')->group(function () {
    Route::apiResource('clients', ClientController::class);
    Route::apiResource('projects', ProjectController::class);
    Route::get('notifications', [App\Http\Controllers\NotificationController::class, 'index']);
    Route::post('notifications', [App\Http\Controllers\NotificationController::class, 'store']);
    Route::put('notifications/{id}/read', [App\Http\Controllers\NotificationController::class, 'markRead']);
    Route::put('notifications/read-all', [App\Http\Controllers\NotificationController::class, 'markAllRead']);
    Route::delete('notifications/{id}', [App\Http\Controllers\NotificationController::class, 'destroy']);
    Route::apiResource('users', App\Http\Controllers\UserController::class)->except(['show']);
    Route::apiResource('tickets', App\Http\Controllers\TicketController::class);
    Route::apiResource('invoices', App\Http\Controllers\InvoiceController::class);
    Route::apiResource('tasks', TaskController::class);
});
Route::get('/dashboard/stats', [App\Http\Controllers\DashboardController::class, 'stats'])->middleware('auth:api');
Route::get('/test', function () {
    return response()->json([
        'status'  => 'ok',
        'models'  => 'loaded',
        'message' => 'NexaCRM API is running!'
    ]);
});