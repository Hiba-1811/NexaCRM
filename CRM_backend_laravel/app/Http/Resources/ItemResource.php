<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * ItemResource — Product/Service catalogue
 */
class ItemResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'          => $this->item_id,
            'description' => $this->item_description,
            'type'        => $this->item_type,       // standard | dimensions
            'unit'        => $this->item_unit,
            'rate'        => $this->item_rate,
            'tax_status'  => $this->item_tax_status, // taxable | exempt
            'category_id' => $this->item_categoryid,
            'creator_id'  => $this->item_creatorid,
            'created_at'  => $this->item_created,

            // ====== Dimensions (ila dimensions type) ======
            'dimensions' => $this->when($this->item_type === 'dimensions', [
                'length' => $this->item_dimensions_length,
                'width'  => $this->item_dimensions_width,
            ]),

            'category' => new CategoryResource($this->whenLoaded('category')),
        ];
    }
}