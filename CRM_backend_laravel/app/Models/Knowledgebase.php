<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Knowledgebase Model
 * Table: knowledgebase
 * Articles mta3 el knowledge base — visible lil clients.
 * Kol article marboot b category (kb_categories).
 */
class Knowledgebase extends Model
{
    protected $table = 'knowledgebase';
    protected $primaryKey = 'knowledgebase_id';
    public $timestamps = false;

    protected $fillable = [
        'knowledgebase_created', 'knowledgebase_updated',
        'knowledgebase_creatorid', 'knowledgebase_categoryid',
        'knowledgebase_title', 'knowledgebase_slug',
        'knowledgebase_text', 'knowledgebase_embed_video_id',
        'knowledgebase_embed_code', 'knowledgebase_embed_thumb',
    ];

    protected $casts = [
        'knowledgebase_created' => 'datetime',
        'knowledgebase_updated' => 'datetime',
    ];

    public function creator() { return $this->belongsTo(User::class,     'knowledgebase_creatorid',  'id');          }
    public function category(){ return $this->belongsTo(Category::class, 'knowledgebase_categoryid', 'category_id'); }
}