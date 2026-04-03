<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Invoice extends Model
{
    protected $table = 'invoices';
    protected $primaryKey = 'bill_invoiceid';
    public $timestamps = false;
    protected $fillable = [
        'bill_uniqueid', 'bill_created', 'bill_updated', 'bill_clientid',
        'bill_projectid', 'bill_creatorid', 'bill_categoryid', 'bill_date',
        'bill_due_date', 'bill_subtotal', 'bill_discount_type', 'bill_discount_amount',
        'bill_final_amount', 'bill_notes', 'bill_terms', 'bill_status',
        'bill_recurring', 'bill_invoice_type', 'bill_type', 'bill_visibility',
        'bill_viewed_by_client',
    ];
    protected $casts = [
        'bill_created' => 'datetime', 'bill_updated' => 'datetime',
        'bill_date' => 'date', 'bill_due_date' => 'date',
        'bill_subtotal' => 'decimal:2', 'bill_final_amount' => 'decimal:2',
    ];
}
