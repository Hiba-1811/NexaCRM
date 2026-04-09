<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Contract Model
 * Table: contracts
 * Takhzen contracts marbootin b clients, projects ou leads.
 * Ynajem ykon signed min 2 jiha: provider (charika) w client.
 */
class Contract extends Model
{
    protected $table = 'contracts';
    protected $primaryKey = 'doc_id';
    public $timestamps = false;

    protected $fillable = [
        'doc_unique_id', 
        'doc_template', 
        'doc_created', 
        'doc_updated',
        'doc_date_status_change'
        , 'doc_creatorid', 'doc_categoryid',
        'doc_heading', 'doc_heading_color', 'doc_title', 'doc_title_color',
        'doc_body', 'doc_date_start', 'doc_date_end', 'doc_date_published',
        'doc_date_last_emailed', 'doc_value', 'doc_client_id',
        'doc_project_id', 'doc_lead_id', 'doc_notes', 'doc_viewed',
        'doc_type', 'doc_system_type', 'doc_status',
        'doc_provider_signed_status', 'doc_provider_signed_date',
        'doc_provider_signed_userid', 'doc_signed_status', 'doc_signed_date',
        'doc_publishing_type', 'doc_publishing_scheduled_date',
        'doc_publishing_scheduled_status',
    ];

    protected $casts = [
        'doc_created'              => 'datetime',
        'doc_updated'              => 'datetime',
        'doc_date_status_change'   => 'datetime',
        'doc_date_start'           => 'date',
        'doc_date_end'             => 'date',
        'doc_date_published'       => 'date',
        'doc_date_last_emailed'    => 'datetime',
        'doc_provider_signed_date' => 'datetime',
        'doc_signed_date'          => 'datetime',
        'doc_value'                => 'decimal:2',
    ];

    public function client()   { return $this->belongsTo(Client::class,  'doc_client_id',  'client_id');  }
    public function project()  { return $this->belongsTo(Project::class, 'doc_project_id', 'project_id'); }
    public function lead()     { return $this->belongsTo(Lead::class,    'doc_lead_id',    'lead_id');    }
    public function creator()  { return $this->belongsTo(User::class,    'doc_creatorid',  'id');         }
}