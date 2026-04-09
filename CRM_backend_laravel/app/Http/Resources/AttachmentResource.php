<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * AttachmentResource
 *
 * POURQUOI:
 * - Nzidou 'url' w 'thumb_url' computed — frontend direct yestaamlhom
 * - Nkhabbu el directory paths (internal)
 */
class AttachmentResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'            => $this->attachment_id,
            'unique_id'     => $this->attachment_uniqiueid,
            'filename'      => $this->attachment_filename,
            'extension'     => $this->attachment_extension,
            'type'          => $this->attachment_type, // image | file
            'size'          => $this->attachment_size,
            'resource_type' => $this->attachmentresource_type,
            'resource_id'   => $this->attachmentresource_id,

            // ====== URLs (computed) ======
            'url' => asset('storage/' . $this->attachment_directory . '/' . $this->attachment_filename),
            'thumb_url' => $this->attachment_thumbname
                ? asset('storage/' . $this->attachment_directory . '/' . $this->attachment_thumbname)
                : null,

            'creator_id' => $this->attachment_creatorid,
            'client_id'  => $this->attachment_clientid,
            'created_at' => $this->attachment_created,
        ];
    }
}