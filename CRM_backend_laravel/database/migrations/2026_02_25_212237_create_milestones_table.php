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
        Schema::create('milestones', function (Blueprint $table) {
            $table->integer('milestone_id')->primary();
            $table->timestamp('milestone_created');
            $table->timestamp('milestone_updated');
            $table->integer('milestone_creatorid');
            $table->string('milestone_title', 250)->default('uncategorised');
            $table->integer('milestone_projectid')->nullable();
            $table->integer('milestone_position')->default(1);
            $table->string('milestone_type', 50)->default('categorised');
            $table->string('milestone_color', 50)->default('default');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('milestones');
    }
};
