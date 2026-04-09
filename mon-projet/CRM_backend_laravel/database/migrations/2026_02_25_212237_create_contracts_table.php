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
        Schema::create('contracts', function (Blueprint $table) {
            $table->integer('doc_id')->primary();
            $table->string('doc_unique_id', 150)->nullable();
            $table->string('doc_template', 150)->nullable();
            $table->timestamp('doc_created');
            $table->timestamp('doc_updated');
            $table->timestamp('doc_date_status_change');
            $table->integer('doc_creatorid');
            $table->integer('doc_categoryid')->nullable()->default(11);
            $table->string('doc_heading', 250)->nullable()->default('#7493a9');
            $table->string('doc_heading_color', 30)->nullable()->default('#7493a9');
            $table->string('doc_title', 250)->nullable();
            $table->string('doc_title_color', 30)->nullable();
            $table->string('doc_hero_direcory', 250)->nullable();
            $table->string('doc_hero_filename', 250)->nullable();
            $table->string('doc_hero_updated', 250)->nullable()->default('no');
            $table->text('doc_body')->nullable();
            $table->date('doc_date_start')->nullable();
            $table->date('doc_date_end')->nullable();
            $table->date('doc_date_published')->nullable();
            $table->timestamp('doc_date_last_emailed')->nullable();
            $table->decimal('doc_value', 10)->nullable();
            $table->integer('doc_client_id')->nullable();
            $table->integer('doc_project_id')->nullable();
            $table->integer('doc_lead_id')->nullable();
            $table->text('doc_notes')->nullable();
            $table->string('doc_viewed', 20)->nullable()->default('no');
            $table->string('doc_type', 150)->nullable()->default('contract');
            $table->string('doc_system_type', 150)->nullable()->default('document');
            $table->integer('doc_provider_signed_userid')->nullable();
            $table->timestamp('doc_provider_signed_date')->nullable();
            $table->string('doc_provider_signed_first_name', 150)->nullable();
            $table->string('doc_provider_signed_last_name', 150)->nullable();
            $table->string('doc_provider_signed_signature_directory', 150)->nullable();
            $table->string('doc_provider_signed_signature_filename', 150)->nullable();
            $table->string('doc_provider_signed_ip_address', 150)->nullable();
            $table->string('doc_provider_signed_status', 50)->nullable()->default('');
            $table->integer('doc_signed_userid')->nullable();
            $table->timestamp('doc_signed_date')->nullable();
            $table->string('doc_signed_first_name', 150)->nullable();
            $table->string('doc_signed_last_name', 150)->nullable();
            $table->string('doc_signed_signature_directory', 150)->nullable();
            $table->string('doc_signed_signature_filename', 150)->nullable();
            $table->string('doc_signed_status', 50)->nullable()->default('');
            $table->string('doc_signed_ip_address', 150)->nullable();
            $table->string('doc_fallback_client_first_name', 150)->nullable();
            $table->string('doc_fallback_client_last_name', 150)->nullable();
            $table->string('doc_fallback_client_email', 150)->nullable();
            $table->string('doc_status', 100)->nullable()->default('draft');
            $table->string('docresource_type', 100)->nullable();
            $table->integer('docresource_id')->nullable();
            $table->string('doc_publishing_type', 20)->nullable()->default('instant');
            $table->timestamp('doc_publishing_scheduled_date')->nullable();
            $table->text('doc_publishing_scheduled_status')->nullable();
            $table->text('doc_publishing_scheduled_log')->nullable();
            $table->text('contract_mapping_type')->nullable();
            $table->integer('contract_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('contracts');
    }
};
