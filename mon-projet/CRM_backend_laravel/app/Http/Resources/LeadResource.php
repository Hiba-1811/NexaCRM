<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * LeadResource
 *
 * POURQUOI:
 * - Ngroupiw el contact info f object
 * - Ngroupiw el address f object
 * - Ngroupiw el conversion info f object
 * - Nkhabbu el 150 custom fields (internal)
 */
class LeadResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            // ====== Identity ======
            'id'        => $this->lead_id,
            'unique_id' => $this->lead_uniqueid,
            'title'     => $this->lead_title,
            'position'  => $this->lead_position,

            // ====== Contact Info (grouped) ======
            'contact' => [
                'first_name'   => $this->lead_firstname,
                'last_name'    => $this->lead_lastname,
                'full_name'    => trim($this->lead_firstname . ' ' . $this->lead_lastname),
                'email'        => $this->lead_email,
                'phone'        => $this->lead_phone,
                'job_position' => $this->lead_job_position,
                'company_name' => $this->lead_company_name,
                'website'      => $this->lead_website,
            ],

            // ====== Address (grouped) ======
            'address' => [
                'street'  => $this->lead_street,
                'city'    => $this->lead_city,
                'state'   => $this->lead_state,
                'zip'     => $this->lead_zip,
                'country' => $this->lead_country,
            ],

            // ====== Lead Info ======
            'description'    => $this->lead_description,
            'value'          => $this->lead_value,
            'source'         => $this->lead_source,
            'input_source'   => $this->lead_input_source, // app | webform
            'status'         => $this->lead_status,
            'active_state'   => $this->lead_active_state, // active | archived
            'last_contacted' => $this->lead_last_contacted,

            // ====== Conversion Info (grouped) ======
            'conversion' => [
                'converted'    => $this->lead_converted,
                'date'         => $this->lead_converted_date,
                'client_id'    => $this->lead_converted_clientid,
                'converted_by' => $this->lead_converted_by_userid,
            ],

            // ====== Meta ======
            'category_id' => $this->lead_categoryid,
            'creator_id'  => $this->lead_creatorid,
            'created_at'  => $this->lead_created,
            'updated_at'  => $this->lead_updated,

            // ====== Relationships ======
            'assignees' => UserResource::collection($this->whenLoaded('assignees')),
            'client'    => new ClientResource($this->whenLoaded('client')),
            'comments'  => CommentResource::collection($this->whenLoaded('comments')),
            'notes'     => NoteResource::collection($this->whenLoaded('notes')),
        ];
    }
}