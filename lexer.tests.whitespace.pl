:- begin_tests(lexer_whitespace).
:- ensure_loaded('lexer.pl').

test(emptyString) :- 
    lexer("",Tokens),
    assertion(Tokens=[]).

test(space) :- 
    lexer(" ",Tokens),
    assertion(Tokens=[]).

test(tab) :- 
    lexer("\t",Tokens),
    assertion(Tokens=[]).

test(carriagereturn) :- 
    lexer("\r",Tokens),
    assertion(Tokens=[]).

test(newline) :- 
    lexer("\n",Tokens),
    assertion(Tokens=[]).

test(whitespaces) :- 
    lexer(" \t\t\r\n  ",Tokens),
    assertion(Tokens=[]).

:- end_tests(lexer_whitespace).