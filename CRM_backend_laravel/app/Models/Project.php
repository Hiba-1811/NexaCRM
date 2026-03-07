<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    protected $table = 'projects';
    protected $primaryKey = 'project_id';
    public $timestamps = false;

    protected $fillable = [
        'project_uniqueid',
        'project_type',
        'project_reference',
        'project_importid',
        'project_created',
        'project_updated',
        'project_clientid',
        'project_creatorid',
        'project_categoryid',
        'project_cover_directory',
        'project_cover_filename',
        'project_title',
        'project_date_start',
        'project_date_due',
        'project_description',
        'project_status',
        'project_active_state',
        'project_progress',
        'project_billing_rate',
        'project_billing_type',
        'project_billing_estimated_hours',
        'project_billing_costs_estimate',
        'project_progress_manually',
        'project_visibility',
        'clientperm_tasks_view',
        'clientperm_tasks_collaborate',
        'clientperm_tasks_create',
        'clientperm_timesheets_view',
        'clientperm_expenses_view',
        'assignedperm_milestone_manage',
        'assignedperm_tasks_collaborate',
    ];

    protected $casts = [
        'project_created'      => 'datetime',
        'project_updated'      => 'datetime',
        'project_date_start'   => 'date',
        'project_date_due'     => 'date',
        'project_billing_rate' => 'decimal:2',
        'project_progress'     => 'integer',
    ];

    // ======= Relationships =======

    // Project -> Client
    public function client()
    {
        return $this->belongsTo(Client::class, 'project_clientid', 'client_id');
    }

    // Project -> Creator (User)
    public function creator()
    {
        return $this->belongsTo(User::class, 'project_creatorid', 'id');
    }

    // Project -> Tasks
    public function tasks()
    {
        return $this->hasMany(Task::class, 'task_projectid', 'project_id');
    }

    // Project -> Users assigned
    public function members()
    {
        return $this->belongsToMany(User::class, 'projects_assigned', 'projectsassigned_projectid', 'projectsassigned_userid');
    }

    // Project -> Manager
    public function managers()
    {
        return $this->belongsToMany(User::class, 'projects_manager', 'projectsmanager_projectid', 'projectsmanager_userid');
    }

    // Project -> Invoices
    public function invoices()
    {
        return $this->hasMany(Invoice::class, 'bill_projectid', 'project_id');
    }

    // Project -> Expenses
    public function expenses()
    {
        return $this->hasMany(Expense::class, 'expense_projectid', 'project_id');
    }

    // Project -> Milestones
    public function milestones()
    {
        return $this->hasMany(Milestone::class, 'milestone_projectid', 'project_id');
    }

    // Project -> Timers
    public function timers()
    {
        return $this->hasMany(Timer::class, 'timer_projectid', 'project_id');
    }
}