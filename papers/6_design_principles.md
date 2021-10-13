# Discusión de papers #6 - Design principles behind smalltalk

Aspectos en los que se enfoca:

- Descripcion: lenguaje de programacion en si
- Interaccion: interfaz (con la que venimos laburando hasta ahora)

Principios que cualquier proyecto en general tendria que tener

- Personal mastery: que una persona sea capaz de entender el sistema entero. Que
  esté al alcance de una persona entender el todo
  - no limitar la creatividad
  - todo en el sistema tiene que explicarse a si mismo

- Buen diseño: medio a traves del cual se logra el personal mastery. Todo
  uniforme.

minimo de piezas axiomaticas, generales, uniformes.

> ejemplo de un sistema: lego o rasti. Sistema de piezas uniformes, axiomaticas,
> que sirven para constuir cosas. Misma idea o concepto
>
> Si no fueran uniformes no encajarian (no es que sean todas iguales). Encajan
> naturalmente entre si.

Caracteristicas:

- Tener leverage: 

## Yo

Preguntas teoricas para tener en cuenta

1. **¿De que no debe depender un componente en un sistema complejo?**
2. **El paper enumera rápidamente dos principios en los que se basa el diseño de Smalltalk. ¿Cuál es el tercero y que significa?**

Principios:

- Personal Mastery: Si un sistema debe servir al espiritu creativo, lo tiene que
  poder entender en su totalidad una sola persona

- Good design

  > A system should be built with a minimum set of unchangeable parts; those
  parts should be as general as possible; and all parts of the system should be
  held in a uniform framework.

- Proposito de lenguaje: Proveer un framework para la comunicación
- Scope:

  > The design of a language for using computers must deal with internal models,
  external media, and the interaction between these in both the human and the
  computer.

- **Objects**: A computer language should support the concept of "object" and
  provide a uniform means for referring to the objects in its universe.

- **Storage Management**: To be truly "object-oriented", a computer system must
  provide automatic storage management.

- **Messages**: Computing should be viewed as an intrinsic capability of objects
  that can be uniformly invoked by sending messages.

- **Uniform Metaphor**: A language should be designed around a powerful metaphor
  that can be uniformly applied in all areas.

  > Lisp: modelo de linked structures. APL, model of arrays, smalltalk: model of
  > communicating objects

### Organization

- **Modularity**

  > No component in a complex system should depend on the internal details of
  any other component.

- **Classification**: A language must provide a means for classifying similar
  objects, and for adding new classes of objects on equal footing with the
  kernel classes of the system.

  > Classification is the objectification of nessness.

- **Polymorphism**: A program should specify only the behavior of objects, not
  their representation.

- **Factoring**: Each independent component in a system would appear in only one
  place.

- **Leverage**: When a system is well factored, great leverage is available to
  users and implementers alike.

- **Virtual Machine**: A virtual machine specification establishes a framework
  for the application of technology.

  > The Smalltalk virtual machine establishes an object-oriented model for
  storage, a message-oriented model for processing, and a bitmap model for
  visual display of information. Through the use of microcode, and ultimately
  hardware, system performance can be improved dramatically without any
  compromise to the other virtues of the system.

### UI

- Reactive principle

  > Every component accessible to the user should be able to present itself in a
  meaningful way for observation and manipulation.

- Operating system

### Future work

- **Natural Selection**: Languages and systems that are of sound design will
  persist, to be supplanted only by better ones.