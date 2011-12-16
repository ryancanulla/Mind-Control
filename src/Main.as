package
{
	import com.ryancanulla.mindfreak.controller.GameController;
	import com.ryancanulla.mindfreak.view.MindControlGame;
	import com.seantheflexguy.neurosky.mindsetas3api.event.EEGPowersEvent;
	import com.seantheflexguy.neurosky.mindsetas3api.event.ESenseDataEvent;
	import com.seantheflexguy.neurosky.mindsetas3api.event.SignalQualityEvent;
	import com.seantheflexguy.neurosky.mindsetas3api.reader.MindsetByteReader;
	import com.seantheflexguy.neurosky.mindsetas3api.socket.MindsetSocket;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	[SWF(width="1024", height="768", backgroundColor="000000")]
	public class Main extends Sprite
	{
		private var mainView:MindControlGame;
		private var controller:GameController;
		
		public function Main() {
			init();
		}
		
		private function init() : void  {
			mainView = new MindControlGame();
			mainView.setSize(stage.stageWidth, stage.stageHeight);
			addChild(mainView);
			
			controller = new GameController();
			controller.view = mainView;
		}
	}
}