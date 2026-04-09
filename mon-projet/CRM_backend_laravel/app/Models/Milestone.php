<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Milestone Model
 * Table: milestones
 * Used lil project management — tgrouped tasks dessous.
 * Kol project 3endou milestone 'uncategorised' automatique.
 */
class Milestone extends Model
{
    protected $table = 'milestones';
    protected $primaryKey = 'milestone_id';
    public $timestamps = false;

    protected $fillable = [
        'milestone_created', 'milestone_updated', 'milestone_creatorid',
        'milestone_title', 'milestone_projectid', 'milestone_position',
        'milestone_type', 'milestone_color',
    ];

    protected $casts = [
        'milestone_created'  => 'datetime',
        'milestone_updated'  => 'datetime',
        'milestone_position' => 'integer',
    ];

    public function project() { return $this->belongsTo(Project::class, 'milestone_projectid', 'project_id'); }
    public function creator() { return $this->belongsTo(User::class,    'milestone_creatorid', 'id');         }

    public function tasks()
    {
        return $this->hasMany(Task::class, 'task_milestoneid', 'milestone_id');
    }
}