package com.ryancanulla.mindfreak.assets
{
    import flash.display.Bitmap;

    public class GameAssets
    {
        [Embed(source = "assets/background.png")]
        private var BackgroundClass:Class;
        public var background:Bitmap = new BackgroundClass();

        [Embed(source = "assets/mindfreak.png")]
        private var MindFreakClass:Class;
        public var mindFreak:Bitmap = new MindFreakClass();

        [Embed(source = "assets/mindfreak-glow.png")]
        private var MindFreakGlowClass:Class;
        public var mindFreakGlow:Bitmap = new MindFreakGlowClass();

        //[Embed(source="/../assets/Alexon.swf", fontFamily="Alexon")]
        private var AlexonClass:Class;

        //public var mindFreak:Bitmap = new MindFreakClass();

        public function GameAssets() {
        }
    }
}
