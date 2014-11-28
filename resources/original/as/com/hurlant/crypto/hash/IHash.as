package com.hurlant.crypto.hash {
    import flash.utils.*;

    public interface IHash {

        function toString():String;
        function getHashSize():uint;
        function getInputSize():uint;
        function hash(_arg1:ByteArray):ByteArray;

    }
}//package com.hurlant.crypto.hash 
