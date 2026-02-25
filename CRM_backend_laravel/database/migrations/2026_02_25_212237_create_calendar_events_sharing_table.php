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
        Schema::create('calendar_events_sharing', function (Blueprint $table) {
            $table->integer('calendarsharing_id')->primary();
            $table->timestamp('calendarsharing_created')->nullable();
            $table->timestamp('calendarsharing_updated')->nullable();
            $table->integer('calendarsharing_eventid');
            $table->integer('calendarsharing_userid')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('calendar_events_sharing');
    }
};
