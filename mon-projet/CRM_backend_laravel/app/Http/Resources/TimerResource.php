<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * TimerResource
 *
 * POURQUOI:
 * - Nzidou 'duration_formatted' computed (HH:MM:SS)
 * - timer_time f seconds → nħawwlouh human readable
 */
class TimerResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        // Nħawwel seconds → HH:MM:SS
        $seconds = (int) $this->timer_time;
        $formatted = sprintf('%02d:%02d:%02d',
            floor($seconds / 3600),
            floor(($seconds % 3600) / 60),
            $seconds % 60
        );

        return [
            'id'             => $this->timer_id,
            'status'         => $this->timer_status,         // running | stopped
            'billing_status' => $this->timer_billing_status, // invoiced | not_invoiced
            'invoice_id'     => $this->timer_billing_invoiceid,

            // ====== Time ======
            'time_seconds'  => $this->timer_time,
            'time_formatted'=> $formatted, // computed: "01:30:00"
            'started_at'    => $this->timer_started, // unix timestamp
            'stopped_at'    => $this->timer_stopped, // unix timestamp

            'task_id'    => $this->timer_taskid,
            'project_id' => $this->timer_projectid,
            'client_id'  => $this->timer_clientid,
            'creator_id' => $this->timer_creatorid,
            'created_at' => $this->timer_created,

            'task'    => new TaskResource($this->whenLoaded('task')),
            'project' => new ProjectResource($this->whenLoaded('project')),
            'creator' => new UserResource($this->whenLoaded('creator')),
        ];
    }
}