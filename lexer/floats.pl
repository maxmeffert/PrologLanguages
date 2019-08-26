% ==============================================================================
% Floating Point Number Literals
% ==============================================================================

:- module(lexer_floats, [
    token_float_dcg/3
    ]).

:- use_module(lexer/common).
:- use_module(lexer/integers).

floatDecimalPoint(Code) --> stringCode(".",Code).
floatExponent(Code) --> stringCode("e",Code).

floatFractionLiteral([P,D|DS]) --> floatDecimalPoint(P), digit(D), digits(DS).

floatExponentLiteral([FloatExponent|IntegerLiteral]) --> floatExponent(FloatExponent), signedIntegerLiteral(IntegerLiteral).
floatExponentLiteral([FloatExponent|IntegerLiteral]) --> floatExponent(FloatExponent), integerLiteral(IntegerLiteral).

floatLiteral(FloatLiteral) --> integerLiteral(IntegerLiteral), floatFractionLiteral(FloatFractionLiteral), floatExponentLiteral(FloatExponentLiteral), {
    append(IntegerLiteral,FloatFractionLiteral,X),
    append(X,FloatExponentLiteral,FloatLiteral)
}.
floatLiteral(FloatLiteral) --> integerLiteral(IntegerLiteral), floatFractionLiteral(FloatFractionLiteral), {
    append(IntegerLiteral,FloatFractionLiteral,FloatLiteral)
}.
floatLiteral(FloatLiteral) --> integerLiteral(IntegerLiteral), floatExponentLiteral(FloatExponentLiteral), {
    append(IntegerLiteral,FloatExponentLiteral,FloatLiteral)
}.

token_float_dcg(FloatValue) --> floatLiteral(FloatLiteral), {
    number_string(FloatValue,FloatLiteral)
}.