<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Reminder Model
 * Table: reminders
 * Polymorphic — ynajem ykoun 3la:
 * project | client | estimate | lead | task | invoice | ticket.
 * reminder_sent = 'yes' ba3d ma yetba3eth.
 */
class Reminder extends Model
{
    protected $table = 'reminders';
    protected $primaryKey = 'reminder_id';
    public $timestamps = false;

    protected $fillable = [
        'reminder_created', 'reminder_updated', 'reminder_userid',
        'reminder_datetime', 'reminder_timestamp', 'reminder_title',
        'reminder_meta', 'reminder_notes', 'reminder_status',
        'reminder_sent', 'reminderresource_type', 'reminderresource_id',
    ];

    protected $casts = [
        'reminder_created'  => 'datetime',
        'reminder_updated'  => 'datetime',
        'reminder_datetime' => 'datetime',
        'reminder_timestamp'=> 'timestamp',
    ];

    public function user() { return $this->belongsTo(User::class, 'reminder_userid', 'id'); }

    // Polymorphic parent
    public function remindable()
    {
        return $this->morphTo('reminderresource', 'reminderresource_type', 'reminderresource_id');
    }
}