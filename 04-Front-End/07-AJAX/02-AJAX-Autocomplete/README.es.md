## Contexto y Objetivos

Este es nuestro segundo ejercicio AJAX. Vamos a crear una entrada con la capacidad de autocompletarse.¿Quieres saber de qué se trata? Ve a [Google](https://www.google.com/) para tener un ejemplo: tan pronto escribes **un** carácter en el campo de entrada recibes sugerencias debajo para autocompletar el campo.

Queremos crear una entrada que se autocomplete usando **Palabras de diccionario**.

## Especificaciones

Inicia tu servidor web local con:

```bash
serve
```

Ahí verás archivos que debes actualizar::

- `index.html` - la entrada ya está ahí pero hay elementos inútiles en el autocompletado `ul` que puedes remover
- `style.css` - agregale algo de estilo
- `lib/index.js` - ¡aquí empezarás desde cero!

Si quieres algunas sugerencias, puedes usar la API siguiente:

```bash
GET https://dictionary.lewagon.com/autocomplete/:stem
```
Aquí reemplazarás `:stem` con los caracteres agregados por  el/la usuario/a. Tan pronto el/la usuario/a introduzca un carácter (pudiese ser un `keyup`), vas a desencadenar una nueva llamada AJAX. Si te fijas en tu pestaña "Network" en el Inspector de Chrome, verás algo como lo siguiente:

```bash
https://dictionary.lewagon.com/autocomplete/u
https://dictionary.lewagon.com/autocomplete/un
https://dictionary.lewagon.com/autocomplete/und
https://dictionary.lewagon.com/autocomplete/unde
https://dictionary.lewagon.com/autocomplete/under
etc.
```
¡Cuando recibas el JSON desde la API, tu trabajo será actualizar la lista `ul#results` con sugerencias!

Una vez que tengas el comportamiento de básico, no dudes en mejorar el estilo 🎨 de la lista `ul#results` para que se vea muy bien 🎨 😋.

![Animated gif of final goal, showing a list of auto sugesstions that pop up while typing.](https://raw.githubusercontent.com/lewagon/fullstack-images/3a1b80803f1fa3fc59b79530101847d852d21170/frontend/autocomplete.gif)
