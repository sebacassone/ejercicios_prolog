% Problema grafo
% Hechos
% Primera conexión
conexiones(santiago, mendoza, 363, 1, 150).
conexiones(mendoza, santiago, 363, 1, 150).
% Segunda conexión
conexiones(santiago, buenosAires, 1137, 2, 150).
conexiones(buenosAires, santiago, 1137, 2, 150).
% Tercera conexión
conexiones(buenosAires, saoPaulo, 1650, 3, 290).
conexiones(saoPaulo, buenosAires, 1650, 3, 290).
% Cuarta conexión
conexiones(mendoza, saoPaulo, 2445, 4, 280).
conexiones(saoPaulo, mendoza, 2445, 4, 280).

% Clausulas
% Se implementa predicado ruta para determinar si es posible llegar de un origen a destino
ruta(Origen, Destino):-
    conexiones(Origen, Destino, _, _, _).

ruta(Origen, _):-
    conexiones(Origen, Intermedio, _, _, _),
    ruta(Origen, Intermedio).

% Se implementa predicado para obtener el costo de una ruta
obtenerCostoTotalRuta(Origen, Origen, 0, _):- !.

obtenerCostoTotalRuta(Origen, Destino, AccCosto, Vistos):-
    \+ member(Origen, Vistos),
    conexiones(Origen, Intermedio, _, _, Costo1),
    obtenerCostoTotalRuta(Intermedio, Destino, Costo2, [Origen|Vistos]),
    AccCosto is Costo1 + Costo2.

% Obtener tiempo total de una ruta
obtenerTiempoTotal(Origen, Origen, 0, _):- !.

obtenerTiempoTotal(Origen, Destino, AccTiempo, Vistos):-
    \+ member(Origen, Vistos),
    conexiones(Origen, Intermedio, _, Tiempo1, _),
    obtenerTiempoTotal(Intermedio, Destino, Tiempo2, [Origen|Vistos]),
    AccTiempo is Tiempo1 + Tiempo2.

% Obtener tiempo total de una ruta
obtenerDistanciaTotal(Origen, Origen, 0, _):- !.

obtenerDistanciaTotal(Origen, Destino, AccDistancia, Vistos):-
    \+ member(Origen, Vistos),
    conexiones(Origen, Intermedio, Distancia1, _, _),
    obtenerDistanciaTotal(Intermedio, Destino, Distancia2, [Origen|Vistos]),
    AccDistancia is Distancia1 + Distancia2.

% Se implementa predicado tour que permite visitar desde un origen hasta un destino según un presupuesto
tour(Origen, Destino, Presupuesto) :-
    obtenerCostoTotalRuta(Origen, Destino, Costo, []),
    obtenerTiempoTotal(Origen, Destino, Tiempo, []),
    obtenerDistanciaTotal(Origen, Destino, Distancia, []),
    Presupuesto >= Costo,
    TiempoRec >= Tiempo,
    DistanciaRec >= Distancia.
