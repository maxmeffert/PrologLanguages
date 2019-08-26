:- begin_tests(lexer_integer).
:- ensure_loaded('lexer.pl').

test(integer_unsigned) :- 
    lexer("1",Tokens),
    assertion(Tokens=[token(integer,1)]).

test(integer_signed_positive) :- 
    lexer("+10",Tokens),
    assertion(Tokens=[token("+"),token(integer,10)]).

test(integer_signed_negative) :- 
    lexer("-1258",Tokens),
    assertion(Tokens=[token("-"),token(integer,1258)]).

:- end_tests(lexer_integer).