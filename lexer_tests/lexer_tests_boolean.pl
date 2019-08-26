:- begin_tests(lexer_boolean).
:- ensure_loaded('../lexer/lexer.pl').

test(bool_true) :- 
    lexer_from_string("true",Tokens),
    assertion(Tokens=[token(boolean,true)]).

test(bool_false) :- 
    lexer_from_string("false",Tokens),
    assertion(Tokens=[token(boolean,false)]).

test(bool_error) :- 
    lexer_from_string("truefalse",Tokens),
    assertion(Tokens=[token(identifier,"truefalse")]).

test(bool_true_false) :- 
    lexer_from_string("true false",Tokens),
    assertion(Tokens=[token(boolean,true),token(boolean,false)]).

:- end_tests(lexer_boolean).
