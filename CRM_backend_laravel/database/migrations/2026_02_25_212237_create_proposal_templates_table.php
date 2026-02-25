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
        Schema::create('proposal_templates', function (Blueprint $table) {
            $table->integer('proposal_template_id')->primary();
            $table->timestamp('proposal_template_created');
            $table->timestamp('proposal_template_updated');
            $table->integer('proposal_template_creatorid')->nullable();
            $table->string('proposal_template_title', 250)->nullable();
            $table->string('proposal_template_heading_color', 30)->nullable()->default('#FFFFFF');
            $table->string('proposal_template_title_color', 30)->nullable()->default('#FFFFFF');
            $table->text('proposal_template_body')->nullable();
            $table->integer('proposal_template_estimate_id')->nullable();
            $table->string('proposal_template_system', 20)->nullable()->default('no');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('proposal_templates');
    }
};
