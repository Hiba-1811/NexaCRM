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
        Schema::create('projects', function (Blueprint $table) {
            $table->integer('project_id')->primary();
            $table->string('project_uniqueid', 100)->nullable();
            $table->string('project_type', 30)->default('project');
            $table->string('project_reference', 250)->nullable();
            $table->string('project_importid', 100)->nullable();
            $table->timestamp('project_created')->nullable();
            $table->timestamp('project_updated')->nullable();
            $table->integer('project_timestamp_created')->nullable();
            $table->integer('project_timestamp_updated')->nullable();
            $table->integer('project_clientid')->nullable();
            $table->integer('project_creatorid');
            $table->integer('project_categoryid')->nullable()->default(1);
            $table->string('project_cover_directory', 100)->nullable();
            $table->string('project_cover_filename', 100)->nullable();
            $table->integer('project_cover_file_id')->nullable();
            $table->string('project_title', 250);
            $table->date('project_date_start')->nullable();
            $table->date('project_date_due')->nullable();
            $table->text('project_description')->nullable();
            $table->date('project_date_status_changed')->nullable();
            $table->string('project_status', 50)->nullable()->default('not_started');
            $table->string('project_active_state', 10)->nullable()->default('active');
            $table->smallInteger('project_progress')->nullable()->default(0);
            $table->decimal('project_billing_rate', 10)->nullable()->default(0);
            $table->string('project_billing_type', 40)->nullable()->default('hourly');
            $table->integer('project_billing_estimated_hours')->nullable()->default(0);
            $table->decimal('project_billing_costs_estimate', 10)->nullable()->default(0);
            $table->string('project_progress_manually', 10)->nullable()->default('no');
            $table->string('clientperm_tasks_view', 10)->nullable()->default('yes');
            $table->string('clientperm_tasks_collaborate', 40)->nullable()->default('yes');
            $table->string('clientperm_tasks_create', 40)->nullable()->default('yes');
            $table->string('clientperm_timesheets_view', 40)->nullable()->default('yes');
            $table->string('clientperm_expenses_view', 40)->nullable()->default('no');
            $table->string('assignedperm_milestone_manage', 40)->nullable()->default('yes');
            $table->string('assignedperm_tasks_collaborate', 40)->nullable();
            $table->string('project_visibility', 40)->nullable()->default('visible');
            $table->text('project_calendar_timezone')->nullable();
            $table->text('project_calendar_location')->nullable();
            $table->string('project_calendar_reminder', 10)->nullable()->default('no');
            $table->integer('project_calendar_reminder_duration')->nullable();
            $table->text('project_calendar_reminder_period')->nullable();
            $table->text('project_calendar_reminder_sent')->nullable();
            $table->timestamp('project_calendar_reminder_date_sent')->nullable();
            $table->text('projectresource_type')->nullable();
            $table->integer('projectresource_id')->nullable();
            $table->text('project_custom_field_1')->nullable();
            $table->text('project_custom_field_2')->nullable();
            $table->text('project_custom_field_3')->nullable();
            $table->text('project_custom_field_4')->nullable();
            $table->text('project_custom_field_5')->nullable();
            $table->text('project_custom_field_6')->nullable();
            $table->text('project_custom_field_7')->nullable();
            $table->text('project_custom_field_8')->nullable();
            $table->text('project_custom_field_9')->nullable();
            $table->text('project_custom_field_10')->nullable();
            $table->timestamp('project_custom_field_11')->nullable();
            $table->timestamp('project_custom_field_12')->nullable();
            $table->timestamp('project_custom_field_13')->nullable();
            $table->timestamp('project_custom_field_14')->nullable();
            $table->timestamp('project_custom_field_15')->nullable();
            $table->timestamp('project_custom_field_16')->nullable();
            $table->timestamp('project_custom_field_17')->nullable();
            $table->timestamp('project_custom_field_18')->nullable();
            $table->timestamp('project_custom_field_19')->nullable();
            $table->timestamp('project_custom_field_20')->nullable();
            $table->text('project_custom_field_21')->nullable();
            $table->text('project_custom_field_22')->nullable();
            $table->text('project_custom_field_23')->nullable();
            $table->text('project_custom_field_24')->nullable();
            $table->text('project_custom_field_25')->nullable();
            $table->text('project_custom_field_26')->nullable();
            $table->text('project_custom_field_27')->nullable();
            $table->text('project_custom_field_28')->nullable();
            $table->text('project_custom_field_29')->nullable();
            $table->text('project_custom_field_30')->nullable();
            $table->string('project_custom_field_31', 20)->nullable();
            $table->string('project_custom_field_32', 20)->nullable();
            $table->string('project_custom_field_33', 20)->nullable();
            $table->string('project_custom_field_34', 20)->nullable();
            $table->string('project_custom_field_35', 20)->nullable();
            $table->string('project_custom_field_36', 20)->nullable();
            $table->string('project_custom_field_37', 20)->nullable();
            $table->string('project_custom_field_38', 20)->nullable();
            $table->string('project_custom_field_39', 20)->nullable();
            $table->string('project_custom_field_40', 20)->nullable();
            $table->string('project_custom_field_41', 150)->nullable();
            $table->string('project_custom_field_42', 150)->nullable();
            $table->string('project_custom_field_43', 150)->nullable();
            $table->string('project_custom_field_44', 150)->nullable();
            $table->string('project_custom_field_45', 150)->nullable();
            $table->string('project_custom_field_46', 150)->nullable();
            $table->string('project_custom_field_47', 150)->nullable();
            $table->string('project_custom_field_48', 150)->nullable();
            $table->string('project_custom_field_49', 150)->nullable();
            $table->string('project_custom_field_50', 150)->nullable();
            $table->integer('project_custom_field_51')->nullable();
            $table->integer('project_custom_field_52')->nullable();
            $table->integer('project_custom_field_53')->nullable();
            $table->integer('project_custom_field_54')->nullable();
            $table->integer('project_custom_field_55')->nullable();
            $table->integer('project_custom_field_56')->nullable();
            $table->integer('project_custom_field_57')->nullable();
            $table->integer('project_custom_field_58')->nullable();
            $table->integer('project_custom_field_59')->nullable();
            $table->integer('project_custom_field_60')->nullable();
            $table->decimal('project_custom_field_61', 10)->nullable();
            $table->decimal('project_custom_field_62', 10)->nullable();
            $table->decimal('project_custom_field_63', 10)->nullable();
            $table->decimal('project_custom_field_64', 10)->nullable();
            $table->decimal('project_custom_field_65', 10)->nullable();
            $table->decimal('project_custom_field_66', 10)->nullable();
            $table->decimal('project_custom_field_67', 10)->nullable();
            $table->decimal('project_custom_field_68', 10)->nullable();
            $table->decimal('project_custom_field_69', 10)->nullable();
            $table->decimal('project_custom_field_70', 10)->nullable();
            $table->string('project_automation_status', 30)->nullable()->default('disabled');
            $table->string('project_automation_create_invoices', 30)->nullable()->default('no');
            $table->string('project_automation_convert_estimates_to_invoices', 30)->nullable()->default('no');
            $table->string('project_automation_invoice_unbilled_hours', 30)->nullable()->default('no');
            $table->decimal('project_automation_invoice_hourly_rate', 10)->nullable();
            $table->integer('project_automation_invoice_hourly_tax_1')->nullable();
            $table->string('project_automation_invoice_email_client', 30)->nullable()->default('no');
            $table->integer('project_automation_invoice_due_date')->nullable()->default(0);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('projects');
    }
};
