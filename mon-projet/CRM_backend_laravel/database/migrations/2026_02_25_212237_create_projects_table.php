<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('projects', function (Blueprint $table) {
            $table->increments('project_id');
            $table->string('project_uniqueid', 100)->nullable();
            $table->string('project_type', 30)->default('project');
            $table->string('project_reference', 250)->nullable();
            $table->string('project_importid', 100)->nullable();
            $table->dateTime('project_created')->nullable();
            $table->dateTime('project_updated')->nullable();
            $table->integer('project_timestamp_created')->nullable();
            $table->integer('project_timestamp_updated')->nullable();
            $table->integer('project_clientid')->nullable();
            $table->integer('project_creatorid');
            $table->integer('project_categoryid')->default(1);
            $table->string('project_cover_directory', 100)->nullable();
            $table->string('project_cover_filename', 100)->nullable();
            $table->integer('project_cover_file_id')->nullable();
            $table->string('project_title', 250);
            $table->date('project_date_start')->nullable();
            $table->date('project_date_due')->nullable();
            $table->text('project_description')->nullable();
            $table->date('project_date_status_changed')->nullable();
            $table->string('project_status', 50)->default('not_started');
            $table->string('project_active_state', 10)->default('active');
            $table->tinyInteger('project_progress')->default(0);
            $table->decimal('project_billing_rate', 10, 2)->default(0.00);
            $table->string('project_billing_type', 40)->default('hourly');
            $table->integer('project_billing_estimated_hours')->default(0);
            $table->decimal('project_billing_costs_estimate', 10, 2)->default(0.00);
            $table->string('project_progress_manually', 10)->default('no');
            $table->string('clientperm_tasks_view', 10)->default('yes');
            $table->string('clientperm_tasks_collaborate', 40)->default('yes');
            $table->string('clientperm_tasks_create', 40)->default('yes');
            $table->string('clientperm_timesheets_view', 40)->default('yes');
            $table->string('clientperm_expenses_view', 40)->default('no');
            $table->string('assignedperm_milestone_manage', 40)->default('yes');
            $table->string('assignedperm_tasks_collaborate', 40)->nullable();
            $table->string('project_visibility', 40)->default('visible');
            $table->text('project_calendar_timezone')->nullable();
            $table->text('project_calendar_location')->nullable();
            $table->string('project_calendar_reminder', 10)->default('no');
            $table->integer('project_calendar_reminder_duration')->nullable();
            $table->text('project_calendar_reminder_period')->nullable();
            $table->text('project_calendar_reminder_sent')->nullable();
            $table->dateTime('project_calendar_reminder_date_sent')->nullable();
            $table->text('projectresource_type')->nullable();
            $table->integer('projectresource_id')->nullable();
            // custom fields 1-10 (tinytext)
            for ($i = 1; $i <= 10; $i++) {
                $table->text("project_custom_field_{$i}")->nullable();
            }
            // custom fields 11-20 (datetime)
            for ($i = 11; $i <= 20; $i++) {
                $table->dateTime("project_custom_field_{$i}")->nullable();
            }
            // custom fields 21-30 (text)
            for ($i = 21; $i <= 30; $i++) {
                $table->text("project_custom_field_{$i}")->nullable();
            }
            // custom fields 31-40 (varchar 20)
            for ($i = 31; $i <= 40; $i++) {
                $table->string("project_custom_field_{$i}", 20)->nullable();
            }
            // custom fields 41-50 (varchar 150)
            for ($i = 41; $i <= 50; $i++) {
                $table->string("project_custom_field_{$i}", 150)->nullable();
            }
            // custom fields 51-60 (int)
            for ($i = 51; $i <= 60; $i++) {
                $table->integer("project_custom_field_{$i}")->nullable();
            }
            // custom fields 61-70 (decimal)
            for ($i = 61; $i <= 70; $i++) {
                $table->decimal("project_custom_field_{$i}", 10, 2)->nullable();
            }
            $table->string('project_automation_status', 30)->default('disabled');
            $table->string('project_automation_create_invoices', 30)->default('no');
            $table->string('project_automation_convert_estimates_to_invoices', 30)->default('no');
            $table->string('project_automation_invoice_unbilled_hours', 30)->default('no');
            $table->decimal('project_automation_invoice_hourly_rate', 10, 2)->nullable();
            $table->integer('project_automation_invoice_hourly_tax_1')->nullable();
            $table->string('project_automation_invoice_email_client', 30)->default('no');
            $table->integer('project_automation_invoice_due_date')->default(0);

            $table->index('project_clientid');
            $table->index('project_creatorid');
            $table->index('project_categoryid');
            $table->index('project_status');
            $table->index('project_visibility');
            $table->index('project_type');
            $table->index('project_active_state');
            $table->index('project_billing_type');
            $table->index('clientperm_tasks_view');
            $table->index('project_progress_manually');
            $table->index('clientperm_tasks_collaborate');
            $table->index('clientperm_tasks_create');
            $table->index('clientperm_timesheets_view');
            $table->index('clientperm_expenses_view');
            $table->index('assignedperm_milestone_manage');
            $table->index('assignedperm_tasks_collaborate');
            $table->index('project_calendar_reminder');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('projects');
    }
};