<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('calendar_events_sharing', function (Blueprint $table) {
            $table->increments('calendarsharing_id');
            $table->dateTime('calendarsharing_created')->nullable();
            $table->dateTime('calendarsharing_updated')->nullable();
            $table->integer('calendarsharing_eventid');
            $table->integer('calendarsharing_userid')->nullable();

            $table->index('calendarsharing_eventid');
            $table->index('calendarsharing_userid');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('calendar_events_sharing');
    }
};