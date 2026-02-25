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
        Schema::create('payments', function (Blueprint $table) {
            $table->integer('payment_id')->primary();
            $table->timestamp('payment_created')->nullable();
            $table->timestamp('payment_updated')->nullable();
            $table->integer('payment_creatorid')->nullable();
            $table->date('payment_date')->nullable();
            $table->integer('payment_invoiceid')->nullable();
            $table->integer('payment_subscriptionid')->nullable();
            $table->integer('payment_clientid')->nullable();
            $table->integer('payment_projectid')->nullable();
            $table->decimal('payment_amount', 10);
            $table->string('payment_transaction_id', 100)->nullable();
            $table->string('payment_gateway', 100)->nullable();
            $table->text('payment_notes')->nullable();
            $table->string('payment_type', 50)->nullable()->default('invoice');
            $table->text('paymentresource_type')->nullable();
            $table->integer('paymentresource_id')->nullable();
            $table->text('payment_mapping_type')->nullable();
            $table->integer('payment_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payments');
    }
};
