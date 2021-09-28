# Discusión de papers #10 - Object Recursion

- [Object Recursion - Bobby Woolf](https://hillside.net/plop/plop98/final_submissions/P21.pdf)

- Lectura opcional: [Object Oriented Software Construction - Chapter 11 - Design By Contract](https://www.dropbox.com/s/pk1pzub5u87bo4w/Meyer%20B%20%282000%29.%20Object-Oriented%20Software%20Construction%20-%20Chapter%2011%20Design%20by%20Contract.pdf?dl=0)

## Object Recursion - Bobby Woolf (07/27/98)

### Notas mías

- Intent: Distribuir el procesamiento de una request sobre una estructura
  delegando polimorficamente. Permite que una request transparentemente se rompa
  en partes más chicas que son más fáciles de resolver.

- Motivation

  Ejemplo: Comparar dos objetos.

  - Podriamos tener una clase `Comparer` que sepa como comparar todos los
    objetos, pero se vuelve muy compleja.
  
  - Otra forma es que un objeto sepa comparar sus partes con otro, y que sus
    partes sepan compararse también, y así. Esto saca la necesidad de una clase
    a parte.

    > This comparison algorithm, where an object compares itself to another by
    telling their parts to compare themselves and so on, is an example of Object
    Recursion. An implementation of a recursive message sends the same message
    to one or more of its related objects and so on. The message surfs through
    the linked structure until reaching objects that can simply implement the
    message and return the result.

Ventajas

- Procesamiento distribuido
- Flexibilidad de la responsabilidad y de roles
- Incremento en encapsulamiento

Desventaja

- Complejidad de programación. La recursión (procedural o object oriented) es
  "dificult to grasp". Usado de más puede hacer que un sistema sea más dificil
  de entender y mantener.

Comentarios

- Me costó entender el genérico porque hay muchos nombres muy abstractos

### Discusión en clase

Proceso de distribucion de un pedido, que se distribuya en una esctructura
mediante delegación polimorfica.

- Métodos que continuan la recursión
- Métodos que hacen de caso base, porque el resultado de trivial o directo.

A diferencia de las recursiones procedurales, lo hacemos a nivel objeto y no
función.

### Ejemplo

```text
n! = 1              si n < 2
     (n - 1)! * n   si n > 1
```

Hay dos ifs
