<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    protected $table = 'clients';
    protected $primaryKey = 'client_id';
    public $timestamps = false;
    protected static function booted()
{
    static::creating(function ($client) {
        $client->client_created = now();
        $client->client_updated = now();
    });

    static::updating(function ($client) {
        $client->client_updated = now();
    });
}

    protected $fillable = [
        'client_importid',
        'client_created',
        'client_updated',
        'client_creatorid',
        'client_created_from_leadid',
        'client_categoryid',
        'client_company_name',
        'client_description',
        'client_phone',
        'client_logo_folder',
        'client_logo_filename',
        'client_website',
        'client_vat',
        'client_billing_street',
        'client_billing_city',
        'client_billing_state',
        'client_billing_zip',
        'client_billing_country',
        'client_shipping_street',
        'client_shipping_city',
        'client_shipping_state',
        'client_shipping_zip',
        'client_shipping_country',
        'client_status',
        'client_app_modules',
        'client_settings_modules_projects',
        'client_settings_modules_invoices',
        'client_settings_modules_payments',
        'client_settings_modules_knowledgebase',
        'client_settings_modules_estimates',
        'client_settings_modules_subscriptions',
        'client_settings_modules_tickets',
        'client_billing_invoice_terms',
        'client_billing_invoice_due_days',
    ];

    protected $casts = [
        'client_created' => 'datetime',
        'client_updated' => 'datetime',
        'client_billing_invoice_due_days' => 'integer',
    ];

    // ======= Relationships =======

    // Client -> Projects
    public function projects()
    {
        return $this->hasMany(Project::class, 'project_clientid', 'client_id');
    }

    // Client -> Invoices
    public function invoices()
    {
        return $this->hasMany(Invoice::class, 'bill_clientid', 'client_id');
    }

    // Client -> Estimates
    public function estimates()
    {
        return $this->hasMany(Estimate::class, 'bill_clientid', 'client_id');
    }

    // Client -> Tickets
    public function tickets()
    {
        return $this->hasMany(Ticket::class, 'ticket_clientid', 'client_id');
    }

    // Client -> Contacts (users mta3 el client)
    public function contacts()
    {
        return $this->hasMany(User::class, 'clientid', 'client_id');
    }

    // Client -> Lead ily tħawwel minnu
    public function lead()
    {
        return $this->belongsTo(Lead::class, 'client_created_from_leadid', 'lead_id');
    }

    // Client -> Payments
    public function payments()
    {
        return $this->hasMany(Payment::class, 'payment_clientid', 'client_id');
    }
}