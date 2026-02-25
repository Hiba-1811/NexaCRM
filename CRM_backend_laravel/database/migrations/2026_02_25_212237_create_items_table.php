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
        Schema::create('items', function (Blueprint $table) {
            $table->integer('item_id')->primary();
            $table->timestamp('item_created')->nullable();
            $table->timestamp('item_updated')->nullable();
            $table->integer('item_categoryid')->default(8);
            $table->integer('item_creatorid');
            $table->string('item_type', 100)->default('standard');
            $table->text('item_description')->nullable();
            $table->string('item_unit', 50)->nullable();
            $table->decimal('item_rate', 15);
            $table->string('item_tax_status', 100)->default('taxable');
            $table->decimal('item_dimensions_length', 15)->nullable();
            $table->decimal('item_dimensions_width', 15)->nullable();
            $table->text('item_notes_estimatation')->nullable();
            $table->text('item_notes_production')->nullable();
            $table->text('itemresource_type')->nullable();
            $table->integer('itemresource_id')->nullable();
            $table->text('item_mapping_type')->nullable();
            $table->integer('item_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('items');
    }
};
