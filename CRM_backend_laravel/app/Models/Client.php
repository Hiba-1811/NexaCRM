<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    protected $table = 'clients';
    protected $primaryKey = 'client_id';
    public $timestamps = false;

    protected $fillable = [
        'client_company_name',
        'client_description',
        'client_phone',
        'client_website',
        'client_vat',
        'client_status',
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
        'client_categoryid',
        'client_creatorid',
        'client_created_from_leadid',
    ];

    protected $attributes = [
        'client_created_from_leadid' => 0,
        'client_status' => 'active',
    ];
}
