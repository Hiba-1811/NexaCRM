<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    protected $table = 'users';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'unique_id',
        'created',
        'updated',
        'deleted',
        'creatorid',
        'email',
        'password',
        'first_name',
        'last_name',
        'phone',
        'position',
        'clientid',
        'account_owner',
        'primary_admin',
        'avatar_directory',
        'avatar_filename',
        'type',
        'status',
        'role_id',
        'last_seen',
        'theme',
        'last_ip_address',
        'social_facebook',
        'social_twitter',
        'social_linkedin',
        'social_github',
        'social_dribble',
        'pref_language',
        'pref_email_notifications',
        'pref_leftmenu_position',
        'pref_statspanel_position',
        'pref_filter_own_tasks',
        'pref_hide_completed_tasks',
        'pref_filter_own_projects',
        'pref_view_tasks_layout',
        'pref_view_leads_layout',
        'pref_view_projects_layout',
        'pref_theme',
        'notifications_system',
        'notifications_new_project',
        'notifications_projects_activity',
        'notifications_billing_activity',
        'notifications_new_assignement',
        'notifications_leads_activity',
        'notifications_tasks_activity',
        'notifications_tickets_activity',
        'notifications_reminders',
        'dashboard_access',
        'welcome_email_sent',
        'timezone',
        'force_password_change',
    ];

    protected $hidden = [
        'password',
        'remember_token',
        'forgot_password_token',
    ];

    protected $casts = [
        'created'    => 'datetime',
        'updated'    => 'datetime',
        'deleted'    => 'datetime',
        'last_seen'  => 'datetime',
        'forgot_password_token_expiry' => 'datetime',
    ];

    public function getJWTIdentifier() {
        return $this->getKey();
    }

    public function getJWTCustomClaims() {
        return [];
    }

    // ======= Relationships =======

    // User -> Role
    public function role()
    {
        return $this->belongsTo(Role::class, 'role_id', 'role_id');
    }

    // User -> Client (ila kan client user)
    public function client()
    {
        return $this->belongsTo(Client::class, 'clientid', 'client_id');
    }

    // User -> Tasks assigned lih
    public function tasks()
    {
        return $this->belongsToMany(Task::class, 'tasks_assigned', 'tasksassigned_userid', 'tasksassigned_taskid');
    }

    // User -> Projects assigned lih
    public function projects()
    {
        return $this->belongsToMany(Project::class, 'projects_assigned', 'projectsassigned_userid', 'projectsassigned_projectid');
    }

    // User -> Leads assigned lih
    public function leads()
    {
        return $this->belongsToMany(Lead::class, 'leads_assigned', 'leadsassigned_userid', 'leadsassigned_leadid');
    }
}