<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Role Model
 * Table: roles
 * Takhzen permissions mta3 kol role.
 * Values: 0=none, 1=view, 2=view+add+edit, 3=view+add+edit+delete
 */
class Role extends Model
{
    protected $table = 'roles';
    protected $primaryKey = 'role_id';
    public $timestamps = false;

    protected $fillable = [
        'role_created', 'role_updated', 'role_system', 'role_type',
        'role_name', 'role_clients', 'role_contacts', 'role_contracts',
        'role_invoices', 'role_estimates', 'role_proposals', 'role_payments',
        'role_items', 'role_tasks', 'role_tasks_scope', 'role_projects',
        'role_projects_scope', 'role_projects_billing', 'role_leads',
        'role_leads_scope', 'role_expenses', 'role_expenses_scope',
        'role_timesheets', 'role_timesheets_scope', 'role_team',
        'role_team_scope', 'role_tickets', 'role_knowledgebase',
    ];

    protected $casts = [
        'role_created'    => 'datetime',
        'role_updated'    => 'datetime',
        'role_clients'    => 'integer',
        'role_contacts'   => 'integer',
        'role_contracts'  => 'integer',
        'role_invoices'   => 'integer',
        'role_tasks'      => 'integer',
        'role_projects'   => 'integer',
        'role_leads'      => 'integer',
        'role_expenses'   => 'integer',
        'role_timesheets' => 'integer',
        'role_team'       => 'integer',
        'role_tickets'    => 'integer',
    ];

    // Role -> Users
    public function users()
    {
        return $this->hasMany(User::class, 'role_id', 'role_id');
    }
}