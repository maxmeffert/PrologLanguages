% ==============================================================================
% Integer Number Literals
% ==============================================================================
:- module(lexer_integers, [
        token_integer_dcg/3,
        signed_integer_literal_dcg/3,
        unsigned_integer_literal_dcg/3
        ]).

:- use_module(lexer/common).
:- use_module(lexer/digits).

sign_dcg(Code) --> string_code_dcg("+",Code).
sign_dcg(Code) --> string_code_dcg("-",Code).

signed_integer_literal_dcg([S,D|DS]) --> 
    sign_dcg(S), 
    digit_dcg(D), 
    digits_dcg(DS).

unsigned_integer_literal_dcg([D|DS]) --> 
    digit_dcg(D), 
    digits_dcg(DS).

token_integer_dcg(IntegerValue) --> 
    unsigned_integer_literal_dcg(IntegerLiteral), 
    { number_string(IntegerValue,IntegerLiteral) }.