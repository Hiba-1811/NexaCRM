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
        Schema::create('tickets', function (Blueprint $table) {
            $table->integer('ticket_id')->primary();
            $table->timestamp('ticket_created')->nullable();
            $table->timestamp('ticket_updated')->nullable();
            $table->integer('ticket_creatorid');
            $table->integer('ticket_categoryid')->default(9);
            $table->integer('ticket_clientid')->nullable();
            $table->integer('ticket_projectid')->nullable();
            $table->string('ticket_subject', 250)->nullable();
            $table->text('ticket_message')->nullable();
            $table->string('ticket_priority', 50)->default('normal');
            $table->timestamp('ticket_last_updated')->nullable();
            $table->timestamp('ticket_date_status_changed')->nullable();
            $table->smallInteger('ticket_status')->default(1);
            $table->string('ticket_source', 10)->default('web');
            $table->string('ticket_active_state', 20)->nullable()->default('active');
            $table->string('ticket_user_type', 10)->nullable()->default('user');
            $table->text('ticket_imap_sender_email_address')->nullable();
            $table->text('ticket_imap_sender_email_id')->nullable();
            $table->text('ticket_imap_email_payload')->nullable();
            $table->text('ticket_custom_field_1')->nullable();
            $table->text('ticket_custom_field_2')->nullable();
            $table->text('ticket_custom_field_3')->nullable();
            $table->text('ticket_custom_field_4')->nullable();
            $table->text('ticket_custom_field_5')->nullable();
            $table->text('ticket_custom_field_6')->nullable();
            $table->text('ticket_custom_field_7')->nullable();
            $table->text('ticket_custom_field_8')->nullable();
            $table->text('ticket_custom_field_9')->nullable();
            $table->text('ticket_custom_field_10')->nullable();
            $table->text('ticket_custom_field_11')->nullable();
            $table->text('ticket_custom_field_12')->nullable();
            $table->text('ticket_custom_field_13')->nullable();
            $table->text('ticket_custom_field_14')->nullable();
            $table->text('ticket_custom_field_15')->nullable();
            $table->text('ticket_custom_field_16')->nullable();
            $table->text('ticket_custom_field_17')->nullable();
            $table->text('ticket_custom_field_18')->nullable();
            $table->text('ticket_custom_field_19')->nullable();
            $table->text('ticket_custom_field_20')->nullable();
            $table->text('ticket_custom_field_21')->nullable();
            $table->text('ticket_custom_field_22')->nullable();
            $table->text('ticket_custom_field_23')->nullable();
            $table->text('ticket_custom_field_24')->nullable();
            $table->text('ticket_custom_field_25')->nullable();
            $table->text('ticket_custom_field_26')->nullable();
            $table->text('ticket_custom_field_27')->nullable();
            $table->text('ticket_custom_field_28')->nullable();
            $table->text('ticket_custom_field_29')->nullable();
            $table->text('ticket_custom_field_30')->nullable();
            $table->text('ticket_custom_field_31')->nullable();
            $table->text('ticket_custom_field_32')->nullable();
            $table->text('ticket_custom_field_33')->nullable();
            $table->text('ticket_custom_field_34')->nullable();
            $table->text('ticket_custom_field_35')->nullable();
            $table->text('ticket_custom_field_36')->nullable();
            $table->text('ticket_custom_field_37')->nullable();
            $table->text('ticket_custom_field_38')->nullable();
            $table->text('ticket_custom_field_39')->nullable();
            $table->text('ticket_custom_field_40')->nullable();
            $table->text('ticket_custom_field_41')->nullable();
            $table->text('ticket_custom_field_42')->nullable();
            $table->text('ticket_custom_field_43')->nullable();
            $table->text('ticket_custom_field_44')->nullable();
            $table->text('ticket_custom_field_45')->nullable();
            $table->text('ticket_custom_field_46')->nullable();
            $table->text('ticket_custom_field_47')->nullable();
            $table->text('ticket_custom_field_48')->nullable();
            $table->text('ticket_custom_field_49')->nullable();
            $table->text('ticket_custom_field_50')->nullable();
            $table->text('ticket_custom_field_51')->nullable();
            $table->text('ticket_custom_field_52')->nullable();
            $table->text('ticket_custom_field_53')->nullable();
            $table->text('ticket_custom_field_54')->nullable();
            $table->text('ticket_custom_field_55')->nullable();
            $table->text('ticket_custom_field_56')->nullable();
            $table->text('ticket_custom_field_57')->nullable();
            $table->text('ticket_custom_field_58')->nullable();
            $table->text('ticket_custom_field_59')->nullable();
            $table->text('ticket_custom_field_60')->nullable();
            $table->text('ticket_custom_field_61')->nullable();
            $table->text('ticket_custom_field_62')->nullable();
            $table->text('ticket_custom_field_63')->nullable();
            $table->text('ticket_custom_field_64')->nullable();
            $table->text('ticket_custom_field_65')->nullable();
            $table->text('ticket_custom_field_66')->nullable();
            $table->text('ticket_custom_field_67')->nullable();
            $table->text('ticket_custom_field_68')->nullable();
            $table->text('ticket_custom_field_69')->nullable();
            $table->text('ticket_custom_field_70')->nullable();
            $table->text('ticket_mapping_type')->nullable();
            $table->integer('ticket_mapping_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tickets');
    }
};
