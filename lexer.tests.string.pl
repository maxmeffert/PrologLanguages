:- begin_tests(lexer_string).
:- ensure_loaded('lexer.pl').

test(string) :-
    lexer("\"asdf\"",Tokens),
    assertion(Tokens=[token(string,"asdf")]).

test(string_space) :-
    lexer("\" \" ",Tokens),
    assertion(Tokens=[token(string," ")]).

test(string_with_escaped_quote) :-
    lexer("\"as\\\"df\"",Tokens),
    assertion(Tokens=[token(string,"as\\\"df")]).

test(string_with_escaped_quotes) :-
    lexer("\"a\\\"s\\\"df\"",Tokens),
    assertion(Tokens=[token(string,"a\\\"s\\\"df")]).

:- end_tests(lexer_string).