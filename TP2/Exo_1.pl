% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
%then enter the text in that file's own buffer.

:-dynamic sur/2.
:-dynamic sous/2.


sur(a,sol).
sur(c,b).
sur(b,sol).
sous(b,c).
sous(c,0).
sous(a,0).

poser_sol(A):-sur(A,sol),sous(A,0).
poser_sol(A):-sur(A,sol),sous(A,X),X\=0,poser_sol(X),poser_sol(A).
poser_sol(A):-sur(A,X),X\=sol,sous(A,0),write(A),write(' se trouve sur '),write(X),write('\n'),retract(sur(A,X)),assert(sur(A,sol)),retract(sous(X,A)),assert(sous(X,0)),write(A),write(' est posé sur sol'),write('\n').
poser_sol(A):-sur(A,X),X\=sol,sous(A,Z),Z\=0,write(A),write(' se trouve sur '),write(X),write(' est sous '),write(Z),write('\n'),poser_sol(Z),poser_sol(A).


poser_1(A,B):-sur(B,A),sous(B,0).
poser_1(A,B):-sur(B,sol),sous(B,0),retract(sur(B,sol)),assert(sur(B,A)),retract(sous(A,0)),assert(sous(A,B)),write(B),write(' est sur '),write(A),write('\n').
poser_1(A,B):-sur(B,X),X\=A,sous(B,0),write(B),write(' se trouve sur '),write(X),write('\n'),retract(sur(B,X)),assert(sur(B,A)),retract(sous(X,B)),assert(sous(X,0)),retract(sous(A,0)),assert(sous(A,B)),write(B),write(' est sur '),write(A),write('\n').
poser_1(A,B):-sous(B,X),X\=0,poser_sol(X),poser_1(A,B).


ranger(A,B,C):-poser_sol(A),poser_1(A,B),poser_1(B,C).

liber:-abolish(sur/2),abolish(sous/2).




%autre méthode

:-dynamic sur/2.
sur(b,a).
sur(c,b).
sur(table,c).
cube(a).
cube(b).
cube(c).
terre(table).

head(X):-cube(X),not(sur(X,_)).


%--methode manuel---%

dplacedepl(X):-cube(X),write('-->'),write(X),write('est maintenant sur la tere'),cube(Y),sur(Y,X),retract(sur(Y,X)),assert(sur(table,X)).

deplacer(X,Y):-terre(Y),head(X),dplacedepl(X).

deplacer(X,Y):-dif(X,Y),head(Y),head(X),retract(sur(_,X)),assert(sur(Y,X)),write('-->'),write(X),write('est maintenant sur '),write(Y).

deplacer(X,Y):-sur(Y,X).

%---methode automatique(pour faire la deplacement direct)---%


deplacer(X,Y):-dif(X,Y),head(Y),determineTETE(X,R),(dif(R,X),dplacedepl(R)),deplacer(X,Y).

deplacer(X,Y):-dif(X,Y),cube(X),determineTETE(Y,R),(dif(R,Y),dplacedepl(R)),deplacer(X,Y).

determineTETE(C,C):-cube(C),head(C).
determineTETE(C,N):-cube(C),sur(C,N),head(N).
determineTETE(C,N):-cube(C),cube(T),sur(C,T),determineTETE(T,K),N=K.

liber:-abolish(sur/2).
%-------------
deplacer1(X,Y,Z):-sur(X,a),sur(Y,b),sur(Z,c).
deplacer1(X,Y,Z):-deplacer(b,Y),deplacer(a,X),deplacer(c,Z),deplacer1(X,Y,Z).
deplacer1(X,Y,Z):-deplacer(a,X),deplacer(b,Y),deplacer(c,Z),deplacer1(X,Y,Z).
deplacer1(X,Y,Z):-deplacer(a,X),deplacer(c,Z),deplacer(b,Y),deplacer1(X,Y,Z).
