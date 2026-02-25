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
        Schema::create('events', function (Blueprint $table) {
            $table->integer('event_id')->primary();
            $table->timestamp('event_created')->nullable();
            $table->timestamp('event_updated')->nullable();
            $table->integer('event_creatorid');
            $table->integer('event_clientid')->nullable();
            $table->string('event_creator_name', 150)->nullable();
            $table->string('event_item', 150)->nullable();
            $table->integer('event_item_id')->nullable();
            $table->text('event_item_content')->nullable();
            $table->text('event_item_content2')->nullable();
            $table->text('event_item_content3')->nullable();
            $table->text('event_item_content4')->nullable();
            $table->string('event_item_lang', 150)->nullable();
            $table->string('event_item_lang_alt', 150)->nullable();
            $table->string('event_parent_type', 150)->nullable();
            $table->string('event_parent_id', 150)->nullable();
            $table->string('event_parent_title', 150)->nullable();
            $table->string('event_show_item', 150)->nullable()->default('yes');
            $table->string('event_show_in_timeline', 150)->nullable()->default('yes');
            $table->string('event_notification_category', 150)->nullable();
            $table->string('eventresource_type', 50)->nullable();
            $table->integer('eventresource_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('events');
    }
};
