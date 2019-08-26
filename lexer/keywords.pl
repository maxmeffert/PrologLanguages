% ==============================================================================
% Keyword Literals
% ==============================================================================

:- module(lexer_keywords, [
        token_keyword_dcg/3
        ]).

:- use_module(lexer/letters).

token_keyword_dcg(if) --> letters_dcg(LS), { string_codes("if", LS) }.
token_keyword_dcg(else) --> letters_dcg(LS), { string_codes("else", LS) }.
token_keyword_dcg(while) --> letters_dcg(LS), { string_codes("while", LS) }.
token_keyword_dcg(var) --> letters_dcg(LS), { string_codes("var", LS) }.

