# Discusión de paper #13 Pattern abuser

No tenemos una bala de plata, todo depende del dominio. En base a eso tomamos
las mejores decisiones. Sobre el final hace 3 preguntas

1. Como sabemos cuando un patrón es realmente aplicable y va a tener el impacto
   esperado?

    Los patrones deberían emerger del proceso. No debería tratarse de cuando
    deberíamos usar tal patrón, sino ver que lo que hayamos implementado sea ese
    patrón.

    Los patrones hay que aprenderlos y olvidarlos.

    > che, esto se está empezando a parecer a un visitor, y ahí es donde uno lo
    > relaciona y lo implementa de esa manera. Más aún si usamos TDD sabemos que
    > sigue funcionando.

2. Como sabemos que efectivamente aplicar el patrón va a ser a la app más
   reusable y que escale mejor?

    Con precisión a futuro no lo vamos a poder saber, aplicamos futurología.
    Pero si tenemos funcionalidades pre-existentes que avalan la funcionaldiad
    nueva, y eso nos lleva hacia el uso de un patrón de diseño, entonces la app
    va a estar adaptada para esto de una forma mucho más simple y orgánica.

    Pero si la app da un giro 180 grados no lo vamos a poder preveer.

    Y por esto no podemos aplicar un patron de patrones.

3. La aplicación se hace "mejor" luego de aplicar los patrones? Que significa
   mejor, o mejor en términos de qué?

    Depende de que definimos por mejor y en qué contexto.

    - Criterio de reusabilidad de Pat (mientras más patrones mejor), entonces se
      hace mejor seguro, pero sabemos que trae problemas a futuro

    - Es una mezcla de los dos anteriores.

Los patrones nos dan *lenguaje*, nos mejora la comunicación. Por ej. intentar
explicar como implementar un visitor en portfolio sin decir que es un visitor es
un lío. En cambio si decimos "para este cacho de codigo implementé un visitor"
ya está, porque se sabe como se implementa.

Pero para un ojo que no está entrenado, tal vez la solución y hablar de eso
puede ser complejo de entender.

Hernan:

El que escribió esto también hizo otros articulos. Microservicios

## It3

Lo que nos falta es testear la interfaz de entrada, rest. Hay dos caras, la
externa que habla HTTP con rest y etc. Y la interna que es la que habla con
nuestro sistema.

> Nota de la otra vez: dibuja hernan como dos objetos la cara externa e interna,
> pero puede ser uno solo dependiendo del fwk.
>
> Ej: si hacemos el webserver con java spring, la cara externa es técnicamente
> spring. Pero conceptualmente lo podemos pensar como dos objetos, y está bueno
> pensarlo así.

Queremos testear la interfaz.

- Que haga requests http y que hable con el webserver. La cara externa habla
   con la interna que habla con los objetos.

   Mala, porque el test, webserver y handler corren en procesos diferentes. Se
   produce un interprocess comunication por medio de TCP/IP, que implica tiempo.

   No es una buena idea porque es mas complicada.

- Que el test hable con la cara externa. Crea el objeto request http y habla con
  la cara externa.

  Problema: me tengo que poner a definir el request http, poner los parametros
  en la URL, etc.

- Hablo directamente con la cara interna.

  Esto es lo que vamos a hacer.

  El protocolo publico son los mensajes relacionados a los definidos en la
  interfaz rest. Sabe responder cosas como

  - createCart: aUser authenticatedWith: aPassword
  - addToCart: id ...: product ...: quantity
  - listCart: id
  - checkoutCart|: id
  - listPurchases

  Nuestros tests tienen que testear este protocolo, y la idea es que no rompamos
  el encapsulamiento de ese objeto. Como si mi test fuese la cara externa.

  No vamos a hacer la parte de HTTP, pero si todo lo que tiene que ver con la
  cara externa y la interna.

### Tests

1. La forma mas simple de empezar con hernan es arrancar con un usuario que no
   autentica. Hay que indicarle a tus libros interface como autenticar, un
   objeto que te diga.

   Esto es usar otro test double.

2. Se puede crear un carrito con user y pw valida

  Para fijarte que 

- todas las opreaciones con id invalido error
- la interfaz se empieza a comportar de manera similar a los tests que ya
  desarrollamos. Para crear un carrito tiene que conocer un catálogo. Se va a
  parecer en cuanto a las relaciones de los objetos, pero los tests no van a ser
  iguales.

Consideraciones:

- No ponerle InterfaceTest al test

- Donde pongo el cart id???????

- Hoy empezamos, el lunes seguimos con esta parte que es larga y vamos a
  encarar, y la parte principal a resolver es que no se puede usar el carrito
  después de que pasaron 30m desde que se usó.

  Es interesante.

- No encaremos el problema de los 30m el finde. Hay que terminar toda la
  funcionalidad salvo eso. Se entrega recién el jueves que viene.

Para guardar los IDs dict en el facade.

Aclaraciones:

- La cara interna de la interfaz no tiene que devolver en el formato que dice la
  especificacion. Por ej. 0|ISB cant ISB cant etc. Esa serializacion se encarga
  la cara externa. La cara externa tiene que devolver un objeto que le permita
  facilmente a la cara externa generar ese string, como un bag.

- El create cart tampoco tiene que devolver 0|, de eso se encarga la interfaz

- Esta interfaz es como el patron facade. Representa un punto de entrada (no
  salida) al sistema.

  El ListCart no puede devolver un carrito, tiene que devolver el contenido. El
  checkout no puede devolver un Cashier, tiene que devolver lo que tenga que
  devolver el checkout.

- Cuando tenemos un dict, la union de la clave y el valor puede significar algo
  y puede valer la pena reificarlo.

Para el lunes: venir con todas las operaciones listas. Por lo menos el positivo
de checkout cart. Asi empezamos con la parte de cerrar el listPurchases. Nos va
a llevar un tiempito, porque no resolvimos del todo lo del Sale.

Y despues está el tema posta de los 30m que va a llevar un tiempo. No dejemos
como está las cosas hasta el lunes y tenemos que salir corriendo hasta el
jueves.

Para el lunes, minimo

- createCart con auth y no se puede
- addToCart con cart id valido, invalido
- listCart id valido invalido
- checkoutCart invalido valido

A nivel modelo vamos a tener cosas repetidas. hay algo que tenemos que reificar.
Abstracción que puede empezar a aparecer. 