% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.


%tester les listes
%adopter par le prof comme meilleur solution

tete([X],X1,[]):-X1 is X.
tete([X,Y],X1,X2):-X1 is X,X2 is Y.
tete([X|L],X,L).



ajoutTete(X,L,[X|L]).


ajoutFin(X,[],[X]).
ajoutFin(X,[Y|L1],L2):- ajoutTete(Y,L3,L2),ajoutFin(X,L1,L3).


inverser([],[]).
inverser([X|L1],L2):-inverser(L1,L3),ajoutFin(X,L3,L2).



concatener([],L2,L2).
concatener([X|L1],L2,L3):-ajoutTete(X,L4,L3),concatener(L1,L2,L4).


long([],0).
long([_|Y],L) :- long(Y,L2),L is L2 + 1.


lastElm([X],X).
lastElm([_|L],X) :- lastElm(L,X).



position(X,[X|_],1).
position(X,[_|L],Y):-position(X,L,Z),Y is Z+1.


supp(_,[],[]).
supp(X,[X|L],L).
supp(X,[P|R],[P|L]):-supp(X,R,L).



supp_occ(_,[],[]).
supp_occ(X,[X|L],L1) :- supp_occ(X,L,L1).
supp_occ(Z,[X|L],[X|L1]) :- Z \= X , supp_occ(Z,L,L1).

%le teste permet de forcer la resultat


substitue(_,_,[],[]).
substitue(X,Y,[X|L],[Y|L1]) :- substitue(X,Y,L,L1).
substitue(X,Y,[Z|L],[Z|L1]) :- X\=Z, substitue(X,Y,L,L1).




appart(_,[]):-false.
appart(X,[X|_]).
appart(X,[_|L]):-appart(X,L).


inclus([],_).
inclus([X|L1],L2):-appart(X,L2),inclus(L1,L2).



intersection([],_,[]).
intersection([X|L],L1,[X|R]):-appart(X,L1),intersection(L,L1,R).
intersection([Y|L],L1,R):-not(appart(Y,L1)),intersection(L,L1,R).

somme([],0).
somme([X|R],N) :- somme(R,N1), N is N1+X.


max([X],X).
max([X|L],Y):- max(L,Z),((X > Z ,Y is X);(X =< Z ,Y is Z)).



tri(L,L1) :-echange(L,L2),!,tri(L2,L1).
tri(L1,L1).


echange([X,Y|L], [Y,X|L]):-X>Y.
echange([Z|L], [Z|L1]) :-echange(L,L1).


elements_rang_impair([], []).
elements_rang_impair([X], [X]).
elements_rang_impair([X,_|Y],[X|L]):- elements_rang_impair(Y, L).



successif(X,Y,[X|[Y|_]]).
successif(X,Y,[X|[Y|_]]).
successif(X,Y,[_|L]):-successif(X,Y,L).
