<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * ExpenseResource
 *
 * POURQUOI:
 * - Ngroupiw recurring info f object
 * - Nzidou 'is_billable' boolean computed
 */
class ExpenseResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'             => $this->expense_id,
            'date'           => $this->expense_date,
            'amount'         => $this->expense_amount,
            'description'    => $this->expense_description,
            'type'           => $this->expense_type,            // business | client
            'billable'       => $this->expense_billable,        // billable | not_billable
            'billing_status' => $this->expense_billing_status,  // invoiced | not_invoiced
            'invoice_id'     => $this->expense_billable_invoiceid,
            'category_id'    => $this->expense_categoryid,
            'client_id'      => $this->expense_clientid,
            'project_id'     => $this->expense_projectid,
            'creator_id'     => $this->expense_creatorid,
            'created_at'     => $this->expense_created,
            'updated_at'     => $this->expense_updated,

            // ====== Recurring (grouped) ======
            'recurring' => [
                'enabled'      => $this->expense_recurring,
                'duration'     => $this->expense_recurring_duration,
                'period'       => $this->expense_recurring_period,
                'cycles'       => $this->expense_recurring_cycles,
                'cycles_done'  => $this->expense_recurring_cycles_counter,
            ],

            'client'  => new ClientResource($this->whenLoaded('client')),
            'project' => new ProjectResource($this->whenLoaded('project')),
        ];
    }
}