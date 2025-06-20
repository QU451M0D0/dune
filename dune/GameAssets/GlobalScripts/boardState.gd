extends Node

#State of the board of the current game

#these objects represent the game state, not the original state of these


@onready var currentTurn := 0

@onready var phases := [
	"Storm",
	"SpiceBlowNexus",
	"CHOAMCharity",
	"Bidding",
	"Revival",
	"ShipmentAndMovement",
	"Battle",
	"SpiceCollection",
	"MentatPause"
]

@onready var currentPhase := 0


@onready var stormSectors := [
	0,
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11,
	12,
	13,
	14,
	15,
	16,
	17
]

@onready var currentStormSector := 0

@onready var spiceBlowDeck := [
]

@onready var spiceBlowDiscardA := [
	
]

@onready var spiceBlowDiscardB := [
	
]
