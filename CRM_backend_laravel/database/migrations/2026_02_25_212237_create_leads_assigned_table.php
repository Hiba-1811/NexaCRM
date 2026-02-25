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
        Schema::create('leads_assigned', function (Blueprint $table) {
            $table->integer('leadsassigned_id')->primary();
            $table->integer('leadsassigned_leadid')->nullable();
            $table->integer('leadsassigned_userid')->nullable();
            $table->timestamp('leadsassigned_created');
            $table->timestamp('leadsassigned_updated');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('leads_assigned');
    }
};
