:- begin_tests(integer_tests).
:- use_module(lexer/integers).

test(test1) :- 
    string_codes("1", Codes),
    phrase(token_integer_dcg(IntegerLiteral),Codes),
    assertion(IntegerLiteral = "1").

test(test2) :- 
    string_codes("42", Codes),
    phrase(token_integer_dcg(IntegerLiteral),Codes),
    assertion(IntegerLiteral = "42").

test(test3) :- 
    string_codes("000", Codes),
    phrase(token_integer_dcg(IntegerLiteral),Codes),
    assertion(IntegerLiteral = "000").

test(test4, fail) :- 
    string_codes("a1", Codes),
    phrase(token_integer_dcg(_),Codes).

test(test5, fail) :- 
    string_codes("42b", Codes),
    phrase(token_integer_dcg(_),Codes).

:- end_tests(integer_tests).
