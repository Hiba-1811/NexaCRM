<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('lineitems', function (Blueprint $table) {
            $table->integer('lineitem_id')->primary();
            $table->integer('lineitem_position')->nullable();
            $table->timestamp('lineitem_created')->nullable();
            $table->timestamp('lineitem_updated')->nullable();
            $table->text('lineitem_description')->nullable();
            $table->string('lineitem_rate', 250)->nullable();
            $table->string('lineitem_unit', 100)->nullable();
            $table->float('lineitem_quantity')->nullable();
            $table->decimal('lineitem_total', 15)->nullable();
            $table->string('lineitemresource_linked_type', 30)->nullable();
            $table->integer('lineitemresource_linked_id')->nullable();
            $table->string('lineitemresource_type', 50)->nullable();
            $table->integer('lineitemresource_id')->nullable();
            $table->string('lineitem_type', 10)->nullable()->default('plain');
            $table->integer('lineitem_time_hours')->nullable();
            $table->integer('lineitem_time_minutes')->nullable();
            $table->text('lineitem_time_timers_list')->nullable();
            $table->float('lineitem_dimensions_length')->nullable();
            $table->float('lineitem_dimensions_width')->nullable();
            $table->string('lineitem_tax_status', 100)->nullable()->default('taxable');
            $table->integer('lineitem_linked_product_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lineitems');
    }
};
