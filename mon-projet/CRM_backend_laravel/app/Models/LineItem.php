<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * LineItem Model
 * Table: lineitems
 * Polymorphic — ligne mta3 invoice ou estimate.
 * lineitem_type: plain | time | dimensions.
 * lineitemresource_type: invoice | estimate.
 */
class LineItem extends Model
{
    protected $table = 'lineitems';
    protected $primaryKey = 'lineitem_id';
    public $timestamps = false;

    protected $fillable = [
        'lineitem_position', 'lineitem_created', 'lineitem_updated',
        'lineitem_description', 'lineitem_rate', 'lineitem_unit',
        'lineitem_quantity', 'lineitem_total',
        'lineitemresource_linked_type', 'lineitemresource_linked_id',
        'lineitemresource_type', 'lineitemresource_id',
        'lineitem_type', 'lineitem_time_hours', 'lineitem_time_minutes',
        'lineitem_time_timers_list', 'lineitem_dimensions_length',
        'lineitem_dimensions_width', 'lineitem_tax_status',
        'lineitem_linked_product_id',
    ];

    protected $casts = [
        'lineitem_created'  => 'datetime',
        'lineitem_updated'  => 'datetime',
        'lineitem_total'    => 'decimal:2',
        'lineitem_quantity' => 'float',
    ];

    // LineItem -> Invoice ou Estimate (polymorphic)
    public function lineitemable()
    {
        return $this->morphTo('lineitemresource', 'lineitemresource_type', 'lineitemresource_id');
    }

    // LineItem -> Item (product catalogue)
    public function product()
    {
        return $this->belongsTo(Item::class, 'lineitem_linked_product_id', 'item_id');
    }
}