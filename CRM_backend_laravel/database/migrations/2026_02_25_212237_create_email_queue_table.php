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
        Schema::create('email_queue', function (Blueprint $table) {
            $table->integer('emailqueue_id')->primary();
            $table->timestamp('emailqueue_created');
            $table->timestamp('emailqueue_updated');
            $table->string('emailqueue_to', 150)->nullable();
            $table->string('emailqueue_from_email', 150)->nullable();
            $table->string('emailqueue_from_name', 150)->nullable();
            $table->string('emailqueue_subject', 250)->nullable();
            $table->text('emailqueue_message')->nullable();
            $table->string('emailqueue_type', 150)->nullable()->default('general');
            $table->text('emailqueue_attachments')->nullable();
            $table->string('emailqueue_resourcetype', 50)->nullable();
            $table->integer('emailqueue_resourceid')->nullable();
            $table->string('emailqueue_pdf_resource_type', 50)->nullable();
            $table->integer('emailqueue_pdf_resource_id')->nullable();
            $table->timestamp('emailqueue_started_at')->nullable();
            $table->string('emailqueue_status', 20)->nullable()->default('new');
            $table->integer('emailqueue_attempts')->nullable()->default(0);
            $table->text('emailqueue_notes')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('email_queue');
    }
};
