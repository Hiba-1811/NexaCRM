<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Comment Model
 * Table: comments
 * Polymorphic — ynajem ykoun 3la: project | ticket | task | lead.
 * commentresource_type = ism el table, commentresource_id = el id.
 */
class Comment extends Model
{
    protected $table = 'comments';
    protected $primaryKey = 'comment_id';
    public $timestamps = false;

    protected $fillable = [
        'comment_created', 'comment_updated', 'comment_creatorid',
        'comment_clientid', 'comment_text', 'comment_client_status',
        'comment_team_status', 'commentresource_type', 'commentresource_id',
    ];

    protected $casts = [
        'comment_created' => 'datetime',
        'comment_updated' => 'datetime',
    ];

    public function creator() { return $this->belongsTo(User::class,   'comment_creatorid', 'id');         }
    public function client()  { return $this->belongsTo(Client::class, 'comment_clientid',  'client_id'); }

    // Polymorphic parent (task, project, lead, ticket)
    public function commentable()
    {
        return $this->morphTo('commentresource', 'commentresource_type', 'commentresource_id');
    }
}