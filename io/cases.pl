:- module(cases, [title/1, case/3]).
:- use_module('../prolog/choicebound').
:- use_module(engine).
title('choicebound').
pred_g(P) :- rnd_pick([member, append_split, select, last, length, twice], P).
case(analyse, [P], analyse) :- pred_g(P).
case(bound, [P, N], bound) :- pred_g(P), rnd_int(0, 12, N).
case(actual, [P, L], actual) :- pred_g(P), rnd_int(0, 6, N), length(L, N), maplist([X]>>rnd_pick([a, b, c], X), L).
case(certificate, [P, M], certificate) :- pred_g(P), rnd_int(0, 4, M).
