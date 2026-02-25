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
        Schema::create('email_templates', function (Blueprint $table) {
            $table->string('emailtemplate_module_unique_id', 250)->nullable();
            $table->string('emailtemplate_module_name', 250)->nullable();
            $table->string('emailtemplate_name', 100)->nullable();
            $table->string('emailtemplate_lang', 250)->nullable();
            $table->string('emailtemplate_type', 30)->nullable();
            $table->string('emailtemplate_category', 30)->nullable();
            $table->string('emailtemplate_subject', 250)->nullable();
            $table->text('emailtemplate_body')->nullable();
            $table->text('emailtemplate_variables')->nullable();
            $table->timestamp('emailtemplate_created')->nullable();
            $table->timestamp('emailtemplate_updated')->nullable();
            $table->string('emailtemplate_status', 20)->nullable()->default('enabled');
            $table->string('emailtemplate_language', 50)->nullable();
            $table->string('emailtemplate_real_template', 50)->nullable()->default('yes');
            $table->string('emailtemplate_show_enabled', 50)->nullable()->default('yes');
            $table->integer('emailtemplate_id')->primary();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('email_templates');
    }
};
