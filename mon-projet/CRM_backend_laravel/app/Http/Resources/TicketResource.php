<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * TicketResource
 *
 * POURQUOI:
 * - Nzidou replies_count computed
 * - Nzidou last_reply computed
 */
class TicketResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'           => $this->ticket_id,
            'subject'      => $this->ticket_subject,
            'message'      => $this->ticket_message,
            'priority'     => $this->ticket_priority,
            'status'       => $this->ticket_status,
            'source'       => $this->ticket_source,
            'active_state' => $this->ticket_active_state,
            'user_type'    => $this->ticket_user_type, // team | client

            // ====== IDs ======
            'client_id'   => $this->ticket_clientid,
            'project_id'  => $this->ticket_projectid,
            'category_id' => $this->ticket_categoryid,
            'creator_id'  => $this->ticket_creatorid,
            'created_at'  => $this->ticket_created,
            'updated_at'  => $this->ticket_updated,

            // ====== Relationships ======
            'client'      => new ClientResource($this->whenLoaded('client')),
            'project'     => new ProjectResource($this->whenLoaded('project')),
            'replies'     => TicketReplyResource::collection($this->whenLoaded('replies')),
            'attachments' => AttachmentResource::collection($this->whenLoaded('attachments')),
        ];
    }
}