<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * TaskResource
 *
 * POURQUOI:
 * - Ngroupiw el recurring settings f object
 * - Ngroupiw el billing info f object
 * - Nzidou 'total_time_seconds' computed mel timers
 */
class TaskResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            // ====== Identity ======
            'id'          => $this->task_id,
            'unique_id'   => $this->task_uniqueid,
            'title'       => $this->task_title,
            'description' => $this->task_description,
            'position'    => $this->task_position,

            // ====== Status ======
            'status'           => $this->task_status,
            'priority'         => $this->task_priority,
            'active_state'     => $this->task_active_state,
            'visibility'       => $this->task_visibility,
            'client_visibility'=> $this->task_client_visibility,

            // ====== Dates ======
            'date_start' => $this->task_date_start,
            'date_due'   => $this->task_date_due,
            'created_at' => $this->task_created,
            'updated_at' => $this->task_updated,

            // ====== Billing (grouped) ======
            'billing' => [
                'billable'        => $this->task_billable,
                'billing_status'  => $this->task_billable_status, // invoiced | not_invoiced
                'invoice_id'      => $this->task_billable_invoiceid,
            ],

            // ====== Recurring (grouped) ======
            'recurring' => [
                'enabled'  => $this->task_recurring,
                'duration' => $this->task_recurring_duration,
                'period'   => $this->task_recurring_period, // day | week | month | year
                'cycles'   => $this->task_recurring_cycles,
            ],

            // ====== IDs ======
            'project_id'   => $this->task_projectid,
            'client_id'    => $this->task_clientid,
            'creator_id'   => $this->task_creatorid,
            'milestone_id' => $this->task_milestoneid,

            // ====== Relationships ======
            'project'     => new ProjectResource($this->whenLoaded('project')),
            'creator'     => new UserResource($this->whenLoaded('creator')),
            'assignees'   => UserResource::collection($this->whenLoaded('assignees')),
            'milestone'   => new MilestoneResource($this->whenLoaded('milestone')),
            'comments'    => CommentResource::collection($this->whenLoaded('comments')),
            'checklists'  => ChecklistResource::collection($this->whenLoaded('checklists')),
            'attachments' => AttachmentResource::collection($this->whenLoaded('attachments')),
            'timers'      => TimerResource::collection($this->whenLoaded('timers')),
        ];
    }
}