# Discusión de papers #7 - Polymorphic hierarchies (1996)

- [Polymorphic Hierarchy](https://www.dropbox.com/s/jyy87o2a3ljdr7w/Polymorphic%20Hierarchy.pdf?dl=0)

> The top class in a polymorphic hierarchy is a **Template Class**.

Interesante sobre darle declaratividad al código creando funciones

> Second, I try to use the method description to describe the entire method. I
generally don’t like to comment individual lines of code. It's tempting to do so
when I write a line or two of code that is so bizarre that another programmer
has no chance of understand what he’s looking at. Unfortunately, I’m not going
to be able to cover this unfortunate blunder by including an equally convoluted
comment. Instead, I hide the bizarre code in a new method with a descriptive
name. The comment I would have included to explain the code becomes the method’s
description.

Habla de separar los comentarios de metodos en dos

- Proposito: Deberia ser lo mismo para todos los métodos de la jerarquía
  polimórfica.
- Detalles de implementación: opcional

> I find that trying to understand a class without knowing its superclasses is
like hearing a private joke without knowing the context it came from.

> the subimplementor should have the same purpose as the superimplementor.

## Comentarios Emilio Oca

Puede haber distintas core interface. Por ej. la de collection seria agregar,
iterar. la de ordered collection indexar, etc.

El unico comentario que tiene sentido es el comentario semantico