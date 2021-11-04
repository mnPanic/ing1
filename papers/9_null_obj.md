# Null Object Pattern

- [Null object pattern](https://drive.google.com/file/d/1WytOS3c5_PlNFXnV_7fOn0715w0Pl5FL/view)
- [Generalized null object pattern](https://ubadao.files.wordpress.com/2013/07/a-generalized-null-object-pattern.pdf)

El null object pattern describe como desarrollar una clase que encapsula como un
ipo de objeto deberi hacer nada. Como ese "deberia hacer nada" esta encapsulado,
su complejidad está escondida del colaborador y puede ser reutilizada facilmente
por cualquiera.

La clave es una clase abtracta que define interfaces para todos los objetos de
este tipo. El null object entonces es una subclase de esta que no hace nada.
Como cumple con esa interfaz, se puede usar en todos los lugares donde se usen
objetos de ese tipo.

Aplicabilidad

- Un objeto requiere un colaborador (el null object no lo introduce)
- Algunas instancias de ese colaborador no deberían hacer nada
- Al cliente no le interesa si se hace algo o no
- Queremos reutilizar el comportamiento de no hacer nada

Desventajas

- can necessitate creating a new NullObject class for every new AbstractObject
  class.
- can be difficult to implement if various clients do not agree on how the null
  object should do nothing.

Relación con otros patrones

- Null object no es proxy
- Puede ser una Strategy especial.

Observaciones mias

- Hace muchísimas menciones a otros patrones

## Discusión en clase

- Este es el primer patrón que vemos formalmente
  - Vamos a hablar de muchos. Todos los patrones tienen un uso
- El Gamma nació como un compilado de patrones, y luego aparecieron nuevos (como
  el method object, command)

- Ventaja
  - Evita los ifs para no hacer ciertas cosas
- Es un caso particular de reemplazar el if por polimorfimso. Lo hacemos
  aparecer, pero no es mas que el algoritmo de sacar ifs.

Crítica al paper: fuertemente basado en herencia. Pone como condición que hay
que tener esta herencia. Ahora está difundido acoplarse a interfaces /
protocolo.

Singleton: tiene infinitos problemas

- Null object tiende a ser stateless: no tiene sentido que guarde estado algo
  que no hace nada
