:-dynamic (jap/2).
:-dynamic (nom/2).
:-dynamic (listtran/2).
:-dynamic (nom1/2).

%exercice 1

appart(_,[]):-false.
appart(X,[X|_]).
appart(X,[_|L]):-appart(X,L).


inclus([],_).
inclus([X|L1],L2):-appart(X,L2),inclus(L1,L2).


elements_rang_impair([], []).
elements_rang_impair([X], [X]).
elements_rang_impair([X,_|Y],[X|L]):- elements_rang_impair(Y, L).


successif(X,Y,[X,Y|_]).
successif(Y,X,[X,Y|_]).
successif(X,Y,[_|L]):-successif(X,Y,L).


%exercice 2



nom(itchi,X1):-X1 is 1.
nom(ni,X2):-X2 is 2.
nom(san,X3):-X3 is 3.
nom(shi,X4):-X4 is 4.
nom(go,X5):-X5 is 5.
nom(oku,X6):-X6 is 6.
nom(shitchi,X7):-X7 is 7.
nom(hatchi,X8):-X8 is 8.
nom(ku,X9):-X9 is 9.
nom(giu,X10):-X10 is 10.
nom(hyaku,X100):-X100 is 100.
nom(sen,X1000):-X1000 is 1000.
nom(man,X10000):-X10000 is 10000.


jap([X],N) :- nom(X,N).
jap([X,Y|L],N):-nom(X,Y1),jap(L,M),nom(Y,Y2),N is Y1*Y2+M.



%exercice 3



couleur(vert).
couleur(rouge).
couleur(bleu).

coloriage(C1, C2, C3, C4):- couleur(C1), couleur(C2), couleur(C3), couleur(C4),
C1\=C2, C1\=C3, C1\=C4,
C2\=C3, C3\=C4.

