% ==============================================================================
% Keyword Literals
% ==============================================================================

:- ensure_loaded('lexer.common.pl').

tKeyword(if) --> letters(LS), { string_codes("if", LS) }.
tKeyword(else) --> letters(LS), { string_codes("else", LS) }.
tKeyword(while) --> letters(LS), { string_codes("while", LS) }.
tKeyword(var) --> letters(LS), { string_codes("var", LS) }.

