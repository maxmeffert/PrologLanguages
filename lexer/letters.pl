% ==============================================================================
% Letter
% ==============================================================================

:- module(lexer_letters, [
        letter/1,
        letter_dcg/3,
        letters_dcg/3
        ]).

:- use_module(lexer/letters).

letter(Code) :- code_type(Code, alpha), !.

letter_dcg(Code) --> [Code], { letter(Code) }.

letters_dcg([Code|Codes]) --> letter_dcg(Code), letters_dcg(Codes).
letters_dcg([]) --> \+ letter_dcg(_).