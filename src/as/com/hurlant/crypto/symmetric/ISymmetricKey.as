package com.hurlant.crypto.symmetric {
    import flash.utils.*;

    public interface ISymmetricKey {

        function encrypt(_arg1:ByteArray, _arg2:uint=0):void;
        function dispose():void;
        function getBlockSize():uint;
        function toString():String;
        function decrypt(_arg1:ByteArray, _arg2:uint=0):void;

    }
}//package com.hurlant.crypto.symmetric 
