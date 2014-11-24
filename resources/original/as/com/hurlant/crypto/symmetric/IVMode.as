package com.hurlant.crypto.symmetric {
    import flash.utils.*;
    import com.hurlant.crypto.prng.*;
    import com.hurlant.util.*;

    public class IVMode {

        protected var lastIV:ByteArray;
        protected var iv:ByteArray;
        protected var blockSize:uint;
        protected var padding:IPad;
        protected var prng:Random;
        protected var key:ISymmetricKey;

        public function IVMode(_arg1:ISymmetricKey, _arg2:IPad=null){
            this.key = _arg1;
            blockSize = _arg1.getBlockSize();
            if (_arg2 == null){
                _arg2 = new PKCS5(blockSize);
            } else {
                _arg2.setBlockSize(blockSize);
            };
            this.padding = _arg2;
            prng = new Random();
            iv = null;
            lastIV = new ByteArray();
        }
        public function set IV(_arg1:ByteArray):void{
            iv = _arg1;
            lastIV.length = 0;
            lastIV.writeBytes(iv);
        }
        protected function getIV4d():ByteArray{
            var _local1:ByteArray;
            _local1 = new ByteArray();
            if (iv){
                _local1.writeBytes(iv);
            } else {
                throw (new Error("an IV must be set before calling decrypt()"));
            };
            return (_local1);
        }
        protected function getIV4e():ByteArray{
            var _local1:ByteArray;
            _local1 = new ByteArray();
            if (iv){
                _local1.writeBytes(iv);
            } else {
                prng.nextBytes(_local1, blockSize);
            };
            lastIV.length = 0;
            lastIV.writeBytes(_local1);
            return (_local1);
        }
        public function get IV():ByteArray{
            return (lastIV);
        }
        public function dispose():void{
            var _local1:uint;
            if (iv != null){
                _local1 = 0;
                while (_local1 < iv.length) {
                    iv[_local1] = prng.nextByte();
                    _local1++;
                };
                iv.length = 0;
                iv = null;
            };
            if (lastIV != null){
                _local1 = 0;
                while (_local1 < iv.length) {
                    lastIV[_local1] = prng.nextByte();
                    _local1++;
                };
                lastIV.length = 0;
                lastIV = null;
            };
            key.dispose();
            key = null;
            padding = null;
            prng.dispose();
            prng = null;
            Memory.gc();
        }
        public function getBlockSize():uint{
            return (key.getBlockSize());
        }

    }
}//package com.hurlant.crypto.symmetric 
