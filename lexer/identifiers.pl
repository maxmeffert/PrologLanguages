% ==============================================================================
% Identifier Literals
% ==============================================================================

:- module(lexer_identifiers, [
        token_identifier_dcg/3
        ]).

:- use_module(lexer/common).
:- use_module(lexer/letters).
:- use_module(lexer/letters_or_digits).

token_identifier_dcg(Value) --> letter(L), lettersOrDigits(LS), {
    stringCodes(Value,[L|LS])
}.
