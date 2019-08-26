% ==============================================================================
% Identifier Literals
% ==============================================================================

:- use_module(lexer/common).

tIdentifier(Value) --> letter(L), lettersOrDigits(LS), {
    stringCodes(Value,[L|LS])
}.
