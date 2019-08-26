% ==============================================================================
% Identifier Literals
% ==============================================================================

:- ensure_loaded('lexer.common.pl').

tIdentifier(Value) --> letter(L), lettersOrDigits(LS), {
    stringCodes(Value,[L|LS])
}.
