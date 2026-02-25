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
        Schema::create('categories', function (Blueprint $table) {
            $table->integer('category_id')->primary();
            $table->string('category_uniqueid', 100);
            $table->timestamp('category_created')->nullable();
            $table->timestamp('category_updated')->nullable();
            $table->integer('category_creatorid')->nullable();
            $table->string('category_name', 150)->nullable();
            $table->string('category_description', 150)->nullable();
            $table->string('category_system_default', 20)->nullable()->default('no');
            $table->string('category_visibility', 20)->nullable()->default('everyone');
            $table->string('category_icon', 100)->nullable()->default('sl-icon-docs');
            $table->string('category_type', 50);
            $table->string('category_slug', 250);
            $table->integer('category_meta_1')->nullable();
            $table->timestamp('category_meta_2')->nullable();
            $table->timestamp('category_meta_3')->nullable();
            $table->text('category_meta_4')->nullable();
            $table->text('category_meta_5')->nullable();
            $table->text('category_meta_6')->nullable();
            $table->text('category_meta_7')->nullable();
            $table->text('category_meta_8')->nullable();
            $table->text('category_meta_9')->nullable();
            $table->text('category_meta_10')->nullable();
            $table->text('category_meta_11')->nullable();
            $table->text('category_meta_12')->nullable();
            $table->text('category_meta_13')->nullable();
            $table->text('category_meta_14')->nullable();
            $table->text('category_meta_15')->nullable();
            $table->text('category_meta_16')->nullable();
            $table->text('category_meta_17')->nullable();
            $table->text('category_meta_18')->nullable();
            $table->text('category_meta_19')->nullable();
            $table->text('category_meta_20')->nullable();
            $table->timestamp('category_meta_22')->nullable();
            $table->timestamp('category_meta_21')->nullable();
            $table->integer('category_meta_23')->nullable()->default(0);
            $table->integer('category_meta_24')->nullable()->default(0);
            $table->integer('category_meta_25')->nullable()->default(0);
            $table->integer('category_meta_26')->nullable()->default(0);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('categories');
    }
};
