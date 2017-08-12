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

Tener en cuenta el manejo de memoria.

## Extras

Se han añadido los siguientes detalles extra en la práctica:

- Se ha añadido un **Split View** que incluye el Tab Bar con el listado de Houses y Seasons. Además se ha implementado el manejo específico del botón _List_ en Ipad: Al entrar en una vista detalle, si el dispositivo es un ipad y se encuentra en portrait, la vista master se oculta automáticamente (ésta aparece haciendo un deslizamiento con el dedo de izquierda a derecha en la parte izquierda de la pantalla, pero no me parecía demasiado intuitivo, así que he decidido añadir esta funcionalidad de accesibilidad)
- Información extra en los modelos
	- Person: se añade un campo _character_ donde se especifica un resumen de la historia del personaje
	- Season:
		- Número de temporada
		- Fecha de inicio de emisión
		- Fecha de fin de emisión	 
		- Resumen de la temporada
		- Wiki para obtener más información de la temporada
	- Episode:
		- Número de episodio
		- Título
		- Fecha de emisión
		- Resumen del capítulo
		- Wiki para obtener más información del capítulo
- La vista que se utiliza para visualizar la Wiki  (_WikiViewController_) se ha modificado para que pueda ser reutilizada por todos los modelos que contienen información de wiki (House, Season, Episode)
- Se han añadido tres ficheros JSON para obtener cierta información detallada de cada modelo:
	- EpisodeSummaries
	- SeasonSummaries
	- PersonSummaries
- Para obtener esta información se ha creado una clase extra para leer y manejar los datos del JSON: _RepositoryUtil_  
- Se ha ampliado el TDD para la lectura y manejo de los JSON
- Se incluye una clase auxiliar para centralizar el estilo de la vista que contiene los resúmenes de las temporadas, episodios y personajes: _ViewsUtil_
- A las vistas de detalle se ha aplicado Autolayout, para que su visualización sea correcta tanto en portrait como landscape en cualquier tipo de dispositivo: ipad/iphone
- Se incluye icono de la aplicación. Generado con [logojoy](https://logojoy.com) y assets generados con [makeappicon.com](http://makeappicon.com)
- Se incluye otra clase de utilizar para formatear las fechas en formato Date: _DateFormatter_
- Se incluye este fichero README.md para añadir especificación de todos los puntos anteriormente definidos
