<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class WebformResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'              => $this->webform_id,
            'unique_id'       => $this->webform_uniqueid,
            'title'           => $this->webform_title,
            'type'            => $this->webform_type,   // lead | etc
            'status'          => $this->webform_status, // enabled | disabled
            'submissions'     => $this->webform_submissions,
            'lead_title'      => $this->webform_lead_title,
            'lead_status'     => $this->webform_lead_status,
            'thankyou_message'=> $this->webform_thankyou_message,
            'submit_text'     => $this->webform_submit_button_text,
            'background_color'=> $this->webform_background_color,
            'recaptcha'       => $this->webform_recaptcha,

            // ====== Notifications ======
            'notifications' => [
                'notify_assigned' => $this->webform_notify_assigned,
                'notify_admin'    => $this->webform_notify_admin,
            ],

            'creator_id' => $this->webform_creatorid,
            'created_at' => $this->webform_created,

            'assignees' => UserResource::collection($this->whenLoaded('assignees')),
        ];
    }
}