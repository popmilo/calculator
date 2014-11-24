package com.hurlant.crypto.prng {
    import flash.utils.*;

    public interface IPRNG {

        function init(_arg1:ByteArray):void;
        function next():uint;
        function dispose():void;
        function getPoolSize():uint;
        function toString():String;

    }
}//package com.hurlant.crypto.prng 
