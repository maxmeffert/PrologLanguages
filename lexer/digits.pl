% ==============================================================================
% Digits
% ==============================================================================

:- module(lexer_digits, [
        digit/1,
        digit/3,
        digits/3
        ]).

:- use_module(lexer/common).

digit(Code) :- codeInfo(Code, (Code,digit)).

digit(Code) --> [Code], { digit(Code) }.

digits([Code|Codes]) --> digit(Code), digits(Codes).
digits([]) --> \+ digit(_).