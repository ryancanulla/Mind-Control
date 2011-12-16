/*
Copyright (c) 2011, Sean Moore (seantheflexguy). All Rights Reserved.
@project  Neurosky, Mindset BCI AS3 API
@version  1.0.2
@author   Sean Moore (seantheflexguy)
*/
 
package com.seantheflexguy.neurosky.mindsetas3api.event
{
	import com.seantheflexguy.neurosky.mindsetas3api.data.EEGPowers;
	
	import flash.events.Event;
	
	/**
	 * 
	 */
	public final class EEGPowersEvent extends Event
	{
		
		private var _eegPowers : EEGPowers;
		/**
		 * 
		 * EEG Powers data object updated with data captured by the Mindset BCI.
		 * 
		 */
		public function get eegPowers() : EEGPowers
		{
			return _eegPowers;
		}
		public function set eegPowers( value : EEGPowers ) : void
		{
			this._eegPowers = value;
		}
		
		/**
		 * 
		 * Fully qualified event type.
		 * 
		 */
		public static const EEG_POWERS_EVENT : String = "com.seantheflexguy.neurosky.mindsetas3api.event.EEGPowersEvent";
		
		/**
		 * 
		 * Dispatched when EEG Power data is captured by the Mindset BCI.
		 * 
		 */
		public function EEGPowersEvent( data : EEGPowers, type : String = EEG_POWERS_EVENT, bubbles : Boolean = false, cancelable : Boolean = false )
		{
			super( type, bubbles, cancelable );
			this.eegPowers = data;
		}
		
		/**
		 * 
		 * Returns a cloned copy of the event object by setting the type property and 
		 * any new properties in the clone.
		 * 
		 */
		override public function clone() : Event
		{
			return new EEGPowersEvent( eegPowers );
		}
		
	}
}