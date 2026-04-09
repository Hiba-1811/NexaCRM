<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Tag Model
 * Table: tags
 * Polymorphic — ynajem ykoun 3la kol ħaja:
 * invoice | project | client | lead | task | estimate | ticket | contract | proposal.
 * tag_visibility: public (admin) | user (personal).
 */
class Tag extends Model
{
    protected $table = 'tags';
    protected $primaryKey = 'tag_id';
    public $timestamps = false;

    protected $fillable = [
        'tag_created', 'tag_updated', 'tag_creatorid',
        'tag_title', 'tag_visibility',
        'tagresource_type', 'tagresource_id',
    ];

    protected $casts = [
        'tag_created' => 'datetime',
        'tag_updated' => 'datetime',
    ];

    public function creator() { return $this->belongsTo(User::class, 'tag_creatorid', 'id'); }

    // Polymorphic parent
    public function taggable()
    {
        return $this->morphTo('tagresource', 'tagresource_type', 'tagresource_id');
    }
}