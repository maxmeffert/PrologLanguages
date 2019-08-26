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



:- end_tests(lexer_keyword).