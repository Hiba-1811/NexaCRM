<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CalendarEventResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'          => $this->event_id,
            'title'       => $this->event_title,
            'description' => $this->event_description,
            'start'       => $this->event_start,
            'end'         => $this->event_end,
            'color'       => $this->event_color,
            'all_day'     => $this->event_all_day,
            'status'      => $this->event_status,
            'creator_id'  => $this->event_creatorid,
            'created_at'  => $this->event_created,

            'creator'      => new UserResource($this->whenLoaded('creator')),
            'shared_with'  => UserResource::collection($this->whenLoaded('sharedWith')),
        ];
    }
}