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
        Schema::create('projects_assigned', function (Blueprint $table) {
            $table->integer('projectsassigned_id')->primary();
            $table->integer('projectsassigned_projectid')->nullable();
            $table->integer('projectsassigned_userid')->nullable();
            $table->timestamp('projectsassigned_created')->nullable();
            $table->timestamp('projectsassigned_updated')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('projects_assigned');
    }
};
