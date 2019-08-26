% ==============================================================================
% Whitespaces
% ==============================================================================

:- module(lexer_whitespaces, [
        whitespace/1,
        whitespaces/1,
        whitespace_dcg/2,
        whitespace_dcg/3,
        whitespaces_dcg/3,
        not_whitespace_dcg/3,
        not_whitespaces_dcg/3
        ]).

whitespace(Code) :- code_type(Code, space), !.
whitespace(Code) :- code_type(Code, white), !.

whitespaces([]).
whitespaces([Code|Codes]) :- 
    whitespace(Code), 
    whitespaces(Codes).

notWhitespace(Code) :- \+ whitespace(Code).

whitespace_dcg --> [Code], { whitespace(Code) }.
whitespace_dcg(Code) --> [Code], { whitespace(Code) }.

whitespaces_dcg([Code|Codes]) --> whitespaces_dcg(Code), whitespaces_dcg(Codes).
whitespaces_dcg([]) --> \+ whitespaces_dcg(_).

not_whitespace_dcg(Code) --> [Code], { notWhitespace(Code) }.
not_whitespaces_dcg([Code|Codes]) --> not_whitespace_dcg(Code), not_whitespaces_dcg(Codes).
not_whitespaces_dcg([]) --> \+ not_whitespace_dcg(_).