package com.ryancanulla.mindfreak.controller
{
	import com.ryancanulla.mindfreak.view.IView;
	import com.ryancanulla.mindfreak.view.MindControlGame;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.osmf.events.TimeEvent;

	public class GameLoop
	{
		private var timer:Timer;
		private var _view:IView;
		
		public function GameLoop() {
			createTimer();
		}
		
		private function createTimer():void {
			timer = new Timer(1000 / 33, 10 * 1000);
			timer.addEventListener(TimerEvent.TIMER, render);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, restartTimer);
		}
		
		private function render(e:TimerEvent):void {
			_view.render();
		}
		
		private function restartTimer(e:TimerEvent):void {
			timer.reset();
			timer.start();
		}
		
		public function start():void {
			timer.start();
		}
		
		public function set view(e:IView):void {
			_view = e;
		}
	}
}