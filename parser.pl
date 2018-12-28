% ==============================================================================
% Parser
% ==============================================================================

parser(Tokens,ParseTree) :-
    expression(ParseTree,Tokens,[]).

% ==============================================================================
% Expressions
% ==============================================================================

expression(X) --> addition(X), !.

addition(add(A,B)) --> multiplication(A), addOperator, addition(B), !.
addition(A) --> multiplication(A), !.

multiplication(mul(A,B)) --> unary(A), mulOperator, multiplication(B), !.
multiplication(A) --> unary(A), !.

unary(neg(X)) --> negOperator, unary(X), !.
unary(X) --> primary(X), !.

primary(X) --> number(X), !.
primary(X) --> "(", expression(X), ")", !.

number(number(Number)) --> [tFloat(Number)].
number(number(Number)) --> [tInteger(Number)].

negOperator --> [tMinus].
addOperator --> [tPlus].
mulOperator --> [tStar].
