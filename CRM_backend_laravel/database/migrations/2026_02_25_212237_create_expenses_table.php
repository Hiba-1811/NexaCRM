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
        Schema::create('expenses', function (Blueprint $table) {
            $table->integer('expense_id')->primary();
            $table->string('expense_importid', 100)->nullable();
            $table->date('expense_created')->nullable();
            $table->date('expense_updated')->nullable();
            $table->date('expense_date')->nullable();
            $table->integer('expense_clientid')->nullable();
            $table->integer('expense_projectid')->nullable();
            $table->integer('expense_creatorid');
            $table->integer('expense_categoryid')->default(7);
            $table->decimal('expense_amount', 10);
            $table->text('expense_description')->nullable();
            $table->text('expense_type')->nullable();
            $table->string('expense_billable', 30)->nullable()->default('not_billable');
            $table->string('expense_billing_status', 30)->nullable()->default('not_invoiced');
            $table->integer('expense_billable_invoiceid')->nullable();
            $table->string('expense_recurring', 5)->nullable()->default('no');
            $table->integer('expense_recurring_duration')->nullable();
            $table->string('expense_recurring_period', 30)->nullable();
            $table->integer('expense_recurring_cycles')->nullable();
            $table->integer('expense_recurring_cycles_counter')->nullable()->default(0);
            $table->timestamp('expense_recurring_last')->nullable();
            $table->timestamp('expense_recurring_next')->nullable();
            $table->string('expense_recurring_child', 5)->nullable()->default('no');
            $table->integer('expense_recurring_parent_id')->nullable();
            $table->string('expense_cron_status', 20)->nullable()->default('none');
            $table->text('expenseresource_type')->nullable();
            $table->integer('expenseresource_id')->nullable();
            $table->text('expense_mapping_type')->nullable();
            $table->integer('expense_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('expenses');
    }
};
