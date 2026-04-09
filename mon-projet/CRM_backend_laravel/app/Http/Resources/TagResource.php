<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class TagResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'            => $this->tag_id,
            'title'         => $this->tag_title,
            'visibility'    => $this->tag_visibility, // public | user
            'resource_type' => $this->tagresource_type,
            'resource_id'   => $this->tagresource_id,
            'creator_id'    => $this->tag_creatorid,
            'created_at'    => $this->tag_created,
        ];
    }
}