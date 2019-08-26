:- begin_tests(lexer_whitespace).
:- use_module(lexer/lexer).

test(emptyString) :- 
    lexer_from_string("",Tokens),
    assertion(Tokens=[]).

test(space) :- 
    lexer_from_string(" ",Tokens),
    assertion(Tokens=[]).

test(tab) :- 
    lexer_from_string("\t",Tokens),
    assertion(Tokens=[]).

test(carriagereturn) :- 
    lexer_from_string("\r",Tokens),
    assertion(Tokens=[]).

test(newline) :- 
    lexer_from_string("\n",Tokens),
    assertion(Tokens=[]).

test(whitespaces) :- 
    lexer_from_string(" \t\t\r\n  ",Tokens),
    assertion(Tokens=[]).

:- end_tests(lexer_whitespace).