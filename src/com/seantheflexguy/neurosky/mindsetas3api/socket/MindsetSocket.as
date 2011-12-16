/*
Copyright (c) 2011, Sean Moore (seantheflexguy). All Rights Reserved.
@project  Neurosky, Mindset BCI AS3 API
@version  1.0.2
@author   Sean Moore (seantheflexguy)
*/

package com.seantheflexguy.neurosky.mindsetas3api.socket
{
	import com.seantheflexguy.neurosky.mindsetas3api.reader.MindsetByteReader;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;

	/**
	 * 
	 * Communicates with the Mindset Connector. Reads byte data into the reader buffer.
	 * Manages socket listeners.
	 * 
	 * <example>
	 * Example:
	 * <listing version="3.0"> 
	 * var thinkGearReader : MindsetReader = new MindsetReader();
	 * var thinkGearSocket : MindsetSocket = new MindsetSocket();
	 * thinkGearSocket.reader = thinkGearReader;
	 * thinkGearSocket.start();
	 * </listing>
	 * </example>
	 * 
	 * @see com.kannopy.thinkgear.api.reader.MindsetReader
	 * @see flash.net.Socket
	 * 
	 */
	public final class MindsetSocket extends Socket
	{
		
		/**
		 * 
		 * The address used to communicate with the Mindset Connector.
		 * 
		 */	
		private const IP_ADDRESS : String = "127.0.0.1";
		
		/**
		 * 
		 * The port used to communicate with the Mindset Connector.
		 * 
		 */
		private const THINK_GEAR_SOCKET_PORT : int = 13854;
		
		private var _reader : MindsetByteReader;
		/**
		 * 
		 * Buffer instance used by the socket to read byte data from the Mindset Connector.
		 * 
		 */
		public function set reader( reader : MindsetByteReader ) : void
		{
			this._reader = reader;
		}
		
		/**
		 * 
		 * Establishes communication with the Mindset Connector. Sets up socket
		 * listeners to monitor socket activity.
		 * 
		 */
		public function start() : void
		{
			createSocketListeners();
			this.connect( IP_ADDRESS, THINK_GEAR_SOCKET_PORT );
		}
		
		/**
		 * 
		 * Breaks communication with the Mindset Connector. Destroys socket listeners.
		 * 
		 */
		public function stop() : void
		{
			removeSocketListeners();
		}
		
		/**
		 * 
		 * Create socket listeners to monitor socket activity.
		 * 
		 */
		private function createSocketListeners() : void
		{
            this.addEventListener( ProgressEvent.SOCKET_DATA, handleSocketData );
            this.addEventListener( IOErrorEvent.IO_ERROR, handleSocketError );
            this.addEventListener( SecurityErrorEvent.SECURITY_ERROR, handleSecurityError );
            this.addEventListener( Event.CONNECT, handleSocketConnection );
            this.addEventListener( Event.CLOSE, handleSocketClose );
            this.addEventListener( Event.ACTIVATE, handleSocketActivate );
            this.addEventListener( Event.DEACTIVATE, handleSocketDeactivate );
		}
		
		/**
		 * 
		 * Destroy socket listeners.
		 * 
		 */
		private function removeSocketListeners() : void
		{
            this.removeEventListener( ProgressEvent.SOCKET_DATA, handleSocketData );
            this.removeEventListener( IOErrorEvent.IO_ERROR, handleSocketError );
            this.removeEventListener( SecurityErrorEvent.SECURITY_ERROR, handleSecurityError );
            this.removeEventListener( Event.CONNECT, handleSocketConnection );
            this.removeEventListener( Event.CLOSE, handleSocketClose );
            this.removeEventListener( Event.ACTIVATE, handleSocketActivate );
            this.removeEventListener( Event.DEACTIVATE, handleSocketDeactivate );
		}
		
		/**
		 * 
		 * Handles incoming data events generated by the Mindset Connector.
		 * 
		 * @see flash.events.ProgressEvent
		 * 
		 */
		private function handleSocketData( event : ProgressEvent ) : void
        {
            read();
            clearOutputBuffer();        
        }
        
        /**
         * 
         * Reads byte data using the socket and buffer.
         * 
         */
        private function read() : void
        {
        	readSocketBytes();
            readBuffer();
        }
		
		/**
         * 
         * Reads socket data being generated by the Mindset Connector.
         * 
         */
		private function readSocketBytes() : void
		{
			var dataReadStartPoint : int = 0;
            var bytesAvailableToRead : int = this.bytesAvailable;
            this.readBytes( _reader.buffer, dataReadStartPoint, bytesAvailableToRead );
		}
        
        /**
         * 
         * Call the read method on the reader to process incoming byte data 
         * from the Mindset Connector.
         * 
         */
        private function readBuffer() : void 
        {
            _reader.read();
        }
		
		/**
		 * 
		 * Flushes any accumulated data in the socket's output buffer.
		 * 
		 */     
        private function clearOutputBuffer() : void
        {
        	this.flush();
        }
        
        /**
         * 
         * Dispatched when an input/output error occurs that causes a send or load operation to fail.
         * 
         * @see flash.events.IOErrorEvent
         *  
         */
        private function handleSocketError( event : IOErrorEvent ) : void 
        {
            trace( "handleSocketError::[" + event.type + "]: " + event.text );
        }
        
        /**
         *
         * Dispatched if a call to Socket.connect() attempts to connect either to a server outside 
         * the caller's security sandbox or to a port lower than 1024.
         * 
         * @see flash.events.SecurityErrorEvent
         *  
         */
        private function handleSecurityError( event : SecurityErrorEvent ) : void 
        {
            trace( "handleSecurityError::[" + event.type + "]: " + event.text );
        }
        
        /**
         * 
         * Dispatched when a network connection has been established.
         * 
         */
        private function handleSocketConnection( event : Event ) : void 
        {
            trace( "handleSocketConnection::[" + event.type + "]" );
        }
        
        /**
         *
         * Dispatched when the server closes the socket connection.
         *  
         */
        private function handleSocketClose( event : Event ) : void 
        {
            trace( "handleSocketClose::[" + event.type + "]" );
        }
        
        /**
         * 
         * Dispatched when Flash Player or an AIR application gains operating system 
         * focus and becomes active.
         * 
         */
        private function handleSocketActivate( event : Event ) : void 
        {
            trace( "handleSocketActivate::[" + event.type + "]" );
        }
        
        /**
         *
         * Dispatched when Flash Player or an AIR application loses operating system 
         * focus and is becoming inactive.
         *  
         */
        private function handleSocketDeactivate( event : Event ) : void 
        {
            trace( "handleSocketDeactivate::[" + event.type + "]" );
        }
		
	}
}