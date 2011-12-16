/*
Copyright (c) 2011, Sean Moore (seantheflexguy). All Rights Reserved.
@project  Neurosky, Mindset BCI AS3 API
@version  1.0.2
@author   Sean Moore (seantheflexguy)
*/

package com.seantheflexguy.neurosky.mindsetas3api.byte
{
	/**
	 * 
	 * Utility class used to determine the type of byte being processed and read
	 * from the Mindset Connector.
	 * 
	 */
	public final class ByteTypeChecker
	{
		/**
		 * 
		 * Returns true if the byte contains a Signal Quality data.
		 * 
		 */
		public static function isSignalQualityByte( byte : uint ) : Boolean
        {
        	return byte == MindsetByteTypes.SIGNAL_QUALITY;
        }
        
        /**
		 * 
		 * Returns true if the byte contains a attention data.
		 * 
		 */
        public static function isAttentionByte( byte : uint ) : Boolean
        {
        	return byte == MindsetByteTypes.ATTENTION;
        }
        
        /**
		 * 
		 * Returns true if the byte contains a meditation data.
		 * 
		 */
        public static function isMeditationByte( byte : uint ) : Boolean
        {
        	return byte == MindsetByteTypes.MEDITATION;
        }
        
        /**
		 * 
		 * Returns true if the byte contains a EEG Powers data.
		 * 
		 */
        public static function isEEGPowersByte( byte : uint ) : Boolean
        {
        	return byte == MindsetByteTypes.EEG_POWERS;
        }
	}
}