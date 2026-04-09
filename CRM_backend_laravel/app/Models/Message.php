<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Message Model
 * Table: messages
 * Internal chat system bein el users.
 * message_source = sender unique_id, message_target = receiver unique_id.
 * message_type: text | file.
 */
class Message extends Model
{
    protected $table = 'messages';
    protected $primaryKey = 'message_id';
    public $timestamps = false;

    protected $fillable = [
        'message_unique_id', 'message_created', 'message_updated',
        'message_timestamp', 'message_creatorid', 'message_source',
        'message_target', 'message_creator_uniqueid', 'message_target_uniqueid',
        'message_text', 'message_file_name', 'message_file_directory',
        'message_file_thumb_name', 'message_file_type',
        'message_type', 'message_status',
    ];

    protected $casts = [
        'message_created'   => 'datetime',
        'message_updated'   => 'datetime',
        'message_timestamp' => 'integer',
    ];

    public function sender()
    {
        return $this->belongsTo(User::class, 'message_creatorid', 'id');
    }
}