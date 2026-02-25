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
        Schema::create('timelines', function (Blueprint $table) {
            $table->integer('timeline_id')->primary();
            $table->integer('timeline_eventid');
            $table->string('timeline_resourcetype', 50)->nullable();
            $table->integer('timeline_resourceid')->nullable();
            $table->text('timeline_mapping_type')->nullable();
            $table->integer('timeline_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('timelines');
    }
};
