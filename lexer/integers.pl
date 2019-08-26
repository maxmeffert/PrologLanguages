% ==============================================================================
% Integer Number Literals
% ==============================================================================
:- module(lexer_integers, [
        token_integer_dcg/3,
        signedIntegerLiteral/3,
        integerLiteral/3
        ]).

:- use_module(lexer/common).
:- use_module(lexer/digits).

sign(Code) --> string_code_dcg("+",Code).
sign(Code) --> string_code_dcg("-",Code).

signedIntegerLiteral([S,D|DS]) --> sign(S), digit_dcg(D), digits_dcg(DS).
integerLiteral([D|DS]) --> digit_dcg(D), digits_dcg(DS).

token_integer_dcg(IntegerValue) --> integerLiteral(IntegerLiteral), {
    number_string(IntegerValue,IntegerLiteral)
}.