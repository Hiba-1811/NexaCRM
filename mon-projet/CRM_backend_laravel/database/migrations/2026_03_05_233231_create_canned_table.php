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
        Schema::create('canned', function (Blueprint $table) {

            $table->increments('canned_id');

            $table->dateTime('canned_created');
            $table->dateTime('canned_updated');

            $table->integer('canned_creatorid')->nullable();
            $table->integer('canned_categoryid')->nullable();

            $table->string('canned_title', 250)->nullable();
            $table->text('canned_message')->nullable();

            $table->string('canned_visibility', 20)->default('public');

            // indexes
            $table->index('canned_categoryid');
            $table->index('canned_creatorid');
            $table->index('canned_visibility');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('canned');
    }
};
