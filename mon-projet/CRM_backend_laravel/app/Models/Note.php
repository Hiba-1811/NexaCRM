<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Note Model
 * Table: notes
 * Polymorphic — tnajem tkoun 3la: client | project | user | lead.
 * Notes private = visible bass lil user illi 3amelhom.
 */
class Note extends Model
{
    protected $table = 'notes';
    protected $primaryKey = 'note_id';
    public $timestamps = false;

    protected $fillable = [
        'note_created', 'note_updated', 'note_creatorid',
        'note_title', 'note_description', 'note_visibility',
        'noteresource_type', 'noteresource_id',
    ];

    protected $casts = [
        'note_created' => 'datetime',
        'note_updated' => 'datetime',
    ];

    public function creator() { return $this->belongsTo(User::class, 'note_creatorid', 'id'); }

    // Polymorphic parent
    public function notable()
    {
        return $this->morphTo('noteresource', 'noteresource_type', 'noteresource_id');
    }
}