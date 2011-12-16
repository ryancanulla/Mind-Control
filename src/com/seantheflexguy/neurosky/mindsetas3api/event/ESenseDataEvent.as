/*
Copyright (c) 2011, Sean Moore (seantheflexguy). All Rights Reserved.
@project  Neurosky, Mindset BCI AS3 API
@version  1.0.2
@author   Sean Moore (seantheflexguy)
*/
 
package com.seantheflexguy.neurosky.mindsetas3api.event
{
	import com.seantheflexguy.neurosky.mindsetas3api.data.ESenseData;
	
	import flash.events.Event;

	public final class ESenseDataEvent extends Event
	{
		
		private var _eSenseData : ESenseData;
		/**
		 * 
		 * eSense data object updated with data captured by the Mindset BCI.
		 * 
		 */
		public function get eSenseData() : ESenseData
		{
			return _eSenseData;
		}
		public function set eSenseData( value : ESenseData ) : void
		{
			this._eSenseData = value;
		}
		
		/**
		 * 
		 * Fully qualified event type.
		 * 
		 */
		public static const E_SENSE_DATA_EVENT : String = "com.seantheflexguy.neurosky.mindsetas3api.event.ESenseDataEvent";
		
		/**
		 * 
		 * Dispatched when eSense data is captured by the Mindset BCI.
		 * 
		 */
		public function ESenseDataEvent( data : ESenseData, type : String = E_SENSE_DATA_EVENT, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super( type, bubbles, cancelable );
			this.eSenseData = data;
		}
		
		/**
		 * 
		 * Returns a cloned copy of the event object by setting the type property and 
		 * any new properties in the clone.
		 * 
		 */
		override public function clone() : Event
		{
			return new ESenseDataEvent( eSenseData );
		}
		
	}
}