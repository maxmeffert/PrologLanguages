% ==============================================================================
% Integer Number Literals
% ==============================================================================
:- module(lexer_integers, [
        token_integer_dcg/3,
        signedIntegerLiteral/3,
        integerLiteral/3
        ]).

:- use_module(lexer/common).

sign(Code) --> stringCode("+",Code).
sign(Code) --> stringCode("-",Code).

signedIntegerLiteral([S,D|DS]) --> sign(S), digit(D), digits(DS).
integerLiteral([D|DS]) --> digit(D), digits(DS).

token_integer_dcg(IntegerValue) --> integerLiteral(IntegerLiteral), {
    number_string(IntegerValue,IntegerLiteral)
}.