:- begin_tests(lexer_boolean).
:- ensure_loaded('lexer.pl').

test(bool_true) :- 
    lexer("true",Tokens),
    assertion(Tokens=[token(boolean,true)]).

test(bool_false) :- 
    lexer("false",Tokens),
    assertion(Tokens=[token(boolean,false)]).

test(bool_error) :- 
    lexer("truefalse",Tokens),
    assertion(Tokens=[token(identifier,"truefalse")]).

test(bool_true_false) :- 
    lexer("true false",Tokens),
    assertion(Tokens=[token(boolean,true),token(boolean,false)]).


:- end_tests(lexer_boolean).
