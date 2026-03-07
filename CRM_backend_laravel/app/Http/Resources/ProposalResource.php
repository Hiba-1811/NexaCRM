<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * ProposalResource — nafs logic mta3 contract, client signature bass
 */
class ProposalResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'          => $this->doc_id,
            'unique_id'   => $this->doc_unique_id,
            'type'        => $this->doc_type,
            'system_type' => $this->doc_system_type,
            'title'       => $this->doc_title,
            'body'        => $this->doc_body,
            'status'      => $this->doc_status, // draft | new | accepted | declined | revised | expired
            'viewed'      => $this->doc_viewed,
            'notes'       => $this->doc_notes,
            'automation_status' => $this->proposal_automation_status,

            'date_start'  => $this->doc_date_start,
            'date_end'    => $this->doc_date_end,
            'created_at'  => $this->doc_created,
            'updated_at'  => $this->doc_updated,

            // ====== Client Signature ======
            'signature' => [
                'date'       => $this->doc_signed_date,
                'first_name' => $this->doc_signed_first_name,
                'last_name'  => $this->doc_signed_last_name,
            ],

            'client_id'  => $this->doc_client_id,
            'project_id' => $this->doc_project_id,
            'lead_id'    => $this->doc_lead_id,

            'client'  => new ClientResource($this->whenLoaded('client')),
            'project' => new ProjectResource($this->whenLoaded('project')),
            'lead'    => new LeadResource($this->whenLoaded('lead')),
        ];
    }
}