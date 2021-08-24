!classDefinition: #Bill category: 'Ejercicio2'!
DenotativeObject subclass: #Bill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bill class' category: 'Ejercicio2'!
Bill class
	instanceVariableNames: 'diasDeVida'!

!Bill class methodsFor: 'as yet unclassified' stamp: 'MP 8/19/2021 21:11:18'!
caminar: unaCantidadDeKilometros
	"Cuando camina, por cada kilómetro que realiza consume un día de vida más 3 dias de costo fijo solo por emprender la caminata"
	diasDeVida := diasDeVida - 3 - unaCantidadDeKilometros.! !

!Bill class methodsFor: 'as yet unclassified' stamp: 'MP 8/19/2021 21:37:38'!
comer: unaCantidadDeKilosDeCerebro
	"Cuando come, adquiere 4 días de vida por cada kilo de cerebro que come. No olvidar considerar que Bill nace con una cierta cantidad de energía (28 días de vida)"
	diasDeVida := diasDeVida + (unaCantidadDeKilosDeCerebro * 4).! !

!Bill class methodsFor: 'as yet unclassified' stamp: 'MP 8/19/2021 21:05:46'!
energia
	"Devuelve la energia del zombie"
	^diasDeVida.! !

!Bill class methodsFor: 'as yet unclassified' stamp: 'MP 8/19/2021 21:50:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	diasDeVida := 48.! !

Bill initializeAfterFileIn!