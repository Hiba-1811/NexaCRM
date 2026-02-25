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
        Schema::create('roles', function (Blueprint $table) {
            $table->integer('role_id')->primary();
            $table->timestamp('role_created')->nullable();
            $table->timestamp('role_updated')->nullable();
            $table->string('role_system', 10)->default('no');
            $table->string('role_type', 10);
            $table->string('role_name', 100);
            $table->smallInteger('role_clients')->default(0);
            $table->smallInteger('role_contacts');
            $table->smallInteger('role_contracts')->default(0);
            $table->smallInteger('role_invoices')->default(0);
            $table->smallInteger('role_estimates')->default(0);
            $table->smallInteger('role_proposals')->default(0);
            $table->smallInteger('role_payments')->default(0);
            $table->smallInteger('role_items')->default(0);
            $table->smallInteger('role_tasks')->default(0);
            $table->string('role_tasks_scope', 20)->default('own');
            $table->smallInteger('role_projects')->default(0);
            $table->string('role_projects_scope', 20)->default('own');
            $table->string('role_projects_billing', 20)->default('0');
            $table->smallInteger('role_leads')->default(0);
            $table->string('role_leads_scope', 20)->default('own');
            $table->smallInteger('role_expenses')->default(0);
            $table->string('role_expenses_scope', 20)->default('own');
            $table->integer('role_timesheets')->default(0);
            $table->string('role_timesheets_scope', 20)->default('own');
            $table->smallInteger('role_team')->default(0);
            $table->string('role_team_scope', 20)->default('global');
            $table->smallInteger('role_tickets')->default(0);
            $table->smallInteger('role_knowledgebase')->default(0);
            $table->string('role_manage_knowledgebase_categories', 20)->default('no');
            $table->string('role_assign_projects', 20)->default('no');
            $table->string('role_assign_leads', 20)->default('no');
            $table->string('role_assign_tasks', 20)->default('no');
            $table->string('role_set_project_permissions', 20)->default('no');
            $table->string('role_subscriptions', 20)->default('0');
            $table->string('role_templates_projects', 20)->default('1');
            $table->string('role_templates_contracts', 20)->default('1');
            $table->string('role_templates_proposals', 20)->default('1');
            $table->string('role_content_import', 20)->default('yes');
            $table->string('role_content_export', 20)->default('yes');
            $table->string('role_module_cs_affiliate', 20)->default('3');
            $table->string('role_homepage', 100)->default('dashboard');
            $table->string('role_messages', 20)->default('yes');
            $table->string('role_reports', 20)->default('no');
            $table->string('role_canned', 20)->default('no');
            $table->string('role_canned_scope', 20)->default('own');
            $table->text('modules')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('roles');
    }
};
