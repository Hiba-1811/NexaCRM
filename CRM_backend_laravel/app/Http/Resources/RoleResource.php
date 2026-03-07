<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * RoleResource
 *
 * POURQUOI:
 * - Ngroupiw permissions f object clair
 * - Values: 0=none, 1=view, 2=edit, 3=delete
 */
class RoleResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'     => $this->role_id,
            'name'   => $this->role_name,
            'type'   => $this->role_type,   // client | team
            'system' => $this->role_system, // yes | no (can't delete)

            // ====== Permissions (grouped) ======
            'permissions' => [
                'clients'     => $this->role_clients,
                'contacts'    => $this->role_contacts,
                'contracts'   => $this->role_contracts,
                'invoices'    => $this->role_invoices,
                'estimates'   => $this->role_estimates,
                'proposals'   => $this->role_proposals,
                'payments'    => $this->role_payments,
                'items'       => $this->role_items,
                'tasks'       => ['level' => $this->role_tasks, 'scope' => $this->role_tasks_scope],
                'projects'    => ['level' => $this->role_projects, 'scope' => $this->role_projects_scope],
                'leads'       => ['level' => $this->role_leads, 'scope' => $this->role_leads_scope],
                'expenses'    => ['level' => $this->role_expenses, 'scope' => $this->role_expenses_scope],
                'timesheets'  => ['level' => $this->role_timesheets, 'scope' => $this->role_timesheets_scope],
                'team'        => ['level' => $this->role_team, 'scope' => $this->role_team_scope],
                'tickets'     => $this->role_tickets,
                'knowledgebase'=> $this->role_knowledgebase,
            ],

            'created_at' => $this->role_created,
        ];
    }
}