# Method object

Compose method: componer un metodo en submetodos para que sea mas legible. Pero
entre ellos comparten muchas variables, y al extraer nuevos metodos tengo que
pasar muchas variables.

Desventajas que se me ocurrian: lo hace mas legible, pero hace más oscuro el
funcionamiento real.

You have a method that does not simplify well with Composed Method

> How do you code a method where many lines of code share
many arguments and temporary variables?

Most objects are nouns, these are verbs.

> Create a class named after the method. Give it an instance vari- able for the
receiver of the original method, each argument, and each temporary variable.
Give it a Constructor Method that takes the original receiver and the method
arguments. Give it one instance method, #compute, implemented by copying the
body of the original method. Replace the method with one that creates an
instance of the new class and sends it #compute.

El receiver es la clase en la cual se ejecuta el método