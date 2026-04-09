<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    protected $table = 'tasks';
    protected $primaryKey = 'task_id';
    public $timestamps = false;

    protected $fillable = [
        'task_uniqueid',
        'task_importid',
        'task_position',
        'task_created',
        'task_updated',
        'task_creatorid',
        'task_clientid',
        'task_projectid',
        'task_date_start',
        'task_date_due',
        'task_title',
        'task_description',
        'task_client_visibility',
        'task_milestoneid',
        'task_priority',
        'task_status',
        'task_active_state',
        'task_billable',
        'task_billable_status',
        'task_billable_invoiceid',
        'task_visibility',
        'task_recurring',
        'task_recurring_duration',
        'task_recurring_period',
        'task_recurring_cycles',
    ];

    protected $casts = [
        'task_created'    => 'datetime',
        'task_updated'    => 'datetime',
        'task_date_start' => 'date',
        'task_date_due'   => 'date',
        'task_position'   => 'float',
        'task_priority'   => 'integer',
        'task_status'     => 'integer',
    ];

    // ======= Relationships =======

    // Task -> Project
    public function project()
    {
        return $this->belongsTo(Project::class, 'task_projectid', 'project_id');
    }

    // Task -> Client
    public function client()
    {
        return $this->belongsTo(Client::class, 'task_clientid', 'client_id');
    }

    // Task -> Creator (User)
    public function creator()
    {
        return $this->belongsTo(User::class, 'task_creatorid', 'id');
    }

    // Task -> Users assigned
    public function assignees()
    {
        return $this->belongsToMany(User::class, 'tasks_assigned', 'tasksassigned_taskid', 'tasksassigned_userid');
    }

    // Task -> Milestone
    public function milestone()
    {
        return $this->belongsTo(Milestone::class, 'task_milestoneid', 'milestone_id');
    }

    // Task -> Timers
    public function timers()
    {
        return $this->hasMany(Timer::class, 'timer_taskid', 'task_id');
    }

    // Task -> Comments
    public function comments()
    {
        return $this->morphMany(Comment::class, 'commentresource');
    }

    // Task -> Checklists
    public function checklists()
    {
        return $this->morphMany(Checklist::class, 'checklistresource');
    }

    // Task -> Attachments
    public function attachments()
    {
        return $this->morphMany(Attachment::class, 'attachmentresource');
    }
}