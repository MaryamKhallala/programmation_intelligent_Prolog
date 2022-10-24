% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

:-dynamic dans/2,ouvre/1,locked/1,avoir/2,posseder/1,est/3.

est(cle,chambre,cave).
est(cle,cave,grenier).
%la chambre et la cave sont fermé
locked(chambre).
locked(cave).
dans(livre,chambre).
dans(robot,cuisine).
ouvre(grenier).
ouvre(cuisine).
avoir(rien,rien).


entrer(robot,X):-ouvre(X),dans(robot,T),retract(dans(robot,T)),assert(dans(robot,X)),
                 write('le robot est dans '),write(T),write('\n'),write('lA porte de '),write(X),write(' est ouverte'),write('\n'),
                 write('le robot entre dans '),write(X),write('\n'),!.
entrer(robot,X):-locked(X),avoir(cle,X),retract(locked(X)),assert(ouvre(X)),
                 write('le robot ouvre '),write(X),write('\n'),
                 dans(robot,T),retract(dans(robot,T)),assert(dans(robot,X)),
                 write('le robot entre dans '),write(X),write('\n').

deplacer(X,Y):-dans(robot,X),ouvre(Y),entrer(robot,Y).
deplacer(X,Y):-dans(robot,X),locked(Y),
               write('La porte de '),write(Y),write(' est fermee '),write('\n'),
               est(cle,Y,Z),
               write('Sa cle est dans '),write(Z),write('\n'),
               deplacer(X,Z),assert(avoir(cle,Y)),retract(est(cle,Y,Z)),
               write('le robot obtient la cle de '),write(Y),write('\n'),
               entrer(robot,Y).

apporter(A,Y):-dans(A,Y),write('le '),write(A),write(' se trouve deja dans '),write(Y),write('\n'),!.
apporter(A,Y):-dans(A,T),dans(robot,T),assert(posseder(livre)),assert(dans(livre,Y)),retract(dans(livre,T)),
               write('le robot et le livre sont dans '),write(T),write('\n'),write('le robot prend le livre ' ),write('\n'),
               deplacer(T,Y),!.
apporter(A,Y):-dans(A,T),write('le '),write(A),write(' est dans '),write(T),write('\n'),dans(robot,W),T\=W,deplacer(W,T),apporter(A,Y).

liberer:-abolish(dans/2),abolish(ouvre/1),abolish(locked/1),abolish(avoir/2),abolish(posseder/1),abolish(est/3).



