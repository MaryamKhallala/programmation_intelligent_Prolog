

tri(L,L1) :-echange(L,L2),!,tri(L2,L1).
tri(L1,L1).


echange([X,Y|L], [Y,X|L]):-X>Y.
echange([Z|L], [Z|L1]) :-echange(L,L1).
