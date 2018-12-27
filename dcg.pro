% expr --> term, addterm.
% addterm --> [].
% addterm --> [+], expr.
% term --> factor, multfactor.
% multfactor --> [].
% multfactor --> [*], term.
% factor --> [I], {integer(I)}.
% factor --> ['('], expr, [')'].

% expr(expr(Term,Addterm)) --> term(Term), addterm(Addterm).
% addterm(addterm) --> [].
% addterm(addterm(Expr)) --> [+], expr(Expr).
% term(term(Factor,Multfactor)) --> factor(Factor), multfactor(Multfactor).
% multfactor(multfactor) --> [].
% multfactor(multfactor(Term)) --> [*], term(Term).
% factor(factor(I)) --> [I], {integer(I)}.
% factor(factor(Expr)) --> ['('], expr(Expr), [')'].

% :- [library(dcg/basics)].


expr(addexpr(Term,Expr)) --> term(Term), [+], expr(Expr).
expr(expr(Term)) --> term(Term).
term(multerm(Factor,Term)) --> factor(Factor), [*], term(Term).
term(term(Factor)) --> factor(Factor).
factor(integer(I)) --> [I], {integer(I)}.
factor(Expr) --> ['('], expr(Expr), [')'].

% eval(expr(Term,AddTerm),X) :- eval(Term,X) , eval(AddTerm,X).
% eval(addterm,X).
% eval(addterm(Expr),X) :- 


float(float([H|T])) --> digit(H), float(T).
float([H,P|T]) --> digit(H), decimalpoint(P), digits(T).



optional_fraction(F) --> fraction(F).
optional_fraction(_) --> [].
fraction([H|T]) --> decimalpoint(H), digits(T).
decimalpoint(_) --> ['.'].

% integer(integer(I)) --> digits(I).

digits([D]) --> digit(D).
digits([H|T]) --> digit(H), digits(T).

digit(D) --> [D] , { '0' @=< D , D @=< ['9'] }.

eval(addexpr(Term,Expr),X) :- 
    eval(Term,X1),
    eval(Expr,X2),
    X is X1 + X2.
eval(expr(Expr),X) :- eval(Expr,X).
eval(multerm(Factor,Term),X) :-
    eval(Factor,X1),
    eval(Term,X2),
    X is X1 * X2.
eval(term(Term),X) :- eval(Term,X).
eval(integer(I),I).

token([tInteger(Value)|T]) --> skip_space, integer(Value), skip_space, token(T). 
token([tIf|T]) --> skip_space, if, skip_space, token(T).
token([tPeriod|T]) --> skip_space, period , skip_space,  token(T).
token([tComma|T]) --> skip_space, comma,skip_space,  token(T).
token([]) --> [], !.

integer(I,IS, X) :- digits(IS, IS, X), number_string(I,IS, X) .

number_string(N,S,_) :- number_string(N,S).

lparanthesis --> ['('].
rparanthesis --> [')'].
puls --> ['+'].
asterisk --> ['*'].
if --> ['i'], ['f'].
period --> ['.'].
comma --> [','].

lexer(String,StartRule,Tokens) :-
    string_chars(String,Chars),
    apply(StartRule,[Tokens,Chars,[]]).


% tokenize([],[]).
% tokenize(['.'],[tPeriod])



skip_space --> [C], {code_type(C, space)}, skip_space.
skip_space --> [].

% :- expr(X,[1,+,2],[]).
