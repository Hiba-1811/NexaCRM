<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('estimates', function (Blueprint $table) {
            $table->increments('bill_estimateid');
            $table->string('bill_uniqueid', 100)->nullable();
            $table->dateTime('bill_created')->nullable();
            $table->dateTime('bill_updated')->nullable();
            $table->dateTime('bill_date_sent_to_customer')->nullable();
            $table->dateTime('bill_date_status_change')->nullable();
            $table->integer('bill_clientid')->nullable();
            $table->integer('bill_projectid')->nullable();
            $table->integer('bill_proposalid')->nullable();
            $table->integer('bill_contractid')->nullable();
            $table->integer('bill_creatorid');
            $table->integer('bill_categoryid')->default(4);
            $table->date('bill_date');
            $table->date('bill_expiry_date')->nullable();
            $table->decimal('bill_subtotal', 15, 2)->default(0.00);
            $table->string('bill_discount_type', 30)->default('none');
            $table->decimal('bill_discount_percentage', 15, 2)->default(0.00);
            $table->decimal('bill_discount_amount', 15, 2)->default(0.00);
            $table->decimal('bill_amount_before_tax', 15, 2)->default(0.00);
            $table->string('bill_tax_type', 20)->default('summary');
            $table->decimal('bill_tax_total_percentage', 15, 2)->default(0.00);
            $table->decimal('bill_tax_total_amount', 15, 2)->default(0.00);
            $table->string('bill_adjustment_description', 250)->nullable();
            $table->decimal('bill_adjustment_amount', 15, 2)->default(0.00);
            $table->decimal('bill_final_amount', 15, 2)->default(0.00);
            $table->text('bill_notes')->nullable();
            $table->text('bill_terms')->nullable();
            $table->string('bill_status', 50)->default('draft');
            $table->string('bill_type', 150)->default('estimate');
            $table->string('bill_estimate_type', 150)->default('estimate');
            $table->string('bill_visibility', 150)->default('visible');
            $table->string('bill_viewed_by_client', 20)->default('no');
            $table->string('bill_system', 20)->default('no');
            $table->string('bill_converted_to_invoice', 20)->default('no');
            $table->integer('bill_converted_to_invoice_invoiceid')->nullable();
            $table->string('estimate_automation_status', 100)->default('disabled');
            $table->string('estimate_automation_create_project', 50)->default('no');
            $table->string('estimate_automation_project_title', 250)->nullable();
            $table->string('estimate_automation_project_status', 100)->default('in_progress');
            $table->string('estimate_automation_create_tasks', 50)->default('no');
            $table->string('estimate_automation_project_email_client', 50)->default('no');
            $table->string('estimate_automation_create_invoice', 50)->default('no');
            $table->integer('estimate_automation_invoice_due_date')->default(7);
            $table->string('estimate_automation_invoice_email_client', 50)->default('no');
            $table->string('estimate_automation_copy_attachments', 50)->default('no');
            $table->integer('estimate_automation_log_created_project_id')->nullable();
            $table->integer('estimate_automation_log_created_invoice_id')->nullable();
            $table->string('bill_publishing_type', 20)->default('instant');
            $table->date('bill_publishing_scheduled_date')->nullable();
            $table->string('bill_publishing_scheduled_status', 20)->default('');
            $table->text('bill_publishing_scheduled_log')->nullable();
            $table->text('billresource_type')->nullable();
            $table->integer('billresource_id')->nullable();
            $table->text('estimate_mapping_type')->nullable();
            $table->integer('estimate_mapping_id')->nullable();

            $table->index('bill_clientid');
            $table->index('bill_creatorid');
            $table->index('bill_categoryid');
            $table->index('bill_status');
            $table->index('bill_type');
            $table->index('bill_visibility');
            $table->index('bill_viewed_by_client');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('estimates');
    }
};