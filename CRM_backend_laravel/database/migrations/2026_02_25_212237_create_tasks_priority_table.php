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
        Schema::create('tasks_priority', function (Blueprint $table) {
            $table->integer('taskpriority_id')->primary();
            $table->timestamp('taskpriority_created')->nullable();
            $table->integer('taskpriority_creatorid')->nullable();
            $table->timestamp('taskpriority_updated')->nullable();
            $table->string('taskpriority_title', 200);
            $table->integer('taskpriority_position');
            $table->string('taskpriority_color', 100)->default('default');
            $table->string('taskpriority_system_default', 10)->default('no');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tasks_priority');
    }
};
