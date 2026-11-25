% choicebound: work out, from a predicate's clauses alone, the most solutions (choicepoints)
% it can give for a list of length N, and certify it. For a predicate that recurses on a list's
% tail, S(N) = (non-recursive clauses whose head fits a list of length N)
%            + (recursive clauses whose head fits it) * S(N - 1).
% The bound is checked against real runs (a meta-interpreter counts the solutions).
%?- analyse(member, A).                  % A = [base, rec]
%?- bound(member, 4, B).                 % B = 4
%?- bound(append_split, 3, B).           % B = 4: append(A, B, L) splits L in N + 1 ways
%?- bound(last, 5, B).                   % B = 1: lst([X], X) fits only a list of length 1
%?- actual(select, [a,b,c], K).          % K = 3
%?- bound(pick2, 4, B).                  % B = 16: between(1, 2, _) gives two answers for each item
:- module(choicebound, [pred/3, analyse/2, bound/3, actual/3, deterministic/1, certificate/3]).
:- use_module(library(lists)).
:- use_module(library(apply)).

% pred(Name, Clauses, Goal^List): clauses as (Head :- Body); the goal to count solutions of, for a list.
pred(member, [ (mem(X, [X|_]) :- true), (mem(X, [_|T]) :- mem(X, T)) ], L^mem(_, L)).
pred(append_split, [ (app([], L, L) :- true), (app([H|T], L, [H|R]) :- app(T, L, R)) ], L^app(_, _, L)).
pred(select, [ (sel(X, [X|T], T) :- true), (sel(X, [H|T], [H|R]) :- sel(X, T, R)) ], L^sel(_, L, _)).
pred(last, [ (lst([X], X) :- true), (lst([_|T], X) :- lst(T, X)) ], L^lst(L, _)).
pred(length, [ (len([], 0) :- true), (len([_|T], N) :- len(T, M), N is M + 1) ], L^len(L, _)).
pred(pick2, [ (pk([]) :- true), (pk([_|T]) :- between(1, 2, _), pk(T)) ], L^pk(L)).   % two choices per item: 2^N answers
pred(twice, [ (tw([_|_]) :- true), (tw([_|_]) :- true), (tw([_|T]) :- tw(T)) ], L^tw(L)).

% analyse(+Pred, -Kinds): base or rec for each clause, in order.
analyse(P, Ks) :- pred(P, Cs, Tpl), copy_term(Tpl, _^G), functor(G, F, A),
    maplist([C, K]>>( copy_term(C, (_ :- B)), ( calls(B, F/A) -> K = rec ; K = base ) ), Cs, Ks).
calls((A, B), FA) :- !, ( calls(A, FA) ; calls(B, FA) ).
calls(G, F/A) :- callable(G), functor(G, F, A).

% body_weight(+Body, +Self, -W): the most answers the body's goals other than the recursive call can give.
body_weight((A, B), S, W) :- !, body_weight(A, S, Wa), body_weight(B, S, Wb), W is Wa * Wb.
body_weight(G, F/A, 1) :- callable(G), functor(G, F, A), !.
body_weight(G, _, W) :- goal_answers(G, W).
goal_answers(true, 1).
goal_answers(between(L, H, _), W) :- integer(L), integer(H), W is max(0, H - L + 1).
goal_answers(G, 1) :- functor(G, F, 2), memberchk(F, [is, =, \=, ==, \==, <, >, =<, >=, =:=, =\=]).

% fits(+Pred, +Clause, +N): the clause's head can take a list of length N in the list's place.
fits(P, C, N) :- pred(P, _, Tpl), copy_term(Tpl, L^G), length(L, N), copy_term(C, (H :- _)), \+ \+ H = G.

% bound(+Pred, +N, -Bound). Each clause counts as many answers as its other body goals can give together
% (one for a test or an arithmetic goal, H - L + 1 for between(L, H, _)); a goal whose answers are not
% known (another predicate, or between with unknown limits) gives no bound at all, rather than a wrong one.
bound(P, N, B) :- pred(P, Cs, _), analyse(P, Ks), pred(P, _, Tpl), copy_term(Tpl, _^G0), functor(G0, F, A),
    maplist([C, W]>>( copy_term(C, (_ :- Body)), body_weight(Body, F/A, W) ), Cs, Ws),
    aggregate_all(sum(W), ( nth1(I, Cs, C), nth1(I, Ks, base), nth1(I, Ws, W), fits(P, C, N) ), Base),
    aggregate_all(sum(W), ( nth1(I, Cs, C), nth1(I, Ks, rec), nth1(I, Ws, W), fits(P, C, N) ), Rec),
    ( Rec =:= 0 -> B = Base ; N =:= 0 -> B = Base ; M is N - 1, bound(P, M, Bm), B is Base + Rec * Bm ).

% actual(+Pred, +List, -Count): how many solutions really come out.
actual(P, L, K) :- pred(P, Cs, Tpl), copy_term(Tpl, L^G), aggregate_all(count, solve(Cs, G), K).
solve(_, true) :- !.
solve(Cs, (A, B)) :- !, solve(Cs, A), solve(Cs, B).
solve(_, G) :- predicate_property(system:G, built_in), !, call(G).
solve(Cs, G) :- member(C, Cs), copy_term(C, (H :- B)), H = G, solve(Cs, B).

deterministic(P) :- forall(between(0, 6, N), ( bound(P, N, B), B =< 1 )).

% certificate(+Pred, +MaxN, -Cert): the bound for each N, checked on a list of that length.
certificate(P, Max, cert(P, Rows)) :- numlist(0, Max, Ns), maplist([N, N-B-K]>>( bound(P, N, B), length(L, N), maplist(=(a), L), actual(P, L, K) ), Ns, Rows).
