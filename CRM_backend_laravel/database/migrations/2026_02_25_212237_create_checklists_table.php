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
        Schema::create('checklists', function (Blueprint $table) {
            $table->integer('checklist_id')->primary();
            $table->integer('checklist_position');
            $table->timestamp('checklist_created');
            $table->timestamp('checklist_updated');
            $table->integer('checklist_creatorid');
            $table->integer('checklist_clientid')->nullable();
            $table->text('checklist_text');
            $table->string('checklist_status', 250)->default('pending');
            $table->string('checklistresource_type', 50);
            $table->integer('checklistresource_id');
            $table->text('checklist_mapping_type')->nullable();
            $table->integer('checklist_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('checklists');
    }
};
