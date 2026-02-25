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
        Schema::create('knowledgebase', function (Blueprint $table) {
            $table->integer('knowledgebase_id')->primary();
            $table->timestamp('knowledgebase_created');
            $table->timestamp('knowledgebase_updated');
            $table->integer('knowledgebase_creatorid');
            $table->integer('knowledgebase_categoryid');
            $table->string('knowledgebase_title', 250);
            $table->string('knowledgebase_slug', 250)->nullable();
            $table->text('knowledgebase_text')->nullable();
            $table->string('knowledgebase_embed_video_id', 50)->nullable();
            $table->text('knowledgebase_embed_code')->nullable();
            $table->string('knowledgebase_embed_thumb', 150)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('knowledgebase');
    }
};
