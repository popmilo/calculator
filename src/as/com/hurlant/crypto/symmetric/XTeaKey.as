package com.hurlant.crypto.symmetric {
    import flash.utils.*;
    import com.hurlant.crypto.prng.*;
    import com.hurlant.util.*;

    public class XTeaKey implements ISymmetricKey {

        public const NUM_ROUNDS:uint = 64;

        private var k:Array;

        public function XTeaKey(_arg1:ByteArray){
            _arg1.position = 0;
            k = [_arg1.readUnsignedInt(), _arg1.readUnsignedInt(), _arg1.readUnsignedInt(), _arg1.readUnsignedInt()];
        }
        public static function parseKey(_arg1:String):XTeaKey{
            var _local2:ByteArray;
            _local2 = new ByteArray();
            _local2.writeUnsignedInt(parseInt(_arg1.substr(0, 8), 16));
            _local2.writeUnsignedInt(parseInt(_arg1.substr(8, 8), 16));
            _local2.writeUnsignedInt(parseInt(_arg1.substr(16, 8), 16));
            _local2.writeUnsignedInt(parseInt(_arg1.substr(24, 8), 16));
            _local2.position = 0;
            return (new XTeaKey(_local2));
        }

        public function dispose():void{
            var _local1:Random;
            var _local2:uint;
            _local1 = new Random();
            _local2 = 0;
            while (_local2 < k.length) {
                k[_local2] = _local1.nextByte();
                delete k[_local2];
                _local2++;
            };
            k = null;
            Memory.gc();
        }
        public function encrypt(_arg1:ByteArray, _arg2:uint=0):void{
            var _local3:uint;
            var _local4:uint;
            var _local5:uint;
            var _local6:uint;
            var _local7:uint;
            _arg1.position = _arg2;
            _local3 = _arg1.readUnsignedInt();
            _local4 = _arg1.readUnsignedInt();
            _local6 = 0;
            _local7 = 2654435769;
            _local5 = 0;
            while (_local5 < NUM_ROUNDS) {
                _local3 = (_local3 + ((((_local4 << 4) ^ (_local4 >> 5)) + _local4) ^ (_local6 + k[(_local6 & 3)])));
                _local6 = (_local6 + _local7);
                _local4 = (_local4 + ((((_local3 << 4) ^ (_local3 >> 5)) + _local3) ^ (_local6 + k[((_local6 >> 11) & 3)])));
                _local5++;
            };
            _arg1.position = (_arg1.position - 8);
            _arg1.writeUnsignedInt(_local3);
            _arg1.writeUnsignedInt(_local4);
        }
        public function decrypt(_arg1:ByteArray, _arg2:uint=0):void{
            var _local3:uint;
            var _local4:uint;
            var _local5:uint;
            var _local6:uint;
            var _local7:uint;
            _arg1.position = _arg2;
            _local3 = _arg1.readUnsignedInt();
            _local4 = _arg1.readUnsignedInt();
            _local6 = 2654435769;
            _local7 = (_local6 * NUM_ROUNDS);
            _local5 = 0;
            while (_local5 < NUM_ROUNDS) {
                _local4 = (_local4 - ((((_local3 << 4) ^ (_local3 >> 5)) + _local3) ^ (_local7 + k[((_local7 >> 11) & 3)])));
                _local7 = (_local7 - _local6);
                _local3 = (_local3 - ((((_local4 << 4) ^ (_local4 >> 5)) + _local4) ^ (_local7 + k[(_local7 & 3)])));
                _local5++;
            };
            _arg1.position = (_arg1.position - 8);
            _arg1.writeUnsignedInt(_local3);
            _arg1.writeUnsignedInt(_local4);
        }
        public function toString():String{
            return ("xtea");
        }
        public function getBlockSize():uint{
            return (8);
        }

    }
}//package com.hurlant.crypto.symmetric 
