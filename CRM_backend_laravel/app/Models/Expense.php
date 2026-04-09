<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Expense Model
 * Table: expenses
 * Takhzen el masarif — marbootin b client ou project.
 * Ynajem ykoun billable (nfatrouh lil client) ou mch billable.
 */
class Expense extends Model
{
    protected $table = 'expenses';
    protected $primaryKey = 'expense_id';
    public $timestamps = false;

    protected $fillable = [
        'expense_importid', 'expense_created', 'expense_updated',
        'expense_date', 'expense_clientid', 'expense_projectid',
        'expense_creatorid', 'expense_categoryid', 'expense_amount',
        'expense_description', 'expense_type', 'expense_billable',
        'expense_billing_status', 'expense_billable_invoiceid',
        'expense_recurring', 'expense_recurring_duration',
        'expense_recurring_period', 'expense_recurring_cycles',
        'expense_cron_status',
    ];

    protected $casts = [
        'expense_created' => 'date',
        'expense_updated' => 'date',
        'expense_date'    => 'date',
        'expense_amount'  => 'decimal:2',
    ];

    public function client()  { return $this->belongsTo(Client::class,  'expense_clientid',  'client_id');  }
    public function project() { return $this->belongsTo(Project::class, 'expense_projectid', 'project_id'); }
    public function creator() { return $this->belongsTo(User::class,    'expense_creatorid', 'id');         }

    public function invoice()
    {
        return $this->belongsTo(Invoice::class, 'expense_billable_invoiceid', 'bill_invoiceid');
    }
}