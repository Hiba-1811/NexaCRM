<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CategoryResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'             => $this->category_id,
            'name'           => $this->category_name,
            'description'    => $this->category_description,
            'type'           => $this->category_type, // project | client | lead | invoice | etc
            'slug'           => $this->category_slug,
            'icon'           => $this->category_icon,
            'visibility'     => $this->category_visibility,
            'system_default' => $this->category_system_default,
            'created_at'     => $this->category_created,
        ];
    }
}