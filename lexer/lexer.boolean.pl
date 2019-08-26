% ==============================================================================
% Boolean Literals
% ==============================================================================

:- use_module(lexer/common).

tBoolean(true) --> letters(LS), { stringCodes("true", LS) }.
tBoolean(false) --> letters(LS), { stringCodes("false", LS) }.
