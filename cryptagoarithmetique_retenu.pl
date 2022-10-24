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
reste(0).
reste(1).
crypto2(S,E,N,D,M,O,R,Y,R1,R2,R3,R4):- nombre(S),nombre(E),nombre(N),nombre(D),nombre(M),nombre(O),nombre(R),nombre(Y),reste(R1),reste(R2),reste(R3)
,reste(R4),
 S\=E,S\=N,S\=D,S\=M,S\=O,S\=R,S\=Y,
 E\=N,E\=D,E\=M,E\=O,E\=R,E\=Y,
 N\=D,N\=M,N\=O,N\=R,N\=Y,
 D\=M,D\=O,D\=R,D\=Y,
 M\=O, M\=R, M\=Y,
 O\=R, O\=Y,
 R\=Y,
    M is R4,
    R3+S+M = O+10*R4,
    R2+E+O = N+10*R3,
    R1+N+R = E+10*R2,
    D+E = Y+10+R1.


