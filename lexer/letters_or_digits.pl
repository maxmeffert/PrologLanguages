% ==============================================================================
% Letters Or Digits
% ==============================================================================

:- module(lexer_letters_or_digits, [
        letterOrDigit/1,
        letterOrDigit/3,
        lettersOrDigits/3
        ]).

:- use_module(lexer/letters).
:- use_module(lexer/digits).

letterOrDigit(Code) :- letter(Code) ; digit(Code).

letterOrDigit(Code) --> [Code], { letterOrDigit(Code) }.

lettersOrDigits([Code|Codes]) --> letterOrDigit(Code), lettersOrDigits(Codes).
lettersOrDigits([]) --> \+ letterOrDigit(_).