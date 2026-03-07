<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Category Model
 * Table: categories
 * Shared categories pour: projects, clients, contracts, expenses,
 * invoices, leads, tickets, items, estimates, knowledgebase.
 * category_type yfarreq binhom.
 */
class Category extends Model
{
    protected $table = 'categories';
    protected $primaryKey = 'category_id';
    public $timestamps = false;

    protected $fillable = [
        'category_uniqueid', 'category_created', 'category_updated',
        'category_creatorid', 'category_name', 'category_description',
        'category_system_default', 'category_visibility', 'category_icon',
        'category_type', 'category_slug',
    ];

    protected $casts = [
        'category_created' => 'datetime',
        'category_updated' => 'datetime',
    ];

    // Category -> Projects
    public function projects()
    {
        return $this->hasMany(Project::class, 'project_categoryid', 'category_id');
    }

    // Category -> Clients
    public function clients()
    {
        return $this->hasMany(Client::class, 'client_categoryid', 'category_id');
    }

    // Category -> Leads
    public function leads()
    {
        return $this->hasMany(Lead::class, 'lead_categoryid', 'category_id');
    }
}