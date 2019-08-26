% ==============================================================================
% Integer Number Literals
% ==============================================================================
:- module(lexer_integers, [
        token_integer_dcg/3
        ]).

:- use_module(lexer/common).
:- use_module(lexer/digits).

integer_literal(Digits,IntegerLiteral) :-
    string_codes(IntegerLiteral,Digits).

integer_literal_dcg([Digit|Digits]) --> 
    digit_dcg(Digit), 
    digits_dcg(Digits), !.

token_integer_dcg(IntegerLiteral) --> 
    integer_literal_dcg(Digits), 
    { integer_literal(Digits,IntegerLiteral) }.