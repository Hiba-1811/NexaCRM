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
        Schema::create('ticket_replies', function (Blueprint $table) {
            $table->integer('ticketreply_id')->primary();
            $table->timestamp('ticketreply_created');
            $table->timestamp('ticketreply_updated');
            $table->integer('ticketreply_creatorid');
            $table->integer('ticketreply_clientid')->nullable();
            $table->integer('ticketreply_ticketid');
            $table->text('ticketreply_text');
            $table->string('ticketreply_source', 10)->default('web');
            $table->text('ticketreply_imap_sender_email_id');
            $table->string('ticketreply_type', 10)->default('reply');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ticket_replies');
    }
};
