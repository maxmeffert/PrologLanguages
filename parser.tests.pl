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

test(parser_equality) :-
    parser([
        token(integer,2), 
        token("=="),
        token(integer,1)
        ],ParseTree),
    assertion(ParseTree=eq(number(2),number(1))).

test(parser_equality) :-
    parser([
        token(integer,2), 
        token("!="),
        token(integer,1)
        ],ParseTree),
    assertion(ParseTree=neq(number(2),number(1))).

test(parser_equality) :-
    parser([
        token(integer,2), 
        token("<="),
        token(integer,1)
        ],ParseTree),
    assertion(ParseTree=lte(number(2),number(1))).

test(parser_equality) :-
    parser([
        token(integer,2), 
        token(">="),
        token(integer,1)
        ],ParseTree),
    assertion(ParseTree=gte(number(2),number(1))).

test(parser_equality) :-
    parser([
        token(integer,2), 
        token("<"),
        token(integer,1)
        ],ParseTree),
    assertion(ParseTree=lt(number(2),number(1))).

test(parser_equality) :-
    parser([
        token(integer,2), 
        token(">"),
        token(integer,1)
        ],ParseTree),
    assertion(ParseTree=gt(number(2),number(1))).



:- end_tests(parser).