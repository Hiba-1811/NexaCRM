<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * TicketReplyResource — replies mta3 el tickets
 */
class TicketReplyResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'         => $this->ticketreply_id,
            'message'    => $this->ticketreply_message,
            'user_type'  => $this->ticketreply_user_type, // team | client
            'creator_id' => $this->ticketreply_creatorid,
            'created_at' => $this->ticketreply_created,
            'updated_at' => $this->ticketreply_updated,

            'creator'     => new UserResource($this->whenLoaded('creator')),
            'attachments' => AttachmentResource::collection($this->whenLoaded('attachments')),
        ];
    }
}