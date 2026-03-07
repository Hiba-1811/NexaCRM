<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tableconfig', function (Blueprint $table) {

            $table->id('tableconfig_id'); // PRIMARY KEY

            $table->dateTime('tableconfig_created');
            $table->dateTime('tableconfig_updated');

            $table->integer('tableconfig_userid')->index(); // KEY

            $table->string('tableconfig_table_name',150)->index(); // KEY

            // columns 1 → 40
            for ($i = 1; $i <= 40; $i++) {
                $table->string("tableconfig_column_$i",20)->default('hidden');
            }

            // custom columns 1 → 70
            for ($i = 1; $i <= 70; $i++) {
                $table->string("tableconfig_custom_$i",20)->default('hidden');
            }

            


        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tableconfig');
    }
};
