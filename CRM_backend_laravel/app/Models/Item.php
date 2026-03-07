<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Item Model
 * Table: items
 * Product/Service catalogue — yetsta3mel fi invoices w estimates.
 * item_type: standard | dimensions.
 * item_tax_status: taxable | exempt.
 */
class Item extends Model
{
    protected $table = 'items';
    protected $primaryKey = 'item_id';
    public $timestamps = false;

    protected $fillable = [
        'item_created', 'item_updated', 'item_categoryid',
        'item_creatorid', 'item_type', 'item_description',
        'item_unit', 'item_rate', 'item_tax_status',
        'item_dimensions_length', 'item_dimensions_width',
        'item_notes_estimatation', 'item_notes_production',
    ];

    protected $casts = [
        'item_created'            => 'datetime',
        'item_updated'            => 'datetime',
        'item_rate'               => 'decimal:2',
        'item_dimensions_length'  => 'decimal:2',
        'item_dimensions_width'   => 'decimal:2',
    ];

    public function category() { return $this->belongsTo(Category::class, 'item_categoryid', 'category_id'); }
    public function creator()  { return $this->belongsTo(User::class,     'item_creatorid',  'id');          }

    // Item -> LineItems (used in invoices/estimates)
    public function lineItems()
    {
        return $this->hasMany(LineItem::class, 'lineitem_linked_product_id', 'item_id');
    }
}