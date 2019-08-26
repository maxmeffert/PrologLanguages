:- begin_tests(lexer_keyword).
:- ensure_loaded('lexer.pl').

test(if) :- 
    lexer("if",Tokens),
    assertion(Tokens=[token(keyword,if)]).

test(if) :- 
    lexer("if hello",Tokens),
    assertion(Tokens=[token(keyword,if), token(identifier,"hello")]).

test(if) :- 
    lexer("ifhello",Tokens),
    assertion(Tokens=[token(identifier,"ifhello")]).



:- end_tests(lexer_keyword).
