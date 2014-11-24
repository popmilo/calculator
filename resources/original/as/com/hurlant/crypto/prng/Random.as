package com.hurlant.crypto.prng {
    import flash.utils.*;
    import flash.text.*;
    import com.hurlant.util.*;
    import flash.system.*;

    public class Random {

        private var psize:int;
        private var ready:Boolean = false;
        private var seeded:Boolean = false;
        private var state:IPRNG;
        private var pool:ByteArray;
        private var pptr:int;

        public function Random(_arg1:Class=null){
            var _local2:uint;
            ready = false;
            seeded = false;
            super();
            if (_arg1 == null){
                _arg1 = ARC4;
            };
            state = (new (_arg1)() as IPRNG);
            psize = state.getPoolSize();
            pool = new ByteArray();
            pptr = 0;
            while (pptr < psize) {
                _local2 = (65536 * Math.random());
                var _local3 = pptr++;
                pool[_local3] = (_local2 >>> 8);
                var _local4 = pptr++;
                pool[_local4] = (_local2 & 0xFF);
            };
            pptr = 0;
            seed();
        }
        public function seed(_arg1:int=0):void{
            if (_arg1 == 0){
                _arg1 = new Date().getTime();
            };
            var _local2 = pptr++;
            pool[_local2] = (pool[_local2] ^ (_arg1 & 0xFF));
            var _local3 = pptr++;
            pool[_local3] = (pool[_local3] ^ ((_arg1 >> 8) & 0xFF));
            var _local4 = pptr++;
            pool[_local4] = (pool[_local4] ^ ((_arg1 >> 16) & 0xFF));
            var _local5 = pptr++;
            pool[_local5] = (pool[_local5] ^ ((_arg1 >> 24) & 0xFF));
            pptr = (pptr % psize);
            seeded = true;
        }
        public function toString():String{
            return (("random-" + state.toString()));
        }
        public function dispose():void{
            var _local1:uint;
            _local1 = 0;
            while (_local1 < pool.length) {
                pool[_local1] = (Math.random() * 0x0100);
                _local1++;
            };
            pool.length = 0;
            pool = null;
            state.dispose();
            state = null;
            psize = 0;
            pptr = 0;
            Memory.gc();
        }
        public function autoSeed():void{
            var _local1:ByteArray;
            var _local2:Array;
            var _local3:Font;
            _local1 = new ByteArray();
            _local1.writeUnsignedInt(System.totalMemory);
            _local1.writeUTF(Capabilities.serverString);
            _local1.writeUnsignedInt(getTimer());
            _local1.writeUnsignedInt(new Date().getTime());
            _local2 = Font.enumerateFonts(true);
            for each (_local3 in _local2) {
                _local1.writeUTF(_local3.fontName);
                _local1.writeUTF(_local3.fontStyle);
                _local1.writeUTF(_local3.fontType);
            };
            _local1.position = 0;
            while (_local1.bytesAvailable >= 4) {
                seed(_local1.readUnsignedInt());
            };
        }
        public function nextByte():int{
            if (!ready){
                if (!seeded){
                    autoSeed();
                };
                state.init(pool);
                pool.length = 0;
                pptr = 0;
                ready = true;
            };
            return (state.next());
        }
        public function nextBytes(_arg1:ByteArray, _arg2:int):void{
            while (_arg2--) {
                _arg1.writeByte(nextByte());
            };
        }

    }
}//package com.hurlant.crypto.prng 
