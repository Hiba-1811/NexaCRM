<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * UserResource
 *
 * POURQUOI:
 * - Nkhabbu el password w token (CRITICAL security)
 * - Nzidou 'full_name' computed field
 * - Nzidou 'avatar_url' ready lil frontend
 * - Nfarq8ou bein team user w client user
 */
class UserResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            // ====== Identity ======
            'id'         => $this->id,
            'unique_id'  => $this->unique_id,
            'full_name'  => trim($this->first_name . ' ' . $this->last_name), // computed
            'first_name' => $this->first_name,
            'last_name'  => $this->last_name,
            'email'      => $this->email,
            'phone'      => $this->phone,
            'position'   => $this->position,

            // ====== Type & Status ======
            'type'           => $this->type,           // team | client
            'status'         => $this->status,         // active | inactive
            'account_owner'  => $this->account_owner,
            'primary_admin'  => $this->primary_admin,

            // ====== Avatar ======
            // Computed URL — frontend mach9ach yban el path
            'avatar_url' => $this->avatar_filename
                ? asset('storage/' . $this->avatar_directory . '/' . $this->avatar_filename)
                : null,

            // ====== Preferences ======
            'preferences' => [
                'language'          => $this->pref_language,
                'theme'             => $this->pref_theme,
                'email_notifs'      => $this->pref_email_notifications,
                'filter_own_tasks'  => $this->pref_filter_own_tasks,
            ],

            // ====== Notification Settings ======
            'notifications' => [
                'system'       => $this->notifications_system,
                'new_project'  => $this->notifications_new_project,
                'billing'      => $this->notifications_billing_activity,
                'tasks'        => $this->notifications_tasks_activity,
                'tickets'      => $this->notifications_tickets_activity,
                'reminders'    => $this->notifications_reminders,
            ],

            // ====== Social Links ======
            'social' => [
                'facebook' => $this->social_facebook,
                'twitter'  => $this->social_twitter,
                'linkedin' => $this->social_linkedin,
                'github'   => $this->social_github,
            ],

            // ====== Meta ======
            'last_seen'   => $this->last_seen,
            'timezone'    => $this->timezone,
            'client_id'   => $this->clientid, // null ila team user
            'created_at'  => $this->created,
            'updated_at'  => $this->updated,

            // ====== Relationships (loaded only when needed) ======
            // whenLoaded = mich ydir query ila mich requested
            'role' => new RoleResource($this->whenLoaded('role')),
        ];

        // ❌ MHEDHECH MAWJOUD: password, remember_token, forgot_password_token
    }
}