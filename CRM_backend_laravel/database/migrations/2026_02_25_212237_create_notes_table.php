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
        Schema::create('notes', function (Blueprint $table) {
            $table->integer('note_id')->primary();
            $table->timestamp('note_created')->nullable();
            $table->timestamp('note_updated')->nullable();
            $table->integer('note_creatorid')->nullable();
            $table->string('note_title', 250)->nullable();
            $table->text('note_description')->nullable();
            $table->string('note_visibility', 30)->nullable()->default('public');
            $table->string('noteresource_type', 50)->nullable();
            $table->integer('noteresource_id')->nullable();
            $table->text('note_mapping_type')->nullable();
            $table->integer('note_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('notes');
    }
};
