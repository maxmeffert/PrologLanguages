% ==============================================================================
% Integer Number Literals
% ==============================================================================

:- use_module(lexer/common).

sign(Code) --> stringCode("+",Code).
sign(Code) --> stringCode("-",Code).

signedIntegerLiteral([S,D|DS]) --> sign(S), digit(D), digits(DS).
integerLiteral([D|DS]) --> digit(D), digits(DS).

tInteger(IntegerValue) --> integerLiteral(IntegerLiteral), {
    number_string(IntegerValue,IntegerLiteral)
}.