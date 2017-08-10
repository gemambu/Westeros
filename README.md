# WESTEROS. Práctica Fundamentos iOS con Swift 4. KC Bootcamp V

La práctica parte de la aplicación creada en las clases de Fundamentos iOS con Swift 4. Hasta el momento el modelo se compone de:

-Houses

Donde cada House tiene datos propios de cada casa (nombre, emblema, frase), así como un listado de miembros que pertenecen a ella.

-Person

Cada miembro tiene información unívoca (nombre, alias ocional, y casa a la que pertenece)

Ambas clases del modelo tienen los siguientes protocolos implementados: CustomStringConvertible, Equatable, Comparable y Hashable.

Esta información se carga desde un repositorio en local.

###TDD

Tenemos los Tests para el manejo de House(s) y Person(s) así como la obtención de información del Repositorio en local.


## Parte Obligatoria

Como entrega obligatoria se piden los siguientes puntos:

- Implementar el modelo para Season (con información relevante de cada temporada) y Episode (como datos, nombre y fecha de lanzamiento con Date). 
- Cada season tendrá al menos un episode
- Implementar los siguientes protocolos (y correspondientes tests):
	- CustomStringConvertible	- Equatable	- Hashable	- Comparable 
- Crear una propiedad en Repositorio llamada _seasons_ similar a houses. Ésta obtendrá las 6 primeras temporadas ordenadas con sus episodios (basta con 2 episodios con temporada)
- Crear una funcion en el repositorio llamada seasons(filteredBy:) >[Season] que acepta una clausura (similar a lo que hicimos para houses) y te permite recibir un [Season] filtrado.
- Crea un SeasonsViewController (tabla, ya sea usando la técnica genérica descrita más arriba o repitiendo el código). Al hacer clic sobre una celda, se debe de hacer un push de un SeasonViewController.- Haz lo equivalente para EpisodesViewController y EpisodeViewController- Nueva Interfaz:	- Crea a un HousesViewController empaquetado dentro de unNavigationController.	- Crea un SeasonsViewController empaquetado dentro de unNavigationViewController	- Mete a ambos dentro de un UITabBarController empaquetado dentro de un NavigationController.	- Usa éste como rootViewController de tu App. Asegúrate de poder cambiar de uno a otro y poder navegar de House a Person y de Season a Episode.


## Parte Opcional

Implementar de forma genérica el Delegado para UITableView.
Con esto, evitamos el código repetitivo en los ViewControllers. Se crea un UITableViewController genérico para Arrays.

Hay que tener en cuenta además el manejo de memoria.

## Extras

SplitView y el manejo del botón en ipad portrait
Información extra en el modelo: detallar aquí los campos nuevos.
JSON para obtener cierta información detallada de cada modelo
TDD para el JSON
Autolayout
README.md donde se especifica todo
