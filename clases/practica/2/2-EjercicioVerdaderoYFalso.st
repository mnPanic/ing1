!classDefinition: #Falso category: '2-EjercicioVerdaderoYFalso'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2-EjercicioVerdaderoYFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: '2-EjercicioVerdaderoYFalso'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'prototipo' stamp: 'MP 8/23/2021 20:25:32'!
no
	^Verdadero.! !

!Falso class methodsFor: 'prototipo' stamp: 'MP 8/23/2021 20:55:16'!
o: unBooleano 
	^unBooleano.! !

!Falso class methodsFor: 'prototipo' stamp: 'MP 8/23/2021 21:58:16'!
siFalso: aBlockClosure 
	"También está bien no devolverlo según jaz"
	^(aBlockClosure value).! !

!Falso class methodsFor: 'prototipo' stamp: 'MP 8/23/2021 21:57:24'!
siVerdadero: aBlockClosure.! !

!Falso class methodsFor: 'prototipo' stamp: 'MP 8/23/2021 20:50:23'!
y: unBooleano 
	^Falso.! !


!classDefinition: #Verdadero category: '2-EjercicioVerdaderoYFalso'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2-EjercicioVerdaderoYFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: '2-EjercicioVerdaderoYFalso'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'protocolo' stamp: 'MP 8/23/2021 20:22:03'!
no
	^Falso.! !

!Verdadero class methodsFor: 'protocolo' stamp: 'MP 8/23/2021 20:52:56'!
o: unBooleano 
	^Verdadero.! !

!Verdadero class methodsFor: 'protocolo' stamp: 'MP 8/23/2021 21:31:19'!
siFalso: aBlockClosure.! !

!Verdadero class methodsFor: 'protocolo' stamp: 'MP 8/23/2021 21:39:54'!
siVerdadero: aBlockClosure 
	^(aBlockClosure value).! !

!Verdadero class methodsFor: 'protocolo' stamp: 'MP 8/23/2021 20:49:05'!
y: unBooleano
	^unBooleano
	
	! !


!classDefinition: #VerdaderoYFalsoTests category: '2-EjercicioVerdaderoYFalso'!
DenotativeObject subclass: #VerdaderoYFalsoTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2-EjercicioVerdaderoYFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VerdaderoYFalsoTests class' category: '2-EjercicioVerdaderoYFalso'!
VerdaderoYFalsoTests class
	instanceVariableNames: ''!

!VerdaderoYFalsoTests class methodsFor: 'as yet unclassified' stamp: 'MP 8/23/2021 20:20:22'!
test01VerdaderoNoDevuelveFalso
	"comment stating purpose of message"

	Assert that: Falso isEqualTo: Verdadero no.! !

!VerdaderoYFalsoTests class methodsFor: 'as yet unclassified' stamp: 'MP 8/23/2021 20:25:11'!
test02FalsoNoDevuelveVerdadero
	"comment stating purpose of message"

	Assert that: Verdadero isEqualTo: Falso no.! !

!VerdaderoYFalsoTests class methodsFor: 'as yet unclassified' stamp: 'MP 8/23/2021 20:46:54'!
test03VerdaderoYVerdaderoDevuelveVerdadero
	"hola"
	Assert that: Verdadero isEqualTo: (Verdadero y: Verdadero).! !

!VerdaderoYFalsoTests class methodsFor: 'as yet unclassified' stamp: 'MP 8/23/2021 20:47:42'!
test04VerdaderoYFalsoDevuelveFalso
	Assert that: Falso isEqualTo: (Verdadero y: Falso).! !

!VerdaderoYFalsoTests class methodsFor: 'as yet unclassified' stamp: 'MP 8/23/2021 20:50:52'!
test05FalsoYFalsoDevuelveFalso
	Assert that: Falso isEqualTo: (Falso y: Falso).! !

!VerdaderoYFalsoTests class methodsFor: 'as yet unclassified' stamp: 'MP 8/23/2021 21:09:01'!
test06FalsoYVerdaderoDevuelveFalso
	Assert that: Falso isEqualTo: (Falso y: Verdadero).! !

!VerdaderoYFalsoTests class methodsFor: 'as yet unclassified' stamp: 'MP 8/23/2021 20:54:01'!
test07VerdaderoOFalsoDevuelveVerdadero
	"hola"
	Assert that: Verdadero isEqualTo: (Verdadero o: Falso).! !

!VerdaderoYFalsoTests class methodsFor: 'as yet unclassified' stamp: 'MP 8/23/2021 20:54:04'!
test08VerdaderoOFalsoDevuelveVerdadero
	"hola"
	Assert that: Verdadero isEqualTo: (Verdadero o: Falso).! !

!VerdaderoYFalsoTests class methodsFor: 'as yet unclassified' stamp: 'MP 8/23/2021 20:54:43'!
test09FalsoOFalsoDevuelveFalso
	Assert that: Falso isEqualTo: (Falso o: Falso).! !

!VerdaderoYFalsoTests class methodsFor: 'as yet unclassified' stamp: 'MP 8/23/2021 20:55:54'!
test10FalsoOVerdaderoDevuelveVerdadero
	Assert that: Verdadero isEqualTo: (Falso o: Verdadero).! !

!VerdaderoYFalsoTests class methodsFor: 'as yet unclassified' stamp: 'MP 8/23/2021 21:54:59'!
test11VerdaderoSiFalsoNoEjecutaElClosure
	|value|
	value := #no.
	Verdadero siFalso: [value := #si].
	Assert that: value isEqualTo: #no.! !

!VerdaderoYFalsoTests class methodsFor: 'as yet unclassified' stamp: 'MP 8/23/2021 21:56:16'!
test12VerdaderoSiVerdaderoEjecutaElClosure
	|value|
	value := #no.
	Verdadero siVerdadero: [value := #si].
	Assert that: value isEqualTo: #si.! !

!VerdaderoYFalsoTests class methodsFor: 'as yet unclassified' stamp: 'MP 8/23/2021 21:57:05'!
test13FalsoSiVerdaderoNoEjecutaElClosure
	|value|
	value := #no.
	Falso siVerdadero: [value := #si].
	Assert that: value isEqualTo: #no.! !

!VerdaderoYFalsoTests class methodsFor: 'as yet unclassified' stamp: 'MP 8/23/2021 21:57:51'!
test14FalsoSiFalsoEjecutaElClosure
	|value|
	value := #no.
	Falso siFalso: [value := #si].
	Assert that: value isEqualTo: #si.! !
