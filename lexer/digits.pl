% ==============================================================================
% Digits
% ==============================================================================

:- module(lexer_digits, [
        digit/1,
        digit_dcg/3,
        digits_dcg/3
        ]).

digit(Code) :- code_type(Code, digit), !.

digit_dcg(Code) --> [Code], { digit(Code) }.

digits_dcg([Code|Codes]) --> digit_dcg(Code), digits_dcg(Codes).
digits_dcg([]) --> \+ digit_dcg(_).