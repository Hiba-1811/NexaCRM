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
        Schema::create('messages_tracking', function (Blueprint $table) {
            $table->integer('messagestracking_id')->primary();
            $table->timestamp('messagestracking_created');
            $table->timestamp('messagestracking_update');
            $table->string('messagestracking_massage_unique_id', 120);
            $table->string('messagestracking_target', 120)->nullable();
            $table->string('messagestracking_user_unique_id', 120)->nullable();
            $table->string('messagestracking_type', 50)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('messages_tracking');
    }
};
