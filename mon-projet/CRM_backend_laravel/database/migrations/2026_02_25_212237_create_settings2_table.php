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
        Schema::create('settings2', function (Blueprint $table) {
            $table->integer('settings2_id')->primary();
            $table->timestamp('settings2_created');
            $table->timestamp('settings2_updated');
            $table->text('settings2_bills_pdf_css')->nullable();
            $table->text('settings2_calendar_projects_colour')->nullable();
            $table->text('settings2_calendar_tasks_colour')->nullable();
            $table->text('settings2_calendar_events_colour')->nullable();
            $table->integer('settings2_calendar_reminder_duration')->nullable();
            $table->text('settings2_calendar_reminder_period')->nullable();
            $table->text('settings2_calendar_events_assigning')->nullable();
            $table->integer('settings2_calendar_first_day')->nullable();
            $table->integer('settings2_calendar_default_event_duration')->nullable();
            $table->text('settings2_calendar_send_reminder_projects')->nullable();
            $table->text('settings2_calendar_send_reminder_tasks')->nullable();
            $table->text('settings2_calendar_send_reminder_events')->nullable();
            $table->text('settings2_captcha_api_site_key')->nullable();
            $table->text('settings2_captcha_api_secret_key')->nullable();
            $table->string('settings2_captcha_status', 10)->nullable()->default('disabled');
            $table->string('settings2_estimates_automation_default_status', 10)->nullable()->default('disabled');
            $table->string('settings2_estimates_automation_create_project', 10)->nullable()->default('no');
            $table->string('settings2_estimates_automation_project_status', 50)->nullable()->default('in_progress');
            $table->text('settings2_estimates_automation_project_title')->nullable();
            $table->string('settings2_estimates_automation_project_email_client', 10)->nullable()->default('no');
            $table->string('settings2_estimates_automation_create_invoice', 10)->nullable()->default('no');
            $table->string('settings2_estimates_automation_invoice_email_client', 10)->nullable()->default('no');
            $table->integer('settings2_estimates_automation_invoice_due_date')->nullable()->default(7);
            $table->string('settings2_estimates_automation_create_tasks', 10)->nullable()->default('no');
            $table->string('settings2_estimates_automation_copy_attachments', 10)->nullable()->default('yes');
            $table->string('settings2_extras_dimensions_billing', 10)->nullable()->default('disabled');
            $table->string('settings2_extras_dimensions_default_unit', 30)->nullable()->default('m2');
            $table->string('settings2_extras_dimensions_show_measurements', 10)->nullable()->default('no');
            $table->text('settings2_importing_leads_duplicates_name')->nullable();
            $table->text('settings2_importing_leads_duplicates_email')->nullable();
            $table->text('settings2_importing_leads_duplicates_telephone')->nullable();
            $table->text('settings2_importing_leads_duplicates_company')->nullable();
            $table->text('settings2_importing_clients_duplicates_email')->nullable();
            $table->text('settings2_importing_clients_duplicates_telephone')->nullable();
            $table->text('settings2_importing_clients_duplicates_company')->nullable();
            $table->string('settings2_projects_automation_default_status', 10)->nullable()->default('disabled');
            $table->string('settings2_projects_automation_create_invoices', 10)->nullable()->default('no');
            $table->string('settings2_projects_automation_convert_estimates_to_invoices', 10)->nullable()->default('no');
            $table->string('settings2_projects_automation_skip_draft_estimates', 10)->nullable()->default('yes');
            $table->string('settings2_projects_automation_skip_declined_estimates', 10)->nullable()->default('yes');
            $table->string('settings2_projects_automation_invoice_unbilled_hours', 10)->nullable()->default('no');
            $table->decimal('settings2_projects_automation_invoice_hourly_rate', 10)->nullable();
            $table->integer('settings2_projects_automation_invoice_hourly_tax_1')->nullable();
            $table->string('settings2_projects_automation_invoice_email_client', 10)->nullable()->default('no');
            $table->integer('settings2_projects_automation_invoice_due_date')->nullable()->default(7);
            $table->string('settings2_tasks_manage_dependencies', 60)->nullable()->default('super-users');
            $table->text('settings2_tap_secret_key')->nullable();
            $table->text('settings2_tap_publishable_key')->nullable();
            $table->text('settings2_tap_currency_code')->nullable();
            $table->string('settings2_tap_language', 10)->nullable()->default('en');
            $table->text('settings2_tap_display_name')->nullable();
            $table->string('settings2_tap_status', 10)->nullable()->default('disabled');
            $table->text('settings2_theme_css')->nullable();
            $table->text('settings2_paystack_secret_key')->nullable();
            $table->text('settings2_paystack_public_key')->nullable();
            $table->text('settings2_paystack_currency_code')->nullable();
            $table->text('settings2_paystack_display_name')->nullable();
            $table->string('settings2_paystack_status', 10)->nullable()->default('disabled');
            $table->text('settings2_proposals_automation_default_status')->nullable();
            $table->text('settings2_proposals_automation_create_project')->nullable();
            $table->text('settings2_proposals_automation_project_status')->nullable();
            $table->text('settings2_proposals_automation_project_email_client')->nullable();
            $table->text('settings2_proposals_automation_create_invoice')->nullable();
            $table->text('settings2_proposals_automation_invoice_email_client')->nullable();
            $table->integer('settings2_proposals_automation_invoice_due_date')->nullable();
            $table->text('settings2_proposals_automation_create_tasks')->nullable();
            $table->string('settings2_file_folders_status', 10)->nullable()->default('enabled');
            $table->string('settings2_file_folders_manage_assigned', 10)->nullable()->default('yes');
            $table->string('settings2_file_folders_manage_project_manager', 10)->nullable()->default('yes');
            $table->string('settings2_file_folders_manage_client', 10)->nullable()->default('yes');
            $table->string('settings2_file_bulk_download', 10)->nullable()->default('enabled');
            $table->integer('settings2_search_category_limit')->nullable()->default(5);
            $table->text('settings2_spaces_team_space_id')->nullable();
            $table->string('settings2_spaces_team_space_status', 10)->nullable()->default('enabled');
            $table->string('settings2_spaces_user_space_status', 10)->nullable()->default('enabled');
            $table->string('settings2_spaces_team_space_title', 150)->nullable()->default('Team Space');
            $table->string('settings2_spaces_user_space_title', 150)->nullable()->default('My Space');
            $table->string('settings2_spaces_team_space_menu_name', 150)->nullable()->default('Team Space');
            $table->string('settings2_spaces_user_space_menu_name', 150)->nullable()->default('Space');
            $table->string('settings2_spaces_features_files', 10)->nullable()->default('enabled');
            $table->string('settings2_spaces_features_notes', 10)->nullable()->default('enabled');
            $table->string('settings2_spaces_features_comments', 10)->nullable()->default('enabled');
            $table->string('settings2_spaces_features_tasks', 10)->nullable()->default('enabled');
            $table->string('settings2_spaces_features_whiteboard', 10)->nullable()->default('enabled');
            $table->string('settings2_spaces_features_checklists', 10)->nullable()->default('enabled');
            $table->string('settings2_spaces_features_todos', 10)->nullable()->default('enabled');
            $table->string('settings2_spaces_features_reminders', 10)->nullable()->default('enabled');
            $table->string('settings2_tickets_replying_interface', 10)->nullable()->default('popup');
            $table->string('settings2_tickets_archive_button', 10)->nullable()->default('yes');
            $table->text('settings2_timesheets_show_recorded_by')->nullable();
            $table->string('settings2_projects_cover_images_show_on_project', 10)->nullable()->default('no');
            $table->string('settings2_onboarding_status', 10)->nullable()->default('disabled');
            $table->text('settings2_onboarding_content')->nullable();
            $table->string('settings2_onboarding_view_status', 10)->nullable()->default('unseen');
            $table->string('settings2_tweak_reports_truncate_long_text', 10)->nullable()->default('yes');
            $table->integer('settings2_tweak_imap_tickets_import_limit')->nullable()->default(5);
            $table->integer('settings2_tweak_imap_connection_timeout')->nullable()->default(30);
            $table->text('settings2_dompdf_fonts')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('settings2');
    }
};
