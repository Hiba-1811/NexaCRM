<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Proposal Model
 * Table: proposals
 * Nafs structure mta3 contracts — bass doc_type = 'proposal'.
 * Ynajem ykon signed mel client bass (mich 2 jiha).
 */
class Proposal extends Model
{
    protected $table = 'proposals';
    protected $primaryKey = 'doc_id';
    public $timestamps = false;

    protected $fillable = [
        'doc_unique_id', 'doc_template', 'doc_created', 'doc_updated',
        'doc_date_status_change', 'doc_creatorid', 'doc_categoryid',
        'doc_heading', 'doc_heading_color', 'doc_title', 'doc_title_color',
        'doc_body', 'doc_date_start', 'doc_date_end', 'doc_date_published',
        'doc_date_last_emailed', 'doc_client_id', 'doc_project_id',
        'doc_lead_id', 'doc_notes', 'doc_viewed', 'doc_type',
        'doc_system_type', 'doc_status', 'doc_signed_date',
        'proposal_automation_status',
    ];

    protected $casts = [
        'doc_created'            => 'datetime',
        'doc_updated'            => 'datetime',
        'doc_date_status_change' => 'datetime',
        'doc_date_start'         => 'date',
        'doc_date_end'           => 'date',
        'doc_date_published'     => 'date',
        'doc_date_last_emailed'  => 'datetime',
        'doc_signed_date'        => 'datetime',
    ];

    public function client()  { return $this->belongsTo(Client::class,  'doc_client_id',  'client_id');  }
    public function project() { return $this->belongsTo(Project::class, 'doc_project_id', 'project_id'); }
    public function lead()    { return $this->belongsTo(Lead::class,    'doc_lead_id',    'lead_id');    }
    public function creator() { return $this->belongsTo(User::class,    'doc_creatorid',  'id');         }
}