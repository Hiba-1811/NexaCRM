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
        Schema::create('webforms_assigned', function (Blueprint $table) {
            $table->integer('webformassigned_id')->primary();
            $table->timestamp('webformassigned_created');
            $table->timestamp('webformassigned_updated');
            $table->integer('webformassigned_formid')->nullable();
            $table->integer('webformassigned_userid')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('webforms_assigned');
    }
};
