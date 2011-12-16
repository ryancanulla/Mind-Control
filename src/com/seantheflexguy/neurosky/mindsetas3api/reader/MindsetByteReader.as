/*
Copyright (c) 2011, Sean Moore (seantheflexguy). All Rights Reserved.
@project  Neurosky, Mindset BCI AS3 API
@version  1.0.2
@author   Sean Moore (seantheflexguy)
*/

package com.seantheflexguy.neurosky.mindsetas3api.reader
{
	import com.seantheflexguy.neurosky.mindsetas3api.byte.ByteTypeChecker;
	import com.seantheflexguy.neurosky.mindsetas3api.byte.MindsetByteTypes;
	import com.seantheflexguy.neurosky.mindsetas3api.data.EEGPowers;
	import com.seantheflexguy.neurosky.mindsetas3api.data.ESenseData;
	import com.seantheflexguy.neurosky.mindsetas3api.data.SignalQuality;
	import com.seantheflexguy.neurosky.mindsetas3api.event.EEGPowersEvent;
	import com.seantheflexguy.neurosky.mindsetas3api.event.ESenseDataEvent;
	import com.seantheflexguy.neurosky.mindsetas3api.event.SignalQualityEvent;
	
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	/**
	 * 
	 * Dispatched to inform client that signal quality data has been captured from the Mindset BCI.
	 * 
	 */
	[Event(name="signalQualityEvent", type="com.seantheflexguy.neurosky.mindsetas3api.event.SignalQualityEvent")]
	
	/**
	 * 
	 * Dispatched to inform client that attention and meditation data has been captured from the Mindset BCI.
	 * 
	 */
	[Event(name="eSenseDataEvent", type="com.seantheflexguy.neurosky.mindsetas3api.event.ESenseDataEvent")]
	
	/**
	 * 
	 * Dispatched to inform client that EEG Power data has been captured from the Mindset BCI.
	 * 
	 */
	[Event(name="eegPowersEvent", type="com.seantheflexguy.neurosky.mindsetas3api.event.EEGPowersEvent")]
	
	/**
	 * 
	 * Reads byte data from the Mindset Connector buffer. Dispatches events as data
	 * is received. Exposes properties available through the Mindset Connector API.
	 * Contains an instance of an ActionScript 3.0 ByteArray object.
	 * 
	 * @see flash.utils.ByteArray
	 * 
	 */
	public final class MindsetByteReader extends EventDispatcher
	{
		
		/**
		 * 
		 * Call initialize to configiure the reader.
		 * 
		 */
		public function MindsetByteReader()
		{
			initialize();
		}
		
		private var _buffer : ByteArray;
		/**
		 * 
		 * Internal buffer used to read byte data from the Mindset Connector.
		 * 
		 * @see flash.utils.ByteArray
		 * 
		 */
		public function get buffer() : ByteArray
        {
        	return _buffer;
        }
		public function set buffer( value : ByteArray ) : void
		{
			_buffer = value;
		}
		
		private var _signalQuality : SignalQuality;
		/**
		 * 
		 * The strength of the connection from the Mindset BCI hardware device to
		 * the computer running the Mindset Connector.
		 * 
		 */
        public function get signalQuality() : SignalQuality
        {
        	return _signalQuality;
        }
		public function set signalQuality( value : SignalQuality ) : void
		{
			_signalQuality = value;
		}
        
        private var _eSenseData : ESenseData;
        /**
         * 
         * Object containing the attention and meditation data being transmitted by the
         * Mindset BCI. 
         *  
         */
        public function get eSenseData() : ESenseData
        {
        	return _eSenseData;
        }
		public function set eSenseData( value : ESenseData ) : void
		{
			_eSenseData = value;
		}
        
        private var _eegPowers : EEGPowers;
        /**
         *
         * Object containing the EEG Powers data being transmitted by the
         * Mindset BCI.
         *  
         */
        public function get eegPowers() : EEGPowers
        {
        	return _eegPowers;
        }
		public function set eegPowers( value : EEGPowers ) : void
		{
			_eegPowers = value;
		}
		
		/**
		 * 
		 * Processes the buffer containing data being transmitted by the Mindset BCI.
		 * 
		 */
		public function read() : void
        {        	
        	while ( twoBytesSeen() )
            {
                continue;
            }

            while ( isNotEndOfBuffer() ) 
            {
                processByte();
            }
            
            dispatchEvents();
            initialize();
        }
        
        /**
         *
         * Notify any registered objects that updated data has been 
         * captured from the Mindset BCI. 
         *  
         */
        private function dispatchEvents() : void
        {
            dispatchEvent( new SignalQualityEvent( signalQuality ) ); 
            dispatchEvent( new ESenseDataEvent( eSenseData ) ); 
            dispatchEvent( new EEGPowersEvent( eegPowers ) ); 
        }
        
        /**
         *
         * Create the internal ByteArray used as the data buffer. Set the buffer's properties.
         * Initialize data objects that will be populated from the BCI buffer data.
         *  
         */
		private function initialize() : void
        {
        	buffer = new ByteArray();
        	buffer.position = 1;
        	buffer.endian = Endian.BIG_ENDIAN;
        	
        	signalQuality = new SignalQuality();
        	eegPowers = new EEGPowers();
        	eSenseData = new ESenseData();
        }
        
        /**
         *
         * Checks to see if two consecutive SYNC (0xAA) bytes have been read.
         *  
         */
        private function twoBytesSeen() : Boolean
        {
        	return ( isNotEndOfBuffer() && currentByteIsNotSyncByte() && lastByteIsNotSyncByte() ); 
        }   
        
        /**
         *
         * Checks the current position in the buffer to ensure the end of it hasn't been reached.
         *  
         */
        private function isNotEndOfBuffer() : Boolean
        {
        	return buffer.position < buffer.length;
        }
        
        /**
         *
         * Checks the current byte being read to see if it's a SYNC (0xAA) byte.
         *  
         */
        private function currentByteIsNotSyncByte() : Boolean
        {
        	var currentByte : uint = buffer.readUnsignedByte();
        	return byteIsNotSyncByte( currentByte );
        }
        
        /**
         *
         * Checks the previously processed byte to see if it's a SYNC (0xAA) byte.
         *  
         */
        private function lastByteIsNotSyncByte() : Boolean
        {
        	var bufferPosition : int = buffer.position;
        	var lastByte : uint = this[ bufferPosition - 1 ];
        	return byteIsNotSyncByte( lastByte );
        }
        
        /**
         * 
         * Checks a byte to see if it's are SYNC (0xAA) byte.
         * 
         */
        private function byteIsNotSyncByte( byte : uint ) : Boolean
        {
        	return byte != MindsetByteTypes.SYNC_BYTE;
        }
        
        /**
         *
         * Processes a byte to determine type. Processes next byte to update 
         * appropriate object with byte data.
         *  
         */
        private function processByte() : void
        {
        	var codeByte : uint = buffer.readUnsignedByte();
        	var dataByte : uint = buffer.readUnsignedByte();

            if ( ByteTypeChecker.isSignalQualityByte( codeByte ) )
            {
            	signalQuality.quality = dataByte;
            }
            else if ( ByteTypeChecker.isAttentionByte( codeByte ) )
            {
            	eSenseData.attention = dataByte;
            }
            else if ( ByteTypeChecker.isMeditationByte( codeByte ) )
            {
            	eSenseData.meditation = dataByte;
            }
            else if ( ByteTypeChecker.isEEGPowersByte( codeByte ) )
            {
            	// EEG powers - read the length, and eight floats (8 * 4 bytes)
            	var lengthByte:Number = dataByte;
				eegPowers.parseEEGPowers( buffer );
            }
        }
	}
}