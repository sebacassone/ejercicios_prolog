% Capa constructora
makeTriangulo(C1, C2, H, [C1, C2, H]).

% Capa selectora
getC1(T, C1):-
    makeTriangulo(C1, _, _, T).

getC2(T, C2):-
    makeTriangulo(_, C2, _, T).

getHip(T, H):-
    makeTriangulo(_, _, H, T).

% Capa otras operaciones

cumple(T):-
    getC1(T, C1),
    getC2(T, C2),
    getHip(T, H),
    Hip is (C1 * C1 + C2 * C2) ** 0.5,
    Hip = H.