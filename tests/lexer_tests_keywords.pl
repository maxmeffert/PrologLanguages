:- begin_tests(lexer_keyword).
:- use_module(lexer/lexer).

test(if) :- 
    lexer_from_string("if",Tokens),
    assertion(Tokens=[token(keyword,if)]).

test(if) :- 
    lexer_from_string("if hello",Tokens),
    assertion(Tokens=[token(keyword,if), token(identifier,"hello")]).

test(if) :- 
    lexer_from_string("ifhello",Tokens),
    assertion(Tokens=[token(identifier,"ifhello")]).

test(bool_true) :- 
    lexer_from_string("true",Tokens),
    assertion(Tokens=[token(keyword,true)]).

test(bool_false) :- 
    lexer_from_string("false",Tokens),
    assertion(Tokens=[token(keyword,false)]).

test(bool_error) :- 
    lexer_from_string("truefalse",Tokens),
    assertion(Tokens=[token(identifier,"truefalse")]).

test(bool_true_false) :- 
    lexer_from_string("true false",Tokens),
    assertion(Tokens=[token(keyword,true),token(keyword,false)]).

test(bool_true_false2) :- 
    lexer_from_string("True FALSE",Tokens),
    assertion(Tokens=[token(keyword,true),token(keyword,false)]).

:- end_tests(lexer_keyword).
