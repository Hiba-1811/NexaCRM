<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('checklists', function (Blueprint $table) {
            $table->increments('checklist_id');
            $table->integer('checklist_position');
            $table->dateTime('checklist_created');
            $table->dateTime('checklist_updated');
            $table->integer('checklist_creatorid');
            $table->integer('checklist_clientid')->nullable();
            $table->text('checklist_text');
            $table->string('checklist_status', 250)->default('pending');
            $table->string('checklistresource_type', 50);
            $table->integer('checklistresource_id');
            $table->text('checklist_mapping_type')->nullable();
            $table->integer('checklist_mapping_id')->nullable();

            $table->index('checklistresource_type');
            $table->index('checklistresource_id');
            $table->index('checklist_creatorid');
            $table->index('checklist_clientid');
            $table->index('checklist_status');
            $table->index('checklist_position');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('checklists');
    }
};