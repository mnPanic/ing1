# Machete 1p

## Algoritmo de quitar codigo repetido

1. Mover contextualmente lo repetido a una nueva abstracción
2. Parametrizar lo que cambia

   > No hacer futurologia.

3. Nombrar la nueva abstracción (Dar semantica. El paso más importante!)
4. Usar la nueva abstracción

## Algoritmo de reemplazar if por polimorfismo

1. (opcional, si no existe) Crear una jerarquía polimórfica con una abstracción
   por cada condición del if.

2. Mover el cuerpo de cada if a cada abstracción de 1. correspondiente,
   parametrizando adecuadamente.

   > Por ejemplo, el receptor pasa a ser parámetro y el parámetro pasa a ser
   > receptor (clásico)

3. Nombrar la nueva abstracción (de no estarlo)
4. Nombrar el nuevo mensaje (aqui se crea una nueva noción)
5. Reemplazar los if por envío de mensajes polimórficos
6. (opcional) Buscar el objeto polimórfico.
