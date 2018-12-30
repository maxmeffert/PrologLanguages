% ==============================================================================
% Parser
% ==============================================================================

:- module(parser, [
    parser/2,
    parser/3,
    program/3
    ]).

parser(Tokens,ParseTree) :-
    parser(Tokens,expression,ParseTree).
    % expression(ParseTree,Tokens,[]).

parser(Tokens,Grammar,ParseTree) :-
    apply(Grammar,[ParseTree,Tokens,[]]).

% ==============================================================================
% Program
% ==============================================================================

program(program(X)) --> declarations(X), !.

declarations([X|XS]) --> declaration(X), declarations(XS).
declarations([]) --> \+ declaration(_).

declaration(X) --> varDeclaration(X), !.

varDeclaration(varDeclaration(X,V)) --> [token(var)], identifier(X), [token("=")], expression(V), [token(";")], !.
varDeclaration(varDeclaration(X)) --> [token(var)], identifier(X), [token(";")], !.


% ==============================================================================
% Expressions
% ==============================================================================

expression(X) --> equality(X), !.
expression(X) --> comparison(X), !.
expression(X) --> addition(X), !.

equality(eq(A,B)) --> addition(A), equalsEquals, addition(B), !.
equality(neq(A,B)) --> addition(A), exclamationEquals, addition(B), !.

comparison(gte(A,B)) --> addition(A), greaterEquals, addition(B), !.
comparison(lte(A,B)) --> addition(A), lessEquals, addition(B), !.
comparison(gt(A,B)) --> addition(A), greater, addition(B), !.
comparison(lt(A,B)) --> addition(A), less, addition(B), !.


addition(add(A,B)) --> multiplication(A), plus, addition(B), !.
addition(sub(A,B)) --> multiplication(A), minus, addition(B), !.
addition(X) --> multiplication(X), !.

multiplication(mul(A,B)) --> unary(A), star, multiplication(B), !.
multiplication(X) --> unary(X), !.

unary(neg(X)) --> minus, unary(X), !.
unary(X) --> primary(X), !.

primary(X) --> numberLiteral(X), !.
primary(X) --> leftParan, expression(X), rightParan, !.

numberLiteral(number(Number)) --> integerLiteral(integer(Number)).
numberLiteral(number(Number)) --> floatLiteral(float(Number)).

integerLiteral(integer(X)) --> [token(integer,X)].
floatLiteral(float(X)) --> [token(float,X)].

stringLiteral(string(X)) --> [token(string,X)].

booleanLiteral(boolean(X)) --> [token(boolean,X)].

identifier(X) --> [token(identifier,X)].

plus --> [token("+")].
minus --> [token("-")].
star --> [token("*")].
equalsEquals --> [token("==")].
exclamationEquals --> [token("!=")].
greater --> [token(">")].
less --> [token("<")].
greaterEquals --> [token(">=")].
lessEquals --> [token("<=")].
leftParan --> [token("(")].
rightParan --> [token(")")].
