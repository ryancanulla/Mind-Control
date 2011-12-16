package com.ryancanulla.mindfreak.view
{
    import com.ryancanulla.mindfreak.assets.GameAssets;
    import com.ryancanulla.mindfreak.view.connection.Connection;

    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;

    public class MindControlGame extends ViewBase implements IView
    {
        private var assets:GameAssets;
        private var background:Bitmap;
        private var mindFreakGlow:Bitmap;
        private var mindFreak:Bitmap;
        private var mindText:TextField;
        private var mindTextValue:TextField;
        private var gameInfoBubble:GameInfoBubble;
        private var lightBulb:LightBulb;
        private var connection:Connection;

        private var _concentration:Number;
        private var _lightStrength:Number;

        public function MindControlGame() {
            super();
            assets = new GameAssets();
            _concentration = 0;
            _lightStrength = 0;

            createChildren();
            updateLayout();
        }

        protected function createChildren():void {
            background = new Bitmap(assets.background.bitmapData);
            background.smoothing = true;
            addChild(background);

            mindFreakGlow = new Bitmap(assets.mindFreakGlow.bitmapData);
            mindFreakGlow.smoothing = true;
            addChild(mindFreakGlow);

            mindFreak = new Bitmap(assets.mindFreak.bitmapData);
            mindFreak.smoothing = true;
            addChild(mindFreak);

            var style:TextFormat = new TextFormat();
            style.size = 35;
            style.font = "Alexon";
            style.color = 0xFF6633;

            var style2:TextFormat = new TextFormat();
            style2.size = 35;
            style2.bold = true
            style2.font = "Alexon";
            style2.color = 0xffffff;

            mindText = new TextField();
            mindText.defaultTextFormat = style;
            mindText.autoSize = TextFieldAutoSize.LEFT;
            mindText.text = "Mind Freak:";
            addChild(mindText);

            mindTextValue = new TextField();
            mindTextValue.defaultTextFormat = style2;
            mindTextValue.autoSize = TextFieldAutoSize.LEFT;
            addChild(mindTextValue);

            gameInfoBubble = new GameInfoBubble();
            gameInfoBubble.setSize(200, 100);
            addChild(gameInfoBubble);

            lightBulb = new LightBulb();
            addChild(lightBulb);

            connection = new Connection();
            addChild(connection);
        }

        protected function updateLayout():void {

            mindFreakGlow.x = this.width / 2 - mindFreakGlow.width / 2;
            mindFreakGlow.y = this.height - (mindFreakGlow.height * .90);

            mindFreak.x = this.width / 2 - mindFreak.width / 2;
            mindFreak.y = this.height - mindFreak.height;

            lightBulb.y = mindFreak.y + mindFreak.height / 2 + 20;
            lightBulb.x = mindFreak.x + mindFreak.width / 2 - 30;

            mindText.x = 25;
            mindText.y = 25;

            mindTextValue.x = mindText.x + mindText.width + 10;
            mindTextValue.y = 25;

            gameInfoBubble.x = mindText.x - 10;
            gameInfoBubble.y = mindText.y + mindText.height;

            connection.x = width * .90;
            connection.y = height * .05;
        }

        protected function updateProperties():void {
            mindTextValue.text = _concentration + "%";
            lightBulb.light = _concentration;
        }

        override protected function sizeUpdated():void {
            updateLayout();
        }

        public function set concentration(e:Number):void {
            _concentration = e;
            updateProperties();
        }

        public function set signal(e:Number):void {
            connection.signal = e;
        }

        public function render():void {
            lightBulb.render();

            if (mindFreakGlow.alpha * 100 < _concentration) {
                mindFreakGlow.alpha += .01;
            }
            else if (mindFreakGlow.alpha * 100 > _concentration) {
                mindFreakGlow.alpha -= .01;
            }
        }
    }
}
