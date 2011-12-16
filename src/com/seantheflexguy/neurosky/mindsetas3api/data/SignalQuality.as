/*
Copyright (c) 2011, Sean Moore (seantheflexguy). All Rights Reserved.
@project  Neurosky, Mindset BCI AS3 API
@version  1.0.2
@author   Sean Moore (seantheflexguy)
*/

package com.seantheflexguy.neurosky.mindsetas3api.data 
{

    /**
     *
     * Data object that encapsulates the signal quality data being captured 
     * from the Mindset BCI.
     *  
     */
    public final class SignalQuality
    {
    	/**
		 * 
		 * Current signal quality level being captured by the Mindset BCI.
		 * 
		 */
        public var quality : uint;

		/**
		 * 
		 * String representation of all current signal quality data.
		 * 
		 */
        public function toString() : String
        {
            return "quality: " + quality;
        }
    }
}