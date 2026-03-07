<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('invoices', function (Blueprint $table) {
            $table->increments('bill_invoiceid');
            $table->string('bill_uniqueid', 100)->nullable();
            $table->dateTime('bill_created')->nullable();
            $table->dateTime('bill_updated')->nullable();
            $table->date('bill_date_sent_to_customer')->nullable();
            $table->dateTime('bill_date_status_change')->nullable();
            $table->integer('bill_clientid');
            $table->integer('bill_projectid')->nullable();
            $table->integer('bill_subscriptionid')->nullable();
            $table->integer('bill_creatorid');
            $table->integer('bill_categoryid')->default(4);
            $table->date('bill_date');
            $table->date('bill_due_date')->nullable();
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
            $table->string('bill_recurring', 50)->default('no');
            $table->integer('bill_recurring_duration')->nullable();
            $table->string('bill_recurring_period', 30)->nullable();
            $table->integer('bill_recurring_cycles')->nullable();
            $table->integer('bill_recurring_cycles_counter')->nullable();
            $table->date('bill_recurring_last')->nullable();
            $table->date('bill_recurring_next')->nullable();
            $table->string('bill_recurring_child', 5)->default('no');
            $table->integer('bill_recurring_parent_id')->nullable();
            $table->string('bill_overdue_reminder_sent', 5)->default('no');
            $table->dateTime('bill_overdue_reminder_last_sent')->nullable();
            $table->integer('bill_overdue_reminder_counter')->default(0);
            $table->string('bill_invoice_type', 30)->default('onetime');
            $table->string('bill_type', 20)->default('invoice');
            $table->string('bill_visibility', 20)->default('visible');
            $table->string('bill_cron_status', 20)->default('none');
            $table->dateTime('bill_cron_date')->nullable();
            $table->string('bill_viewed_by_client', 20)->default('no');
            $table->string('bill_system', 20)->default('no');
            $table->string('bill_publishing_type', 20)->default('instant');
            $table->date('bill_publishing_scheduled_date')->nullable();
            $table->string('bill_publishing_scheduled_status', 20)->default('');
            $table->text('bill_publishing_scheduled_log')->nullable();
            $table->text('billresource_type')->nullable();
            $table->integer('billresource_id')->nullable();
            $table->text('invoice_mapping_type')->nullable();
            $table->integer('invoice_mapping_id')->nullable();

            $table->index('bill_clientid');
            $table->index('bill_projectid');
            $table->index('bill_creatorid');
            $table->index('bill_categoryid');
            $table->index('bill_status');
            $table->index('bill_recurring');
            $table->index('bill_type');
            $table->index('bill_invoice_type');
            $table->index('bill_subscriptionid');
            $table->index('bill_recurring_parent_id');
            $table->index('bill_visibility');
            $table->index('bill_cron_status');
            $table->index('bill_viewed_by_client');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('invoices');
    }
};