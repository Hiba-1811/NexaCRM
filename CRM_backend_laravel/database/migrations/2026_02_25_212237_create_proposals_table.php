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
        Schema::create('proposals', function (Blueprint $table) {
            $table->integer('doc_id')->primary();
            $table->string('doc_unique_id', 150)->nullable();
            $table->string('doc_template', 150)->nullable();
            $table->timestamp('doc_created');
            $table->timestamp('doc_updated');
            $table->timestamp('doc_date_status_change')->nullable();
            $table->integer('doc_creatorid');
            $table->integer('doc_categoryid')->nullable()->default(11);
            $table->text('doc_heading')->nullable();
            $table->text('doc_heading_color')->nullable();
            $table->text('doc_title')->nullable();
            $table->text('doc_title_color')->nullable();
            $table->text('doc_hero_direcory')->nullable();
            $table->text('doc_hero_filename')->nullable();
            $table->string('doc_hero_updated', 250)->nullable()->default('no');
            $table->text('doc_body')->nullable();
            $table->date('doc_date_start')->nullable();
            $table->date('doc_date_end')->nullable();
            $table->date('doc_date_published')->nullable();
            $table->timestamp('doc_date_last_emailed')->nullable();
            $table->integer('doc_client_id')->nullable();
            $table->integer('doc_project_id')->nullable();
            $table->integer('doc_lead_id')->nullable();
            $table->text('doc_notes')->nullable();
            $table->string('doc_viewed', 20)->nullable()->default('no');
            $table->string('doc_type', 150)->nullable();
            $table->string('doc_system_type', 150)->nullable()->default('document');
            $table->timestamp('doc_signed_date')->nullable();
            $table->text('doc_signed_first_name')->nullable();
            $table->text('doc_signed_last_name')->nullable();
            $table->text('doc_signed_signature_directory')->nullable();
            $table->text('doc_signed_signature_filename')->nullable();
            $table->text('doc_signed_ip_address')->nullable();
            $table->text('doc_fallback_client_first_name')->nullable();
            $table->text('doc_fallback_client_last_name')->nullable();
            $table->text('doc_fallback_client_email')->nullable();
            $table->string('doc_status', 100)->nullable()->default('draft');
            $table->string('proposal_automation_status', 20)->nullable()->default('disabled');
            $table->string('docresource_type', 100)->nullable();
            $table->integer('docresource_id')->nullable();
            $table->string('proposal_automation_create_project', 10)->nullable()->default('no');
            $table->text('proposal_automation_project_title')->nullable();
            $table->string('proposal_automation_project_status', 30)->nullable()->default('in_progress');
            $table->string('proposal_automation_create_tasks', 10)->nullable()->default('no');
            $table->string('proposal_automation_project_email_client', 10)->nullable()->default('no');
            $table->string('proposal_automation_create_invoice', 10)->nullable()->default('no');
            $table->integer('proposal_automation_invoice_due_date')->nullable();
            $table->string('proposal_automation_invoice_email_client', 10)->nullable()->default('no');
            $table->integer('proposal_automation_log_created_project_id')->nullable();
            $table->integer('proposal_automation_log_created_invoice_id')->nullable();
            $table->string('doc_publishing_type', 20)->nullable()->default('instant');
            $table->timestamp('doc_publishing_scheduled_date')->nullable();
            $table->text('doc_publishing_scheduled_status')->nullable();
            $table->text('doc_publishing_scheduled_log')->nullable();
            $table->text('proposal_mapping_type')->nullable();
            $table->integer('proposal_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('proposals');
    }
};
