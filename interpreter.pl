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

