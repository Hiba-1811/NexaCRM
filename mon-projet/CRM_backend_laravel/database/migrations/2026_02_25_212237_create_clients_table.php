<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('clients', function (Blueprint $table) {
            $table->increments('client_id');
            $table->string('client_importid', 100)->nullable();
            $table->dateTime('client_created')->nullable();
            $table->dateTime('client_updated')->nullable();
            $table->integer('client_creatorid');
            $table->integer('client_created_from_leadid');
            $table->integer('client_categoryid')->default(2);
            $table->string('client_company_name', 150);
            $table->text('client_description')->nullable();
            $table->string('client_phone', 50)->nullable();
            $table->string('client_logo_folder', 50)->nullable();
            $table->string('client_logo_filename', 50)->nullable();
            $table->string('client_website', 250)->nullable();
            $table->string('client_vat', 50)->nullable();
            $table->string('client_billing_street', 200)->nullable();
            $table->string('client_billing_city', 100)->nullable();
            $table->string('client_billing_state', 100)->nullable();
            $table->string('client_billing_zip', 50)->nullable();
            $table->string('client_billing_country', 100)->nullable();
            $table->string('client_shipping_street', 250)->nullable();
            $table->string('client_shipping_city', 100)->nullable();
            $table->string('client_shipping_state', 100)->nullable();
            $table->string('client_shipping_zip', 50)->nullable();
            $table->string('client_shipping_country', 100)->nullable();
            $table->string('client_status', 50)->default('active');
            $table->string('client_app_modules', 50)->default('system');
            $table->string('client_settings_modules_projects', 50)->default('enabled');
            $table->string('client_settings_modules_invoices', 50)->default('enabled');
            $table->string('client_settings_modules_payments', 50)->default('enabled');
            $table->string('client_settings_modules_knowledgebase', 50)->default('enabled');
            $table->string('client_settings_modules_estimates', 50)->default('enabled');
            $table->string('client_settings_modules_subscriptions', 50)->default('enabled');
            $table->string('client_settings_modules_tickets', 50)->default('enabled');
            $table->string('client_import_first_name', 100)->nullable();
            $table->string('client_import_last_name', 100)->nullable();
            $table->string('client_import_email', 100)->nullable();
            $table->string('client_import_job_title', 100)->nullable();
            for ($i = 1; $i <= 10; $i++) {
                $table->text("client_custom_field_{$i}")->nullable();
            }
            for ($i = 11; $i <= 20; $i++) {
                $table->dateTime("client_custom_field_{$i}")->nullable();
            }
            for ($i = 21; $i <= 30; $i++) {
                $table->text("client_custom_field_{$i}")->nullable();
            }
            for ($i = 31; $i <= 40; $i++) {
                $table->string("client_custom_field_{$i}", 20)->nullable();
            }
            for ($i = 41; $i <= 50; $i++) {
                $table->string("client_custom_field_{$i}", 150)->nullable();
            }
            for ($i = 51; $i <= 60; $i++) {
                $table->integer("client_custom_field_{$i}")->nullable();
            }
            for ($i = 61; $i <= 70; $i++) {
                $table->decimal("client_custom_field_{$i}", 10, 2)->nullable();
            }
            $table->text('client_billing_invoice_terms')->nullable();
            $table->smallInteger('client_billing_invoice_due_days')->nullable();
            $table->text('client_mapping_type')->nullable();
            $table->integer('client_mapping_id')->nullable();

            $table->index('client_creatorid');
            $table->index('client_categoryid');
            $table->index('client_status');
            $table->index('client_created_from_leadid');
            $table->index('client_app_modules');
            $table->index('client_importid');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('clients');
    }
};