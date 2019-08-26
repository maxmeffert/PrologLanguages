% ==============================================================================
% Identifier Literals
% ==============================================================================

:- module(lexer_identifiers, [
        token_identifier_dcg/3
        ]).

:- use_module(lexer/common).

token_identifier_dcg(Value) --> letter(L), lettersOrDigits(LS), {
    stringCodes(Value,[L|LS])
}.
