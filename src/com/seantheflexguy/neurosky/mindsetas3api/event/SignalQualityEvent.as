/*
Copyright (c) 2011, Sean Moore (seantheflexguy). All Rights Reserved.
@project  Neurosky, Mindset BCI AS3 API
@version  1.0.2
@author   Sean Moore (seantheflexguy)
*/
 
package com.seantheflexguy.neurosky.mindsetas3api.event
{
	import com.seantheflexguy.neurosky.mindsetas3api.data.SignalQuality;
	
	import flash.events.Event;

	public final class SignalQualityEvent extends Event
	{
		
		private var _signalQuality : SignalQuality;
		/**
		 * 
		 * Signal quality data object updated with data captured by the Mindset BCI.
		 * 
		 */
		public function get signalQuality() : SignalQuality
		{
			return _signalQuality; 
		}
		public function set signalQuality( value : SignalQuality ) : void
		{
			this._signalQuality = value;
		}
		
		/**
		 * 
		 * Fully qualified event type.
		 * 
		 */
		public static const SIGNAL_QUALITY_EVENT : String = "com.seantheflexguy.neurosky.mindsetas3api.event.SignalQualityEvent";
		
		/**
		 * 
		 * Dispatched when signal quality data is captured by the Mindset BCI.
		 * 
		 */
		public function SignalQualityEvent( data : SignalQuality, type : String = SIGNAL_QUALITY_EVENT, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super( type, bubbles, cancelable );
			this.signalQuality = data;
		}
		
		/**
		 * 
		 * Returns a cloned copy of the event object by setting the type property and 
		 * any new properties in the clone.
		 * 
		 */
		override public function clone() : Event
		{
			return new SignalQualityEvent( signalQuality );
		}
		
	}
}