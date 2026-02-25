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
        Schema::create('modules', function (Blueprint $table) {
            $table->integer('module_id')->primary();
            $table->timestamp('module_created');
            $table->timestamp('module_updated');
            $table->text('module_name')->nullable();
            $table->text('module_alias')->nullable();
            $table->text('module_uniqueid')->nullable();
            $table->text('module_description')->nullable();
            $table->text('module_author_name')->nullable();
            $table->text('module_author_url')->nullable();
            $table->text('module_version')->nullable();
            $table->string('module_status', 30)->nullable()->default('disabled');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('modules');
    }
};
