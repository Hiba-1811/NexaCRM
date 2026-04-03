<?php
namespace App\Http\Controllers;
use App\Models\Client;
use App\Models\Project;
use App\Models\Task;
use App\Models\Invoice;
use App\Models\Ticket;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function stats()
    {
        // Revenue by month (last 6 months)
        $revenue = [];
        for ($i = 5; $i >= 0; $i--) {
            $month = now()->subMonths($i);
            $amount = Invoice::whereYear('bill_date', $month->year)
                ->whereMonth('bill_date', $month->month)
                ->where('bill_status', 'paid')
                ->sum('bill_final_amount');
            $revenue[] = [
                'month' => $month->format('M Y'),
                'amount' => (float) $amount
            ];
        }

        // Upcoming due dates (next 7 days)
        $upcoming = [];
        $upcomingTasks = Task::whereBetween('task_date_due', [now(), now()->addDays(7)])
            ->whereIn('task_status', [1, 2])
            ->orderBy('task_date_due')
            ->take(5)
            ->get(['task_id', 'task_title', 'task_date_due', 'task_status', 'task_priority']);
        foreach ($upcomingTasks as $task) {
            $upcoming[] = [
                'type' => 'task',
                'icon' => '✓',
                'title' => $task->task_title,
                'due' => $task->task_date_due,
                'priority' => $task->task_priority,
            ];
        }
        $upcomingInvoices = Invoice::whereBetween('bill_due_date', [now(), now()->addDays(7)])
            ->whereNotIn('bill_status', ['paid', 'cancelled'])
            ->orderBy('bill_due_date')
            ->take(5)
            ->get(['bill_invoiceid', 'bill_uniqueid', 'bill_due_date', 'bill_final_amount']);
        foreach ($upcomingInvoices as $inv) {
            $upcoming[] = [
                'type' => 'invoice',
                'icon' => '🧾',
                'title' => 'Invoice #' . ($inv->bill_uniqueid ?? $inv->bill_invoiceid),
                'due' => $inv->bill_due_date,
                'amount' => $inv->bill_final_amount,
            ];
        }

        return response()->json([
            'clients' => [
                'total'    => Client::count(),
                'active'   => Client::where('client_status', 'active')->count(),
                'inactive' => Client::where('client_status', 'inactive')->count(),
                'prospect' => Client::where('client_status', 'prospect')->count(),
            ],
            'projects' => [
                'total'    => Project::count(),
                'open'     => Project::where('project_status', 'open')->count(),
                'finished' => Project::where('project_status', 'finished')->count(),
            ],
            'tasks' => [
                'total'       => Task::count(),
                'open'        => Task::where('task_status', 1)->count(),
                'in_progress' => Task::where('task_status', 2)->count(),
                'finished'    => Task::where('task_status', 3)->count(),
            ],
            'invoices' => [
                'total'  => Invoice::count(),
                'paid'   => Invoice::where('bill_status', 'paid')->count(),
                'unpaid' => Invoice::whereNotIn('bill_status', ['paid', 'cancelled'])->count(),
                'total_revenue' => (float) Invoice::where('bill_status', 'paid')->sum('bill_final_amount'),
            ],
            'tickets' => [
                'total'  => Ticket::count(),
                'open'   => Ticket::where('ticket_status', 1)->count(),
                'closed' => Ticket::where('ticket_status', 3)->count(),
            ],
            'recent_clients' => Client::orderBy('client_created', 'desc')
                ->take(5)
                ->get(['client_id', 'client_company_name', 'client_status', 'client_billing_city', 'client_created']),
            'recent_invoices' => Invoice::orderBy('bill_created', 'desc')
                ->take(5)
                ->get(['bill_invoiceid', 'bill_uniqueid', 'bill_status', 'bill_final_amount', 'bill_date', 'bill_due_date']),
            'recent_tickets' => Ticket::orderBy('ticket_created', 'desc')
                ->take(5)
                ->get(['ticket_id', 'ticket_subject', 'ticket_status', 'ticket_priority', 'ticket_created']),
            'revenue_chart' => $revenue,
            'upcoming' => $upcoming,
        ]);
    }
}
