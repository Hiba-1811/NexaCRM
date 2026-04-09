<?php
namespace Database\Seeders;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        User::create([
            'email'      => 'admin@crm.com',
            'password'   => Hash::make('admin123'),
            'first_name' => 'Admin',
            'last_name'  => 'User',
            'position'   => 'admin',
            'type'       => 'admin',
        ]);
        User::create([
            'email'      => 'staff@crm.com',
            'password'   => Hash::make('staff123'),
            'first_name' => 'Staff',
            'last_name'  => 'User',
            'position'   => 'staff',
            'type'       => 'user',
        ]);
        User::create([
            'email'      => 'client@crm.com',
            'password'   => Hash::make('client123'),
            'first_name' => 'Client',
            'last_name'  => 'User',
            'position'   => 'client',
            'type'       => 'client',
        ]);
    }
}
