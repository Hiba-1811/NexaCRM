<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('leads', function (Blueprint $table) {
            $table->increments('lead_id');
            $table->string('lead_uniqueid', 100)->nullable();
            $table->string('lead_importid', 100)->nullable();
            $table->double('lead_position');
            $table->dateTime('lead_created')->nullable();
            $table->dateTime('lead_updated')->nullable();
            $table->dateTime('lead_date_status_change')->nullable();
            $table->integer('lead_creatorid')->nullable();
            $table->integer('lead_updatorid')->nullable();
            $table->integer('lead_categoryid')->default(3);
            $table->string('lead_firstname', 100)->nullable();
            $table->string('lead_lastname', 100)->nullable();
            $table->string('lead_email', 150)->nullable();
            $table->string('lead_phone', 150)->nullable();
            $table->string('lead_job_position', 150)->nullable();
            $table->string('lead_company_name', 150)->nullable();
            $table->string('lead_website', 150)->nullable();
            $table->string('lead_street', 150)->nullable();
            $table->string('lead_city', 150)->nullable();
            $table->string('lead_state', 150)->nullable();
            $table->string('lead_zip', 150)->nullable();
            $table->string('lead_country', 150)->nullable();
            $table->string('lead_source', 150)->nullable();
            $table->string('lead_input_source', 20)->default('app');
            $table->text('lead_input_ip_address')->nullable();
            $table->string('lead_title', 250)->nullable();
            $table->text('lead_description')->nullable();
            $table->decimal('lead_value', 10, 2)->nullable();
            $table->date('lead_last_contacted')->nullable();
            $table->string('lead_converted', 10)->default('no');
            $table->integer('lead_converted_by_userid')->nullable();
            $table->dateTime('lead_converted_date')->nullable();
            $table->integer('lead_converted_clientid')->nullable();
            $table->tinyInteger('lead_status')->default(1);
            $table->string('lead_active_state', 10)->default('active');
            $table->string('lead_visibility', 40)->default('visible');
            $table->string('lead_cover_image', 10)->default('no');
            $table->text('lead_cover_image_uniqueid')->nullable();
            $table->text('lead_cover_image_filename')->nullable();
            // custom fields 1-30 (tinytext)
            for ($i = 1; $i <= 30; $i++) {
                $table->text("lead_custom_field_{$i}")->nullable();
            }
            // custom fields 31-40 (datetime)
            for ($i = 31; $i <= 40; $i++) {
                $table->dateTime("lead_custom_field_{$i}")->nullable();
            }
            // custom fields 41-110 (text)
            for ($i = 41; $i <= 110; $i++) {
                $table->text("lead_custom_field_{$i}")->nullable();
            }
            // custom fields 111-130 (int)
            for ($i = 111; $i <= 130; $i++) {
                $table->integer("lead_custom_field_{$i}")->nullable();
            }
            // custom fields 131-150 (decimal)
            for ($i = 131; $i <= 150; $i++) {
                $table->decimal("lead_custom_field_{$i}", 10, 2)->nullable();
            }
            $table->text('leadresource_type')->nullable();
            $table->integer('leadresource_id')->nullable();
            $table->text('lead_mapping_type')->nullable();
            $table->integer('lead_mapping_id')->nullable();

            $table->index('lead_creatorid');
            $table->index('lead_categoryid');
            $table->index('lead_email');
            $table->index('lead_status');
            $table->index('lead_converted_clientid');
            $table->index('lead_active_state');
            $table->index('lead_visibility');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('leads');
    }
};