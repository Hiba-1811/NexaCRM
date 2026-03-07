<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    protected $table = 'tickets';
    protected $primaryKey = 'ticket_id';
    public $timestamps = false;

    protected $fillable = [
        'ticket_created',
        'ticket_updated',
        'ticket_creatorid',
        'ticket_categoryid',
        'ticket_clientid',
        'ticket_projectid',
        'ticket_subject',
        'ticket_message',
        'ticket_priority',
        'ticket_status',
        'ticket_source',
        'ticket_active_state',
        'ticket_user_type',
    ];

    protected $casts = [
        'ticket_created'      => 'datetime',
        'ticket_updated'      => 'datetime',
        'ticket_status'       => 'integer',
    ];

    // Ticket -> Client
    public function client()
    {
        return $this->belongsTo(Client::class, 'ticket_clientid', 'client_id');
    }

    // Ticket -> Project
    public function project()
    {
        return $this->belongsTo(Project::class, 'ticket_projectid', 'project_id');
    }

    // Ticket -> Replies
    public function replies()
    {
        return $this->hasMany(TicketReply::class, 'ticketreply_ticketid', 'ticket_id');
    }

    // Ticket -> Attachments
    public function attachments()
    {
        return $this->hasMany(Attachment::class, 'attachmentresource_id', 'ticket_id')
                    ->where('attachmentresource_type', 'ticket');
    }
}