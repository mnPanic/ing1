Buenas,

Les escribimos este mail porque tenemos varias consultas sobre el ejercicio de
código repetido.

- Entendemos que siempre que podamos deberíamos intentar usar los métodos que ya
  están implementados en el ambiente.
  
  En los tests 01 y 02, sacamos el timing a un nuevo método, y vimos que existe
  uno con un comportamiento casi igual llamado `should: notTakeMoreThan:` en
  `TestCase`. El problema es que la unidad de tiempo que espera es una que
  responda el mensaje `totalMilliseconds`, que vimos que si responde el objeto
  resultante de hacer `10 milliSecond` pero no las que usamos nosotros de
  `Aconcagua`, resultado de `10 * millisecond`.

  **Está bien que lo dejemos con nuestra implementación custom? O habría que
  cambiar las unidades?**

  Similarmente, en otros tests movimos a un método un conjunto de colaboraciones
  que podrían reemplazarse por `should: raise: withExceptionDo:` de `TestCase`.
  **Deberíamos usar nuestro método o ese?**

- En los tests 05 y 06 hay dos secuencias de colaboraciones que se parecen mucho
  sintácticamente pero que tienen toda la pinta de ser accidentales y no poder
  ser correctamente abstraidas.

  ```
  "(test 06)"
  customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).
  ```

  ```
  "test 05"
  customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
  ```

  **Es esto así?**

- En el codigo repetido de `CustomerBook`, como tiene un return adentro de la
  closure en el contexto del método no podemos moverlo a un método a parte. Ya
  que si lo hicieramos, no haría early return del principal.

  En vez de eso nos hubiera gustado hacer algo con más sentido que englobe todo
  el comportamiento como `removeFirstCustomer` o algo asi, pero no podemos
  hacer el _early return_.

  **Es esperable que nos hayamos chocado con esto o nos estamos perdiendo de
  algún detalle?**

Muchas gracias.
Saludos,
Grupo 11.
