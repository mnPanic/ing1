# Discusión de papers #8

Problema: metodos que tienen que trabajar / interactuar con objetos que tienen
diferentes tipos, y el tipo influye en el resultado.

Paper: una solución es preguntar de que tipo es cada uno de los objetos y en
base a eso hacer el comportamiento.

"OOP to me means only messaging [...] and Extreme late-binding of all things" -
Alan Kay.

En vez de testear los tipos, hacemos que el mismo proceso de envio de mensajes
pueda resolverlo.

> esto ya lo estuvimos viendo con los ejercicios que estuvimos haciendo.

## Problema

Cuando tenemos mas de una variable que es independientemente polimorfica.

Ejemplo:

- Graphical objects
  - rectangle
  - bitmap
- Display ports
  - display
  - printer
  - remote

Solucion naive:

```text
Rectangle >> displayOn: aPort

  aPort isMemberOf: DisplayPort
    ifTrue: ["code for displaying on display port"]

  aPort isMemberOf: PrinterPort
    ifTrue: ["code for displaying on printer port"]

  aPort isMemberOf: RemotePort
    ifTrue: ["code for displaying on remote port"]
```

Como lo resolvemos de forma polimorfica?

## Solución

Nos centramos primero en la jerarquía de graphical objects. cuando reciben el
mensaje display on, ninguno de ellos va a saber de que tipo es el puerto. Sino
que le va a pasar al puerto un mensaje

```smalltalk
Rectangle >> displayOn: aPort
  aPort displayRectangle: self.

Bitmap >> displayOn: aPort
  aPort displayBitmap: self.
```

El rectangulo puede mandar `displayRectangle` porque sabe quien es si mismo.
Idem bitmap. Mandan un mensaje dando la información del tipo que son ellos.
Y del lado de los display ports,

```smalltalk
DisplayPort >> dispayRectangle: aRect
  "code to display rect on display port"

DisplayPort >> dispayBitmap: aBitmap
  "code to display bitmap on display port"

PrinterPort >> dispayRectangle: aRect
  "code to display rect on PrinterPort"

PrinterPort >> dispayBitmap: aBitmap
  "code to display bitmap on PrinterPort"
```

Dan la informacion del tipo en el mensaje que envian.

El nombre es **double dispatch** y ya lo estuvimos utilizando.

Nico: al momento de designar quien tiene que hacer

> podria haber un dispatch de n colaboradores. Y no puedo violar a cada uno para
> saber su tipo para saber que operación hacer.

El que finalmente lo sabe es el que tiene que hacer la operación.

> En el caso de la suma, es el 2do operando. Pero en ese caso es lo mismo quien
> termina haciendo la suma.

Pero no siempre da igual. En ese caso hay que enviar la responsabilidad devuelta
enviando un mensaje al que si tenga la responsabilidad, con toda la información.
