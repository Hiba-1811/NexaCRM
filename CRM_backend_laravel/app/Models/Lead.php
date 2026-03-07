<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Lead extends Model
{
    protected $table = 'leads';
    protected $primaryKey = 'lead_id';
    public $timestamps = false;

    protected $fillable = [
        'lead_uniqueid',
        'lead_importid',
        'lead_position',
        'lead_created',
        'lead_updated',
        'lead_creatorid',
        'lead_categoryid',
        'lead_firstname',
        'lead_lastname',
        'lead_email',
        'lead_phone',
        'lead_job_position',
        'lead_company_name',
        'lead_website',
        'lead_source',
        'lead_input_source',
        'lead_title',
        'lead_description',
        'lead_value',
        'lead_last_contacted',
        'lead_converted',
        'lead_converted_by_userid',
        'lead_converted_date',
        'lead_converted_clientid',
        'lead_status',
        'lead_active_state',
        'lead_visibility',
    ];

    protected $casts = [
        'lead_created'        => 'datetime',
        'lead_updated'        => 'datetime',
        'lead_converted_date' => 'datetime',
        'lead_last_contacted' => 'date',
        'lead_value'          => 'decimal:2',
        'lead_status'         => 'integer',
    ];

    // Lead -> Users assigned
    public function assignees()
    {
        return $this->belongsToMany(User::class, 'leads_assigned', 'leadsassigned_leadid', 'leadsassigned_userid');
    }

    // Lead -> Client (ba3d ma ytħawwel)
    public function client()
    {
        return $this->belongsTo(Client::class, 'lead_converted_clientid', 'client_id');
    }

    // Lead -> Comments
    public function comments()
    {
        return $this->hasMany(Comment::class, 'commentresource_id', 'lead_id')
                    ->where('commentresource_type', 'lead');
    }

    // Lead -> Notes
    public function notes()
    {
        return $this->hasMany(Note::class, 'noteresource_id', 'lead_id')
                    ->where('noteresource_type', 'lead');
    }
}