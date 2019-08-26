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

signed_integer_literal_dcg([Sign,Digit|Digits]) --> 
    sign_dcg(Sign), 
    digit_dcg(Digit), 
    digits_dcg(Digits).

unsigned_integer_literal_dcg([Digit|Digits]) --> 
    digit_dcg(Digit), 
    digits_dcg(Digits).

token_integer_dcg(IntegerValue) --> 
    unsigned_integer_literal_dcg(IntegerLiteral), 
    { number_string(IntegerValue,IntegerLiteral) }.