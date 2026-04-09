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
        Schema::create('kb_categories', function (Blueprint $table) {
            $table->integer('kbcategory_id')->primary();
            $table->timestamp('kbcategory_created');
            $table->timestamp('kbcategory_updated');
            $table->integer('kbcategory_creatorid');
            $table->string('kbcategory_title', 250);
            $table->text('kbcategory_description')->nullable();
            $table->integer('kbcategory_position')->nullable();
            $table->string('kbcategory_visibility', 50)->nullable()->default('everyone');
            $table->string('kbcategory_slug', 250)->nullable();
            $table->string('kbcategory_icon', 250)->nullable();
            $table->string('kbcategory_type', 50)->nullable()->default('text');
            $table->string('kbcategory_system_default', 250)->nullable()->default('no');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('kb_categories');
    }
};
