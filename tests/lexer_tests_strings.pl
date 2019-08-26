:- begin_tests(lexer_string).
:- use_module(lexer/lexer).

test(string) :-
    lexer_from_string("\"asdf\"",Tokens),
    assertion(Tokens=[token(string,"asdf")]).

test(string_space) :-
    lexer_from_string("\" \" ",Tokens),
    assertion(Tokens=[token(string," ")]).

test(string_with_escaped_quote) :-
    lexer_from_string("\"as\\\"df\"",Tokens),
    assertion(Tokens=[token(string,"as\\\"df")]).

test(string_with_escaped_quotes) :-
    lexer_from_string("\"a\\\"s\\\"df\"",Tokens),
    assertion(Tokens=[token(string,"a\\\"s\\\"df")]).

:- end_tests(lexer_string).