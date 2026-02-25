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
        Schema::create('pinned', function (Blueprint $table) {
            $table->integer('pinned_id')->primary();
            $table->integer('pinned_created');
            $table->integer('pinned_updated');
            $table->integer('pinned_userid')->nullable();
            $table->string('pinned_status', 50)->nullable()->default('pinned');
            $table->string('pinnedresource_type', 50)->nullable();
            $table->integer('pinnedresource_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pinned');
    }
};
