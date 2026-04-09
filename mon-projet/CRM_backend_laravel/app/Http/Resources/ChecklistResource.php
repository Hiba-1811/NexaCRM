<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ChecklistResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'            => $this->checklist_id,
            'text'          => $this->checklist_text,
            'status'        => $this->checklist_status, // pending | completed
            'position'      => $this->checklist_position,
            'resource_type' => $this->checklistresource_type,
            'resource_id'   => $this->checklistresource_id,
            'creator_id'    => $this->checklist_creatorid,
            'created_at'    => $this->checklist_created,
        ];
    }
}