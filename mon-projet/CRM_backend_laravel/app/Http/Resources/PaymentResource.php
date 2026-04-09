<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * PaymentResource
 *
 * POURQUOI:
 * - Simple resource — payment data direct
 * - Nzidou gateway label human-readable
 */
class PaymentResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'             => $this->payment_id,
            'date'           => $this->payment_date,
            'amount'         => $this->payment_amount,
            'gateway'        => $this->payment_gateway, // paypal | stripe | cash | bank
            'type'           => $this->payment_type,    // invoice | subscription
            'transaction_id' => $this->payment_transaction_id,
            'notes'          => $this->payment_notes,
            'invoice_id'     => $this->payment_invoiceid,
            'client_id'      => $this->payment_clientid,
            'project_id'     => $this->payment_projectid,
            'creator_id'     => $this->payment_creatorid,
            'created_at'     => $this->payment_created,
            'updated_at'     => $this->payment_updated,

            // ====== Relationships ======
            'invoice' => new InvoiceResource($this->whenLoaded('invoice')),
            'client'  => new ClientResource($this->whenLoaded('client')),
        ];
    }
}