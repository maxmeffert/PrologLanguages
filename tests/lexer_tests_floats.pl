:- begin_tests(lexer_float).
:- use_module(lexer/lexer).

test(float_unsigned) :- 
    lexer_from_string("1.0",Tokens),
    assertion(Tokens=[token(float,1.0)]).

test(float_signed_positive) :- 
    lexer_from_string("+10.3",Tokens),
    assertion(Tokens=[token(symbol,"+"),token(float,10.3)]).

test(float_signed_negative) :- 
    lexer_from_string("-14.344",Tokens),
    assertion(Tokens=[token(symbol,"-"),token(float,14.344)]).

test(float_unsigned_nofraction_exponent_unsigned) :- 
    lexer_from_string("1e2",Tokens),
    assertion(Tokens=[token(float,100.0)]).

test(float_unsigned_nofraction_exponent_signed_positive) :- 
    lexer_from_string("1e+2",Tokens),
    assertion(Tokens=[token(float,100.0)]).

test(float_unsigned_nofraction_exponent_signed_negative) :- 
    lexer_from_string("1e-2",Tokens),
    assertion(Tokens=[token(float,0.01)]).

test(float_signed_positive_nofraction_exponent_signed_negative) :- 
    lexer_from_string("+10e-5",Tokens),
    assertion(Tokens=[token(symbol,"+"),token(float,0.0001)]).

test(float_signed_negative_nofraction_exponent_signed_positive) :- 
    lexer_from_string("-1258e+4",Tokens),
    assertion(Tokens=[token(symbol,"-"),token(float,12580000.0)]).

test(float_unsigned_withfraction_exponent_unsigned) :- 
    lexer_from_string("1.33e+2",Tokens),
    assertion(Tokens=[token(float,133.0)]).

test(float_signed_positive_withfraction_exponent_signed_negative) :- 
    lexer_from_string("+10.000e-5",Tokens),
    assertion(Tokens=[token(symbol,"+"),token(float,0.0001)]).

test(float_signed_negative_withfraction_exponent_signed_positive) :- 
    lexer_from_string("-1258.48e+4",Tokens),
    assertion(Tokens=[token(symbol,"-"),token(float,12584800.0)]).

:- end_tests(lexer_float).