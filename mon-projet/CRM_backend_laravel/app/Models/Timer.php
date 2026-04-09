<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Timer Model
 * Table: timers
 * Takhzen el timers mta3 el tasks — used lil timesheet.
 * timer_started w timer_stopped = unix timestamps.
 * timer_time = total seconds.
 */
class Timer extends Model
{
    protected $table = 'timers';
    protected $primaryKey = 'timer_id';
    public $timestamps = false;

    protected $fillable = [
        'timer_created', 'timer_updated', 'timer_creatorid',
        'timer_recorded_by', 'timer_started', 'timer_stopped',
        'timer_time', 'timer_taskid', 'timer_projectid',
        'timer_clientid', 'timer_status', 'timer_billing_status',
        'timer_billing_invoiceid',
    ];

    protected $casts = [
        'timer_created' => 'datetime',
        'timer_updated' => 'datetime',
        'timer_time'    => 'integer',
    ];

    public function task()    { return $this->belongsTo(Task::class,    'timer_taskid',    'task_id');    }
    public function project() { return $this->belongsTo(Project::class, 'timer_projectid', 'project_id'); }
    public function client()  { return $this->belongsTo(Client::class,  'timer_clientid',  'client_id');  }
    public function creator() { return $this->belongsTo(User::class,    'timer_creatorid', 'id');         }
}