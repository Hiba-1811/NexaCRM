<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * SubscriptionResource
 *
 * POURQUOI:
 * - Ngroupiw Stripe gateway info f object
 * - Ngroupiw amounts f object
 */
class SubscriptionResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'         => $this->subscription_id,
            'status'     => $this->subscription_status, // pending | active | failed | paused | cancelled
            'visibility' => $this->subscription_visibility,
            'notes'      => $this->subscription_notes,

            // ====== Stripe Gateway (grouped) ======
            'gateway' => [
                'id'           => $this->subscription_gateway_id,
                'product'      => $this->subscription_gateway_product,
                'price'        => $this->subscription_gateway_price,
                'product_name' => $this->subscription_gateway_product_name,
                'interval'     => $this->subscription_gateway_interval,
                'period'       => $this->subscription_gateway_period,
                'last_message' => $this->subscription_gateway_last_message,
            ],

            // ====== Amounts (grouped) ======
            'amounts' => [
                'subtotal'       => $this->subscription_subtotal,
                'before_tax'     => $this->subscription_amount_before_tax,
                'tax_percentage' => $this->subscription_tax_percentage,
                'tax_amount'     => $this->subscription_tax_amount,
                'final'          => $this->subscription_final_amount,
            ],

            // ====== Dates ======
            'date_started'      => $this->subscription_date_started,
            'date_ended'        => $this->subscription_date_ended,
            'date_renewed'      => $this->subscription_date_renewed,
            'date_next_renewal' => $this->subscription_date_next_renewal,
            'created_at'        => $this->subscription_created,

            'client_id'  => $this->subscription_clientid,
            'project_id' => $this->subscription_projectid,

            'client'   => new ClientResource($this->whenLoaded('client')),
            'payments' => PaymentResource::collection($this->whenLoaded('payments')),
        ];
    }
}