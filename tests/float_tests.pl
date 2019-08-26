:- begin_tests(float_tests).
:- use_module(lexer/floats).

test(test1) :- 
    string_codes("1.0", Codes),
    phrase(token_float_dcg(FloatLiteral),Codes),
    assertion(FloatLiteral = "1.0").

test(test2) :- 
    string_codes("42e0", Codes),
    phrase(token_float_dcg(FloatLiteral),Codes),
    assertion(FloatLiteral = "42e0").

test(test3) :- 
    string_codes("42e-10", Codes),
    phrase(token_float_dcg(FloatLiteral),Codes),
    assertion(FloatLiteral = "42e-10").

test(test4) :- 
    string_codes("42e+10", Codes),
    phrase(token_float_dcg(FloatLiteral),Codes),
    assertion(FloatLiteral = "42e+10").

test(test5) :- 
    string_codes("42.66e-10", Codes),
    phrase(token_float_dcg(FloatLiteral),Codes),
    assertion(FloatLiteral = "42.66e-10").

test(test6) :- 
    string_codes("42.77e+10", Codes),
    phrase(token_float_dcg(FloatLiteral),Codes),
    assertion(FloatLiteral = "42.77e+10").

test(test7, fail) :- 
    string_codes("a42.77", Codes),
    phrase(token_float_dcg(_),Codes).

test(test8, fail) :- 
    string_codes("42.b77e+10", Codes),
    phrase(token_float_dcg(_),Codes).

test(test9, fail) :- 
    string_codes("42,77e+10", Codes),
    phrase(token_float_dcg(_),Codes).

:- end_tests(float_tests).
