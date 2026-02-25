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
        Schema::create('invoices', function (Blueprint $table) {
            $table->integer('bill_invoiceid')->primary();
            $table->string('bill_uniqueid', 100)->nullable();
            $table->timestamp('bill_created')->nullable();
            $table->timestamp('bill_updated')->nullable();
            $table->date('bill_date_sent_to_customer')->nullable();
            $table->timestamp('bill_date_status_change')->nullable();
            $table->integer('bill_clientid');
            $table->integer('bill_projectid')->nullable();
            $table->integer('bill_subscriptionid')->nullable();
            $table->integer('bill_creatorid');
            $table->integer('bill_categoryid')->default(4);
            $table->date('bill_date');
            $table->date('bill_due_date')->nullable();
            $table->decimal('bill_subtotal', 15)->default(0);
            $table->string('bill_discount_type', 30)->nullable()->default('none');
            $table->decimal('bill_discount_percentage', 15)->nullable()->default(0);
            $table->decimal('bill_discount_amount', 15)->nullable()->default(0);
            $table->decimal('bill_amount_before_tax', 15)->nullable()->default(0);
            $table->string('bill_tax_type', 20)->nullable()->default('summary');
            $table->decimal('bill_tax_total_percentage', 15)->nullable()->default(0);
            $table->decimal('bill_tax_total_amount', 15)->nullable()->default(0);
            $table->string('bill_adjustment_description', 250)->nullable();
            $table->decimal('bill_adjustment_amount', 15)->nullable()->default(0);
            $table->decimal('bill_final_amount', 15)->nullable()->default(0);
            $table->text('bill_notes')->nullable();
            $table->text('bill_terms')->nullable();
            $table->string('bill_status', 50)->default('draft');
            $table->string('bill_recurring', 50)->nullable()->default('no');
            $table->integer('bill_recurring_duration')->nullable();
            $table->string('bill_recurring_period', 30)->nullable();
            $table->integer('bill_recurring_cycles')->nullable();
            $table->integer('bill_recurring_cycles_counter')->nullable();
            $table->date('bill_recurring_last')->nullable();
            $table->date('bill_recurring_next')->nullable();
            $table->string('bill_recurring_child', 5)->nullable()->default('no');
            $table->integer('bill_recurring_parent_id')->nullable();
            $table->string('bill_overdue_reminder_sent', 5)->nullable()->default('no');
            $table->timestamp('bill_overdue_reminder_last_sent')->nullable();
            $table->integer('bill_overdue_reminder_counter')->nullable()->default(0);
            $table->string('bill_invoice_type', 30)->nullable()->default('onetime');
            $table->string('bill_type', 20)->nullable()->default('invoice');
            $table->string('bill_visibility', 20)->nullable()->default('visible');
            $table->string('bill_cron_status', 20)->nullable()->default('none');
            $table->timestamp('bill_cron_date')->nullable();
            $table->string('bill_viewed_by_client', 20)->nullable()->default('no');
            $table->string('bill_system', 20)->nullable()->default('no');
            $table->string('bill_publishing_type', 20)->nullable()->default('instant');
            $table->date('bill_publishing_scheduled_date')->nullable();
            $table->string('bill_publishing_scheduled_status', 20)->nullable();
            $table->text('bill_publishing_scheduled_log')->nullable();
            $table->text('billresource_type')->nullable();
            $table->integer('billresource_id')->nullable();
            $table->text('invoice_mapping_type')->nullable();
            $table->integer('invoice_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('invoices');
    }
};
