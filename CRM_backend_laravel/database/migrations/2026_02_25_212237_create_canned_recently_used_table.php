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
        Schema::create('canned_recently_used', function (Blueprint $table) {
            $table->integer('cannedrecent_id')->primary();
            $table->timestamp('cannedrecent_created');
            $table->timestamp('cannedrecent_updated');
            $table->integer('cannedrecent_userid');
            $table->integer('cannedrecent_cannedid');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('canned_recently_used');
    }
};
