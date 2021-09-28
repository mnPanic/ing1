# TDD

- No es una tecnica de testing
- Desarrollo iterativo e incremental
- Bottom up
- Feedback inmediato.

3 pasos

1. Escribir el test mas sencillo que agregue valor a nuestro modelo. **Debe
   fallar**

2. Implementar la solución más simple que haga pasar el test. **Deben seguir
   pasando los tests anteriores**

3. Refactorizar el codigo **en base a lo que desarrollamos hasta el momento**
   usando las heurísticas que ya vimos.

Siempre que hacemos paso 1, hacemos paso 2. Y si hacemos paso 3, hacemos solo el
3 **No abstraer tempranamente**. Con un caso no generalizamos. También cuando
se hace evidente en base a lo que hicimos hasta el momento.

*Rot13: extension de string. Si lo queremos extraer, lo vamos a poder hacer con
esta implementacion. Es una forma de decirle eso a Cuis.

Valor esperado siempre a la izq y valor computado siempre a la derecha.