<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class NoteResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'            => $this->note_id,
            'title'         => $this->note_title,
            'description'   => $this->note_description,
            'visibility'    => $this->note_visibility, // private | public
            'resource_type' => $this->noteresource_type,
            'resource_id'   => $this->noteresource_id,
            'creator_id'    => $this->note_creatorid,
            'created_at'    => $this->note_created,
            'updated_at'    => $this->note_updated,

            'creator' => new UserResource($this->whenLoaded('creator')),
        ];
    }
}