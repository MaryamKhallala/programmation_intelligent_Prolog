% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer
% bien faite

equa(X,Y,Z,L):-X=0,Y=0,write('pas de solution').
equa(0,Y,Z,L):-L is Y/Z.
equa(X,Y,Z,L):- D is Y*Y-4*X*Z ,D=0, L is -Y/2*X.
equa(X,Y,Z,L):-X\=0, D is Y*Y-4*X*Z ,D<0, write('pas de solution r�el').
equa(X,Y,Z,L):-X\=0, D is Y*Y-4*X*Z ,D>0,L is (-Y-sqrt(D))/(2*X).
equa(X,Y,Z,L):-X\=0, D is Y*Y-4*X*Z ,D>0,L is (-Y+sqrt(D))/(2*X).
