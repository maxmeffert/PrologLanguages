% ==============================================================================
% Keyword Literals
% ==============================================================================

:- module(lexer_keywords, [
        token_keyword_dcg/3
        ]).

:- use_module(lexer/common).
:- use_module(lexer/letters).

token_keyword_dcg(if) --> letters(LS), { stringCodes("if", LS) }.
token_keyword_dcg(else) --> letters(LS), { stringCodes("else", LS) }.
token_keyword_dcg(while) --> letters(LS), { stringCodes("while", LS) }.
token_keyword_dcg(var) --> letters(LS), { stringCodes("var", LS) }.

