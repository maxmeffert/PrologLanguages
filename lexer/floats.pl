% ==============================================================================
% Floating Point Number Literals
% ==============================================================================

:- module(lexer_floats, [
    token_float_dcg/3
    ]).

:- use_module(lexer/common).
:- use_module(lexer/digits).
:- use_module(lexer/integers).

float_decimal_point_dcg(Code) --> string_code_dcg(".",Code).
float_exponent_dcg(Code) --> string_code_dcg("e",Code).

float_fraction_literal_dcg([P,D|DS]) --> 
    float_decimal_point_dcg(P), 
    digit_dcg(D), 
    digits_dcg(DS).

float_exponent_literal_dcg([FloatExponent|IntegerLiteral]) --> 
    float_exponent_dcg(FloatExponent), 
    signedIntegerLiteral(IntegerLiteral).
float_exponent_literal_dcg([FloatExponent|IntegerLiteral]) --> 
    float_exponent_dcg(FloatExponent), 
    integerLiteral(IntegerLiteral).

float_literal_dcg(FloatLiteral) --> 
    integerLiteral(IntegerLiteral), 
    float_fraction_literal_dcg(FloatFractionLiteral), 
    float_exponent_literal_dcg(FloatExponentLiteral), 
    { append(IntegerLiteral,FloatFractionLiteral,X), append(X,FloatExponentLiteral,FloatLiteral) }.

float_literal_dcg(FloatLiteral) --> 
    integerLiteral(IntegerLiteral), 
    float_fraction_literal_dcg(FloatFractionLiteral), 
    { append(IntegerLiteral,FloatFractionLiteral,FloatLiteral) }.

float_literal_dcg(FloatLiteral) --> 
    integerLiteral(IntegerLiteral), 
    float_exponent_literal_dcg(FloatExponentLiteral), 
    { append(IntegerLiteral,FloatExponentLiteral,FloatLiteral) }.

token_float_dcg(FloatValue) --> 
    float_literal_dcg(FloatLiteral), 
    { number_string(FloatValue,FloatLiteral) }.