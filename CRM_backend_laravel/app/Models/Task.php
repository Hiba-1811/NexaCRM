<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    protected $table = 'tasks';
    protected $primaryKey = 'task_id';
    public $timestamps = false;

    protected $fillable = [
        'task_title',
        'task_description',
        'task_status',
        'task_priority',
        'task_date_start',
        'task_date_due',
        'task_projectid',
        'task_clientid',
        'task_creatorid',
        'task_milestoneid',
        'task_billable',
        'task_visibility',
        'task_active_state',
        'task_client_visibility',
        'task_recurring',
    ];

    protected $attributes = [
        'task_status' => 1,
        'task_priority' => 2,
        'task_active_state' => 'yes',
        'task_billable' => 'no',
        'task_visibility' => 'normal',
        'task_client_visibility' => 'yes',
        'task_recurring' => 'no',
        'task_position' => 0,
    ];
}
