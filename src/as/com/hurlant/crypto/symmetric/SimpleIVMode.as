package com.hurlant.crypto.symmetric {
    import flash.utils.*;
    import com.hurlant.util.*;

    public class SimpleIVMode implements IMode, ICipher {

        protected var mode:IVMode;
        protected var cipher:ICipher;

        public function SimpleIVMode(_arg1:IVMode){
            this.mode = _arg1;
            cipher = (_arg1 as ICipher);
        }
        public function encrypt(_arg1:ByteArray):void{
            var _local2:ByteArray;
            cipher.encrypt(_arg1);
            _local2 = new ByteArray();
            _local2.writeBytes(mode.IV);
            _local2.writeBytes(_arg1);
            _arg1.position = 0;
            _arg1.writeBytes(_local2);
        }
        public function decrypt(_arg1:ByteArray):void{
            var _local2:ByteArray;
            _local2 = new ByteArray();
            _local2.writeBytes(_arg1, 0, getBlockSize());
            mode.IV = _local2;
            _local2 = new ByteArray();
            _local2.writeBytes(_arg1, getBlockSize());
            cipher.decrypt(_local2);
            _arg1.length = 0;
            _arg1.writeBytes(_local2);
        }
        public function dispose():void{
            mode.dispose();
            mode = null;
            cipher = null;
            Memory.gc();
        }
        public function toString():String{
            return (("simple-" + cipher.toString()));
        }
        public function getBlockSize():uint{
            return (mode.getBlockSize());
        }

    }
}//package com.hurlant.crypto.symmetric 
