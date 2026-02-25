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
        Schema::create('comments', function (Blueprint $table) {
            $table->integer('comment_id')->primary();
            $table->timestamp('comment_created')->nullable();
            $table->timestamp('comment_updated')->nullable();
            $table->integer('comment_creatorid');
            $table->integer('comment_clientid')->nullable();
            $table->text('comment_text');
            $table->string('comment_client_status', 20)->nullable()->default('unread');
            $table->string('comment_team_status', 20)->nullable()->default('unread');
            $table->string('commentresource_type', 50);
            $table->integer('commentresource_id');
            $table->text('comment_mapping_type')->nullable();
            $table->integer('comment_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('comments');
    }
};
