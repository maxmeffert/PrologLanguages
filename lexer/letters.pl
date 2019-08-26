% ==============================================================================
% Letter
% ==============================================================================

:- module(lexer_letters, [
        letter/1,
        letter/3,
        letters/3
        ]).

:- use_module(lexer/letters).

letter(Code) :- code_type(Code, alpha), !.

letter(Code) --> [Code], { letter(Code) }.

letters([Code|Codes]) --> letter(Code), letters(Codes).
letters([]) --> \+ letter(_).