<?php namespace App\Listeners;

use App\Events\CronicaUpdates;

use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldBeQueued;

class CronicaUpdate {

	/**
	 * Create the event handler.
	 *
	 * @return void
	 */
	public function __construct()
	{
		//
	}

	/**
	 * Handle the event.
	 *
	 * @param  CronicaUpdates  $event
	 * @return void
	 */
	public function handle(CronicaUpdates $event)
	{
		//
	}

}
