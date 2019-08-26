% ==============================================================================
% Whitespaces
% ==============================================================================

:- module(lexer_whitespaces, [
        whitespace/1,
        whitespace/2,
        whitespace/3,
        whitespaces/1,
        whitespaces/3,
        notWhitespace/3,
        notWhitespaces/3
        ]).

whitespace(Code) :- code_type(Code, space), !.
whitespace(Code) :- code_type(Code, white), !.

whitespaces([]).
whitespaces([Code|Codes]) :- 
    whitespace(Code), 
    whitespaces(Codes).

notWhitespace(Code) :- \+ whitespace(Code).

whitespace --> [Code], { whitespace(Code) }.
whitespace(Code) --> [Code], { whitespace(Code) }.

whitespaces([Code|Codes]) --> whitespace(Code), whitespaces(Codes).
whitespaces([]) --> \+ whitespace(_).

notWhitespace(Code) --> [Code], { notWhitespace(Code) }.
notWhitespaces([Code|Codes]) --> notWhitespace(Code), notWhitespaces(Codes).
notWhitespaces([]) --> \+ notWhitespace(_).