<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    protected $table = 'tickets';
    protected $primaryKey = 'ticket_id';
    public $timestamps = false;

    protected $fillable = [
        'ticket_subject',
        'ticket_message',
        'ticket_priority',
        'ticket_status',
        'ticket_source',
        'ticket_clientid',
        'ticket_projectid',
        'ticket_categoryid',
        'ticket_creatorid',
        'ticket_active_state',
        'ticket_user_type',
    ];

    protected $attributes = [
        'ticket_status' => 1,
        'ticket_priority' => 'normal',
        'ticket_source' => 'web',
        'ticket_active_state' => 'yes',
        'ticket_user_type' => 'admin',
    ];
}
