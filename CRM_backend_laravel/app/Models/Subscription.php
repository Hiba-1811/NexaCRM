<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Subscription Model
 * Table: subscriptions
 * Takhzen subscriptions mta3 clients — integrated m3a Stripe.
 * Kol subscription marboota b client w tnajem tkoun marboota b project.
 */
class Subscription extends Model
{
    protected $table = 'subscriptions';
    protected $primaryKey = 'subscription_id';
    public $timestamps = false;

    protected $fillable = [
        'subscription_gateway_id', 'subscription_created', 'subscription_updated',
        'subscription_creatorid', 'subscription_clientid', 'subscription_categoryid',
        'subscription_projectid', 'subscription_gateway_product',
        'subscription_gateway_price', 'subscription_gateway_product_name',
        'subscription_gateway_interval', 'subscription_gateway_period',
        'subscription_date_started', 'subscription_date_ended',
        'subscription_date_renewed', 'subscription_date_next_renewal',
        'subscription_subtotal', 'subscription_final_amount',
        'subscription_tax_percentage', 'subscription_tax_amount',
        'subscription_notes', 'subscription_status', 'subscription_visibility',
        'subscription_cron_status',
    ];

    protected $casts = [
        'subscription_created'           => 'datetime',
        'subscription_updated'           => 'datetime',
        'subscription_date_started'      => 'datetime',
        'subscription_date_ended'        => 'datetime',
        'subscription_date_renewed'      => 'date',
        'subscription_date_next_renewal' => 'date',
        'subscription_subtotal'          => 'decimal:2',
        'subscription_final_amount'      => 'decimal:2',
        'subscription_tax_percentage'    => 'decimal:2',
        'subscription_tax_amount'        => 'decimal:2',
    ];

    public function client()  { return $this->belongsTo(Client::class,  'subscription_clientid',  'client_id');  }
    public function project() { return $this->belongsTo(Project::class, 'subscription_projectid', 'project_id'); }
    public function creator() { return $this->belongsTo(User::class,    'subscription_creatorid', 'id');         }

    public function payments()
    {
        return $this->hasMany(Payment::class, 'payment_subscriptionid', 'subscription_id');
    }
}