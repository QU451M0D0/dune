extends Node

@onready var phaseLabel = $CurrentPhaseLabel
@onready var stormManagerRef = preload("res://GameAssets/PhaseManager/Phases/storm_manager.tscn")
@onready var spiceBlowNexusManagerRef = preload("res://GameAssets/PhaseManager/Phases/spice_blow_nexus_manager.tscn")

##Standard Functions
func _ready() -> void:
	GlobalSignals._endPhaseSignal.connect(_endPhase)
	phaseLabel.text = str(BoardState.phases[BoardState.currentPhase])
	managePhase()

##Local Functions
func managePhase():
	match BoardState.phases[BoardState.currentPhase] :
		"Storm":
			var stormManagerInstance = stormManagerRef.instantiate()
			add_child(stormManagerInstance)
			
		"SpiceBlowNexus":
			var spiceBlowNexusInstance = spiceBlowNexusManagerRef.instantiate()
			add_child(spiceBlowNexusInstance)
			
		"CHOAMCharity":
			pass
		"Bidding":
			pass
		"Revival":
			pass
		"ShipmentAndMovement":
			pass
		"Battle":
			pass
		"SpiceCollection":
			pass
		"MentatPause":
			pass

func advancePhase():
	if BoardState.currentPhase < (BoardState.phases.size() - 1):
		BoardState.currentPhase += 1
	else:
		BoardState.currentPhase = 0
		BoardState.currentTurn += 1
	pass
	phaseLabel.text = BoardState.phases[BoardState.currentPhase]
	
	print(BoardState.phases[BoardState.currentPhase])
	print(BoardState.currentTurn)

func _endPhase():
	advancePhase()
	managePhase()


##Signals
func _on_EndPhase_button_down() -> void:
	_endPhase()
	
	phaseLabel.text = BoardState.phases[BoardState.currentPhase]
	print(BoardState.phases[BoardState.currentPhase])
	print(BoardState.currentTurn)
