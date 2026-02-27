<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    protected $table = 'projects';
    protected $primaryKey = 'project_id';
    public $timestamps = false;

    protected $fillable = [
        'project_title',
        'project_description',
        'project_status',
        'project_active_state',
        'project_date_start',
        'project_date_due',
        'project_clientid',
        'project_creatorid',
        'project_categoryid',
        'project_progress',
        'project_billing_type',
        'project_billing_rate',
        'project_visibility',
    ];

    protected $attributes = [
        'project_status' => 'active',
        'project_active_state' => 1,
        'project_progress' => 0,
        'project_billing_type' => 'fixed_price',
        'project_visibility' => 'normal',
    ];
}
