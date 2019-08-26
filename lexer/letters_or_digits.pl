% ==============================================================================
% Letters Or Digits
% ==============================================================================

:- module(lexer_letters_or_digits, [
        letter_or_digit/1,
        letter_or_digit_dcg/3,
        letters_or_digits_dcg/3
        ]).

:- use_module(lexer/letters).
:- use_module(lexer/digits).

letter_or_digit(Code) :- letter(Code) ; digit(Code).

letter_or_digit_dcg(Code) --> [Code], { letter_or_digit(Code) }.

letters_or_digits_dcg([Code|Codes]) --> letter_or_digit_dcg(Code), letters_or_digits_dcg(Codes).
letters_or_digits_dcg([]) --> \+ letter_or_digit_dcg(_).