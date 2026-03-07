<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * ContractResource
 *
 * POURQUOI:
 * - Ngroupiw provider signature f object
 * - Ngroupiw client signature f object
 * - Ngroupiw publishing info f object
 */
class ContractResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'          => $this->doc_id,
            'unique_id'   => $this->doc_unique_id,
            'type'        => $this->doc_type,        // contract
            'system_type' => $this->doc_system_type, // document | template
            'title'       => $this->doc_title,
            'body'        => $this->doc_body,
            'status'      => $this->doc_status, // draft | awaiting_signatures | active | expired
            'value'       => $this->doc_value,
            'viewed'      => $this->doc_viewed,
            'notes'       => $this->doc_notes,

            // ====== Dates ======
            'date_start'       => $this->doc_date_start,
            'date_end'         => $this->doc_date_end,
            'date_published'   => $this->doc_date_published,
            'date_last_emailed'=> $this->doc_date_last_emailed,
            'created_at'       => $this->doc_created,
            'updated_at'       => $this->doc_updated,

            // ====== Provider Signature (grouped) ======
            'provider_signature' => [
                'status'     => $this->doc_provider_signed_status, // signed | unsigned
                'date'       => $this->doc_provider_signed_date,
                'first_name' => $this->doc_provider_signed_first_name,
                'last_name'  => $this->doc_provider_signed_last_name,
            ],

            // ====== Client Signature (grouped) ======
            'client_signature' => [
                'status'     => $this->doc_signed_status, // signed | unsigned
                'date'       => $this->doc_signed_date,
                'first_name' => $this->doc_signed_first_name,
                'last_name'  => $this->doc_signed_last_name,
            ],

            // ====== IDs ======
            'client_id'  => $this->doc_client_id,
            'project_id' => $this->doc_project_id,
            'lead_id'    => $this->doc_lead_id,
            'creator_id' => $this->doc_creatorid,

            // ====== Relationships ======
            'client'  => new ClientResource($this->whenLoaded('client')),
            'project' => new ProjectResource($this->whenLoaded('project')),
            'lead'    => new LeadResource($this->whenLoaded('lead')),
        ];
    }
}