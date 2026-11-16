% Theorems, proved by exhaustion. Run: swipl -g main -t halt proofs/theorems.pl
:- module(theorems, [main/0]).
:- use_module(prove).
:- discontiguous theorem/1.
:- use_module(library(lists)).
:- use_module(library(apply)).
main :- prove_all(theorems).
:- use_module('../prolog/choicebound').

% Domain: every predicate; every list of length 0..5.

% 1. The bound is sound: no list of length N gives more solutions than the bound.
theorem(bound_is_sound) :- forall(( pred(P, _, _), between(0, 5, N), length(L, N), maplist(=(a), L) ), ( bound(P, N, B), actual(P, L, K), K =< B )).

% 2. For these predicates the bound is exact (it is reached).
theorem(bound_is_exact) :- forall(( pred(P, _, _), between(0, 5, N), length(L, N), numlist(1, N, L0), ( N =:= 0 -> L = [] ; L = L0 ) ), ( bound(P, N, B), actual(P, L, B) )).

% 3. The known counts: member and select give N, append's splits N + 1, last and length 1 (when N > 0 for last).
theorem(known_counts) :- forall(between(1, 5, N), ( bound(member, N, N), bound(select, N, N), N1 is N + 1, bound(append_split, N, N1), bound(last, N, 1), bound(length, N, 1) )).

% 4. deterministic holds exactly for the predicates whose bound never passes 1.
theorem(deterministic_iff_bound_le_one) :- forall(pred(P, _, _), iff(deterministic(P), forall(between(0, 6, N), ( bound(P, N, B), B =< 1 )))).

% 5. The certificate's rows all hold.
theorem(certificate_holds) :- forall(pred(P, _, _), ( certificate(P, 4, cert(P, Rows)), forall(member(_-B-K, Rows), K =< B) )).
