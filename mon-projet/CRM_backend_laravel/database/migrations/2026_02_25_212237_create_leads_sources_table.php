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
        Schema::create('leads_sources', function (Blueprint $table) {
            $table->integer('leadsources_id')->primary();
            $table->timestamp('leadsources_created');
            $table->timestamp('leadsources_updated');
            $table->integer('leadsources_creatorid');
            $table->string('leadsources_title', 200);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('leads_sources');
    }
};
