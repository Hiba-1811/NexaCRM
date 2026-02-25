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
        Schema::create('events_tracking', function (Blueprint $table) {
            $table->integer('eventtracking_id')->primary();
            $table->timestamp('eventtracking_created');
            $table->timestamp('eventtracking_updated');
            $table->integer('eventtracking_eventid');
            $table->integer('eventtracking_userid');
            $table->string('eventtracking_status', 30)->nullable()->default('unread');
            $table->string('eventtracking_email', 50)->nullable()->default('no');
            $table->string('eventtracking_source', 50)->nullable();
            $table->string('eventtracking_source_id', 50)->nullable();
            $table->string('parent_type', 50)->nullable();
            $table->integer('parent_id')->nullable();
            $table->string('resource_type', 50)->nullable();
            $table->integer('resource_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('events_tracking');
    }
};
