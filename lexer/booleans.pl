% ==============================================================================
% Boolean Literals
% ==============================================================================

:- module(lexer_booleans, [
    token_boolean_dcg/3
    ]).

:- use_module(lexer/common).
:- use_module(lexer/letters).

token_boolean_dcg(true) --> letters_dcg(LS), { stringCodes("true", LS) }.
token_boolean_dcg(false) --> letters_dcg(LS), { stringCodes("false", LS) }.
