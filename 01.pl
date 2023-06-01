% Grafo unidireccional.
%  a -1- b -2- e
%   \         /
%   3        3
%    \       /
%     c -2- d -2- f
%            \
%            3
%             \
%              g
%

% nodo(a,b,1).
% nodo(Inicio, Destino, Costo).
% conecta(Inicio, Destino, Costo).

% Pregunta a: Representar el grafo con hechos.
conecta(a, b, 1).
conecta(b, e, 2).
conecta(a, c, 3).
conecta(c, d, 2).
conecta(e, d, 3).
conecta(d, f, 2).
conecta(d, g, 3).

% Consulta: ¿Hay camino directo entre 2 nodos/puntos/ciudades/etc?
existeCaminoDirecto(Inicio, Destino) :- 
	conecta(Inicio, Destino, _).

% existeCaminoDirecto(a,b). true
% existeCaminoDirecto(a,c). true
% existeCaminoDirecto(a,d). false
% existeCaminoDirecto(b,d). false

% Consulta: ¿Existe un camino entre un punto/nodo ORIGEN y un punto/nodo DESTINO?
% ExisteUnCamino?
% existeUnCamino(a, d, Camino).

existeUnCamino(Inicio, Destino) :-
	conecta(Inicio, Destino, _).

existeUnCamino(Inicio, Destino) :-
	conecta(Inicio, Intermedio, _),
	existeUnCamino(Inicio, Intermedio),
    existeUnCamino(Intermedio, Destino).


% Consulta: ¿Cual es el costo de ir desde punto/nodo ORIGEN hacia un punto/nodo DESTINO?

%costoTotalDeOrigenADestino(a, d, CostoTotal).

%costoTotalDeOrigenADestino(Origen, Destino, CostoTotal).
costoTotalDeOrigenADestino(Origen, Origen, 0) :- !.
costoTotalDeOrigenADestino(Origen, Destino, CostoTotal):-
	conecta(Origen, Intermedio, Costo1), 
	costoTotalDeOrigenADestino(Intermedio, Destino, Costo2),
	CostoTotal is Costo1 + Costo2.


% Obtener todos los caminos entre punto inicio y punto final, junto con el costo total de este
% encontrarUnCamino entre un Punto Inicio y Punto final, sumando los costos
%encontrarUnCamino(Inicio, Destino, CostoTotal, CaminoEncontrado, []).
%https://www.swi-prolog.org/pldoc/man?predicate=%5C%2B/1

% Predicado
%encontrarUnCamino(Inicio, Destino, CostoTotal, CaminoEncontrado, Vistos).

% Ejemplo
%encontrarUnCamino(a, d, CostoTotal, CaminoEncontrado, []).

encontrarUnCamino(Inicio, Destino, CostoTotal, [Inicio,Destino], _) :- 
    conecta(Inicio, Destino, CostoTotal).

encontrarUnCamino(Inicio, Destino, CostoTotal, [Inicio|SiguientesPuntos], Vistos) :- 
	\+ member(Inicio, Vistos), % Se niega member, busca si inicio es miembro de la lista Vistos dado que Vistos son los nodos visitados
	conecta(Inicio, Opcion, Costo1), % Obtiene el nodo adyacente a Inicio con su respectivo costo
	encontrarUnCamino(Opcion, Destino, Costo2, SiguientesPuntos, [Inicio|Vistos]), % Se llama recursivamente con el nodo adyacente
	CostoTotal is Costo1 + Costo2.