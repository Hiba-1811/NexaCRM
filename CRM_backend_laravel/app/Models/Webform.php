<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Webform Model
 * Table: webforms
 * Forms mta3 el site — ynajem ykhlek leads yetkhol9ou automatiquement.
 * webform_type: lead | etc.
 * webform_status: enabled | disabled.
 */
class Webform extends Model
{
    protected $table = 'webforms';
    protected $primaryKey = 'webform_id';
    public $timestamps = false;

    protected $fillable = [
        'webform_uniqueid', 'webform_created', 'webform_updated',
        'webform_creatorid', 'webform_title', 'webform_type',
        'webform_builder_payload', 'webform_thankyou_message',
        'webform_notify_assigned', 'webform_notify_admin',
        'webform_submissions', 'webform_user_captcha',
        'webform_submit_button_text', 'webform_background_color',
        'webform_lead_title', 'webform_lead_status',
        'webform_style_css', 'webform_recaptcha', 'webform_status',
    ];

    protected $casts = [
        'webform_created'     => 'datetime',
        'webform_updated'     => 'datetime',
        'webform_submissions' => 'integer',
        'webform_lead_status' => 'integer',
    ];

    public function creator() { return $this->belongsTo(User::class, 'webform_creatorid', 'id'); }

    // Webform -> Assigned users (who gets notified)
    public function assignees()
    {
        return $this->belongsToMany(
            User::class,
            'webforms_assigned',
            'webformassigned_formid',
            'webformassigned_userid'
        );
    }
}