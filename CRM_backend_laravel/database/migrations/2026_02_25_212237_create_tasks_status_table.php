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
        Schema::create('tasks_status', function (Blueprint $table) {
            $table->integer('taskstatus_id')->primary();
            $table->timestamp('taskstatus_created')->nullable();
            $table->integer('taskstatus_creatorid')->nullable();
            $table->timestamp('taskstatus_updated')->nullable();
            $table->string('taskstatus_title', 200);
            $table->integer('taskstatus_position');
            $table->string('taskstatus_color', 100)->default('default');
            $table->string('taskstatus_system_default', 10)->default('no');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tasks_status');
    }
};
