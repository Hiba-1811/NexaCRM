<?php
namespace App\Http\Controllers;
use App\Models\Invoice;
use Illuminate\Http\Request;

class InvoiceController extends Controller
{
    public function index()
    {
        return response()->json(Invoice::all());
    }

    public function store(Request $request)
    {
        $data = $request->all();
        $data['bill_creatorid'] = auth('api')->user()->id;
        $data['bill_created'] = now();
        $data['bill_updated'] = now();
        $data['bill_uniqueid'] = 'INV' . rand(1000, 9999);
        $invoice = Invoice::create($data);
        return response()->json($invoice, 201);
    }

    public function show($id)
    {
        $invoice = Invoice::find($id);
        if (!$invoice) return response()->json(['error' => 'Not found'], 404);
        return response()->json($invoice);
    }

    public function update(Request $request, $id)
    {
        $invoice = Invoice::find($id);
        if (!$invoice) return response()->json(['error' => 'Not found'], 404);
        $invoice->update($request->all());
        return response()->json($invoice);
    }

    public function destroy($id)
    {
        $invoice = Invoice::find($id);
        if (!$invoice) return response()->json(['error' => 'Not found'], 404);
        $invoice->delete();
        return response()->json(['message' => 'Deleted']);
    }
}
