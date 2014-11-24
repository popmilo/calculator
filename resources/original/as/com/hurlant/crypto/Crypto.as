package com.hurlant.crypto {
    import flash.utils.*;
    import com.hurlant.crypto.symmetric.*;
    import com.hurlant.crypto.hash.*;
    import com.hurlant.crypto.rsa.*;
    import com.hurlant.crypto.prng.*;
    import com.hurlant.util.*;

    public class Crypto {

        private var b64:Base64;

        public static function getCipher(_arg1:String, _arg2:ByteArray, _arg3:IPad=null):ICipher{
            var _local4:Array;
            var _local5:ICipher;
            _local4 = _arg1.split("-");
            switch (_local4[0]){
                case "simple":
                    _local4.shift();
                    _arg1 = _local4.join("-");
                    _local5 = getCipher(_arg1, _arg2, _arg3);
                    if ((_local5 is IVMode)){
                        return (new SimpleIVMode((_local5 as IVMode)));
                    };
                    return (_local5);
                case "aes":
                case "aes128":
                case "aes192":
                case "aes256":
                    _local4.shift();
                    if ((_arg2.length * 8) == _local4[0]){
                        _local4.shift();
                    };
                    return (getMode(_local4[0], new AESKey(_arg2), _arg3));
                case "bf":
                case "blowfish":
                    _local4.shift();
                    return (getMode(_local4[0], new BlowFishKey(_arg2), _arg3));
                case "des":
                    _local4.shift();
                    if (((!((_local4[0] == "ede"))) && (!((_local4[0] == "ede3"))))){
                        return (getMode(_local4[0], new DESKey(_arg2), _arg3));
                    };
                    if (_local4.length == 1){
                        _local4.push("ecb");
                    };
                case "3des":
                case "des3":
                    _local4.shift();
                    return (getMode(_local4[0], new TripleDESKey(_arg2), _arg3));
                case "xtea":
                    _local4.shift();
                    return (getMode(_local4[0], new XTeaKey(_arg2), _arg3));
                case "rc4":
                    _local4.shift();
                    return (new ARC4(_arg2));
            };
            return (null);
        }
        public static function getHash(_arg1:String):IHash{
            switch (_arg1){
                case "md2":
                    return (new MD2());
                case "md5":
                    return (new MD5());
                case "sha":
                case "sha1":
                    return (new SHA1());
                case "sha224":
                    return (new SHA224());
                case "sha256":
                    return (new SHA256());
            };
            return (null);
        }
        public static function getRSA(_arg1:String, _arg2:String):RSAKey{
            return (RSAKey.parsePublicKey(_arg2, _arg1));
        }
        private static function getMode(_arg1:String, _arg2:ISymmetricKey, _arg3:IPad=null):IMode{
            switch (_arg1){
                case "ecb":
                    return (new ECBMode(_arg2, _arg3));
                case "cfb":
                    return (new CFBMode(_arg2, _arg3));
                case "cfb8":
                    return (new CFB8Mode(_arg2, _arg3));
                case "ofb":
                    return (new OFBMode(_arg2, _arg3));
                case "ctr":
                    return (new CTRMode(_arg2, _arg3));
                case "cbc":
                default:
                    return (new CBCMode(_arg2, _arg3));
            };
        }
        public static function getKeySize(_arg1:String):uint{
            var _local2:Array;
            _local2 = _arg1.split("-");
            switch (_local2[0]){
                case "simple":
                    _local2.shift();
                    return (getKeySize(_local2.join("-")));
                case "aes128":
                    return (16);
                case "aes192":
                    return (24);
                case "aes256":
                    return (32);
                case "aes":
                    _local2.shift();
                    return ((parseInt(_local2[0]) / 8));
                case "bf":
                case "blowfish":
                    return (16);
                case "des":
                    _local2.shift();
                    switch (_local2[0]){
                        case "ede":
                            return (16);
                        case "ede3":
                            return (24);
                        default:
                            return (8);
                    };
                case "3des":
                case "des3":
                    return (24);
                case "xtea":
                    return (8);
                case "rc4":
                    if (parseInt(_local2[1]) > 0){
                        return ((parseInt(_local2[1]) / 8));
                    };
                    return (16);
            };
            return (0);
        }
        public static function getPad(_arg1:String):IPad{
            switch (_arg1){
                case "null":
                    return (new NullPad());
                case "pkcs5":
                default:
                    return (new PKCS5());
            };
        }
        public static function getHMAC(_arg1:String):HMAC{
            var _local2:Array;
            var _local3:uint;
            _local2 = _arg1.split("-");
            if (_local2[0] == "hmac"){
                _local2.shift();
            };
            _local3 = 0;
            if (_local2.length > 1){
                _local3 = parseInt(_local2[1]);
            };
            return (new HMAC(getHash(_local2[0]), _local3));
        }

    }
}//package com.hurlant.crypto 
