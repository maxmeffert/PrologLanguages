% ==============================================================================
% Boolean Literals
% ==============================================================================

:- ensure_loaded('lexer.common.pl').

tBoolean(true) --> letters(LS), { string_codes("true", LS) }.
tBoolean(false) --> letters(LS), { string_codes("false", LS) }.
