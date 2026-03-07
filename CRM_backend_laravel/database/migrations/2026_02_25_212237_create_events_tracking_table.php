<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('events_tracking', function (Blueprint $table) {
            $table->increments('eventtracking_id');
            $table->dateTime('eventtracking_created');
            $table->dateTime('eventtracking_updated');
            $table->integer('eventtracking_eventid');
            $table->integer('eventtracking_userid');
            $table->string('eventtracking_status', 30)->default('unread');
            $table->string('eventtracking_email', 50)->default('no');
            $table->string('eventtracking_source', 50)->nullable();
            $table->string('eventtracking_source_id', 50)->nullable();
            $table->string('parent_type', 50)->nullable();
            $table->integer('parent_id')->nullable();
            $table->string('resource_type', 50)->nullable();
            $table->integer('resource_id')->nullable();

            $table->index('eventtracking_userid');
            $table->index('eventtracking_eventid');
            $table->index('eventtracking_status');
            $table->index('parent_type');
            $table->index('parent_id');
            $table->index('resource_type');
            $table->index('resource_id');
            $table->index('eventtracking_source');
            $table->index('eventtracking_source_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('events_tracking');
    }
};