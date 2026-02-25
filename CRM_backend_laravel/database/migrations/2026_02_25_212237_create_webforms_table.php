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
        Schema::create('webforms', function (Blueprint $table) {
            $table->integer('webform_id')->primary();
            $table->string('webform_uniqueid', 100)->nullable();
            $table->timestamp('webform_created');
            $table->timestamp('webform_updated');
            $table->integer('webform_creatorid');
            $table->string('webform_title', 100)->nullable();
            $table->string('webform_type', 100)->nullable();
            $table->text('webform_builder_payload')->nullable();
            $table->text('webform_thankyou_message')->nullable();
            $table->string('webform_notify_assigned', 10)->nullable()->default('no');
            $table->string('webform_notify_admin', 10)->nullable()->default('no');
            $table->smallInteger('webform_submissions')->nullable()->default(0);
            $table->string('webform_user_captcha', 10)->nullable()->default('no');
            $table->string('webform_submit_button_text', 100)->nullable();
            $table->string('webform_background_color', 100)->nullable()->default('#FFFFFF');
            $table->string('webform_lead_title', 100)->nullable();
            $table->integer('webform_lead_status')->nullable()->default(1);
            $table->text('webform_style_css')->nullable();
            $table->string('webform_recaptcha', 15)->nullable()->default('disabled');
            $table->string('webform_status', 100)->nullable()->default('enabled');
            $table->text('webform_mapping_type')->nullable();
            $table->integer('webform_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('webforms');
    }
};
