/*
Copyright (c) 2011, Sean Moore (seantheflexguy). All Rights Reserved.
@project  Neurosky, Mindset BCI AS3 API
@version  1.0.2
@author   Sean Moore (seantheflexguy)
*/

package com.seantheflexguy.neurosky.mindsetas3api.byte
{
	public final class MindsetByteTypes
	{
		/**
		 * 
		 * Signal quality data signature.
		 * 
		 */
		public static  const SIGNAL_QUALITY : int = 0x02;
		
		/**
		 * 
		 * Attention data signature.
		 * 
		 */
		public static  const ATTENTION : int = 0x04;
		
		/**
		 * 
		 * Meditation data signature.
		 * 
		 */
		public static  const MEDITATION : int = 0x05;
		
		/**
		 * 
		 * EEG Powers data signature.
		 * 
		 */
		public static  const EEG_POWERS : int = 0x81;

		/**
		 * 
		 * SYNC byte data signature.
		 * 
		 */
		public static  const SYNC_BYTE : int = 0xAA;

	}
}