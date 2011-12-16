/*
Copyright (c) 2011, Sean Moore (seantheflexguy). All Rights Reserved.
@project  Neurosky, Mindset BCI AS3 API
@version  1.0.2
@author   Sean Moore (seantheflexguy)
*/

package com.seantheflexguy.neurosky.mindsetas3api.data
{
    
    import flash.utils.ByteArray;

    /**
     *
     * Data object that encapsulates EEG Power data being captured from the Mindset BCI.
     *  
     */
    public final class EEGPowers 
    {
		
		/**
		 * 
		 * Current delta EEG Power unit captured from the Mindset BCI.
		 * 
		 */
        public var delta : Number;
		
		/**
		 * 
		 * Current theta EEG Power unit captured from the Mindset BCI.
		 * 
		 */
        public var theta : Number;
		
		/**
		 * 
		 * Current beta EEG Power unit captured from the Mindset BCI.
		 * 
		 */
        public var beta : EEGPower = new EEGPower();

		/**
		 * 
		 * Current alpha EEG Power unit captured from the Mindset BCI.
		 * 
		 */
        public var alpha : EEGPower = new EEGPower();

		/**
		 * 
		 * Current gamma EEG Power unit captured from the Mindset BCI.
		 * 
		 */
        public var gamma : EEGPower = new EEGPower();

		/**
		 * 
		 * Reads EEG Power data from the buffer and updates internal properties.
		 * 
		 * @param buffer current buffer being used to process Mindset BCI data through
		 * the MindsetSocket instance.
		 * 
		 * @see com.kannopy.thinkgear.api.socket.MindsetSocket
		 * 
		 */
        public function parseEEGPowers( buffer : ByteArray ) : void 
        {
            delta = buffer.readFloat();
            theta = buffer.readFloat();
            beta.low = buffer.readFloat();
            beta.high = buffer.readFloat();
            alpha.low = buffer.readFloat();
            alpha.high = buffer.readFloat();
            gamma.low = buffer.readFloat();
            gamma.high = buffer.readFloat();
        }

		/**
		 * 
		 * String representation of all current EEG Power data.
		 * 
		 */
        public function toString() : String 
        {
            return "delta: " + delta + ", " + 
            		"theta: " + theta + ", " + 
            		"beta.low: " + beta.low + ", " 
            		+ "beta.high: " + beta.high + ", " + 
            		"alpha.low: " + alpha.low + ", " + 
            		"alpha.high: " + alpha.high + ", " 
            		+ "gamma.low: " + gamma.low + ", " 
            		+ "gamma.high: " + gamma.high;
        }

    }
}