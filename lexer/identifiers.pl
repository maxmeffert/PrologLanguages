% ==============================================================================
% Identifier Literals
% ==============================================================================

:- module(lexer_identifiers, [
        token_identifier_dcg/3
        ]).

:- use_module(lexer/letters).
:- use_module(lexer/letters_or_digits).

token_identifier_dcg(Value) --> letter_dcg(L), letters_or_digits_dcg(LS), {
    string_codes(Value,[L|LS])
}.
