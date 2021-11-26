!classDefinition: #BackpackTest category: 'ISW1-2020-2C-2doParcial'!
TestCase subclass: #BackpackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2020-2C-2doParcial'!

!BackpackTest methodsFor: 'adding' stamp: 'HAW 10/18/2020 16:29:03'!
assertShouldAddAll: portableObjects withPoints: expectedTotalPoints

	| aBackpack |
	
	aBackpack := Backpack containingUpTo: self backpackWeight limitingPointsTo: 100.

	portableObjects do: [ :aPortableObject | aBackpack add: aPortableObject ].
	
	self assert: aBackpack size equals: portableObjects size.
	self assert: aBackpack totalWeight equals: (portableObjects sum: [ :aPortableObject | aPortableObject weight ]).
	self assert: aBackpack totalPoints equals: expectedTotalPoints.
! !

!BackpackTest methodsFor: 'adding' stamp: 'HAW 10/18/2020 16:28:32'!
assertShouldNotAddPortableObjectIfWeightExceeded: aPortableObject

	| aBackpack |
	aBackpack := Backpack containingUpTo: self backpackWeight limitingPointsTo: 100.

	self
		should: [ aBackpack add: aPortableObject ]
		raise: Error
		withMessageText: Backpack maxWeightExceededErrorDescription.
		
	self assert: aBackpack isEmpty. 
! !

!BackpackTest methodsFor: 'adding' stamp: 'HAW 10/18/2020 16:28:32'!
backpackWeight

	^ 42! !

!BackpackTest methodsFor: 'adding' stamp: 'HAW 10/18/2020 16:28:41'!
test07ShouldNotAddNoPointsPortableObjectIfWeightExceeded

	self assertShouldNotAddPortableObjectIfWeightExceeded: 
		(NoPointsPortableObject named: 'help-wanted sign' weighing: self backpackWeight + 1)
! !

!BackpackTest methodsFor: 'adding' stamp: 'HAW 10/18/2020 16:28:47'!
test08ShouldNotAddPointsPortableObjectIfWeightExceeded

	self assertShouldNotAddPortableObjectIfWeightExceeded: 
		(PointsPortableObject named: 'left-handed hammer' weighing: self backpackWeight + 6 worth: 5) ! !

!BackpackTest methodsFor: 'adding' stamp: 'HAW 10/18/2020 16:26:42'!
test09ShouldAddPortableObjectsIfWeightUnderMaxWeightCapacity

	self 
		assertShouldAddAll: self twoPortableObjects
		withPoints: 5.
! !

!BackpackTest methodsFor: 'adding' stamp: 'HAW 10/18/2020 16:27:27'!
test10ShouldAddPortableObjectsIfWeightEqualsMaxWeightCapacity

	self 
		assertShouldAddAll:  self twoPortableObjects, {(PointsPortableObject named: 'letter' weighing: 1 worth: 5)}
		withPoints: 10.
! !

!BackpackTest methodsFor: 'adding' stamp: 'HAW 10/18/2020 16:27:39'!
twoPortableObjects

	^ {
		(PointsPortableObject named: 'left-handed hammer' weighing: 40 worth: 5).
		(NoPointsPortableObject named: 'help-wanted sign' weighing: 1) }! !


!BackpackTest methodsFor: 'creating' stamp: 'HAW 10/14/2020 14:31:04'!
test01CanNotCreateBackpackWithZeroMaxWeight

	self
		should: [ Backpack containingUpTo: 0 limitingPointsTo: 100 ]
		raise: Error
		withMessageText: Backpack invalidWeightCapacityErrorDescription.
! !

!BackpackTest methodsFor: 'creating' stamp: 'HAW 10/14/2020 14:31:04'!
test02CanNotCreateBackpackWithNegativeMaxWeight

	self
		should: [ Backpack containingUpTo: -1 limitingPointsTo: 100 ]
		raise: Error
		withMessageText: Backpack invalidWeightCapacityErrorDescription.! !

!BackpackTest methodsFor: 'creating' stamp: 'HAW 10/14/2020 14:31:04'!
test03CanNotCreateBackpackWithZeroMaxPoints

	self
		should: [ Backpack containingUpTo: 10 limitingPointsTo: 0 ]
		raise: Error
		withMessageText: Backpack invalidPointsCapacityErrorDescription.
! !

!BackpackTest methodsFor: 'creating' stamp: 'HAW 10/14/2020 14:31:04'!
test04CanNotCreateBackpackWithNegativeMaxPoints

	self
		should: [ Backpack containingUpTo: 10 limitingPointsTo: -1 ]
		raise: Error
		withMessageText: Backpack invalidPointsCapacityErrorDescription.! !

!BackpackTest methodsFor: 'creating' stamp: 'HAW 10/14/2020 14:31:04'!
test05CanNotCreateBackpackWithNoIntegerMaxWeight

	self
		should: [ Backpack containingUpTo: 1.0 limitingPointsTo: 100 ]
		raise: Error
		withMessageText: Backpack weightCapacityMustBeIntegerErrorDescription.
! !

!BackpackTest methodsFor: 'creating' stamp: 'HAW 10/14/2020 14:31:04'!
test06CanNotCreateBackpackWithNoIntegerMaxPoints

	self
		should: [ Backpack containingUpTo: 100 limitingPointsTo: 1.0 ]
		raise: Error
		withMessageText: Backpack pointsCapacityMustBeIntegerErrorDescription.
! !


!BackpackTest methodsFor: 'accessing' stamp: 'HAW 10/14/2020 14:49:20'!
test11ShouldAddZeroWeightWhenEmpty

	| aBackpack |
	aBackpack := Backpack containingUpTo: 42 limitingPointsTo: 100.

	self assert: aBackpack totalWeight equals: 0.
	self assert: aBackpack isEmpty
! !

