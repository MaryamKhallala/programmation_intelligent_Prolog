nombre(0).
nombre(1).
nombre(2).
nombre(3).
nombre(4).
nombre(5).
nombre(6).
nombre(7).
nombre(8).
nombre(9).

cryptoarithmetique(S,E,N,D,M,O,R,Y):- nombre(S),nombre(E),nombre(N),nombre(D),nombre(M),nombre(O),nombre(R),nombre(Y),
 S\=E,S\=N,S\=D,S\=M,S\=O,S\=R,S\=Y,
 E\=N,E\=D,E\=M,E\=O,E\=R,E\=Y,
 N\=D,N\=M,N\=O,N\=R,N\=Y,
 D\=M,D\=O,D\=R,D\=Y,
 M\=O, M\=R, M\=Y,
 O\=R, O\=Y,
 R\=Y,
 I is S*1000+E*100+N*10+D+M*1000+O*100+R*10+E, B is M*10000+O*1000+N*100+E*10+Y, B=I.

