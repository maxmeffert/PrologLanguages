:- ['lexer.pl'].
:- ['parser.pl'].
:- ['interpreter.pl'].

run(X) :-
    lexer("-1+5",Tokens),
    parser(Tokens,ParseTree),
    eval(ParseTree,X).