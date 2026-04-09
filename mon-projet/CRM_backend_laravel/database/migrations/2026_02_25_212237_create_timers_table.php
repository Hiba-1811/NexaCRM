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
        Schema::create('timers', function (Blueprint $table) {
            $table->integer('timer_id')->primary();
            $table->timestamp('timer_created')->nullable();
            $table->timestamp('timer_updated')->nullable();
            $table->integer('timer_creatorid')->nullable();
            $table->integer('timer_recorded_by')->nullable();
            $table->integer('timer_started')->nullable();
            $table->integer('timer_stopped')->nullable()->default(0);
            $table->integer('timer_time')->nullable()->default(0);
            $table->integer('timer_taskid')->nullable();
            $table->integer('timer_projectid')->nullable()->default(0);
            $table->integer('timer_clientid')->nullable()->default(0);
            $table->string('timer_status', 20)->nullable()->default('running');
            $table->string('timer_billing_status', 50)->nullable()->default('not_invoiced');
            $table->integer('timer_billing_invoiceid')->nullable();
            $table->text('timer_mapping_type')->nullable();
            $table->integer('timer_mapping_id')->nullable();

            $table->index('timer_creatorid');
            $table->index('timer_taskid');
            $table->index('timer_projectid');
            $table->index('timer_clientid');
            $table->index('timer_status');
            $table->index('timer_billing_status');
            $table->index('timer_billing_invoiceid');

        });


    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('timers');
    }
};
