% ==============================================================================
% Floating Point Number Literals
% ==============================================================================

:- module(lexer_floats, [
    token_float_dcg/3
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
    digits_dcg(Digits), !.

float_decimal_point_dcg(Code) --> string_code_dcg(".",Code).
float_exponent_dcg(Code) --> string_code_dcg("e",Code).

float_fraction_literal_dcg([P,D|DS]) --> 
    float_decimal_point_dcg(P), 
    digit_dcg(D), 
    digits_dcg(DS), !.

float_exponent_literal_dcg([FloatExponent|IntegerLiteral]) --> 
    float_exponent_dcg(FloatExponent), 
    signed_integer_literal_dcg(IntegerLiteral), !.
float_exponent_literal_dcg([FloatExponent|IntegerLiteral]) --> 
    float_exponent_dcg(FloatExponent), 
    signed_integer_literal_dcg(IntegerLiteral), !.
float_exponent_literal_dcg([FloatExponent|IntegerLiteral]) --> 
    float_exponent_dcg(FloatExponent), 
    unsigned_integer_literal_dcg(IntegerLiteral), !.

float_literal(IntegerLiteral,FloatFractionLiteral,FloatExponentLiteral,FloatLiteral) :-
    append(IntegerLiteral,FloatFractionLiteral,X), 
    append(X,FloatExponentLiteral,FloatLiteral).

float_literal_without_exponent(IntegerLiteral,FloatFractionLiteral,FloatLiteral) :-
    append(IntegerLiteral,FloatFractionLiteral,FloatLiteral).

float_literal_without_fraction(IntegerLiteral,FloatExponentLiteral,FloatLiteral) :-
    append(IntegerLiteral,FloatExponentLiteral,FloatLiteral).

float_literal_dcg(FloatLiteral) --> 
    unsigned_integer_literal_dcg(IntegerLiteral), 
    float_fraction_literal_dcg(FloatFractionLiteral), 
    float_exponent_literal_dcg(FloatExponentLiteral), !, 
    { float_literal(IntegerLiteral,FloatFractionLiteral,FloatExponentLiteral,FloatLiteral) }.

float_literal_dcg(FloatLiteral) --> 
    unsigned_integer_literal_dcg(IntegerLiteral), 
    float_fraction_literal_dcg(FloatFractionLiteral), !,
    { float_literal_without_exponent(IntegerLiteral,FloatFractionLiteral,FloatLiteral) }.

float_literal_dcg(FloatLiteral) --> 
    unsigned_integer_literal_dcg(IntegerLiteral), 
    float_exponent_literal_dcg(FloatExponentLiteral), !, 
    { float_literal_without_fraction(IntegerLiteral,FloatExponentLiteral,FloatLiteral) }.

float_literal(Codes,FloatLiteral) :-
    string_codes(FloatLiteral,Codes).

token_float_dcg(FloatLiteral) --> 
    float_literal_dcg(Codes), 
    { float_literal(Codes,FloatLiteral) }.