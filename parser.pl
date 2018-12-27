
expr(add(Term1,Term2)) --> term(Term1), addOperator, term(Term2), !.
expr(Term) --> term(Term), !.
term(mul(Factor1,Factor2)) --> factor(Factor1), mulOperator, factor(Factor2), !.
term(neg(Term)) --> negOperator, factor(Term), !.
term(Term) --> factor(Term), !.
factor(Factor) --> number(Factor), !.
factor(Factor) --> "(", expr(Factor), ")", !.

number(number(Number)) --> [tFloat(Number)].
number(number(Number)) --> [tInteger(Number)].
negOperator --> [tMinus].
addOperator --> [tPlus].
mulOperator --> [tAsterisk].

parser(Tokens,ParseTree) :-
    expr(ParseTree,Tokens,[]).

eval(number(N),N).
eval(add(A,B),Result) :- 
    eval(A,R1),
    eval(B,R2),
    Result is R1 + R2.
eval(mul(A,B),Result) :-
    eval(A,R1),
    eval(B,R2),
    Result is R1 * R2.
eval(neg(X), Result) :-
    eval(X,R),
    Result is -R.

:- ['lexer.pl'].

run(X) :-
    lexer("-1+2+5",Tokens),
    parser(Tokens,ParseTree),
    eval(ParseTree,X).