!BackpackTest methodsFor: 'accessing' stamp: 'HAW 10/14/2020 14:35:57'!
test12ShouldAddWeightWhenAddingPortableObjects

	| aBackpack |
	aBackpack := Backpack containingUpTo: 42 limitingPointsTo: 100.

	aBackpack add: (PointsPortableObject named: 'left-handed hammer' weighing: 10 worth: 5).
	aBackpack add: (NoPointsPortableObject named: 'help-wanted sign' weighing: 10).
	
	self assert: aBackpack size equals: 2.
	self assert: aBackpack totalWeight equals: 20.

! !

!BackpackTest methodsFor: 'accessing' stamp: 'HAW 10/14/2020 14:49:31'!
test13ShouldAddZeroPointsWhenEmpty

	| aBackpack |
	aBackpack := Backpack containingUpTo: 42 limitingPointsTo: 100.

	self assert: aBackpack totalPoints equals: 0.
	self assert: aBackpack isEmpty.
! !

!BackpackTest methodsFor: 'accessing' stamp: 'HAW 10/14/2020 14:35:57'!
test14ShouldAddPointsWhenAddingPointsPortableObjects

	| aBackpack |
	aBackpack := Backpack containingUpTo: 42 limitingPointsTo: 100.

	aBackpack add: (PointsPortableObject named: 'left-handed hammer' weighing: 10 worth: 5).
	aBackpack add: (PointsPortableObject named: 'car key' weighing: 10 worth: 20).
	
	self assert: aBackpack size equals: 2.
	self assert: aBackpack totalPoints equals: 25.

! !

!BackpackTest methodsFor: 'accessing' stamp: 'HAW 10/14/2020 14:35:57'!
test15ShouldNotAddPointsWhenAddingNoPointsPortableObjects

	| aBackpack |
	aBackpack := Backpack containingUpTo: 42 limitingPointsTo: 100.

	aBackpack add: (PointsPortableObject named: 'left-handed hammer' weighing: 10 worth: 5).
	aBackpack add: (NoPointsPortableObject named: 'help-wanted sign' weighing: 10).
	aBackpack add: (NoPointsPortableObject named: 'help-wanted sign' weighing: 10).
	
	self assert: aBackpack size equals: 3.
	self assert: aBackpack totalPoints equals: 5.

! !


!classDefinition: #PlayableCharacterTest category: 'ISW1-2020-2C-2doParcial'!
TestCase subclass: #PlayableCharacterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2020-2C-2doParcial'!

