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
        Schema::create('users', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->text('unique_id')->nullable();
            $table->timestamp('created')->nullable();
            $table->timestamp('updated')->nullable();
            $table->timestamp('deleted')->nullable();
            $table->integer('creatorid')->nullable();
            $table->text('email')->nullable();
            $table->text('password');
            $table->text('first_name');
            $table->text('last_name');
            $table->text('phone')->nullable();
            $table->text('position')->nullable();
            $table->integer('clientid')->nullable();
            $table->string('account_owner', 10)->nullable()->default('no');
            $table->string('primary_admin', 10)->nullable()->default('no');
            $table->text('avatar_directory')->nullable();
            $table->text('avatar_filename')->nullable();
            $table->text('type');
            $table->string('status', 20)->nullable()->default('active');
            $table->integer('role_id')->default(2);
            $table->timestamp('last_seen')->nullable();
            $table->string('theme', 100)->nullable()->default('default');
            $table->text('last_ip_address')->nullable();
            $table->text('social_facebook')->nullable();
            $table->text('social_twitter')->nullable();
            $table->text('social_linkedin')->nullable();
            $table->text('social_github')->nullable();
            $table->text('social_dribble')->nullable();
            $table->string('pref_language', 200)->nullable()->default('english');
            $table->string('pref_email_notifications', 10)->nullable()->default('yes');
            $table->string('pref_leftmenu_position', 50)->nullable()->default('collapsed');
            $table->string('pref_statspanel_position', 50)->nullable()->default('collapsed');
            $table->string('pref_filter_own_tasks', 50)->nullable()->default('no');
            $table->string('pref_hide_completed_tasks', 50)->nullable()->default('no');
            $table->string('pref_filter_own_projects', 50)->nullable()->default('no');
            $table->string('pref_filter_show_archived_projects', 50)->nullable()->default('no');
            $table->string('pref_filter_show_archived_tasks', 50)->nullable()->default('no');
            $table->string('pref_filter_show_archived_leads', 50)->nullable()->default('no');
            $table->string('pref_filter_show_archived_tickets', 50)->nullable()->default('no');
            $table->string('pref_filter_own_leads', 50)->nullable()->default('no');
            $table->string('pref_view_tasks_layout', 50)->nullable()->default('kanban');
            $table->string('pref_view_leads_layout', 50)->nullable()->default('kanban');
            $table->string('pref_view_projects_layout', 50)->nullable()->default('list');
            $table->string('pref_theme', 100)->nullable()->default('default');
            $table->string('pref_calendar_dates_projects', 30)->nullable()->default('due');
            $table->string('pref_calendar_dates_tasks', 30)->nullable()->default('due');
            $table->string('pref_calendar_dates_events', 30)->nullable()->default('due');
            $table->string('pref_calendar_view', 30)->nullable()->default('own');
            $table->text('remember_token')->nullable();
            $table->string('remember_filters_tickets_status', 20)->nullable()->default('disabled');
            $table->text('remember_filters_tickets_payload')->nullable();
            $table->string('remember_filters_projects_status', 20)->nullable()->default('disabled');
            $table->text('remember_filters_projects_payload')->nullable();
            $table->string('remember_filters_invoices_status', 20)->nullable()->default('disabled');
            $table->text('remember_filters_invoices_payload')->nullable();
            $table->string('remember_filters_estimates_status', 20)->nullable()->default('disabled');
            $table->text('remember_filters_estimates_payload')->nullable();
            $table->string('remember_filters_contracts_status', 20)->nullable()->default('disabled');
            $table->text('remember_filters_contracts_payload')->nullable();
            $table->string('remember_filters_payments_status', 20)->nullable()->default('disabled');
            $table->text('remember_filters_payments_payload')->nullable();
            $table->string('remember_filters_proposals_status', 20)->nullable()->default('disabled');
            $table->text('remember_filters_proposals_payload')->nullable();
            $table->string('remember_filters_clients_status', 20)->nullable()->default('disabled');
            $table->text('remember_filters_clients_payload')->nullable();
            $table->string('remember_filters_leads_status', 20)->nullable()->default('disabled');
            $table->text('remember_filters_leads_payload')->nullable();
            $table->string('remember_filters_tasks_status', 20)->nullable()->default('disabled');
            $table->text('remember_filters_tasks_payload')->nullable();
            $table->string('remember_filters_subscriptions_status', 20)->nullable()->default('disabled');
            $table->text('remember_filters_subscriptions_payload')->nullable();
            $table->string('remember_filters_products_status', 20)->nullable()->default('disabled');
            $table->text('remember_filters_products_payload')->nullable();
            $table->string('remember_filters_expenses_status', 20)->nullable()->default('disabled');
            $table->text('remember_filters_expenses_payload')->nullable();
            $table->string('remember_filters_timesheets_status', 20)->nullable()->default('disabled');
            $table->text('remember_filters_timesheets_payload')->nullable();
            $table->text('forgot_password_token')->nullable();
            $table->timestamp('forgot_password_token_expiry')->nullable();
            $table->string('force_password_change', 10)->nullable()->default('no');
            $table->string('notifications_system', 10)->nullable()->default('no\'no\' actual values must be set in the settings config file');
            $table->string('notifications_new_project', 10)->nullable()->default('no');
            $table->string('notifications_projects_activity', 10)->nullable()->default('no');
            $table->string('notifications_billing_activity', 10)->nullable()->default('no');
            $table->string('notifications_new_assignement', 10)->nullable()->default('no');
            $table->string('notifications_leads_activity', 10)->nullable()->default('no');
            $table->string('notifications_tasks_activity', 10)->nullable()->default('no');
            $table->string('notifications_tickets_activity', 10)->nullable()->default('no');
            $table->string('notifications_reminders', 10)->nullable()->default('yes_email');
            $table->string('dashboard_access', 150)->nullable()->default('yes');
            $table->string('welcome_email_sent', 150)->nullable()->default('no');
            $table->text('space_uniqueid')->nullable();
            $table->text('timezone')->nullable();
            $table->text('gateways_stripe_customer_id')->nullable();
            $table->text('gateways_paypal_customer_id')->nullable();
            $table->text('gateways_square_customer_id')->nullable();
            $table->text('gateways_braintree_customer_id')->nullable();
            $table->text('gateways_authorize_net_customer_id')->nullable();
            $table->text('gateways_adyen_customer_id')->nullable();
            $table->text('gateways_worldpay_customer_id')->nullable();
            $table->text('gateways_checkout_com_customer_id')->nullable();
            $table->text('gateways_2checkout_customer_id')->nullable();
            $table->text('gateways_lemonsqueezy_customer_id')->nullable();
            $table->text('gateways_paddle_customer_id')->nullable();
            $table->text('gateways_gumroad_customer_id')->nullable();
            $table->text('gateways_fastspring_customer_id')->nullable();
            $table->text('gateways_razorpay_customer_id')->nullable();
            $table->text('gateways_paytm_customer_id')->nullable();
            $table->text('gateways_phonepe_customer_id')->nullable();
            $table->text('gateways_ccavenue_customer_id')->nullable();
            $table->text('gateways_billdesk_customer_id')->nullable();
            $table->text('gateways_cashfree_customer_id')->nullable();
            $table->text('gateways_flutterwave_customer_id')->nullable();
            $table->text('gateways_paystack_customer_id')->nullable();
            $table->text('gateways_pesapal_customer_id')->nullable();
            $table->text('gateways_dpo_customer_id')->nullable();
            $table->text('gateways_payfast_customer_id')->nullable();
            $table->text('gateways_mercadopago_customer_id')->nullable();
            $table->text('gateways_pagseguro_customer_id')->nullable();
            $table->text('gateways_stone_customer_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
