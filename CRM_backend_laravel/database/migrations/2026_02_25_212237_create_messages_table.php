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
        Schema::create('messages', function (Blueprint $table) {
            $table->integer('message_id')->primary();
            $table->string('message_unique_id', 100);
            $table->timestamp('message_created');
            $table->timestamp('message_updated');
            $table->integer('message_timestamp');
            $table->integer('message_creatorid');
            $table->string('message_source', 150);
            $table->string('message_target', 150);
            $table->string('message_creator_uniqueid', 150)->nullable();
            $table->string('message_target_uniqueid', 150)->nullable();
            $table->text('message_text')->nullable();
            $table->string('message_file_name', 250)->nullable();
            $table->string('message_file_directory', 150)->nullable();
            $table->string('message_file_thumb_name', 150)->nullable();
            $table->string('message_file_type', 50)->nullable();
            $table->string('message_type', 150)->nullable()->default('file');
            $table->string('message_status', 150)->nullable()->default('unread');
            $table->text('message_mapping_type')->nullable();
            $table->integer('message_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('messages');
    }
};
