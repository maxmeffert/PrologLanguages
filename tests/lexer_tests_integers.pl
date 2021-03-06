:- begin_tests(lexer_integer).
:- use_module(lexer/lexer).

test(integer_unsigned) :- 
    lexer_from_string("1",Tokens),
    assertion(Tokens=[token(integer,"1")]).

test(integer_signed_positive) :- 
    lexer_from_string("+10",Tokens),
    assertion(Tokens=[token(symbol,"+"),token(integer,"10")]).

test(integer_signed_negative) :- 
    lexer_from_string("-1258",Tokens),
    assertion(Tokens=[token(symbol,"-"),token(integer,"1258")]).

:- end_tests(lexer_integer).