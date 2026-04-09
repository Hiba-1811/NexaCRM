<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * CalendarEvent Model
 * Table: calendar_events
 * Takhzen calendar events mta3 el users.
 * Ynajem ykon shared m3a users o5rin via calendar_events_sharing.
 */
class CalendarEvent extends Model
{
    protected $table = 'calendar_events';
    protected $primaryKey = 'event_id';
    public $timestamps = false;

    protected $fillable = [
        'event_created', 'event_updated', 'event_creatorid',
        'event_title', 'event_description', 'event_start',
        'event_end', 'event_color', 'event_all_day',
        'event_recurrence', 'event_status',
    ];

    protected $casts = [
        'event_created' => 'datetime',
        'event_updated' => 'datetime',
        'event_start'   => 'datetime',
        'event_end'     => 'datetime',
    ];

    public function creator() { return $this->belongsTo(User::class, 'event_creatorid', 'id'); }

    // CalendarEvent -> Shared users
    public function sharedWith()
    {
        return $this->belongsToMany(
            User::class,
            'calendar_events_sharing',
            'eventsharing_eventid',
            'eventsharing_userid'
        );
    }
}