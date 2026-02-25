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
        Schema::create('tags', function (Blueprint $table) {
            $table->integer('tag_id')->primary();
            $table->timestamp('tag_created')->nullable();
            $table->timestamp('tag_updated')->nullable();
            $table->integer('tag_creatorid')->nullable();
            $table->string('tag_title', 100);
            $table->string('tag_visibility', 50)->default('user');
            $table->string('tagresource_type', 50);
            $table->integer('tagresource_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tags');
    }
};
