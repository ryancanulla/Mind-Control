package com.ryancanulla.mindfreak.view.connection
{
	import com.ryancanulla.mindfreak.view.ViewBase;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	
	public class Connection extends ViewBase
	{
		private var low:Shape;
		private var med:Shape
		private var high:Shape;
		private var max:Shape;
		private var color:uint;
		private var _signal:uint;
		
		public function Connection()
		{
			super();
			createChildren();
			updateLayout();
			updateProperties();
			setLow();
			color = 0xFF6633;
		}
		
		protected function createChildren():void {
			low = new Shape();
			low.graphics.beginFill(0xFF6633);
			low.graphics.drawRect(0,45,10,15);
			low.graphics.endFill();
			addChild(low);
			
			med = new Shape();
			med.graphics.beginFill(0xFF6633);
			med.graphics.drawRect(15,30,10,30);
			med.graphics.endFill();
			addChild(med);
			
			high = new Shape();
			high.graphics.beginFill(0xFF6633);
			high.graphics.drawRect(30,15,10,45);
			high.graphics.endFill();
			addChild(high);
			
			max = new Shape();
			max.graphics.beginFill(0xFF6633);
			max.graphics.drawRect(45,0,10,60);
			max.graphics.endFill();
			addChild(max);
		}
		
		protected function updateProperties():void {
			
		}
		
		protected function updateLayout():void {			
			if(_signal == 0)
				setMax();
			else if (_signal == 200)
				setLow();
			else if (_signal > 49)
				setMed();
			else if (_signal > 24)
				setHigh();
		}
		
		private function setLow():void {
			low.visible = true;
			med.visible = false;
			high.visible = false;
			max.visible = false;
		}
		
		private function setMed():void {
			setLow();
			med.visible = true;
		}
		
		private function setHigh():void {
			setMed();
			high.visible = true;
		}
		
		private function setMax():void {
			setHigh();
			max.visible = true;
		}
		
		public function set signal(e:uint):void {
			_signal = e;
			updateLayout();
		}
	}
}