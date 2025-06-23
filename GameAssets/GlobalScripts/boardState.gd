extends Node

#State of the board of the current game

#these objects represent the game state, not the original state of these
const territoriesRef := preload("res://GameAssets/GameBoard/territories.tscn")
const sectorsRef = preload("res://GameAssets/GameBoard/sectors.tscn")
const positionsRef = preload("res://GameAssets/GameBoard/positions.tscn")

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


@onready var positions := {
	"Polar Sink A" : {
		"Territory": "Polar Sink",
		"Sector" : 18,
		"Spice": 0
		},
	"The Great Flat A" : {
		"Territory": "The Great Flat",
		"Sector" : 14,
		"Spice": 0
		},
	"Funeral Plain A" : {
		"Territory": "Funeral Plain",
		"Sector" : 14,
		"Spice": 0
		},
	"Bight of the Cliff A" : {
		"Territory": "Bight of the Cliff",
		"Sector" : 14,
		"Spice": 0
		},
	"Bight of the Cliff B" : {
		"Territory": "Bight of the Cliff",
		"Sector" : 13,
		"Spice": 0
		},
	"Sietch Tabr A" : {
		"Territory": "Sietch Tabr",
		"Sector" : 13,
		"Spice": 0
		},
	"Wind Pass A" : {
		"Territory": "Wind Pass",
		"Sector" : 16,
		"Spice": 0
		},
	"Wind Pass B" : {
		"Territory": "Wind Pass",
		"Sector" : 15,
		"Spice": 0
		},
	"Wind Pass C" : {
		"Territory": "Wind Pass",
		"Sector" : 14,
		"Spice": 0
		},
	"Wind Pass D" : {
		"Territory": "Wind Pass",
		"Sector" : 13,
		"Spice": 0
		},
	"Plastic Basin A" : {
		"Territory": "Plastic Basin",
		"Sector" : 13,
		"Spice": 0
		},
	"Plastic Basin B" : {
		"Territory": "Plastic Basin",
		"Sector" : 12,
		"Spice": 0
		},
	"Plastic Basin C" : {
		"Territory": "Plastic Basin",
		"Sector" : 11,
		"Spice": 0
		},
	"Rock Outcroppings A" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 13,
		"Spice": 0
		},
	"Rock Outcroppings B" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Hagga Basin A" : {
		"Territory": "Hagga Basin",
		"Sector" : 12,
		"Spice": 0
		},
	"Hagga Basin B" : {
		"Territory": "Hagga Basin",
		"Sector" : 11,
		"Spice": 0
		},
	"Broken Land A" : {
		"Territory": "Broken Land",
		"Sector" : 11,
		"Spice": 0
		},
	"Broken Land B" : {
		"Territory": "Broken Land",
		"Sector" : 10,
		"Spice": 0
		},
	"Tsimpo A" : {
		"Territory": "Tsimpo",
		"Sector" : 12,
		"Spice": 0
		},
	"Tsimpo B" : {
		"Territory": "Tsimpo",
		"Sector" : 11,
		"Spice": 0
		},
	"Tsimpo C" : {
		"Territory": "Tsimpo",
		"Sector" : 10,
		"Spice": 0
		},
	"Carthag A" : {
		"Territory": "Carthag",
		"Sector" : 10,
		"Spice": 0
		},
	"Arsunt A" : {
		"Territory": "Arsunt",
		"Sector" : 11,
		"Spice": 0
		},
	"Arsunt B" : {
		"Territory": "Arsunt",
		"Sector" : 10,
		"Spice": 0
		},
	"Imperial Basin A" : {
		"Territory": "Imperial Basin",
		"Sector" : 10,
		"Spice": 0
		},
	"Imperial Basin B" : {
		"Territory": "Imperial Basin",
		"Sector" : 9,
		"Spice": 0
		},
	"Imperial Basin C" : {
		"Territory": "Imperial Basin",
		"Sector" : 8,
		"Spice": 0
		},
	"Arrakeen A" : {
		"Territory": "Arrakeen",
		"Sector" : 9,
		"Spice": 0
		},
	"Old Gap A" : {
		"Territory": "Old Gap",
		"Sector" : 10,
		"Spice": 0
		},
	"Old Gap B" : {
		"Territory": "Old Gap",
		"Sector" : 9,
		"Spice": 0
		},
	"Old Gap C" : {
		"Territory": "Old Gap",
		"Sector" : 8,
		"Spice": 0
		},
		
	"Rim Wall West A" : {
		"Territory": "Rim Wall West",
		"Sector" : 8,
		"Spice": 0
		},
	"Basin A" : {
		"Territory": "Basin",
		"Sector" : 8,
		"Spice": 0
		},
	"Hole in the Rock A" : {
		"Territory": "Hole in the Rock",
		"Sector" : 8,
		"Spice": 0
		},
	"Sihaya Ridge A" : {
		"Territory": "Sihaya Ridge",
		"Sector" : 8,
		"Spice": 0
		},
	"Shield Wall A" : {
		"Territory": "Shield Wall",
		"Sector" : 8,
		"Spice": 0
		},
	"Shield Wall B" : {
		"Territory": "Shield Wall",
		"Sector" : 7,
		"Spice": 0
		},
	"False Wall East A" : {
		"Territory": "False Wall East",
		"Sector" : 8,
		"Spice": 0
		},
	"False Wall East B" : {
		"Territory": "False Wall East",
		"Sector" : 8,
		"Spice": 0
		},
	"False Wall East C" : {
		"Territory": "False Wall East",
		"Sector" : 7,
		"Spice": 0
		},
	"False Wall East D" : {
		"Territory": "False Wall East",
		"Sector" : 6,
		"Spice": 0
		},
	"False Wall East E" : {
		"Territory": "False Wall East",
		"Sector" : 5,
		"Spice": 0
		},
	"Gara Kulon A" : {
		"Territory": "Gara Kulon",
		"Sector" : 7,
		"Spice": 0
		},
	"The Minor Erg A" : {
		"Territory": "The Minor Erg",
		"Sector" : 7,
		"Spice": 0
		},
		
	"The Minor Erg B" : {
		"Territory": "The Minor Erg",
		"Sector" : 6,
		"Spice": 0
		},
	"The Minor Erg C" : {
		"Territory": "The Minor Erg",
		"Sector" : 5,
		"Spice": 0
		},
	"The Minor Erg D" : {
		"Territory": "The Minor Erg",
		"Sector" : 4,
		"Spice": 0
		},
	"Pasty Mesa A" : {
		"Territory": "Pasty Mesa",
		"Sector" : 7,
		"Spice": 0
		},
	"Pasty Mesa B" : {
		"Territory": "Pasty Mesa",
		"Sector" : 6,
		"Spice": 0
		},
	"Pasty Mesa C" : {
		"Territory": "Pasty Mesa",
		"Sector" : 5,
		"Spice": 0
		},
	"Pasty Mesa D" : {
		"Territory": "Pasty Mesa",
		"Sector" : 4,
		"Spice": 0
		},
	"Red Chasm A" : {
		"Territory": "Red Chasm",
		"Sector" : 6,
		"Spice": 0
		},
	"South Mesa A" : {
		"Territory": "South Mesa",
		"Sector" : 5,
		"Spice": 0
		},
	"South Mesa B" : {
		"Territory": "South Mesa",
		"Sector" : 4,
		"Spice": 0
		},
	"South Mesa C" : {
		"Territory": "South Mesa",
		"Sector" : 3,
		"Spice": 0
		},
	"Tuek's Sietch A" : {
		"Territory": "Tuek's Sietch",
		"Sector" : 4,
		"Spice": 0
		},
	"False Wall South A" : {
		"Territory": "False Wall South",
		"Sector" : 4,
		"Spice": 0
		},
	"False Wall South B" : {
		"Territory": "False Wall South",
		"Sector" : 3,
		"Spice": 0
		},
	"Harg Pass A" : {
		"Territory": "Harg Pass",
		"Sector" : 4,
		"Spice": 0
		},
	"Harg Pass B" : {
		"Territory": "Harg Pass",
		"Sector" : 3,
		"Spice": 0
		},
	"Cielago East A" : {
		"Territory": "Cielago East",
		"Sector" : 3,
		"Spice": 0
		},
	"Cielago East B" : {
		"Territory": "Cielago East",
		"Sector" : 2,
		"Spice": 0
		},
	"Cielago North A" : {
		"Territory": "Cielago North",
		"Sector" : 2,
		"Spice": 0
		},
	"Cielago North B" : {
		"Territory": "Cielago North",
		"Sector" : 1,
		"Spice": 0
		},
	"Cielago North C" : {
		"Territory": "Cielago North",
		"Sector" : 0,
		"Spice": 0
		},
	"Cielago Depression A" : {
		"Territory": "Cielago Depression",
		"Sector" : 2,
		"Spice": 0
		},
	"Cielago Depression B" : {
		"Territory": "Cielago Depression",
		"Sector" : 1,
		"Spice": 0
		},
	"Cielago Depression C" : {
		"Territory": "Cielago Depression",
		"Sector" : 0,
		"Spice": 0
		},
	"Cielago South A" : {
		"Territory": "Cielago South",
		"Sector" : 2,
		"Spice": 0
		},
	"Cielago South B" : {
		"Territory": "Cielago South",
		"Sector" : 1,
		"Spice": 0
		},
	"Meridian A" : {
		"Territory": "Meridian",
		"Sector" : 1,
		"Spice": 0
		},
	"Meridian B" : {
		"Territory": "Meridian",
		"Sector" : 0,
		"Spice": 0
		},
	"Cielago West A" : {
		"Territory": "Cielago West",
		"Sector" : 0,
		"Spice": 0
		},
	"Cielago West B" : {
		"Territory": "Cielago West",
		"Sector" : 17,
		"Spice": 0
		},
	"Wind Pass North A" : {
		"Territory": "Wind Pass North",
		"Sector" : 17,
		"Spice": 0
		},
	"Wind Pass North B" : {
		"Territory": "Wind Pass North",
		"Sector" : 16,
		"Spice": 0
		},
	"Habbanya Ridge Flat A" : {
		"Territory": "Habbanya Ridge Flat",
		"Sector" : 17,
		"Spice": 0
		},
	"Habbanya Ridge Flat B" : {
		"Territory": "Habbanya Ridge Flat",
		"Sector" : 16,
		"Spice": 0
		},
	"Habbanya Sietch A" : {
		"Territory": "Habbanya Sietch",
		"Sector" : 16,
		"Spice": 0
		},
	"False Wall West A" : {
		"Territory": "False Wall West",
		"Sector" : 17,
		"Spice": 0
		},
	"False Wall West B" : {
		"Territory": "False Wall West",
		"Sector" : 16,
		"Spice": 0
		},
	"False Wall West C" : {
		"Territory": "False Wall West",
		"Sector" : 15,
		"Spice": 0
		},
	"Habbanya Erg A" : {
		"Territory": "Habbanya Erg",
		"Sector" : 16,
		"Spice": 0
		},
	"Habbanya Erg B" : {
		"Territory": "Habbanya Erg",
		"Sector" : 15,
		"Spice": 0
		},
	"The Greater Flat A" : {
		"Territory": "The Greater Flat",
		"Sector" : 15,
		"Spice": 0
		},
}

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

#func _ready() -> void:
	#var territoriesInst = territoriesRef.instantiate()
	#add_child(territoriesInst)
	#var sectorsInst = sectorsRef.instantiate()
	#add_child(sectorsInst)
	#var positionsInst = positionsRef.instantiate()
	#add_child(positionsInst)
	#await get_tree().process_frame
