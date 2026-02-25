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
        Schema::create('tasks_dependencies', function (Blueprint $table) {
            $table->integer('tasksdependency_id')->primary();
            $table->integer('tasksdependency_created');
            $table->integer('tasksdependency_updated');
            $table->integer('tasksdependency_creatorid')->nullable();
            $table->integer('tasksdependency_projectid')->nullable();
            $table->integer('tasksdependency_clientid')->nullable();
            $table->integer('tasksdependency_taskid')->nullable();
            $table->integer('tasksdependency_blockerid')->nullable();
            $table->string('tasksdependency_type', 100)->nullable();
            $table->string('tasksdependency_status', 100)->nullable()->default('active');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tasks_dependencies');
    }
};
