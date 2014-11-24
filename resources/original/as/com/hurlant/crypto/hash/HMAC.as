package com.hurlant.crypto.hash {
    import flash.utils.*;

    public class HMAC {

        private var bits:uint;
        private var hash:IHash;

        public function HMAC(_arg1:IHash, _arg2:uint=0){
            this.hash = _arg1;
            this.bits = _arg2;
        }
        public function getHashSize():uint{
            if (bits != 0){
                return ((bits / 8));
            };
            return (hash.getHashSize());
        }
        public function dispose():void{
            hash = null;
            bits = 0;
        }
        public function compute(_arg1:ByteArray, _arg2:ByteArray):ByteArray{
            var _local3:ByteArray;
            var _local4:ByteArray;
            var _local5:ByteArray;
            var _local6:uint;
            var _local7:ByteArray;
            var _local8:ByteArray;
            if (_arg1.length > hash.getInputSize()){
                _local3 = hash.hash(_arg1);
            } else {
                _local3 = new ByteArray();
                _local3.writeBytes(_arg1);
            };
            while (_local3.length < hash.getInputSize()) {
                _local3[_local3.length] = 0;
            };
            _local4 = new ByteArray();
            _local5 = new ByteArray();
            _local6 = 0;
            while (_local6 < _local3.length) {
                _local4[_local6] = (_local3[_local6] ^ 54);
                _local5[_local6] = (_local3[_local6] ^ 92);
                _local6++;
            };
            _local4.position = _local3.length;
            _local4.writeBytes(_arg2);
            _local7 = hash.hash(_local4);
            _local5.position = _local3.length;
            _local5.writeBytes(_local7);
            _local8 = hash.hash(_local5);
            if ((((bits > 0)) && ((bits < (8 * _local8.length))))){
                _local8.length = (bits / 8);
            };
            return (_local8);
        }
        public function toString():String{
            return ((("hmac-" + (((bits > 0)) ? (bits + "-") : "")) + hash.toString()));
        }

    }
}//package com.hurlant.crypto.hash 
