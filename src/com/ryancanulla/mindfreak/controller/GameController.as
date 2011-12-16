package com.ryancanulla.mindfreak.controller
{
    import com.ryancanulla.mindfreak.model.GameModel;
    import com.ryancanulla.mindfreak.view.IView;
    import com.ryancanulla.mindfreak.view.MindControlGame;
    import com.ryancanulla.mindfreak.view.ViewBase;
    import com.seantheflexguy.neurosky.mindsetas3api.event.EEGPowersEvent;
    import com.seantheflexguy.neurosky.mindsetas3api.event.ESenseDataEvent;
    import com.seantheflexguy.neurosky.mindsetas3api.event.SignalQualityEvent;
    import com.seantheflexguy.neurosky.mindsetas3api.reader.MindsetByteReader;
    import com.seantheflexguy.neurosky.mindsetas3api.socket.MindsetSocket;

    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.utils.Timer;

    import org.osmf.events.TimeEvent;

    public class GameController {

        private var _view:IView;
        private var _model:GameModel;
        private var gameLoop:GameLoop;
        private var mindsetByteReader:MindsetByteReader;
        private var mindsetSocket:MindsetSocket;

        public function GameController() {
            init();
        }

        private function init() : void  {
            _model = GameModel.getInstance();
            addListeners();
            connectMindset();
        }

        private function createGameLoop():void {
            gameLoop = new GameLoop();
            gameLoop.view = _view;
            gameLoop.start();
        }

        private function addListeners():void {
            _model.addEventListener(Event.CHANGE, updateProperties);
        }

        private function connectMindset():void {
            mindsetByteReader = new MindsetByteReader();
            mindsetByteReader.addEventListener( SignalQualityEvent.SIGNAL_QUALITY_EVENT, signalQualityUpdate );
            mindsetByteReader.addEventListener( ESenseDataEvent.E_SENSE_DATA_EVENT, eSenseDataUpdate );
            mindsetByteReader.addEventListener( EEGPowersEvent.EEG_POWERS_EVENT, eegPowersUpdate );

            mindsetSocket = new MindsetSocket();
            mindsetSocket.reader = mindsetByteReader;
            mindsetSocket.start();
        }

        private function updateProperties(e:Event):void {
            _view.concentration = _model.attention;
            _view.signal = _model.signal;
        }

        private function signalQualityUpdate( event : SignalQualityEvent ) : void {
            trace( ">>signalQualityUpdate: " + event.signalQuality.toString() );
            _model.signal = event.signalQuality.quality as Number;
        }

        private function eSenseDataUpdate( event : ESenseDataEvent ) : void {
            _model.attention = event.eSenseData.attention;

            trace(">>meditationUpdate: " + event.eSenseData.meditation.toString());
        }

        private function eegPowersUpdate( event : EEGPowersEvent ) : void {
            trace( ">>alphaUpdate: " + event.eegPowers.alpha );
            trace( ">>betaUpdate: " + event.eegPowers.beta );
            trace( ">>deltaUpdate: " + event.eegPowers.delta );
            trace( ">>gammaUpdate: " + event.eegPowers.gamma );
            trace( ">>thetaUpdate: " + event.eegPowers.theta );
        }

        public function set view(e:IView):void {
            _view = e;
            createGameLoop();
        }
    }
}
