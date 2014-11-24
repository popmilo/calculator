package com.hurlant.math {
    import com.hurlant.math.*;

    class ClassicReduction implements IReduction {

        private var m:BigInteger;

        public function ClassicReduction(_arg1:BigInteger){
            this.m = _arg1;
        }
        public function revert(_arg1:BigInteger):BigInteger{
            return (_arg1);
        }
        public function reduce(_arg1:BigInteger):void{
            _arg1.divRemTo(m, null, _arg1);
        }
        public function convert(_arg1:BigInteger):BigInteger{
            if ((((_arg1.s < 0)) || ((_arg1.compareTo(m) >= 0)))){
                return (_arg1.mod(m));
            };
            return (_arg1);
        }
        public function sqrTo(_arg1:BigInteger, _arg2:BigInteger):void{
            _arg1.squareTo(_arg2);
            reduce(_arg2);
        }
        public function mulTo(_arg1:BigInteger, _arg2:BigInteger, _arg3:BigInteger):void{
            _arg1.multiplyTo(_arg2, _arg3);
            reduce(_arg3);
        }

    }
}//package com.hurlant.math 
