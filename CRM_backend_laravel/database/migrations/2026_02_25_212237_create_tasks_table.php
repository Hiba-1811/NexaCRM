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
        Schema::create('tasks', function (Blueprint $table) {
            $table->integer('task_id')->primary();
            $table->string('task_uniqueid', 100)->nullable();
            $table->string('task_importid', 100)->nullable();
            $table->float('task_position');
            $table->timestamp('task_created')->nullable();
            $table->timestamp('task_updated')->nullable();
            $table->integer('task_creatorid')->nullable();
            $table->integer('task_clientid')->nullable();
            $table->integer('task_projectid')->nullable();
            $table->date('task_date_start')->nullable();
            $table->date('task_date_due')->nullable();
            $table->string('task_title', 250)->nullable();
            $table->text('task_description')->nullable();
            $table->string('task_client_visibility', 100)->nullable()->default('yes');
            $table->integer('task_milestoneid')->nullable();
            $table->string('task_previous_status', 100)->nullable()->default('new');
            $table->integer('task_priority')->nullable()->default(1);
            $table->timestamp('task_date_status_changed')->nullable();
            $table->integer('task_status')->nullable()->default(1);
            $table->integer('task_completed_by_userid')->nullable();
            $table->string('task_active_state', 100)->nullable()->default('active');
            $table->string('task_billable', 5)->nullable()->default('yes');
            $table->string('task_billable_status', 20)->nullable()->default('not_invoiced');
            $table->integer('task_billable_invoiceid')->nullable();
            $table->integer('task_billable_lineitemid')->nullable();
            $table->string('task_visibility', 40)->nullable()->default('visible');
            $table->string('task_overdue_notification_sent', 40)->nullable()->default('no');
            $table->string('task_recurring', 40)->nullable()->default('no');
            $table->integer('task_recurring_duration')->nullable();
            $table->string('task_recurring_period', 30)->nullable();
            $table->integer('task_recurring_cycles')->nullable();
            $table->integer('task_recurring_cycles_counter')->nullable()->default(0);
            $table->date('task_recurring_last')->nullable();
            $table->date('task_recurring_next')->nullable();
            $table->string('task_recurring_child', 10)->nullable()->default('no');
            $table->timestamp('task_recurring_parent_id')->nullable();
            $table->string('task_recurring_copy_checklists', 10)->nullable()->default('yes');
            $table->string('task_recurring_copy_files', 10)->nullable()->default('yes');
            $table->string('task_recurring_automatically_assign', 10)->nullable()->default('yes');
            $table->string('task_recurring_finished', 10)->nullable()->default('no');
            $table->text('task_cloning_original_task_id')->nullable();
            $table->string('task_cover_image', 10)->nullable()->default('no');
            $table->text('task_cover_image_uniqueid')->nullable();
            $table->text('task_cover_image_filename')->nullable();
            $table->text('task_calendar_timezone')->nullable();
            $table->text('task_calendar_location')->nullable();
            $table->string('task_calendar_reminder', 10)->nullable()->default('no');
            $table->integer('task_calendar_reminder_duration')->nullable();
            $table->text('task_calendar_reminder_period')->nullable();
            $table->text('task_calendar_reminder_sent')->nullable();
            $table->timestamp('task_calendar_reminder_date_sent')->nullable();
            $table->text('task_custom_field_1')->nullable();
            $table->text('task_custom_field_2')->nullable();
            $table->text('task_custom_field_3')->nullable();
            $table->text('task_custom_field_4')->nullable();
            $table->text('task_custom_field_5')->nullable();
            $table->text('task_custom_field_6')->nullable();
            $table->text('task_custom_field_7')->nullable();
            $table->text('task_custom_field_8')->nullable();
            $table->text('task_custom_field_9')->nullable();
            $table->text('task_custom_field_10')->nullable();
            $table->timestamp('task_custom_field_11')->nullable();
            $table->timestamp('task_custom_field_12')->nullable();
            $table->timestamp('task_custom_field_13')->nullable();
            $table->timestamp('task_custom_field_14')->nullable();
            $table->timestamp('task_custom_field_15')->nullable();
            $table->timestamp('task_custom_field_16')->nullable();
            $table->timestamp('task_custom_field_17')->nullable();
            $table->timestamp('task_custom_field_18')->nullable();
            $table->timestamp('task_custom_field_19')->nullable();
            $table->timestamp('task_custom_field_20')->nullable();
            $table->text('task_custom_field_21')->nullable();
            $table->text('task_custom_field_22')->nullable();
            $table->text('task_custom_field_23')->nullable();
            $table->text('task_custom_field_24')->nullable();
            $table->text('task_custom_field_25')->nullable();
            $table->text('task_custom_field_26')->nullable();
            $table->text('task_custom_field_27')->nullable();
            $table->text('task_custom_field_28')->nullable();
            $table->text('task_custom_field_29')->nullable();
            $table->text('task_custom_field_30')->nullable();
            $table->text('task_custom_field_31')->nullable();
            $table->text('task_custom_field_32')->nullable();
            $table->text('task_custom_field_33')->nullable();
            $table->text('task_custom_field_34')->nullable();
            $table->text('task_custom_field_35')->nullable();
            $table->text('task_custom_field_36')->nullable();
            $table->text('task_custom_field_37')->nullable();
            $table->text('task_custom_field_38')->nullable();
            $table->text('task_custom_field_39')->nullable();
            $table->text('task_custom_field_40')->nullable();
            $table->text('task_custom_field_41')->nullable();
            $table->text('task_custom_field_42')->nullable();
            $table->text('task_custom_field_43')->nullable();
            $table->text('task_custom_field_44')->nullable();
            $table->text('task_custom_field_45')->nullable();
            $table->text('task_custom_field_46')->nullable();
            $table->text('task_custom_field_47')->nullable();
            $table->text('task_custom_field_48')->nullable();
            $table->text('task_custom_field_49')->nullable();
            $table->text('task_custom_field_50')->nullable();
            $table->integer('task_custom_field_51')->nullable();
            $table->integer('task_custom_field_52')->nullable();
            $table->integer('task_custom_field_53')->nullable();
            $table->integer('task_custom_field_54')->nullable();
            $table->integer('task_custom_field_55')->nullable();
            $table->integer('task_custom_field_56')->nullable();
            $table->integer('task_custom_field_57')->nullable();
            $table->integer('task_custom_field_58')->nullable();
            $table->integer('task_custom_field_59')->nullable();
            $table->integer('task_custom_field_60')->nullable();
            $table->decimal('task_custom_field_61', 10)->nullable();
            $table->decimal('task_custom_field_62', 10)->nullable();
            $table->decimal('task_custom_field_63', 10)->nullable();
            $table->decimal('task_custom_field_64', 10)->nullable();
            $table->decimal('task_custom_field_65', 10)->nullable();
            $table->decimal('task_custom_field_66', 10)->nullable();
            $table->decimal('task_custom_field_67', 10)->nullable();
            $table->decimal('task_custom_field_68', 10)->nullable();
            $table->decimal('task_custom_field_69', 10)->nullable();
            $table->decimal('task_custom_field_70', 10)->nullable();
            $table->text('taskresource_type')->nullable();
            $table->integer('taskresource_id')->nullable();
            $table->text('task_mapping_type')->nullable();
            $table->integer('task_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tasks');
    }
};
