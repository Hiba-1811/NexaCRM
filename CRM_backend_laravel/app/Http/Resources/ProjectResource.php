<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * ProjectResource
 *
 * POURQUOI:
 * - Ngroupiw el billing info f object
 * - Ngroupiw el client permissions f object
 * - Nzidou cover_url computed
 * - Nkhabbu el custom fields
 */
class ProjectResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            // ====== Identity ======
            'id'          => $this->project_id,
            'unique_id'   => $this->project_uniqueid,
            'type'        => $this->project_type,       // project | template | space
            'title'       => $this->project_title,
            'description' => $this->project_description,
            'reference'   => $this->project_reference,

            // ====== Status & Progress ======
            'status'       => $this->project_status,      // not_started | in_progress | on_hold | completed
            'active_state' => $this->project_active_state, // active | archive
            'progress'     => (int) $this->project_progress,
            'visibility'   => $this->project_visibility,

            // ====== Dates ======
            'date_start'  => $this->project_date_start,
            'date_due'    => $this->project_date_due,
            'created_at'  => $this->project_created,
            'updated_at'  => $this->project_updated,

            // ====== Cover Image ======
            'cover_url' => $this->project_cover_filename
                ? asset('storage/' . $this->project_cover_directory . '/' . $this->project_cover_filename)
                : null,

            // ====== Billing (grouped) ======
            'billing' => [
                'type'             => $this->project_billing_type, // hourly | fixed
                'rate'             => $this->project_billing_rate,
                'estimated_hours'  => $this->project_billing_estimated_hours,
                'costs_estimate'   => $this->project_billing_costs_estimate,
            ],

            // ====== Client Permissions (grouped) ======
            'client_permissions' => [
                'tasks_view'        => $this->clientperm_tasks_view,
                'tasks_collaborate' => $this->clientperm_tasks_collaborate,
                'tasks_create'      => $this->clientperm_tasks_create,
                'timesheets_view'   => $this->clientperm_timesheets_view,
                'expenses_view'     => $this->clientperm_expenses_view,
            ],

            // ====== IDs ======
            'client_id'  => $this->project_clientid,
            'creator_id' => $this->project_creatorid,
            'category_id'=> $this->project_categoryid,

            // ====== Relationships ======
            'client'     => new ClientResource($this->whenLoaded('client')),
            'creator'    => new UserResource($this->whenLoaded('creator')),
            'members'    => UserResource::collection($this->whenLoaded('members')),
            'managers'   => UserResource::collection($this->whenLoaded('managers')),
            'tasks'      => TaskResource::collection($this->whenLoaded('tasks')),
            'milestones' => MilestoneResource::collection($this->whenLoaded('milestones')),
        ];
    }
}