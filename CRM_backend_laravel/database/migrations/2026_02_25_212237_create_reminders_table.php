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
        Schema::create('reminders', function (Blueprint $table) {
            $table->integer('reminder_id')->primary();
            $table->timestamp('reminder_created');
            $table->timestamp('reminder_updated');
            $table->integer('reminder_userid')->nullable();
            $table->timestamp('reminder_TIMESTAMP')->nullable();
            $table->timestamp('reminder_timestamp')->nullable();
            $table->string('reminder_title', 250)->nullable();
            $table->string('reminder_meta', 250)->nullable();
            $table->text('reminder_notes')->nullable();
            $table->string('reminder_status', 10)->nullable()->default('new');
            $table->string('reminder_sent', 10)->nullable()->default('no');
            $table->string('reminderresource_type', 50)->nullable();
            $table->integer('reminderresource_id')->nullable();
            $table->text('reminder_mapping_type')->nullable();
            $table->integer('reminder_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reminders');
    }
};
