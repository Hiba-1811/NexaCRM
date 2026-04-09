<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('automation_assigned', function (Blueprint $table) {
            $table->increments('automationassigned_id');
            $table->dateTime('automationassigned_created')->nullable();
            $table->integer('automationassigned_updated')->nullable();
            $table->integer('automationassigned_userid')->nullable();
            $table->string('automationassigned_resource_type', 150)->nullable();
            $table->integer('automationassigned_resource_id')->nullable();

            $table->index('automationassigned_resource_id');
            $table->index('automationassigned_resource_type');
            $table->index('automationassigned_userid');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('automation_assigned');
    }
};