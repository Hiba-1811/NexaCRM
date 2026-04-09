<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Attachment Model
 * Table: attachments
 * Polymorphic — takhzen fichiers marbootin b: task | expense | ticket | ticketreply.
 * attachmentresource_type = ism el table, attachmentresource_id = el id.
 */
class Attachment extends Model
{
    protected $table = 'attachments';
    protected $primaryKey = 'attachment_id';
    public $timestamps = false;

    protected $fillable = [
        'attachment_uniqiueid', 'attachment_created', 'attachment_updated',
        'attachment_creatorid', 'attachment_clientid', 'attachment_directory',
        'attachment_filename', 'attachment_extension', 'attachment_type',
        'attachment_size', 'attachment_thumbname',
        'attachmentresource_type', 'attachmentresource_id',
    ];

    protected $casts = [
        'attachment_created' => 'datetime',
        'attachment_updated' => 'datetime',
    ];

    public function creator() { return $this->belongsTo(User::class,   'attachment_creatorid', 'id');        }
    public function client()  { return $this->belongsTo(Client::class, 'attachment_clientid',  'client_id'); }

    // Polymorphic parent
    public function attachable()
    {
        return $this->morphTo('attachmentresource', 'attachmentresource_type', 'attachmentresource_id');
    }
}

