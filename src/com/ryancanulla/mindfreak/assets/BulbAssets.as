package com.ryancanulla.mindfreak.assets
{
    import flash.display.Bitmap;

    public class BulbAssets
    {
        [Embed(source = "assets/bulb/shadow.png")]
        private var ShadowClass:Class;
        public var shadow:Bitmap = new ShadowClass();

        [Embed(source = "assets/bulb/male-screw.png")]
        private var MaleScrewClass:Class;
        public var maleScrew:Bitmap = new MaleScrewClass();

        [Embed(source = "assets/bulb/bulb-off.png")]
        private var BulbOffClass:Class;
        public var bulbOFF:Bitmap = new BulbOffClass();

        [Embed(source = "assets/bulb/bulb-on.png")]
        private var BulbOnClass:Class;
        public var bulbON:Bitmap = new BulbOnClass();

        public function BulbAssets() {
        }
    }
}
