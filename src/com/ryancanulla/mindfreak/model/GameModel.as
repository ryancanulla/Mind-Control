package com.ryancanulla.mindfreak.model
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class GameModel extends EventDispatcher
	{
		private static var _instance:GameModel;
		private var _attention:Number;
		private var _signal:Number;
		
		public function GameModel(enforcer:SingletonEnforcer) {}
		
		public static function getInstance():GameModel {
			if (GameModel._instance == null) {
				GameModel._instance = new GameModel(new SingletonEnforcer());
			}
			return GameModel._instance;
		}
		
		public function set attention(e:Number):void {
			_attention = e;
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function set signal(e:Number):void {
			_signal = e;
			dispatchEvent(new Event(Event.CHANGE));
		}		
		
		public function get attention():Number {
			return _attention;
		}
		
		public function get signal():Number {
			return _signal;
		}
	}
}

class SingletonEnforcer
{
}
