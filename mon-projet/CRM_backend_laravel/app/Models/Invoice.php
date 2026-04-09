<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    protected $table = 'invoices';
    protected $primaryKey = 'bill_invoiceid';
    public $timestamps = false;

    protected $fillable = [
        'bill_uniqueid',
        'bill_created',
        'bill_updated',
        'bill_clientid',
        'bill_projectid',
        'bill_creatorid',
        'bill_categoryid',
        'bill_date',
        'bill_due_date',
        'bill_subtotal',
        'bill_discount_type',
        'bill_discount_amount',
        'bill_final_amount',
        'bill_notes',
        'bill_terms',
        'bill_status',
        'bill_recurring',
        'bill_invoice_type',
        'bill_type',
        'bill_visibility',
        'bill_viewed_by_client',
    ];

    protected $casts = [
        'bill_created'      => 'datetime',
        'bill_updated'      => 'datetime',
        'bill_date'         => 'date',
        'bill_due_date'     => 'date',
        'bill_subtotal'     => 'decimal:2',
        'bill_final_amount' => 'decimal:2',
    ];

    // Invoice -> Client
    public function client()
    {
        return $this->belongsTo(Client::class, 'bill_clientid', 'client_id');
    }

    // Invoice -> Project
    public function project()
    {
        return $this->belongsTo(Project::class, 'bill_projectid', 'project_id');
    }

    // Invoice -> Payments
    public function payments()
    {
        return $this->hasMany(Payment::class, 'payment_invoiceid', 'bill_invoiceid');
    }

    // Invoice -> LineItems
    public function lineItems()
    {
        return $this->hasMany(LineItem::class, 'lineitemresource_id', 'bill_invoiceid')
                    ->where('lineitemresource_type', 'invoice');
    }
}