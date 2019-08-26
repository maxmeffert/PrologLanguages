% ==============================================================================
% Keyword Literals
% ==============================================================================

:- use_module(lexer/common).

tKeyword(if) --> letters(LS), { stringCodes("if", LS) }.
tKeyword(else) --> letters(LS), { stringCodes("else", LS) }.
tKeyword(while) --> letters(LS), { stringCodes("while", LS) }.
tKeyword(var) --> letters(LS), { stringCodes("var", LS) }.

