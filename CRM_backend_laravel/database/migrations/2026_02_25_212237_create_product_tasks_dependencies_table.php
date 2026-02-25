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
        Schema::create('product_tasks_dependencies', function (Blueprint $table) {
            $table->integer('product_task_dependency_id')->primary();
            $table->date('product_task_dependency_created');
            $table->date('product_task_dependency_updated');
            $table->integer('product_task_dependency_taskid')->nullable();
            $table->integer('product_task_dependency_blockerid')->nullable();
            $table->string('product_task_dependency_type', 100)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('product_tasks_dependencies');
    }
};
