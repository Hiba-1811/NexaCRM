<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $table = 'payments';
    protected $primaryKey = 'payment_id';
    public $timestamps = false;

    protected $fillable = [
        'payment_created',
        'payment_updated',
        'payment_creatorid',
        'payment_date',
        'payment_invoiceid',
        'payment_clientid',
        'payment_projectid',
        'payment_amount',
        'payment_transaction_id',
        'payment_gateway',
        'payment_notes',
        'payment_type',
    ];

    protected $casts = [
        'payment_created' => 'datetime',
        'payment_updated' => 'datetime',
        'payment_date'    => 'date',
        'payment_amount'  => 'decimal:2',
    ];

    // Payment -> Invoice
    public function invoice()
    {
        return $this->belongsTo(Invoice::class, 'payment_invoiceid', 'bill_invoiceid');
    }

    // Payment -> Client
    public function client()
    {
        return $this->belongsTo(Client::class, 'payment_clientid', 'client_id');
    }
}