!PlayableCharacterTest methodsFor: 'tests' stamp: 'MP 11/24/2021 00:03:37'!
test01_forwardWhenHeadingNorthIncrementsYCoordinate

	| playableCharacter |

	playableCharacter := PlayableCharacter named: 'Luigi' using: self defaultBackpack at: 1@2 heading: #North in: self defaultRoom .

	playableCharacter moveForward.

	self assert: (playableCharacter isAt: 1@3 heading: #North)! !

!PlayableCharacterTest methodsFor: 'tests' stamp: 'MP 11/24/2021 00:03:37'!
test02_backwardWhenHeadingNorthDecrementsYCoordinate

	| playableCharacter |

	playableCharacter := PlayableCharacter named: 'Luigi' using: self defaultBackpack at: 1@2 heading: #North in: self defaultRoom .

	playableCharacter moveBackward.

	self assert: (playableCharacter isAt: 1@1 heading: #North)! !

!PlayableCharacterTest methodsFor: 'tests' stamp: 'MP 11/24/2021 00:03:37'!
test03_rotateRightWhenHeadingNorthHeadsEast

	| playableCharacter |

	playableCharacter := PlayableCharacter named: 'Luigi' using: self defaultBackpack at: 1@2 heading: #North in: self defaultRoom .

	playableCharacter rotateRight.

	self assert: (playableCharacter isAt: 1@2 heading: #East)! !

!PlayableCharacterTest methodsFor: 'tests' stamp: 'MP 11/24/2021 00:03:37'!
test04_rotateLeftWhenHeadingNorthHeadsWest

	| playableCharacter |

	playableCharacter := PlayableCharacter named: 'Luigi' using: self defaultBackpack at: 1@2 heading: #North in: self defaultRoom .

	playableCharacter rotateLeft.

	self assert: (playableCharacter isAt: 1@2 heading: #West)! !

!PlayableCharacterTest methodsFor: 'tests' stamp: 'MP 11/24/2021 00:03:37'!
test05_movingWhenHeadingEastWorksAsExpected

	| playableCharacter |

	playableCharacter := PlayableCharacter named: 'Luigi' using: self defaultBackpack at: 1@2 heading: #East in: self defaultRoom .

	playableCharacter
		moveForward;
		moveForward;
		moveBackward;
		rotateRight;
		rotateLeft;
		rotateLeft.

	self assert: (playableCharacter isAt: 2@2 heading: #North)! !

!PlayableCharacterTest methodsFor: 'tests' stamp: 'MP 11/24/2021 00:03:36'!
test06_movingWhenHeadingSouthWorksAsExpected

	| playableCharacter |

	playableCharacter := PlayableCharacter named: 'Luigi' using: self defaultBackpack at: 1@2 heading: #South in: self defaultRoom .

	playableCharacter
		moveForward;
		moveForward;
		moveBackward;
		rotateRight;
		rotateLeft;
		rotateLeft.

	self assert: (playableCharacter isAt: 1@1 heading: #East)! !

!PlayableCharacterTest methodsFor: 'tests' stamp: 'MP 11/24/2021 00:03:37'!
test07_movingWhenHeadingWestWorksAsExpected

	| playableCharacter |

	playableCharacter := PlayableCharacter named: 'Luigi' using: self defaultBackpack at: 2@2 heading: #West in: self defaultRoom .

	playableCharacter
		moveForward;
		moveForward;
		moveBackward;
		rotateRight;
		rotateLeft;
		rotateLeft.

	self assert: (playableCharacter isAt: 1@2 heading: #South)! !

!PlayableCharacterTest methodsFor: 'tests' stamp: 'MP 11/24/2021 00:03:37'!
test08_canNotCreatePlayableCharacterWhenHeadingIsNotValid

	self
		should: [PlayableCharacter named: 'Luigi' using: self defaultBackpack at: 1@2 heading: #X in: self defaultRoom ]
		raise: Error
		withExceptionDo: [:anError |
			self assert: PlayableCharacter invalidCardinalPointErrorDescription equals: anError messageText ]! !

!PlayableCharacterTest methodsFor: 'tests' stamp: 'MP 11/24/2021 23:18:01'!
test09_canTakePortableObjects

	| playableCharacter paper room |

	room _ self defaultRoom.
	paper := NoPointsPortableObject named: 'Paper' weighing: 1.
	room add: paper at: 2@3.
	playableCharacter := PlayableCharacter named: 'Luigi' using: self defaultBackpack at: 2@2 heading: #North in: room.
	
	playableCharacter take: paper.
	
	self assert: (playableCharacter backpackIncludes: paper)! !

!PlayableCharacterTest methodsFor: 'tests' stamp: 'MP 11/24/2021 23:19:19'!
test10_canNotTakeMoreObjectsThanTheBackpackCanCarry

	| playableCharacter paper key room |
	
	paper := NoPointsPortableObject named: 'Paper' weighing: 100.
	key := NoPointsPortableObject named: 'Key' weighing: 1.

	room _ self defaultRoom.
	room add: paper at: 2@3.
	room add: key at:  3@2.
	
	playableCharacter := PlayableCharacter named: 'Luigi' using: self defaultBackpack at: 2@2 heading: #North in: room.
	
	playableCharacter take: paper.
	playableCharacter rotateRight.
	self 
		should: [ playableCharacter take: key ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError |
			self assert: Backpack maxWeightExceededErrorDescription equals: anError messageText.
			self assert: (playableCharacter backpackIncludes: paper).
			self deny: (playableCharacter backpackIncludes: key) ]
	
	! !


!PlayableCharacterTest methodsFor: 'as yet unclassified' stamp: 'HAW 12/9/2020 13:53:29'!
defaultBackpack

	^ Backpack containingUpTo: 100 limitingPointsTo: 100 ! !

!PlayableCharacterTest methodsFor: 'as yet unclassified' stamp: 'MP 11/24/2021 00:05:03'!
defaultRoom

	^ Room width: 10 height: 10.! !


!classDefinition: #RoomTest category: 'ISW1-2020-2C-2doParcial'!
TestCase subclass: #RoomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2020-2C-2doParcial'!

!RoomTest methodsFor: 'tests' stamp: 'MP 11/24/2021 00:02:28'!
defaultBackpack
	
	^ Backpack containingUpTo: 100 limitingPointsTo: 100.! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/24/2021 00:00:04'!
test01CannotCreateRoomWithInvalidWidth

	self should: [ Room width: -1 height: 1. ]
		raise: Error - MessageNotUnderstood
		withMessageText: Room invalidCellsErrorDescription.! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/24/2021 00:00:12'!
test02CannotCreateRoomWithInvalidHeight

	self should: [ Room width: 1 height: -1. ]
		raise: Error - MessageNotUnderstood
		withMessageText: Room invalidCellsErrorDescription.! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/25/2021 12:29:50'!
test03CannotCreatePlayerOutOfRoomBounds

	| room |
	room _ Room width: 1 height: 1.
	self should: [ PlayableCharacter named: 'Mario' using: self defaultBackpack at: 2@2 heading: #North in: room. ]
		raise: Error - MessageNotUnderstood
		withMessageText: Room positionOutsideOfRoomErrorDescription.! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/25/2021 12:22:10'!
test04CannotCreatePlayerOnTopOfStageObject

	| room |
	room _ Room width: 2 height: 2.
	room add: self key at: 2@2.

	self should: [ PlayableCharacter named: 'Mario' using: self defaultBackpack at: 2@2 heading: #North in: room. ]
		raise: Error - MessageNotUnderstood
		withMessageText: Room positionOccupiedErrorDescription.! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/25/2021 12:29:54'!
test05CannotMoveForwardOutsideOfRoom

	| room player |
	room _ Room width: 2 height: 2.
	player _ PlayableCharacter named: 'Mario' using: self defaultBackpack at: 2@2 heading: #North in: room.
	self should: [ player moveForward ]
		raise: Error - MessageNotUnderstood
		withMessageText: Room positionOutsideOfRoomErrorDescription.! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/25/2021 12:29:57'!
test06CannotMoveBackwardOutsideOfRoom

	| room player |
	room _ Room width: 2 height: 2.
	player _ PlayableCharacter named: 'Mario' using: self defaultBackpack at: 0@0 heading: #North in: room.
	self should: [ player moveBackward ]
		raise: Error - MessageNotUnderstood
		withMessageText: Room positionOutsideOfRoomErrorDescription.! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/25/2021 12:30:00'!
test07CannotMoveForwardOverObject

	| room player |
	room _ Room width: 2 height: 2.
	room add: self key at: 2@2.
	player _ PlayableCharacter named: 'Mario' using: self defaultBackpack at: 2@1 heading: #North in: room.
	self should: [ player moveForward ]
		raise: Error - MessageNotUnderstood
		withMessageText: Room positionOccupiedErrorDescription.! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/25/2021 12:30:04'!
test08CannotMoveBackwardOverObject

	| room player |
	room _ Room width: 2 height: 2.
	room add: self key at: 2@0.
	player _ PlayableCharacter named: 'Mario' using: self defaultBackpack at: 2@1 heading: #North in: room.
	self should: [ player moveBackward ]
		raise: Error - MessageNotUnderstood
		withMessageText: Room positionOccupiedErrorDescription.! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/24/2021 19:53:26'!
test09ObjectsCannotOverlapInRoom

	| room key sign |
	room _ Room width: 2 height: 2.
	key _ self key.
	sign _ self sign.
	room add: key at: 2@0.
	self should: [ room add: sign at: 2@0 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Room positionOccupiedErrorDescription equals: anError messageText.
			self assert: (room is: key at: 2@0).
			self deny: (room is: sign at: 2@0).
		]! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/24/2021 19:53:34'!
test10RoomCanContainMultipleObjectsInDifferentPositions

	| room key sign |
	room _ Room width: 2 height: 2.
	key _ self key.
	sign _ self sign.

	room add: key at: 2@0.
	room add: sign at: 1@0.
	
	self assert: (room is: key at: 2@0).
	self assert: (room is: sign at: 1@0).! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/25/2021 11:51:01'!
test11PlayerTakingContiguousObjectsFromRoomRemovesThem

	| player room key |
	room _ Room width: 5 height: 5.
	key _ self key.
	room add: key at: 0@1.
	player _ PlayableCharacter named: 'Mario' using: self defaultBackpack at: 0@0 heading: #North in: room.
	
	player take: key.
	
	self assert: (player backpackIncludes: key).
	self deny: (room is: key at: 0@1). 


	! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/25/2021 11:51:12'!
test12PlayerCanOnlyTakeContiguousObjects

	| player room key |
	room _ Room width: 5 height: 5.
	key _ self key.
	room add: key at: 1@0.
	player _ PlayableCharacter named: 'Mario' using: self defaultBackpack at: 0@0 heading: #North in: room.
	
	self should: [ player take: key. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Room cannotTakeObjectErrorDescription equals: anError messageText.
			self deny: (player backpackIncludes: key).
			self assert: (room is: key at: 1@0).
		].
	


	! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/25/2021 11:51:45'!
test13PlayerCanTakePortableObjectFromNoPortableObject

	| player room key box |
	room _ Room width: 5 height: 5.
	key _ self key.
	box _ NoPortableObject named: 'box' including: (OrderedCollection with: key).
	room add: box at: 0@1.
	player _ PlayableCharacter named: 'Mario' using: self defaultBackpack at: 0@0 heading: #North in: room.
	
	player take: box.
	
	self assert: (player backpackIncludes: key).
	self deny: (box includes: key).! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/25/2021 11:51:56'!
test14PlayerCanTakePortableObjectsFromNoPortableObject

	| player room key box book |
	room _ Room width: 5 height: 5.
	key _ self key.
	book _ self book.
	box _ NoPortableObject named: 'box' including: (OrderedCollection with: key with: book).
	room add: box at: 0@1.
	player _ PlayableCharacter named: 'Mario' using: self defaultBackpack at: 0@0 heading: #North in: room.
	
	player take: box.
	
	self assert: (player backpackIncludes: book).
	self assert: (player backpackIncludes: key).
	self deny: (box includes: key).
	self deny: (box includes: book).
	self assert: (room is: box at: 0@1).! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/25/2021 11:52:13'!
test15PlayerTakesAsManyObjectsAsBackpackHandles

	| player room key box book heavyObject |
	key _ self key.
	book _ self book.
	heavyObject _ NoPointsPortableObject named: 'Dark matter' weighing: 1000.
	box _ NoPortableObject named: 'box' including: (OrderedCollection with: key with: book with: heavyObject).
	
	room _ Room width: 5 height: 5.
	room add: box at: 0@1.

	player _ PlayableCharacter named: 'Mario' using: self defaultBackpack at: 0@0 heading: #North in: room.

	self 
		should: [ 	player take: box. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Backpack maxWeightExceededErrorDescription equals: anError messageText.
			self assert: (player backpackIncludes: book).
			self assert: (player backpackIncludes: key).
			self deny: (box includes: key).
			self deny: (box includes: book).
			self assert: (box includes: heavyObject).
			self assert: (room is: box at: 0@1).
		].
	
	! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/25/2021 12:19:03'!
test16PlayerTakesObjectsFromNestedNoPortableObjects

	| player room key box book closet coin drawer |
	room _ Room width: 5 height: 5.
	key _ self key.
	book _ self book.
	coin _ self coin.

	box _ NoPortableObject named: 'box'
		including: (OrderedCollection with: coin).

	drawer _ NoPortableObject named: 'drawer'
		including: (OrderedCollection with: key with: box).

	closet _ NoPortableObject named: 'closet'
		including: (OrderedCollection with: book with: drawer).
	
	room add: closet at: 0@1.
	player _ PlayableCharacter named: 'Mario' using: self defaultBackpack at: 0@0 heading: #North in: room.
	
	player take: closet.
	
	self assert: (player backpackIncludes: book).
	self assert: (player backpackIncludes: key).
	self assert: (player backpackIncludes: coin).
	
	self deny: (closet includes: book).
	self assert: (closet includes: drawer).
	
	self deny: (drawer includes: key).
	self assert: (drawer includes: box).
	
	self deny: (box includes: coin).
	
	self assert: (room is: closet at: 0@1).! !

!RoomTest methodsFor: 'tests' stamp: 'MP 11/25/2021 12:26:08'!
test17CannotAddObjectsOutsideOfRoom

	| room key |
	room _ Room width: 5 height: 5.
	key _ self key.
	
	self should: [ room add: key at: 6@6 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Room positionOutsideOfRoomErrorDescription equals: anError messageText.
			self deny: (room is: key at: 6@6).
		].
! !


!RoomTest methodsFor: 'stage objects' stamp: 'MP 11/25/2021 11:21:14'!
book

	^ NoPointsPortableObject named: 'book' weighing: 20.! !

!RoomTest methodsFor: 'stage objects' stamp: 'MP 11/25/2021 11:57:49'!
coin

	^ NoPointsPortableObject named: 'coin' weighing: 1.! !

!RoomTest methodsFor: 'stage objects' stamp: 'MP 11/24/2021 20:38:37'!
key

	^ NoPointsPortableObject named: 'key' weighing: 10.! !

!RoomTest methodsFor: 'stage objects' stamp: 'MP 11/24/2021 14:40:56'!
sign

	^ NoPortableObject named: 'sign'.! !


!classDefinition: #Backpack category: 'ISW1-2020-2C-2doParcial'!
Object subclass: #Backpack
	instanceVariableNames: 'weightCapacity gamePointsCapacity container'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2020-2C-2doParcial'!

!Backpack methodsFor: 'exceptions' stamp: 'FRT 10/8/2020 18:02:29'!
signalMaxPointsExceeded

	self error: self class maxPointsExceededErrorDescription ! !

!Backpack methodsFor: 'exceptions' stamp: 'FRT 10/8/2020 18:02:47'!
signalMaxWeightExceeded

	self error: self class maxWeightExceededErrorDescription ! !


!Backpack methodsFor: 'initialization' stamp: 'HAW 10/14/2020 14:31:56'!
initializeContainingUpTo: aWeightCapacity limitingPointsTo: pointsCapacity

	weightCapacity := aWeightCapacity.
	gamePointsCapacity := pointsCapacity.
	
	container := OrderedCollection new.
	
	
	! !


!Backpack methodsFor: 'accessing' stamp: 'FRT 10/11/2020 19:14:47'!
size

	^ container size.! !

!Backpack methodsFor: 'accessing' stamp: 'HAW 10/18/2020 12:20:52'!
totalPoints
		
	^(container select: [ :portableObject | portableObject doesItAddPoints ])	
		sum: [ :portableObject | portableObject points ]
		ifEmpty: [ 0 ]! !

!Backpack methodsFor: 'accessing' stamp: 'HAW 10/18/2020 12:20:20'!
totalWeight
	
	^container 
		sum: [ :portableObject | portableObject weight ]
		ifEmpty: [ 0 ]
		! !


!Backpack methodsFor: 'assertions' stamp: 'FRT 10/12/2020 14:12:36'!
assertPointsAdding: aPointsPortableObject

	(self totalPoints + aPointsPortableObject points) > gamePointsCapacity ifTrue: [ self signalMaxPointsExceeded ]! !

!Backpack methodsFor: 'assertions' stamp: 'FRT 10/15/2020 12:22:34'!
assertWeightAdding: aPortableObject tolerating: aThreshold

	(self totalWeight + aPortableObject weight - weightCapacity) > aThreshold ifTrue: [ self signalMaxWeightExceeded ]! !


!Backpack methodsFor: 'adding' stamp: 'HAW 10/18/2020 12:28:24'!
add: aPortableObject
	
	aPortableObject assertCanAddTo: self.
	
	container add: aPortableObject.
	! !


!Backpack methodsFor: 'testing' stamp: 'HAW 12/9/2020 19:44:17'!
includes: aPortableObject 
	
	^container includes: aPortableObject ! !

!Backpack methodsFor: 'testing' stamp: 'FRT 10/11/2020 18:38:38'!
isEmpty

	^ container isEmpty.! !


!Backpack methodsFor: 'adding - private' stamp: 'HAW 10/18/2020 12:28:48'!
assertCanAddNoPointsPortableObject: aNoPointsPortableObject 
	
	self assertWeightAdding: aNoPointsPortableObject tolerating: 0.
	! !

!Backpack methodsFor: 'adding - private' stamp: 'HAW 10/18/2020 12:29:07'!
assertCanAddPointPortableObject: aPointsPortableObject 
	
	self assertWeightAdding: aPointsPortableObject tolerating: 5.
	self assertPointsAdding: aPointsPortableObject.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backpack class' category: 'ISW1-2020-2C-2doParcial'!
Backpack class
	instanceVariableNames: ''!

!Backpack class methodsFor: 'error messages' stamp: 'FRT 10/11/2020 18:27:33'!
invalidPointsCapacityErrorDescription

	^ 'Points capacity must be positive'! !

!Backpack class methodsFor: 'error messages' stamp: 'FRT 10/11/2020 18:21:04'!
invalidWeightCapacityErrorDescription

	^ 'Weight capacity must be positive'! !

!Backpack class methodsFor: 'error messages' stamp: 'FRT 10/8/2020 17:36:29'!
maxPointsExceededErrorDescription

	^ 'Maximum points has been exceeded'! !

!Backpack class methodsFor: 'error messages' stamp: 'FRT 10/8/2020 17:36:17'!
maxWeightExceededErrorDescription

	^ 'Maximum weight has been exceeded'! !

!Backpack class methodsFor: 'error messages' stamp: 'FRT 10/8/2020 17:43:00'!
pointsCapacityMustBeIntegerErrorDescription

	^ 'Points capacity must be integer'! !

!Backpack class methodsFor: 'error messages' stamp: 'FRT 10/8/2020 17:42:48'!
weightCapacityMustBeIntegerErrorDescription

	^ 'Weight capacity must be integer'! !


!Backpack class methodsFor: 'exceptions' stamp: 'FRT 10/11/2020 18:27:16'!
signalInvalidPointsCapacity

	self error: self invalidPointsCapacityErrorDescription 
! !

!Backpack class methodsFor: 'exceptions' stamp: 'FRT 10/11/2020 18:21:51'!
signalInvalidWeightCapacity

	self error: self invalidWeightCapacityErrorDescription 
! !

!Backpack class methodsFor: 'exceptions' stamp: 'FRT 10/8/2020 17:41:06'!
signalPointsCapacityMustBeInteger

	self error: self pointsCapacityMustBeIntegerErrorDescription
! !

!Backpack class methodsFor: 'exceptions' stamp: 'FRT 10/8/2020 17:40:47'!
signalWeightCapacityMustBeInteger

	self error: self weightCapacityMustBeIntegerErrorDescription
! !


!Backpack class methodsFor: 'instance creation' stamp: 'HAW 10/14/2020 14:31:56'!
containingUpTo: aWeightCapacity limitingPointsTo: pointsCapacity

	aWeightCapacity strictlyPositive  ifFalse: [ self signalInvalidWeightCapacity ].
	pointsCapacity strictlyPositive ifFalse: [ self signalInvalidPointsCapacity ].
	
	aWeightCapacity isInteger ifFalse: [ self signalWeightCapacityMustBeInteger ].
	pointsCapacity isInteger ifFalse: [ self signalPointsCapacityMustBeInteger ].
	
	^ self new initializeContainingUpTo: aWeightCapacity limitingPointsTo: pointsCapacity.
! !


!classDefinition: #PlayableCharacter category: 'ISW1-2020-2C-2doParcial'!
Object subclass: #PlayableCharacter
	instanceVariableNames: 'position heading backpack name room'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2020-2C-2doParcial'!

!PlayableCharacter methodsFor: 'initialization' stamp: 'MP 11/24/2021 00:04:31'!
initializeNamed: aName using: aBackpack at: aPosition heading: aMarsRoverHeading in: aRoom  

	name := aName.
	backpack := aBackpack.
	position := aPosition.
	heading := aMarsRoverHeading.
	room := aRoom. ! !


!PlayableCharacter methodsFor: 'moving' stamp: 'MP 11/25/2021 12:32:40'!
moveBackward

	self moveTo: position - heading forwardPoint ! !

!PlayableCharacter methodsFor: 'moving' stamp: 'MP 11/25/2021 12:32:16'!
moveForward

	self moveTo: position + heading forwardPoint.! !

!PlayableCharacter methodsFor: 'moving' stamp: 'MP 11/25/2021 12:32:32'!
moveTo: aPosition

	room assertPositionIsValid: aPosition.
	position := aPosition! !


!PlayableCharacter methodsFor: 'rotating' stamp: 'HAW 10/11/2019 08:31:55'!
rotateLeft
	
	heading := heading leftHeading! !

!PlayableCharacter methodsFor: 'rotating' stamp: 'HAW 10/11/2019 08:32:04'!
rotateRight
	
	heading := heading rightHeading! !


!PlayableCharacter methodsFor: 'taking objects' stamp: 'MP 11/24/2021 23:36:50'!
take: aStageObject

	room player: self lookingAt: position + heading forwardPoint takes: aStageObject.! !


!PlayableCharacter methodsFor: 'taking objects - private' stamp: 'MP 11/24/2021 23:27:45'!
addToBackpack: aPortableObject

	backpack add: aPortableObject.! !


!PlayableCharacter methodsFor: 'testing' stamp: 'HAW 12/9/2020 19:43:44'!
backpackIncludes: aPortableObject 
	
	^backpack includes: aPortableObject ! !

!PlayableCharacter methodsFor: 'testing' stamp: 'HAW 7/1/2018 14:25:05'!
isAt: aPosition heading: aCardinalPoint

	^position = aPosition and: [ heading cardinalPoint = aCardinalPoint ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayableCharacter class' category: 'ISW1-2020-2C-2doParcial'!
PlayableCharacter class
	instanceVariableNames: 'headings'!

!PlayableCharacter class methodsFor: 'heading' stamp: 'HAW 7/2/2018 16:28:16'!
headingFor: aCardinalPoint
	
	^headings at: aCardinalPoint ifAbsent: [ self error: self invalidCardinalPointErrorDescription ]! !


!PlayableCharacter class methodsFor: 'instance creation' stamp: 'MP 11/25/2021 12:31:05'!
named: aName using: aBackpack at: aPosition heading: aCardinalPoint in: aRoom  
	
	| newHeading |

	newHeading := self headingFor: aCardinalPoint.
	
	aRoom assertPositionIsValid: aPosition.

	^self new initializeNamed: aName using: aBackpack at: aPosition heading: newHeading in: aRoom! !


!PlayableCharacter class methodsFor: 'initialization' stamp: 'HAW 10/11/2019 08:37:25'!
forHeadingAt: aCardinalPoint leftIs: aLeftCardinalPoint rightIs: aRightCardinalPoint
	
	(headings at: aCardinalPoint) leftHeading: (headings at: aLeftCardinalPoint) rightHeading: (headings at: aRightCardinalPoint).
	! !

!PlayableCharacter class methodsFor: 'initialization' stamp: 'HAW 7/2/2018 15:27:41'!
initialize

	self initializeHeadings! !

!PlayableCharacter class methodsFor: 'initialization' stamp: 'HAW 12/9/2020 19:31:43'!
initializeHeadings

	headings := Dictionary new.
	
	(OrderedCollection 
		with: (PlayableCharacterHeading for: #North forwardWith: 0@1 )	
		with: (PlayableCharacterHeading for: #East forwardWith: 1@0 )
		with: (PlayableCharacterHeading for: #South forwardWith: 0@-1 )
		with: (PlayableCharacterHeading for: #West forwardWith: -1@0 ))
			do: [ :heading | headings at: heading cardinalPoint put: heading ].
	
	self 
		forHeadingAt: #North leftIs: #West rightIs: #East;
		forHeadingAt: #South leftIs: #East rightIs: #West;
		forHeadingAt: #East leftIs: #North rightIs: #South;
		forHeadingAt: #West leftIs: #South rightIs: #North.
	! !


!PlayableCharacter class methodsFor: 'error descriptions' stamp: 'HAW 7/2/2018 16:26:14'!
invalidCardinalPointErrorDescription
	
	^'Invalid cardinal point'! !


!classDefinition: #PlayableCharacterHeading category: 'ISW1-2020-2C-2doParcial'!
Object subclass: #PlayableCharacterHeading
	instanceVariableNames: 'cardinalPoint forwardPoint rightHeading leftHeading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2020-2C-2doParcial'!

!PlayableCharacterHeading methodsFor: 'accessing' stamp: 'HAW 7/2/2018 15:29:44'!
cardinalPoint
	
	^cardinalPoint! !

!PlayableCharacterHeading methodsFor: 'accessing' stamp: 'HAW 7/2/2018 15:30:39'!
forwardPoint
	
	^forwardPoint! !

!PlayableCharacterHeading methodsFor: 'accessing' stamp: 'HAW 10/11/2019 08:31:33'!
leftHeading
	
	^leftHeading! !

!PlayableCharacterHeading methodsFor: 'accessing' stamp: 'HAW 10/11/2019 08:31:27'!
rightHeading
	
	^rightHeading! !


!PlayableCharacterHeading methodsFor: 'initialization' stamp: 'HAW 10/11/2019 08:27:25'!
initializeFor: aCardinalPoint forwardWith: aForwardPoint  
	
	cardinalPoint := aCardinalPoint.
	forwardPoint := aForwardPoint.
! !

!PlayableCharacterHeading methodsFor: 'initialization' stamp: 'HAW 10/11/2019 08:31:33'!
leftHeading: aLeftHeading rightHeading: aRightHeading
 
	leftHeading := aLeftHeading.
	rightHeading := aRightHeading ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayableCharacterHeading class' category: 'ISW1-2020-2C-2doParcial'!
PlayableCharacterHeading class
	instanceVariableNames: ''!

!PlayableCharacterHeading class methodsFor: 'instance creation' stamp: 'HAW 10/11/2019 08:27:46'!
for: aCardinalPoint forwardWith: aForwardPoint  

	^self new initializeFor: aCardinalPoint forwardWith: aForwardPoint ! !


!classDefinition: #Room category: 'ISW1-2020-2C-2doParcial'!
Object subclass: #Room
	instanceVariableNames: 'width height widthInCells heightInCells objects object pos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2020-2C-2doParcial'!

!Room methodsFor: 'adding objects' stamp: 'MP 11/25/2021 12:31:05'!
add: aStageObject at: aPosition

	self assertPositionIsValid: aPosition.
	objects at: aPosition put: aStageObject.
	! !


!Room methodsFor: 'initialization' stamp: 'MP 11/24/2021 19:41:50'!
initializeWidth: aWidthOfCells height: aHeightOfCells 

	width _ aWidthOfCells.
	height _ aHeightOfCells.
	objects _ Dictionary new.! !


!Room methodsFor: 'taking objects - private' stamp: 'MP 11/25/2021 12:20:33'!
assertObject: aStageObject isAt: aPosition

	^ (self is: aStageObject at: aPosition) ifFalse: [ self error: self class cannotTakeObjectErrorDescription ]! !

!Room methodsFor: 'taking objects - private' stamp: 'MP 11/25/2021 12:08:06'!
noPortableObjectTaken: aNoPortableObject

	"they're not removed."! !

!Room methodsFor: 'taking objects - private' stamp: 'MP 11/25/2021 12:20:23'!
player: aPlayableCharacter lookingAt: aPosition takes: aStageObject 
	
	self assertObject: aStageObject isAt: aPosition.
	
	aStageObject takenBy: aPlayableCharacter from: self.
! !

!Room methodsFor: 'taking objects - private' stamp: 'MP 11/25/2021 12:10:05'!
portableObjectTaken: aPortableObject

	objects removeKey: (objects keyAtValue: aPortableObject	)! !


!Room methodsFor: 'testing' stamp: 'MP 11/24/2021 19:44:02'!
is: aStageObject at: aPosition
	
	| actualObject |
	actualObject _ objects at: aPosition ifAbsent: [ ^ false ].
	^ actualObject = aStageObject.! !

!Room methodsFor: 'testing' stamp: 'MP 11/24/2021 12:35:38'!
isInBounds: aPosition 
	
	^ width >= aPosition x 
		and: [ height >= aPosition y ]
		and: [ aPosition x >= 0 ]
		and: [ aPosition y >= 0 ].! !

!Room methodsFor: 'testing' stamp: 'MP 11/24/2021 19:44:19'!
isOccupied: aPosition
	
	^ objects includesKey: aPosition.! !


!Room methodsFor: 'assertions' stamp: 'MP 11/25/2021 12:30:55'!
assertPositionIsInBounds: aPosition

	^ (self isInBounds: aPosition) ifFalse: [ self error: self class positionOutsideOfRoomErrorDescription ]! !

!Room methodsFor: 'assertions' stamp: 'MP 11/25/2021 12:31:05'!
assertPositionIsValid: aPosition

	self assertPositionIsInBounds: aPosition.
	self assertPositionIsntOccupied: aPosition.! !

!Room methodsFor: 'assertions' stamp: 'MP 11/25/2021 12:19:39'!
assertPositionIsntOccupied: aPosition

	^ (self isOccupied: aPosition) ifTrue: [ self error: self class positionOccupiedErrorDescription ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Room class' category: 'ISW1-2020-2C-2doParcial'!
Room class
	instanceVariableNames: ''!

!Room class methodsFor: 'error descriptions' stamp: 'MP 11/24/2021 23:31:32'!
cannotTakeObjectErrorDescription
	
	^ 'cannot take object'.! !

!Room class methodsFor: 'error descriptions' stamp: 'MP 11/23/2021 23:52:39'!
invalidCellsErrorDescription
	
	^'invalid cell count, must be positive'.! !

!Room class methodsFor: 'error descriptions' stamp: 'MP 11/24/2021 14:41:13'!
positionOccupiedErrorDescription
	
	^ 'position already occupied by another object'.! !

!Room class methodsFor: 'error descriptions' stamp: 'MP 11/25/2021 12:27:15'!
positionOutsideOfRoomErrorDescription

	^ 'position outside of room bounds'.! !


!Room class methodsFor: 'instance creation' stamp: 'MP 11/23/2021 23:59:50'!
width: aWidthOfCells height: aHeightOfCells

	aWidthOfCells positive ifFalse: [ self error: self invalidCellsErrorDescription ].
	aHeightOfCells positive ifFalse: [ self error: self invalidCellsErrorDescription ].

	^self new initializeWidth: aWidthOfCells height: aHeightOfCells ! !


!classDefinition: #StageObject category: 'ISW1-2020-2C-2doParcial'!
Object subclass: #StageObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2020-2C-2doParcial'!


!classDefinition: #NoPortableObject category: 'ISW1-2020-2C-2doParcial'!
StageObject subclass: #NoPortableObject
	instanceVariableNames: 'name stageObject includedObject includedObjects'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2020-2C-2doParcial'!

!NoPortableObject methodsFor: 'initialization' stamp: 'MP 11/24/2021 23:43:25'!
includes: aStageObject

	^ includedObjects includes: aStageObject.! !

!NoPortableObject methodsFor: 'initialization' stamp: 'MP 11/24/2021 14:41:38'!
initializeNamed: aName

	name _ aName.! !

!NoPortableObject methodsFor: 'initialization' stamp: 'MP 11/24/2021 23:43:13'!
initializeNamed: aName including: aCollectionOfObjects 

	name := aName.
	includedObjects := aCollectionOfObjects.! !


!NoPortableObject methodsFor: 'taking objects - private' stamp: 'MP 11/25/2021 12:08:41'!
noPortableObjectTaken: aNoPortableObject

	"not removed".! !

!NoPortableObject methodsFor: 'taking objects - private' stamp: 'MP 11/25/2021 12:08:30'!
portableObjectTaken: aPortableObject

	includedObjects remove: aPortableObject.	! !

!NoPortableObject methodsFor: 'taking objects - private' stamp: 'MP 11/25/2021 12:17:29'!
subObjectsTakenBy: aPlayableCharacter

	| objects |
	" se hace la copia porque sino se borra mientras se itera y no se iteran todos los elementos".

	objects _ includedObjects copy.
	objects do: [ :aStageObject |
		aStageObject takenBy: aPlayableCharacter from: self.
	]
! !

!NoPortableObject methodsFor: 'taking objects - private' stamp: 'MP 11/25/2021 12:17:00'!
takenBy: aPlayableCharacter from: somewhere
	
	[ self subObjectsTakenBy: aPlayableCharacter. ]
		ensure: [ somewhere noPortableObjectTaken: self. ]
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NoPortableObject class' category: 'ISW1-2020-2C-2doParcial'!
NoPortableObject class
	instanceVariableNames: ''!

!NoPortableObject class methodsFor: 'instance creation' stamp: 'MP 11/24/2021 14:41:26'!
named: aName 

	^self new initializeNamed: aName ! !

!NoPortableObject class methodsFor: 'instance creation' stamp: 'MP 11/24/2021 23:34:59'!
named: aName including: aStageObject 

	^self new initializeNamed: aName including: aStageObject ! !


!classDefinition: #PortableObject category: 'ISW1-2020-2C-2doParcial'!
StageObject subclass: #PortableObject
	instanceVariableNames: 'name weight'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2020-2C-2doParcial'!

!PortableObject methodsFor: 'testing' stamp: 'FRT 10/11/2020 17:54:20'!
doesItAddPoints

	self subclassResponsibility	! !


!PortableObject methodsFor: 'adding' stamp: 'HAW 10/18/2020 12:28:24'!
assertCanAddTo: aBackpack

	self subclassResponsibility	! !


!PortableObject methodsFor: 'accessing' stamp: 'FRT 10/11/2020 18:53:51'!
weight

	^ weight! !


!PortableObject methodsFor: 'taking objects - private' stamp: 'MP 11/25/2021 12:06:17'!
takenBy: aPlayableCharacter from: somewhere

	aPlayableCharacter addToBackpack: self.
	somewhere portableObjectTaken: self.! !


!classDefinition: #NoPointsPortableObject category: 'ISW1-2020-2C-2doParcial'!
PortableObject subclass: #NoPointsPortableObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2020-2C-2doParcial'!

!NoPointsPortableObject methodsFor: 'initialization' stamp: 'HAW 10/14/2020 14:34:36'!
initializeNamed: aName weighing: aWeight
	
	name := aName.
	weight := aWeight.! !


!NoPointsPortableObject methodsFor: 'testing' stamp: 'FRT 10/11/2020 17:54:20'!
doesItAddPoints	

	^ false! !


!NoPointsPortableObject methodsFor: 'adding' stamp: 'HAW 10/18/2020 12:28:48'!
assertCanAddTo: aBackpack 
	
	^aBackpack assertCanAddNoPointsPortableObject: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NoPointsPortableObject class' category: 'ISW1-2020-2C-2doParcial'!
NoPointsPortableObject class
	instanceVariableNames: ''!

!NoPointsPortableObject class methodsFor: 'instance creation' stamp: 'HAW 10/14/2020 14:34:36'!
named: aName weighing: aWeight
	
	^ self new initializeNamed: aName weighing: aWeight. ! !


!classDefinition: #PointsPortableObject category: 'ISW1-2020-2C-2doParcial'!
PortableObject subclass: #PointsPortableObject
	instanceVariableNames: 'points'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2020-2C-2doParcial'!

!PointsPortableObject methodsFor: 'testing' stamp: 'FRT 10/11/2020 17:54:20'!
doesItAddPoints

	^ true! !


!PointsPortableObject methodsFor: 'initialization' stamp: 'HAW 10/14/2020 14:36:26'!
initializeNamed: aName weighing: aWeight worth: gamePoints
	
	name := aName.
	weight := aWeight.
	points := gamePoints.! !


!PointsPortableObject methodsFor: 'accessing' stamp: 'FRT 10/11/2020 19:06:57'!
points

	^ points! !


!PointsPortableObject methodsFor: 'adding' stamp: 'HAW 10/18/2020 12:29:07'!
assertCanAddTo: aBackpack 
	
	^aBackpack assertCanAddPointPortableObject: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PointsPortableObject class' category: 'ISW1-2020-2C-2doParcial'!
PointsPortableObject class
	instanceVariableNames: ''!

!PointsPortableObject class methodsFor: 'instance creation' stamp: 'HAW 10/14/2020 14:36:26'!
named: aName weighing: aWeight worth: gamePoints
	
	^ self new initializeNamed: aName weighing: aWeight worth: gamePoints.! !

PlayableCharacter initialize!