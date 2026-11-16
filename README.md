# choicebound

work out, from a predicate's clauses alone, the most solutions (choicepoints) it can give for a list of length N, and certify it. A predicate recursing on a list's tail has the bound S(0) = B0, S(N) = B1 + R * S(N-1), where B0 counts clauses that answer the empty list, B1 the non-recursive clauses that answer a non-empty one, and R the recursive clauses. The bound is checked against real runs (a meta-interpreter counts the solutions).

## Use

```prolog
?- use_module(prolog/choicebound).
?- analyse(member, A).                  % A = rec(0, 1, 1): member has at most N solutions
?- bound(member, 4, B).                 % B = 4
?- bound(append_split, 3, B).           % B = 4: append(A, B, L) splits L in N + 1 ways
?- actual(select, [a,b,c], K).          % K = 3
```

## Proofs

`proofs/theorems.pl` proves 5 theorems by exhaustion: each one is checked for every case in a finite domain that covers every branch of the definitions. every predicate; every list of length 0..5.

1. The bound is sound: no list of length N gives more solutions than the bound.
2. For these predicates the bound is exact (it is reached).
3. The known counts: member and select give N, append's splits N + 1, last and length 1 (when N > 0 for last).
4. deterministic holds exactly for the predicates whose bound never passes 1.
5. The certificate's rows all hold.

```sh
swipl -g main -t halt proofs/theorems.pl
```

## 200 inputs and outputs

`io/ios.txt` lists 200 inputs and outputs from real runs, and `io/ios.pl` has the same as Prolog facts. The inputs come from a fixed seed (`io/cases.pl`). `swipl -g check -t halt io/run.pl` runs them again. It fails if any output changes, or if a predicate doesn't confirm its own recorded output, which checks steadfastness. GitHub Actions runs the proofs and the examples on every push, and records the examples on the first push.

Licence: BSD-3-Clause.
