<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * ClientResource
 *
 * POURQUOI:
 * - Ngroupiw el addresses f objects (billing/shipping)
 * - Ngroupiw el module settings f object
 * - Nkhabbu el custom fields (internal data)
 * - Nzidou logo_url computed
 */
class ClientResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            // ====== Identity ======
            'id'           => $this->client_id,
            'company_name' => $this->client_company_name,
            'description'  => $this->client_description,
            'phone'        => $this->client_phone,
            'website'      => $this->client_website,
            'vat'          => $this->client_vat,
            'status'       => $this->client_status, // active | inactive

            // ====== Logo ======
            'logo_url' => $this->client_logo_filename
                ? asset('storage/' . $this->client_logo_folder . '/' . $this->client_logo_filename)
                : null,

            // ====== Billing Address (grouped) ======
            'billing_address' => [
                'street'  => $this->client_billing_street,
                'city'    => $this->client_billing_city,
                'state'   => $this->client_billing_state,
                'zip'     => $this->client_billing_zip,
                'country' => $this->client_billing_country,
            ],

            // ====== Shipping Address (grouped) ======
            'shipping_address' => [
                'street'  => $this->client_shipping_street,
                'city'    => $this->client_shipping_city,
                'state'   => $this->client_shipping_state,
                'zip'     => $this->client_shipping_zip,
                'country' => $this->client_shipping_country,
            ],

            // ====== Billing Settings ======
            'billing_settings' => [
                'invoice_terms'    => $this->client_billing_invoice_terms,
                'invoice_due_days' => $this->client_billing_invoice_due_days,
            ],

            // ====== Module Permissions ======
            'modules' => [
                'projects'      => $this->client_settings_modules_projects,
                'invoices'      => $this->client_settings_modules_invoices,
                'payments'      => $this->client_settings_modules_payments,
                'knowledgebase' => $this->client_settings_modules_knowledgebase,
                'estimates'     => $this->client_settings_modules_estimates,
                'subscriptions' => $this->client_settings_modules_subscriptions,
                'tickets'       => $this->client_settings_modules_tickets,
            ],

            // ====== Meta ======
            'category_id' => $this->client_categoryid,
            'created_at'  => $this->client_created,
            'updated_at'  => $this->client_updated,

            // ====== Relationships ======
            'contacts'  => UserResource::collection($this->whenLoaded('contacts')),
            'projects'  => ProjectResource::collection($this->whenLoaded('projects')),
            'invoices'  => InvoiceResource::collection($this->whenLoaded('invoices')),
        ];
    }
}