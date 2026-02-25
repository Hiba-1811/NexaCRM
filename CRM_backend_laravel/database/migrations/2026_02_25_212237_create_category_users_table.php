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
        Schema::create('category_users', function (Blueprint $table) {
            $table->integer('categoryuser_id')->primary();
            $table->integer('categoryuser_categoryid');
            $table->integer('categoryuser_userid');
            $table->timestamp('categoryuser_created');
            $table->timestamp('categoryuser_updated');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('category_users');
    }
};
