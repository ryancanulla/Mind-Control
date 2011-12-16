package com.ryancanulla.mindfreak.view
{
    import flash.display.Shape;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;

    public class GameInfoBubble extends ViewBase
    {
        private var background:Shape;
        private var displayText:TextField;

        public function GameInfoBubble()
        {
            super();
            createChildren();
            updateLayout();
            updateProperties();
        }

        private function createChildren():void {
            background = new Shape();
            background.graphics.beginFill(0xCCCCCC, .7);
            background.graphics.drawRoundRect(0, 0, 275, 100, 10, 10);
            background.graphics.lineStyle(5, 0x000000, .7);
            background.graphics.endFill();
            addChild(background);

            var style:TextFormat = new TextFormat();
            style.size = 15;
            style.font = "Arial";
            style.leading = 7;
            style.bold = false;

            displayText = new TextField();
            displayText.defaultTextFormat = style;
            displayText.width = background.width * .9;
            displayText.height = background.height * .9;
            displayText.wordWrap = true
            displayText.multiline = true;
            addChild(displayText);
        }

        private function updateLayout():void {
            displayText.x = background.width * .04;
            displayText.y = background.height * .15;
        }

        private function updateProperties():void {
            displayText.text = "The first test of a master mind freak is controlling the light with your mind."
        }

        override protected function sizeUpdated():void {
            updateLayout();
        }
    }
}
