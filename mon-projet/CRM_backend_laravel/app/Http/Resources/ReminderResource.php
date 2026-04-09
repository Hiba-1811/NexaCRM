<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ReminderResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'            => $this->reminder_id,
            'title'         => $this->reminder_title,
            'notes'         => $this->reminder_notes,
            'datetime'      => $this->reminder_datetime,
            'status'        => $this->reminder_status, // new | active | due
            'sent'          => $this->reminder_sent,
            'resource_type' => $this->reminderresource_type,
            'resource_id'   => $this->reminderresource_id,
            'user_id'       => $this->reminder_userid,
            'created_at'    => $this->reminder_created,

            'user' => new UserResource($this->whenLoaded('user')),
        ];
    }
}