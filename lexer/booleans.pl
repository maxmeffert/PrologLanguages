% ==============================================================================
% Boolean Literals
% ==============================================================================

:- module(lexer_booleans, [
    token_boolean_dcg/3
    ]).

:- use_module(lexer/letters).

token_boolean_dcg(true) --> letters_dcg(LS), { string_codes("true", LS) }.
token_boolean_dcg(false) --> letters_dcg(LS), { string_codes("false", LS) }.
