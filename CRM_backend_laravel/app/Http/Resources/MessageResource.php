<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * MessageResource
 *
 * POURQUOI:
 * - Nzidou 'file_url' computed ila kan file message
 * - Nkhabbu el directory paths
 */
class MessageResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'         => $this->message_id,
            'unique_id'  => $this->message_unique_id,
            'text'       => $this->message_text,
            'type'       => $this->message_type,   // text | file
            'status'     => $this->message_status, // read | unread
            'source'     => $this->message_source, // sender unique_id
            'target'     => $this->message_target, // receiver unique_id
            'timestamp'  => $this->message_timestamp,
            'created_at' => $this->message_created,

            // ====== File (ila mich text message) ======
            'file' => $this->when($this->message_type === 'file', [
                'name'      => $this->message_file_name,
                'type'      => $this->message_file_type, // file | image
                'url'       => asset('storage/' . $this->message_file_directory . '/' . $this->message_file_name),
                'thumb_url' => $this->message_file_thumb_name
                    ? asset('storage/' . $this->message_file_directory . '/' . $this->message_file_thumb_name)
                    : null,
            ]),

            'sender' => new UserResource($this->whenLoaded('sender')),
        ];
    }
}