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
        Schema::create('cs_affiliate_earnings', function (Blueprint $table) {
            $table->integer('cs_affiliate_earning_id')->primary();
            $table->timestamp('cs_affiliate_earning_created');
            $table->timestamp('cs_affiliate_earning_updated');
            $table->integer('cs_affiliate_earning_projectid');
            $table->integer('cs_affiliate_earning_invoiceid');
            $table->timestamp('cs_affiliate_earning_invoice_payment_date')->nullable();
            $table->timestamp('cs_affiliate_earning_commission_approval_date')->nullable();
            $table->integer('cs_affiliate_earning_affiliateid');
            $table->decimal('cs_affiliate_earning_amount', 10);
            $table->decimal('cs_affiliate_earning_commission_rate', 10)->default(0);
            $table->string('cs_affiliate_earning_status', 30)->default('pending');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cs_affiliate_earnings');
    }
};
