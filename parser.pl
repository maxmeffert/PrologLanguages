% ==============================================================================
% Parser
% ==============================================================================

parser(Tokens,ParseTree) :-
    parser(Tokens,expression,ParseTree).
    % expression(ParseTree,Tokens,[]).

parser(Tokens,Grammar,ParseTree) :-
    apply(Grammar,[ParseTree,Tokens,[]]).

% ==============================================================================
% Expressions
% ==============================================================================

expression(X) --> addition(X), !.

addition(add(A,B)) --> multiplication(A), plus, addition(B), !.
addition(sub(A,B)) --> multiplication(A), minus, addition(B), !.
addition(X) --> multiplication(X), !.

multiplication(mul(A,B)) --> unary(A), star, multiplication(B), !.
multiplication(X) --> unary(X), !.

unary(neg(X)) --> minus, unary(X), !.
unary(X) --> primary(X), !.

primary(X) --> rNumberLiteral(X), !.
primary(X) --> leftParan, expression(X), rightParan, !.

rNumberLiteral(number(Number)) --> rIntegerLiteral(integer(Number)).
rNumberLiteral(number(Number)) --> rFloatLiteral(float(Number)).

rIntegerLiteral(integer(X)) --> [token(integer,X)].
rFloatLiteral(float(X)) --> [token(float,X)].

rStringLiteral(string(X)) --> [token(string,X)].

rBooleanLiteral(boolean(X)) --> [token(boolean,X)].

plus --> [token("+")].
minus --> [token("-")].
star --> [token("*")].
leftParan --> [token("(")].
rightParan --> [token(")")].
