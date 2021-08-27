!classDefinition: #I category: '3-NumerosNaturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3-NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: '3-NumerosNaturales'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 21:13:49'!
+ aNatural
	^aNatural next! !

!I class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 20:42:58'!
next
	^II! !


!classDefinition: #II category: '3-NumerosNaturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3-NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: '3-NumerosNaturales'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 21:24:35'!
+ aNatural
	^self previous + aNatural next! !

!II class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 21:52:19'!
- aNatural
	aNatural = I ifTrue:[^self previous].
	^self previous - aNatural previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 21:58:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 21:23:42'!
next
	next ifNotNil:[^next].
	next := II createChildNamed: self name, 'I'.
	next previous: self.
	^next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 21:24:44'!
previous
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 21:25:20'!
previous: aNatural.
	previous _ aNatural.! !


!classDefinition: #III category: '3-NumerosNaturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3-NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: '3-NumerosNaturales'!
III class
	instanceVariableNames: ''!

!III class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 21:58:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: '3-NumerosNaturales'!
II subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3-NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: '3-NumerosNaturales'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 21:58:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !


!classDefinition: #IIIII category: '3-NumerosNaturales'!
II subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3-NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: '3-NumerosNaturales'!
IIIII class
	instanceVariableNames: ''!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 21:58:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	previous := IIII.! !


!classDefinition: #IIIIII category: '3-NumerosNaturales'!
II subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3-NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: '3-NumerosNaturales'!
IIIIII class
	instanceVariableNames: ''!

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 21:58:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIII.
	previous := IIIII.! !


!classDefinition: #IIIIIII category: '3-NumerosNaturales'!
II subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3-NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: '3-NumerosNaturales'!
IIIIIII class
	instanceVariableNames: ''!

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 21:58:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIII.
	previous := IIIIII.! !


!classDefinition: #IIIIIIII category: '3-NumerosNaturales'!
II subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3-NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: '3-NumerosNaturales'!
IIIIIIII class
	instanceVariableNames: ''!

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 21:58:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIII.
	previous := IIIIIII.! !


!classDefinition: #IIIIIIIII category: '3-NumerosNaturales'!
II subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3-NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIII class' category: '3-NumerosNaturales'!
IIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'MP 8/26/2021 21:58:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := IIIIIIII.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!
IIIIIII initializeAfterFileIn!
IIIIIIII initializeAfterFileIn!
IIIIIIIII initializeAfterFileIn!