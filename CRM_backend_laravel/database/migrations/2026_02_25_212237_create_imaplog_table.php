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
        Schema::create('imaplog', function (Blueprint $table) {
            $table->integer('imaplog_id')->primary();
            $table->timestamp('imaplog_created');
            $table->timestamp('imaplog_updated');
            $table->integer('imaplog_categoryid');
            $table->text('imaplog_to_email');
            $table->text('imaplog_from_email')->nullable();
            $table->text('imaplog_from_name')->nullable();
            $table->text('imaplog_subject')->nullable();
            $table->text('imaplog_email_uid')->nullable();
            $table->integer('imaplog_mailbox_id')->nullable();
            $table->text('imaplog_body')->nullable();
            $table->integer('imaplog_attachments_count')->nullable();
            $table->text('imaplog_header_in_reply_to')->nullable();
            $table->text('imaplog_payload_header')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('imaplog');
    }
};
