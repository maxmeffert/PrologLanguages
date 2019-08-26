:- begin_tests(lexer_misc).
:- use_module(lexer/lexer).

test(some_expression) :- 
    lexer_from_string("1-10",Tokens),
    assertion(Tokens=[token(integer,"1"),token(symbol,"-"),token(integer,"10")]).
    
test(some_expression) :- 
    lexer_from_string("1+10",Tokens),
    assertion(Tokens=[token(integer,"1"),token(symbol,"+"),token(integer,"10")]).

test(some_expression) :- 
    lexer_from_string("1==10",Tokens),
    assertion(Tokens=[token(integer,"1"),token(symbol,"=="),token(integer,"10")]).

:- end_tests(lexer_misc).