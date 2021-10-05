# Patrones

Del Design Patterns

## Null object

## Method object

## State pattern

> State (305) Allow an object to alter its behavior when its internal state
> changes. The object will appear to change its class.

Qué pasa cuando tenemos un objeto cuyo comportamiento depende de un estado
interno? Podemos tener ifs dentro de cada operación, pero vamos a tener
condicionales repetidos que complican el mantenimiento.

Ejemplo: `TCPConnection`, dependiendo del estado como se comportan las
operaciones. Hay una clase para cada subestado, TCPConnection delega a ella y
esta se encarga de hacer lo que tenga que hacer y cambiar de estado.

Consecuencias

- Localiza el comportamiento específico a cada estado y lo particiona para
  diferentes estados.
- Hace que las transiciones de estado sean explícitas, ya que se cambia de
  objeto. Sino, si el estado es algo que se computa en base a variables las
  transiciones son asignaciones.

  También evitan que el context tenga estados internos inconsistentes, porque
  las transiciones de estado son atómicas desde el punto de vista el context.
  Cambian una sola variable.

- Los state objects se pueden compartir.

Para discutir en clase:

- The Flyweight (195) pattern explains when and how State objects can be shared
- State objects are often Singletons (127).

  Si singleton es malo, no es costoso estar creando todo el tiempo objetos
  nuevos? Cómo se suele hacer?

Discusión en clase:

Hernan: lo que conviene es que el contexto cambie el estado, poorque sino los
estados estan acoplados y rompes el encapsulamiento del contexto. Hay pocas
situaciones en donde es muy complejo y tal vez conviene que lo haga el estado.

La solución 1a de stack se hace con este patrón.