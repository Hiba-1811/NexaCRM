<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * LineItemResource — ligne mta3 invoice ou estimate
 *
 * POURQUOI:
 * - Ngroupiw time info f object ila type = time
 * - Ngroupiw dimensions f object ila type = dimensions
 */
class LineItemResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'          => $this->lineitem_id,
            'description' => $this->lineitem_description,
            'rate'        => $this->lineitem_rate,
            'unit'        => $this->lineitem_unit,
            'quantity'    => $this->lineitem_quantity,
            'total'       => $this->lineitem_total,
            'type'        => $this->lineitem_type, // plain | time | dimensions
            'tax_status'  => $this->lineitem_tax_status,
            'position'    => $this->lineitem_position,
            'resource_type' => $this->lineitemresource_type,
            'resource_id'   => $this->lineitemresource_id,
            'product_id'    => $this->lineitem_linked_product_id,

            // ====== Time info (ila type = time) ======
            'time' => $this->when($this->lineitem_type === 'time', [
                'hours'   => $this->lineitem_time_hours,
                'minutes' => $this->lineitem_time_minutes,
            ]),

            // ====== Dimensions (ila type = dimensions) ======
            'dimensions' => $this->when($this->lineitem_type === 'dimensions', [
                'length' => $this->lineitem_dimensions_length,
                'width'  => $this->lineitem_dimensions_width,
            ]),

            'product' => new ItemResource($this->whenLoaded('product')),
        ];
    }
}