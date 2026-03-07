<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * MilestoneResource
 *
 * POURQUOI:
 * - Nzidou tasks_count computed
 * - Nzidou tasks_completed_count computed
 */
class MilestoneResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'         => $this->milestone_id,
            'title'      => $this->milestone_title,
            'type'       => $this->milestone_type, // categorised | uncategorised
            'color'      => $this->milestone_color,
            'position'   => $this->milestone_position,
            'project_id' => $this->milestone_projectid,
            'creator_id' => $this->milestone_creatorid,
            'created_at' => $this->milestone_created,

            // Computed counts (ila tasks loaded)
            'tasks_count' => $this->whenLoaded('tasks', fn() => $this->tasks->count()),
            'tasks_completed' => $this->whenLoaded('tasks',
                fn() => $this->tasks->where('task_status', 5)->count() // 5 = completed
            ),

            'tasks' => TaskResource::collection($this->whenLoaded('tasks')),
        ];
    }
}