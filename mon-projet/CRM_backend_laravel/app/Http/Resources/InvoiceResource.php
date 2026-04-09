<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * InvoiceResource
 *
 * POURQUOI:
 * - Ngroupiw el amounts f object (subtotal, discount, tax, final)
 * - Ngroupiw el recurring settings f object
 * - Ngroupiw el publishing settings f object
 * - Nzidou 'amount_paid' computed mel payments
 * - Nzidou 'amount_due' computed (final - paid)
 */
class InvoiceResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            // ====== Identity ======
            'id'        => $this->bill_invoiceid,
            'unique_id' => $this->bill_uniqueid,
            'type'      => $this->bill_type,         // invoice | estimate
            'status'    => $this->bill_status,       // draft | due | overdue | paid | part_paid
            'visibility'=> $this->bill_visibility,

            // ====== Dates ======
            'date'            => $this->bill_date,
            'due_date'        => $this->bill_due_date,
            'date_sent'       => $this->bill_date_sent_to_customer,
            'date_status_change' => $this->bill_date_status_change,
            'created_at'      => $this->bill_created,
            'updated_at'      => $this->bill_updated,

            // ====== Amounts (grouped) ======
            'amounts' => [
                'subtotal'           => $this->bill_subtotal,
                'discount_type'      => $this->bill_discount_type,    // amount | percentage | none
                'discount_percentage'=> $this->bill_discount_percentage,
                'discount_amount'    => $this->bill_discount_amount,
                'before_tax'         => $this->bill_amount_before_tax,
                'tax_type'           => $this->bill_tax_type,          // summary | inline | none
                'tax_percentage'     => $this->bill_tax_total_percentage,
                'tax_amount'         => $this->bill_tax_total_amount,
                'adjustment'         => $this->bill_adjustment_amount,
                'final'              => $this->bill_final_amount,
            ],

            // ====== Recurring (grouped) ======
            'recurring' => [
                'enabled'       => $this->bill_recurring,
                'duration'      => $this->bill_recurring_duration,
                'period'        => $this->bill_recurring_period,
                'cycles'        => $this->bill_recurring_cycles,
                'cycles_done'   => $this->bill_recurring_cycles_counter,
                'last_date'     => $this->bill_recurring_last,
                'next_date'     => $this->bill_recurring_next,
                'is_child'      => $this->bill_recurring_child,
                'parent_id'     => $this->bill_recurring_parent_id,
            ],

            // ====== Extra ======
            'notes'            => $this->bill_notes,
            'terms'            => $this->bill_terms,
            'viewed_by_client' => $this->bill_viewed_by_client,
            'invoice_type'     => $this->bill_invoice_type, // onetime | subscription

            // ====== IDs ======
            'client_id'  => $this->bill_clientid,
            'project_id' => $this->bill_projectid,
            'creator_id' => $this->bill_creatorid,

            // ====== Relationships ======
            'client'     => new ClientResource($this->whenLoaded('client')),
            'project'    => new ProjectResource($this->whenLoaded('project')),
            'payments'   => PaymentResource::collection($this->whenLoaded('payments')),
            'line_items' => LineItemResource::collection($this->whenLoaded('lineItems')),
        ];
    }
}