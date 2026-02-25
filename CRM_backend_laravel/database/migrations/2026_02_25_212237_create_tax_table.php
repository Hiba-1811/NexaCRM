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
        Schema::create('tax', function (Blueprint $table) {
            $table->integer('tax_id')->primary();
            $table->integer('tax_taxrateid');
            $table->timestamp('tax_created');
            $table->timestamp('tax_updated');
            $table->string('tax_name', 100)->nullable();
            $table->decimal('tax_rate', 10)->nullable();
            $table->string('tax_type', 50)->nullable()->default('summary');
            $table->integer('tax_lineitem_id')->nullable();
            $table->string('taxresource_type', 50)->nullable();
            $table->integer('taxresource_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tax');
    }
};
