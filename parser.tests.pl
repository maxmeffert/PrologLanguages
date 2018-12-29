:- begin_tests(parser).
:- ['parser.pl'].

test(parser) :-
    parser([
        token("-"),
        token(integer,1)
        ],ParseTree),
    assertion(ParseTree=neg(number(1))).

test(parser) :-
    parser([
        token(integer,2),
        token("-"),
        token(integer,1)],
        ParseTree),
    assertion(ParseTree=sub(number(2),number(1))).

test(parser) :-
    parser([
        token(integer,2), 
        token("+"),
        token(integer,1)
        ],ParseTree),
    assertion(ParseTree=add(number(2),number(1))).

:- end_tests(parser).