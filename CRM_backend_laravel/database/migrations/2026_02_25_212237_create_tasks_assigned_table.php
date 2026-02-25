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
        Schema::create('tasks_assigned', function (Blueprint $table) {
            $table->integer('tasksassigned_id')->primary();
            $table->integer('tasksassigned_taskid');
            $table->integer('tasksassigned_userid')->nullable();
            $table->timestamp('tasksassigned_created')->nullable();
            $table->timestamp('tasksassigned_updated')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tasks_assigned');
    }
};
