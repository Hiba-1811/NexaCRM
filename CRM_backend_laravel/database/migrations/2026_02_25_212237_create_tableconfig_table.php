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
        Schema::create('tableconfig', function (Blueprint $table) {
            $table->integer('tableconfig_id')->primary();
            $table->timestamp('tableconfig_created');
            $table->timestamp('tableconfig_updated');
            $table->integer('tableconfig_userid');
            $table->string('tableconfig_table_name', 150);
            $table->string('tableconfig_column_1', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_2', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_3', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_4', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_5', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_6', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_7', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_8', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_9', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_10', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_11', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_12', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_13', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_14', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_15', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_16', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_17', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_18', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_19', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_20', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_21', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_22', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_23', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_24', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_25', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_26', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_27', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_28', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_29', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_30', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_31', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_32', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_33', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_34', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_35', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_36', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_37', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_38', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_39', 20)->nullable()->default('hidden');
            $table->string('tableconfig_column_40', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_1', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_2', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_3', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_4', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_5', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_6', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_7', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_8', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_9', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_10', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_11', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_12', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_13', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_14', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_15', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_16', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_17', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_18', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_19', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_20', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_21', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_22', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_23', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_24', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_25', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_26', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_27', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_28', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_29', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_30', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_31', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_32', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_33', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_34', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_35', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_36', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_37', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_38', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_39', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_40', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_41', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_42', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_43', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_44', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_45', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_46', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_47', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_48', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_49', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_50', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_51', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_52', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_53', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_54', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_55', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_56', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_57', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_58', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_59', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_60', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_61', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_62', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_63', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_64', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_65', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_66', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_67', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_68', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_69', 20)->nullable()->default('hidden');
            $table->string('tableconfig_custom_70', 20)->nullable()->default('hidden');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tableconfig');
    }
};
