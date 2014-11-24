package com.hurlant.crypto.prng {
    import flash.utils.*;
    import com.hurlant.crypto.symmetric.*;
    import com.hurlant.util.*;

    public class ARC4 implements IPRNG, IStreamCipher {

        private const psize:uint = 0x0100;

        private var S:ByteArray;
        private var i:int = 0;
        private var j:int = 0;

        public function ARC4(_arg1:ByteArray=null){
            i = 0;
            j = 0;
            super();
            S = new ByteArray();
            if (_arg1){
                init(_arg1);
            };
        }
        public function decrypt(_arg1:ByteArray):void{
            encrypt(_arg1);
        }
        public function init(_arg1:ByteArray):void{
            var _local2:int;
            var _local3:int;
            var _local4:int;
            _local2 = 0;
            while (_local2 < 0x0100) {
                S[_local2] = _local2;
                _local2++;
            };
            _local3 = 0;
            _local2 = 0;
            while (_local2 < 0x0100) {
                _local3 = (((_local3 + S[_local2]) + _arg1[(_local2 % _arg1.length)]) & 0xFF);
                _local4 = S[_local2];
                S[_local2] = S[_local3];
                S[_local3] = _local4;
                _local2++;
            };
            this.i = 0;
            this.j = 0;
        }
        public function dispose():void{
            var _local1:uint;
            _local1 = 0;
            if (S != null){
                _local1 = 0;
                while (_local1 < S.length) {
                    S[_local1] = (Math.random() * 0x0100);
                    _local1++;
                };
                S.length = 0;
                S = null;
            };
            this.i = 0;
            this.j = 0;
            Memory.gc();
        }
        public function encrypt(_arg1:ByteArray):void{
            var _local2:uint;
            _local2 = 0;
            while (_local2 < _arg1.length) {
                var _temp1 = _local2;
                _local2 = (_local2 + 1);
                var _local3 = _temp1;
                _arg1[_local3] = (_arg1[_local3] ^ next());
            };
        }
        public function next():uint{
            var _local1:int;
            i = ((i + 1) & 0xFF);
            j = ((j + S[i]) & 0xFF);
            _local1 = S[i];
            S[i] = S[j];
            S[j] = _local1;
            return (S[((_local1 + S[i]) & 0xFF)]);
        }
        public function getBlockSize():uint{
            return (1);
        }
        public function getPoolSize():uint{
            return (psize);
        }
        public function toString():String{
            return ("rc4");
        }

    }
}//package com.hurlant.crypto.prng 
