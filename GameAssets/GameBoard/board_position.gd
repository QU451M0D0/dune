extends Marker2D

@export var nearbyTerritories := []

@onready var boardPositionColliderRef := $BoardPositionCollider
@onready var spiceRef := $Spice

@onready var thisTerritory 
@onready var thisSector

@onready var thisPosition
@export var positionName : String

func _ready() -> void:
	#GlobalSignals._spawnSpice.connect(onSpawnSpiceSignalEmit)
	#getTerritorySector()
	pass

#
#func onSpawnSpiceSignalEmit(cardPosition, cardAmount) :
	#if positionName == cardPosition:
		#var positionInfo = BoardState.positions[positionName]
		#positionInfo["Spice"] += cardAmount
		
	
	#getTerritorySector()
	#getThisPosition()
	#print(thisPosition)
	#print(cardPosition)
	#if thisPosition == cardPosition :
		#spiceSpawnRef.spawnSpiceInstance()
	#print(thisTerritory.territory)
	#print(thisSector.sector)
	#print(thisPosition)

#func getTerritorySector() :
	#await get_tree().physics_frame
	#await get_tree().physics_frame
	#await get_tree().physics_frame
	#var territorySector = boardPositionColliderRef.get_overlapping_areas()
	#thisTerritory = territorySector[0]
	#thisSector = territorySector[1]
	
#func getThisPosition() :
	#var listOfPositions = BoardState.positions
	#for pos in listOfPositions :
		#var  posInfo = listOfPositions[pos]
		#if posInfo["Territory"] == thisTerritory.territory and posInfo["Sector"] == thisSector.sector :
			#thisPosition = pos
			#
