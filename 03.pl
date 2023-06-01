% Hechos (no es una lista exhaustiva, son solo algunos casos de referencia)
listen(juan, rock).
listen(pedro, metal).
listen(sandra, pop).
listen(pedro, pop).
listen(maria, blues).
listen(erika, clásica).

% Variaciones de Predicado
listenByGroupGender([erika, juan, sandra], rock).
listenByGroupGender([pedro, gabriel, sebastian], pop).
listenByGroupGender([juan, pablo, matias], metal).
listenByGroupGender([mariana, pablo, sebastian], indie).

% Variaciones de Predicado 2
listenPersonGenderPreference(matias, [rock, blues]).
listenPersonGenderPreference(gabriel, [rock, clásica]).
listenPersonGenderPreference(sebastian, [pop, metal]).
listenPersonGenderPreference(juan, [indie, pop]).

% Clausulas
% Se utiliza el primer listen para consultar el estilo musical
% Meta primeria: listenBy(EstiloMusical, NombrePersona)
% Meta secundaria: listen(NombrePersona, EstiloMusical)
% Dom: EstiloMusical
% Rec: NombrePersona
listenBy(EstiloMusical, NombrePersona):-
    listen(NombrePersona, EstiloMusical).

% Se utiliza la variación de predicado 2 para consultar a las personas por cierto genero musical
listenByGender(EstiloMusical, Nombres):-
    listenPersonGenderPreference(Nombres, Estilos),
    pertenece(EstiloMusical, Estilos).

% Caso base
pertenece(Elemento, [Elemento | _]).

% Caso recursivo
pertenece(Elemento, [_ | Resto]):-
    pertenece(Elemento, Resto).