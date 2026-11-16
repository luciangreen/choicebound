% choicebound: work out, from a predicate's clauses alone, the most solutions (choicepoints)
% it can give for a list of length N, and certify it. A predicate recursing on a list's tail
% has the bound S(0) = B0, S(N) = B1 + R * S(N-1), where B0 counts clauses that answer the
% empty list, B1 the non-recursive clauses that answer a non-empty one, and R the recursive
% clauses. The bound is checked against real runs (a meta-interpreter counts the solutions).
%?- analyse(member, A).                  % A = rec(0, 1, 1): member has at most N solutions
%?- bound(member, 4, B).                 % B = 4
%?- bound(append_split, 3, B).           % B = 4: append(A, B, L) splits L in N + 1 ways
%?- actual(select, [a,b,c], K).          % K = 3
:- module(choicebound, [pred/3, analyse/2, bound/3, actual/3, deterministic/1, certificate/3]).
:- use_module(library(lists)).
:- use_module(library(apply)).

% pred(Name, Clauses, Goal^List): clauses as (Head :- Body); the goal to count solutions of, for a list.
pred(member, [ (mem(X, [X|_]) :- true), (mem(X, [_|T]) :- mem(X, T)) ], L^mem(_, L)).
pred(append_split, [ (app([], L, L) :- true), (app([H|T], L, [H|R]) :- app(T, L, R)) ], L^app(_, _, L)).
pred(select, [ (sel(X, [X|T], T) :- true), (sel(X, [H|T], [H|R]) :- sel(X, T, R)) ], L^sel(_, L, _)).
pred(last, [ (lst([X], X) :- true), (lst([_|T], X) :- lst(T, X)) ], L^lst(L, _)).
pred(length, [ (len([], 0) :- true), (len([_|T], N) :- len(T, M), N is M + 1) ], L^len(L, _)).
pred(twice, [ (tw([_|_]) :- true), (tw([_|_]) :- true), (tw([_|T]) :- tw(T)) ], L^tw(L)).

% analyse(+Pred, -rec(B0, B1, R)) from the clauses: which clauses can answer [] and [_|_], and which recurse.
analyse(P, rec(B0, B1, R)) :- pred(P, Cs, Tpl), copy_term(Tpl, _^G), functor(G, F, A),
    list_arg(G, I),
    include([C]>>( copy_term(C, (H :- B)), \+ calls(B, F/A), arg(I, H, X), \+ X \= [] ), Cs, Z), length(Z, B0),
    include([C]>>( copy_term(C, (H :- B)), \+ calls(B, F/A), arg(I, H, X), \+ X \= [_|_] ), Cs, O), length(O, B1),
    include([C]>>( copy_term(C, (_ :- B)), calls(B, F/A) ), Cs, Rs), length(Rs, R).
list_arg(G, I) :- arg(I, G, X), var(X), !.   % the list is the goal's first unbound-template argument
calls((A, B), FA) :- !, ( calls(A, FA) ; calls(B, FA) ).
calls(G, F/A) :- callable(G), functor(G, F, A).

% bound(+Pred, +N, -Bound)
bound(P, N, B) :- analyse(P, rec(B0, B1, R)), bound_(N, B0, B1, R, B).
bound_(0, B0, _, _, B0) :- !.
bound_(N, B0, B1, R, B) :- M is N - 1, bound_(M, B0, B1, R, Bm), B is B1 + R * Bm.

% actual(+Pred, +List, -Count): how many solutions really come out.
actual(P, L, K) :- pred(P, Cs, Tpl), copy_term(Tpl, L^G), aggregate_all(count, solve(Cs, G), K).
solve(_, true) :- !.
solve(Cs, (A, B)) :- !, solve(Cs, A), solve(Cs, B).
solve(_, G) :- predicate_property(system:G, built_in), !, call(G).
solve(Cs, G) :- member(C, Cs), copy_term(C, (H :- B)), H = G, solve(Cs, B).

deterministic(P) :- forall(between(0, 6, N), ( bound(P, N, B), B =< 1 )).

% certificate(+Pred, +MaxN, -Cert): the bound for each N, checked on a list of that length.
certificate(P, Max, cert(P, Rows)) :- numlist(0, Max, Ns), maplist([N, N-B-K]>>( bound(P, N, B), length(L, N), maplist(=(a), L), actual(P, L, K) ), Ns, Rows).
