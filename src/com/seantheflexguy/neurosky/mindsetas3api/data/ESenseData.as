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
     * Data object that encapsulates eSense data being captured from the Mindset BCI.
     *  
     */
    public final class ESenseData
    {
		/**
		 * 
		 * Current attention level being captured by the Mindset BCI.
		 * 
		 */
        public var attention : int;
		
		/**
		 * 
		 * Current meditation level being captured by the Mindset BCI.
		 * 
		 */
        public var meditation : int;

		/**
		 * 
		 * String representation of all current eSense data.
		 * 
		 */
        public function toString() : String
        {
            return "attention: " + attention + ", " + "meditation: " + meditation;
        }
    }
}