% ==============================================================================
% Digits
% ==============================================================================

:- module(lexer_digits, [
        digit/1,
        digit/3,
        digits/3
        ]).

digit(Code) :- code_type(Code, digit), !.

digit(Code) --> [Code], { digit(Code) }.

digits([Code|Codes]) --> digit(Code), digits(Codes).
digits([]) --> \+ digit(_).