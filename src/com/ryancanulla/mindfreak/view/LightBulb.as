package com.ryancanulla.mindfreak.view
{
    import com.ryancanulla.mindfreak.assets.BulbAssets;

    import flash.display.Bitmap;
    import flash.events.Event;

    public class LightBulb extends ViewBase
    {
        private var bulbAssets:BulbAssets;
        private var bulbON:Bitmap;
        private var bulbOFF:Bitmap;
        private var maleScrew:Bitmap;
        private var shadow:Bitmap;

        private var _light:Number;

        public function LightBulb() {
            super();

            bulbAssets = new BulbAssets;
            _light = 1;

            createChildren();
            updateLayout();
            updateProperties();
        }

        private function createChildren():void {
            shadow = new Bitmap(bulbAssets.shadow.bitmapData);
            shadow.smoothing = true;
            addChild(shadow);

            maleScrew = new Bitmap(bulbAssets.maleScrew.bitmapData);
            maleScrew.smoothing = true;
            addChild(maleScrew);

            bulbOFF = new Bitmap(bulbAssets.bulbOFF.bitmapData);
            bulbOFF.smoothing = true;
            addChild(bulbOFF);

            bulbON = new Bitmap(bulbAssets.bulbON.bitmapData);
            bulbON.smoothing = true;
            bulbON.alpha = .1;
            addChild(bulbON);
        }

        private function updateLayout():void {
            maleScrew.y = bulbOFF.height - 10;
            maleScrew.x = bulbOFF.width / 2 - maleScrew.width / 2;

            shadow.y = maleScrew.y + maleScrew.height + 2;
            shadow.x = -10;
        }

        private function updateProperties():void {
            bulbON.alpha = _light;
        }

        override protected function sizeUpdated():void {
            updateLayout();
        }

        public function render():void {
            if (bulbON.alpha * 100 < _light) {
                bulbON.alpha += .01;
            }
            else if (bulbON.alpha * 100 > _light) {
                bulbON.alpha -= .01;
            }
        }

        public function set light(e:Number):void {
            _light = e;
        }
    }
}
