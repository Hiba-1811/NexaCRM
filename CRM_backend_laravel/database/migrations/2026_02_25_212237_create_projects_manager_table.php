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
        Schema::create('projects_manager', function (Blueprint $table) {
            $table->integer('projectsmanager_id')->primary();
            $table->timestamp('projectsmanager_created');
            $table->timestamp('projectsmanager_updated');
            $table->integer('projectsmanager_projectid')->nullable();
            $table->integer('projectsmanager_userid');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('projects_manager');
    }
};
