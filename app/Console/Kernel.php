<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use Illuminate\Support\Facades\DB;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
    ];

    /**
     * Delete Daily temporary clients from database
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // Triggers then delete additional content from tables:
		// Address, Company and temporary Order
         $schedule->call(function() {

             $yesterday = date('Y-m-d H:i:s', strtotime('yesterday'));

             DB::table('clients')
                 ->where('temp','1')
                 ->where('created_at','<=',$yesterday)
                 ->delete();

         })->daily();
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
