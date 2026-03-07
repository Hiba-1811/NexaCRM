<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Checklist Model
 * Table: checklists
 * Polymorphic — checklist items mta3 tasks (w ghirhom).
 * checklist_status: pending | completed.
 */
class Checklist extends Model
{
    protected $table = 'checklists';
    protected $primaryKey = 'checklist_id';
    public $timestamps = false;

    protected $fillable = [
        'checklist_position', 'checklist_created', 'checklist_updated',
        'checklist_creatorid', 'checklist_clientid', 'checklist_text',
        'checklist_status', 'checklistresource_type', 'checklistresource_id',
    ];

    protected $casts = [
        'checklist_created'  => 'datetime',
        'checklist_updated'  => 'datetime',
        'checklist_position' => 'integer',
    ];

    public function creator() { return $this->belongsTo(User::class,   'checklist_creatorid', 'id');        }
    public function client()  { return $this->belongsTo(Client::class, 'checklist_clientid',  'client_id'); }

    // Polymorphic parent
    public function checklistable()
    {
        return $this->morphTo('checklistresource', 'checklistresource_type', 'checklistresource_id');
    }
}