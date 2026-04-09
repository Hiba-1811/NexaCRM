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
        Schema::create('leads_status', function (Blueprint $table) {
            $table->integer('leadstatus_id')->primary();
            $table->timestamp('leadstatus_created')->nullable();
            $table->integer('leadstatus_creatorid')->nullable();
            $table->timestamp('leadstatus_updated')->nullable();
            $table->string('leadstatus_title', 200);
            $table->integer('leadstatus_position');
            $table->string('leadstatus_color', 100)->default('default');
            $table->string('leadstatus_system_default', 10)->default('no');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('leads_status');
    }
};
