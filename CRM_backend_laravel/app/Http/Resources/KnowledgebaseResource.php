<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class KnowledgebaseResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'          => $this->knowledgebase_id,
            'title'       => $this->knowledgebase_title,
            'slug'        => $this->knowledgebase_slug,
            'text'        => $this->knowledgebase_text,
            'category_id' => $this->knowledgebase_categoryid,
            'creator_id'  => $this->knowledgebase_creatorid,
            'created_at'  => $this->knowledgebase_created,
            'updated_at'  => $this->knowledgebase_updated,

            // ====== Embed Video ======
            'embed' => $this->when($this->knowledgebase_embed_video_id, [
                'video_id' => $this->knowledgebase_embed_video_id,
                'code'     => $this->knowledgebase_embed_code,
                'thumb'    => $this->knowledgebase_embed_thumb,
            ]),

            'category' => new CategoryResource($this->whenLoaded('category')),
            'creator'  => new UserResource($this->whenLoaded('creator')),
        ];
    }
}