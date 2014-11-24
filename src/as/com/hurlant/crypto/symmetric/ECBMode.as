package com.hurlant.crypto.symmetric {
    import flash.utils.*;
    import com.hurlant.util.*;

    public class ECBMode implements IMode, ICipher {

        private var key:ISymmetricKey;
        private var padding:IPad;

        public function ECBMode(_arg1:ISymmetricKey, _arg2:IPad=null){
            this.key = _arg1;
            if (_arg2 == null){
                _arg2 = new PKCS5(_arg1.getBlockSize());
            } else {
                _arg2.setBlockSize(_arg1.getBlockSize());
            };
            this.padding = _arg2;
        }
        public function encrypt(_arg1:ByteArray):void{
            var _local2:uint;
            var _local3:ByteArray;
            var _local4:ByteArray;
            var _local5:uint;
            padding.pad(_arg1);
            _arg1.position = 0;
            _local2 = key.getBlockSize();
            _local3 = new ByteArray();
            _local4 = new ByteArray();
            _local5 = 0;
            while (_local5 < _arg1.length) {
                _local3.length = 0;
                _arg1.readBytes(_local3, 0, _local2);
                key.encrypt(_local3);
                _local4.writeBytes(_local3);
                _local5 = (_local5 + _local2);
            };
            _arg1.length = 0;
            _arg1.writeBytes(_local4);
        }
        public function decrypt(_arg1:ByteArray):void{
            var _local2:uint;
            var _local3:ByteArray;
            var _local4:ByteArray;
            var _local5:uint;
            _arg1.position = 0;
            _local2 = key.getBlockSize();
            if ((_arg1.length % _local2) != 0){
                throw (new Error(("ECB mode cipher length must be a multiple of blocksize " + _local2)));
            };
            _local3 = new ByteArray();
            _local4 = new ByteArray();
            _local5 = 0;
            while (_local5 < _arg1.length) {
                _local3.length = 0;
                _arg1.readBytes(_local3, 0, _local2);
                key.decrypt(_local3);
                _local4.writeBytes(_local3);
                _local5 = (_local5 + _local2);
            };
            padding.unpad(_local4);
            _arg1.length = 0;
            _arg1.writeBytes(_local4);
        }
        public function dispose():void{
            key.dispose();
            key = null;
            padding = null;
            Memory.gc();
        }
        public function getBlockSize():uint{
            return (key.getBlockSize());
        }
        public function toString():String{
            return ((key.toString() + "-ecb"));
        }

    }
}//package com.hurlant.crypto.symmetric 
