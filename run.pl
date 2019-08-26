:- use_module(lexer/lexer).
:- use_module(parser/parser).
:- use_module(interpreter/interpreter).

run(X) :-
    lexer("-1+5+1+2",Tokens),
    parser(Tokens,ParseTree),
    eval(ParseTree,X).