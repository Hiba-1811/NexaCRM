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
        Schema::create('files', function (Blueprint $table) {
            $table->integer('file_id')->primary();
            $table->string('file_uniqueid', 100)->nullable();
            $table->string('file_upload_unique_key', 100)->nullable();
            $table->timestamp('file_created')->nullable();
            $table->timestamp('file_updated')->nullable();
            $table->integer('file_creatorid')->nullable();
            $table->integer('file_clientid')->nullable();
            $table->integer('file_folderid')->nullable();
            $table->string('file_filename', 250)->nullable();
            $table->string('file_directory', 100)->nullable();
            $table->string('file_extension', 10)->nullable();
            $table->string('file_size', 40)->nullable();
            $table->string('file_type', 20)->nullable();
            $table->string('file_thumbname', 250)->nullable();
            $table->string('file_visibility_client', 5)->nullable()->default('yes');
            $table->text('file_mapping_type')->nullable();
            $table->integer('file_mapping_id')->nullable();
            $table->string('fileresource_type', 50)->nullable();
            $table->integer('fileresource_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('files');
    }
};
