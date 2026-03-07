<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CommentResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'            => $this->comment_id,
            'text'          => $this->comment_text,
            'client_status' => $this->comment_client_status, // read | unread
            'team_status'   => $this->comment_team_status,
            'resource_type' => $this->commentresource_type,  // project | task | lead | ticket
            'resource_id'   => $this->commentresource_id,
            'client_id'     => $this->comment_clientid,
            'creator_id'    => $this->comment_creatorid,
            'created_at'    => $this->comment_created,
            'updated_at'    => $this->comment_updated,

            'creator' => new UserResource($this->whenLoaded('creator')),
        ];
    }
}