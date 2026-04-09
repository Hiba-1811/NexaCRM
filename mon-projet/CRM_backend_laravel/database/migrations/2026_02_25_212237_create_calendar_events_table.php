<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('calendar_events', function (Blueprint $table) {
            $table->increments('calendar_event_id');
            $table->string('calendar_event_uniqueid', 100)->nullable();
            $table->dateTime('calendar_event_created');
            $table->dateTime('calendar_event_updated');
            $table->integer('calendar_event_creatorid')->nullable();
            $table->string('calendar_event_title', 200)->nullable();
            $table->text('calendar_event_description')->nullable();
            $table->text('calendar_event_location')->nullable();
            $table->string('calendar_event_all_day', 50)->default('yes');
            $table->date('calendar_event_start_date')->nullable();
            $table->time('calendar_event_start_time')->nullable();
            $table->date('calendar_event_end_date')->nullable();
            $table->time('calendar_event_end_time')->nullable();
            $table->string('calendar_event_sharing', 100)->default('self');
            $table->string('calendar_event_reminder', 100)->default('no');
            $table->string('calendar_event_reminder_sent', 20)->default('no');
            $table->text('calendar_event_timezoe')->nullable();
            $table->dateTime('calendar_event_reminder_date_sent')->nullable();
            $table->integer('calendar_event_reminder_duration')->nullable();
            $table->text('calendar_event_reminder_period')->nullable();
            $table->string('calendar_event_colour', 50)->nullable();

            $table->index('calendar_event_all_day');
            $table->index('calendar_event_creatorid');
            $table->index('calendar_event_reminder_sent');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('calendar_events');
    }
};