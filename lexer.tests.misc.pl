:- begin_tests(lexer_misc).
:- ensure_loaded('lexer.pl').

test(some_expression) :- 
    lexer("1-10",Tokens),
    assertion(Tokens=[token(integer,1),token("-"),token(integer,10)]).
    
test(some_expression) :- 
    lexer("1+10",Tokens),
    assertion(Tokens=[token(integer,1),token("+"),token(integer,10)]).

test(some_expression) :- 
    lexer("1==10",Tokens),
    assertion(Tokens=[token(integer,1),token("=="),token(integer,10)]).

:- end_tests(lexer_misc).