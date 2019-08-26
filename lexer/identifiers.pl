% ==============================================================================
% Identifier Literals
% ==============================================================================

:- module(lexer_identifiers, [
        tIdentifier/3
        ]).

:- use_module(lexer/common).

tIdentifier(Value) --> letter(L), lettersOrDigits(LS), {
    stringCodes(Value,[L|LS])
}.
