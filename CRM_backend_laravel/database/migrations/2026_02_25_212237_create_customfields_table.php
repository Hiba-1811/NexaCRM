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
        Schema::create('customfields', function (Blueprint $table) {
            $table->integer('customfields_id')->primary();
            $table->timestamp('customfields_created');
            $table->timestamp('customfields_updated');
            $table->integer('customfields_position')->default(1);
            $table->string('customfields_datatype', 50)->nullable()->default('text');
            $table->text('customfields_datapayload')->nullable();
            $table->string('customfields_type', 50)->nullable();
            $table->string('customfields_name', 250)->nullable();
            $table->string('customfields_title', 250)->nullable();
            $table->string('customfields_required', 5)->nullable()->default('no');
            $table->string('customfields_show_client_page', 100)->nullable();
            $table->string('customfields_show_project_page', 100)->nullable();
            $table->string('customfields_show_task_summary', 100)->nullable();
            $table->string('customfields_show_lead_summary', 100)->nullable();
            $table->string('customfields_show_invoice', 100)->nullable();
            $table->string('customfields_show_ticket_page', 100)->nullable()->default('no');
            $table->string('customfields_show_filter_panel', 100)->nullable()->default('no');
            $table->string('customfields_standard_form_status', 100)->nullable()->default('disabled');
            $table->string('customfields_status', 50)->nullable()->default('disabled');
            $table->string('customfields_sorting_a_z', 5)->nullable()->default('z');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('customfields');
    }
};
