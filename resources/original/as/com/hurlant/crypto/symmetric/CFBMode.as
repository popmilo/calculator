package com.hurlant.crypto.symmetric {
    import flash.utils.*;

    public class CFBMode extends IVMode implements IMode {

        public function CFBMode(_arg1:ISymmetricKey, _arg2:IPad=null){
            super(_arg1, null);
        }
        public function toString():String{
            return ((key.toString() + "-cfb"));
        }
        public function decrypt(_arg1:ByteArray):void{
            var _local2:uint;
            var _local3:ByteArray;
            var _local4:ByteArray;
            var _local5:uint;
            var _local6:uint;
            var _local7:uint;
            _local2 = _arg1.length;
            _local3 = getIV4d();
            _local4 = new ByteArray();
            _local5 = 0;
            while (_local5 < _arg1.length) {
                key.encrypt(_local3);
                _local6 = (((_local5 + blockSize))<_local2) ? blockSize : (_local2 - _local5);
                _local4.position = 0;
                _local4.writeBytes(_arg1, _local5, _local6);
                _local7 = 0;
                while (_local7 < _local6) {
                    _arg1[(_local5 + _local7)] = (_arg1[(_local5 + _local7)] ^ _local3[_local7]);
                    _local7++;
                };
                _local3.position = 0;
                _local3.writeBytes(_local4);
                _local5 = (_local5 + blockSize);
            };
        }
        public function encrypt(_arg1:ByteArray):void{
            var _local2:uint;
            var _local3:ByteArray;
            var _local4:uint;
            var _local5:uint;
            var _local6:uint;
            _local2 = _arg1.length;
            _local3 = getIV4e();
            _local4 = 0;
            while (_local4 < _arg1.length) {
                key.encrypt(_local3);
                _local5 = (((_local4 + blockSize))<_local2) ? blockSize : (_local2 - _local4);
                _local6 = 0;
                while (_local6 < _local5) {
                    _arg1[(_local4 + _local6)] = (_arg1[(_local4 + _local6)] ^ _local3[_local6]);
                    _local6++;
                };
                _local3.position = 0;
                _local3.writeBytes(_arg1, _local4, _local5);
                _local4 = (_local4 + blockSize);
            };
        }

    }
}//package com.hurlant.crypto.symmetric 
