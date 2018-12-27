
% takeWhile(List,Predicate,Taken,Remainder)     

takeWhile([],_,[],[]).
% takeWhile([X],Predicate,[X],[]) :- apply(Predicate,[X]).
% takeWhile([X],Predicate,[],[X]) :- not(apply(Predicate,[X])), !.

takeWhile([H|T],Predicate,Result,Remainder) :-
    apply(Predicate,[H]) -> (takeWhile(T,Predicate,Res,Remainder), Result = [H|Res]);
    Remainder = [].

bar(X) :- X @=< 5.

takeN([],_,[],[]).
takeN(XS,N,[],XS) :- N =< 0, !.
takeN([H|T],N,[H|Result],Remainder) :-
    M is N-1,
    takeN(T,M,Result,Remainder).

takeP([],_,[],[]).
takeP([H|T],Predicate,[],[H|T]) :- not(apply(Predicate,[H])), !.
takeP([H|T],Predicate,[H|Result],Remainder) :-
    apply(Predicate,[H]),
    takeP(T,Predicate,Result,Remainder).