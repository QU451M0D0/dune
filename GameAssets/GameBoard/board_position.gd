extends Marker2D
\
@export var nearbyTerritories := []

@onready var boardPositionColliderRef := $BoardPositionCollider
@onready var spiceSpawnRef := $SpiceSpawn

@onready var thisTerritory 
@onready var thisSector

@onready var thisPosition

func _ready() -> void:
	GlobalSignals._spawnSpice.connect(onSpawnSpiceSignalEmit)

func getTerritorySector() :
	var territorySector = boardPositionColliderRef.get_overlapping_areas()
	thisTerritory = territorySector[0]
	thisSector = territorySector[1]

func onSpawnSpiceSignalEmit(cardPosition, cardAmount) :
	if thisPosition == cardPosition :
		for i in cardAmount:
			spiceSpawnRef.spawnSpiceInstance()

func getThisPosition() :
	var listOfPositions = BoardState.positions
	var listOfPositionsKeys = listOfPositions.keys()
	for pos in listOfPositions :
		var  posInfo = listOfPositions[pos]
		if posInfo["Territory"] == thisTerritory.territory and posInfo["Sector"] == thisSector.sector :
			thisPosition = pos


func _on_button_pressed() -> void:
	getTerritorySector()
	getThisPosition()
	print(thisTerritory.territory)
	print(thisSector.sector)
	print(thisPosition)
