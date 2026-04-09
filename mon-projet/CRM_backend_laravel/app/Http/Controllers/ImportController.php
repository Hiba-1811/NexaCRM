<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Client;
class ImportController extends Controller
{
    public function importClients(Request $request)
    {
        $request->validate(['file' => 'required|mimes:csv,txt']);
        
        $file = $request->file('file');
        $handle = fopen($file->getPathname(), 'r');
        
        $header = fgetcsv($handle);
        $imported = 0;
        $errors = [];
        
        while (($row = fgetcsv($handle)) !== false) {
            try {
                if (count($row) !== count($header)) continue;
                if (empty(array_filter($row))) continue;

                $data = array_combine($header, $row);
                
                Client::create([
                    'client_company_name' => $data['client_company_name'] ?? null,
                    'client_phone'        => $data['client_phone'] ?? null,
                    'client_website'      => $data['client_website'] ?? null,
                    'client_status'       => $data['client_status'] ?? 'active',
                    'client_description'  => $data['client_description'] ?? null,
                    'client_creatorid'    => auth('api')->user()->id,
                    'client_created'      => now(),
                    'client_updated'      => now(),
                ]);
                $imported++;
            } catch (\Exception $e) {
                $errors[] = $e->getMessage();
            }
        }
        
        fclose($handle);
        return response()->json([
            'message' => "$imported clients importés avec succès",
            'errors'  => $errors
        ]);
    }
}