% ==============================================================================
% Boolean Literals
% ==============================================================================

:- module(lexer_booleans, [
    token_boolean_dcg/3
    ]).

:- use_module(lexer/common).

token_boolean_dcg(true) --> letters(LS), { stringCodes("true", LS) }.
token_boolean_dcg(false) --> letters(LS), { stringCodes("false", LS) }.
