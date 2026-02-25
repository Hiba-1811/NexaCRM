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
        Schema::create('canned', function (Blueprint $table) {
            $table->integer('canned_id')->primary();
            $table->timestamp('canned_created');
            $table->timestamp('canned_updated');
            $table->integer('canned_creatorid')->nullable();
            $table->integer('canned_categoryid')->nullable();
            $table->string('canned_title', 250)->nullable();
            $table->text('canned_message')->nullable();
            $table->string('canned_visibility', 20)->nullable()->default('public');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('canned');
    }
};
