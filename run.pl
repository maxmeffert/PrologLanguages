:- use_module(lexer).
:- use_module(parser).
:- use_module(interpreter).

run(X) :-
    lexer("-1+5+1+2",Tokens),
    parser(Tokens,ParseTree),
    eval(ParseTree,X).