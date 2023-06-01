% Hechos
libro(1, 'Cien Años de Soledad', 'Novela').
libro(2, 'El Principito', 'Fantasia').
libro(3, '1984', 'Ciencia Ficcion').
libro(4, 'Dracula', 'Terror').
libro(5, 'El Fin de la Eternidad', 'Aventura').


autor(1, 'Gabriel Garcia Marquez', ['Novela', 'Realismo Magico']).
autor(2, 'Antoine de Saint-Exupéry', ['Fantasia']).
autor(3, 'George Orwell', ['Ciencia Ficcion', 'Novela']).
autor(4, 'Bram Stoker', ['Terror', 'Fantasia']).
autor(5, 'Isaac Asimov', ['Fantasia', 'Aventura', 'Ciencia Ficción']).

% Clausulas
% Buscar todos los libros de una categoría dada
% Meta primaria: libroEnCategoria(Categoria)
% Meta secundaria: libro(IdLibro, Titulo, Categoria)
% Dom: Categoria
% Rec: TituloLibro
librosEnCategoria(TituloLibro, Categoria):-
    libro(_, TituloLibro, Categoria).

% Busca en todos los autores una categoria dada
% Meta primaria: autorEnCategoria(Categoria)
% Meta secundaria: autor(IdAutor, Nombre, Categorias)
% Dom: Categoria
% Rec: NombreAutor
autoresEnCategoria(NombreAutor, Categoria):-
    autor(_, NombreAutor, Categorias),
    pertenece(Categoria, Categorias).

% Verifica si un elemento pertenece a una lista de elementos
% Meta primaria: pertenece(Elemento, Lista)

% Caso base
pertenece(Elemento, [Elemento|_]).

% Caso recursivo
pertenece(Elemento, [_|RestoLista]):-
    pertenece(Elemento, RestoLista).
