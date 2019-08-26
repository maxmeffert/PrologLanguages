% ==============================================================================
% Boolean Literals
% ==============================================================================

:- ensure_loaded('lexer.common.pl').

tBoolean(true) --> letters(LS), { stringCodes("true", LS) }.
tBoolean(false) --> letters(LS), { stringCodes("false", LS) }.
