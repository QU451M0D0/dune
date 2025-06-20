extends Node


@onready var stormChoiceMax : int
@onready var stormChoiceMin : int

@onready var playerAChoice : int
@onready var playerAChoiceConfirmed : bool
@onready var playerBChoice : int
@onready var playerBChoiceConfirmed : bool

@onready var moveStormTotal : int

@onready var MoveStormUI := $MoveStormUI
@onready var playerASpinBox := $MoveStormUI/PlayerUnitChoiceHBox/PlayerAVBox/PlayerAValue
@onready var playerBSpinBox := $MoveStormUI/PlayerUnitChoiceHBox/PlayerBVBox/PlayerBValue
@onready var playerAConfirm := $MoveStormUI/PlayerUnitChoiceHBox/PlayerAVBox/ConfirmA
@onready var playerBConfirm := $MoveStormUI/PlayerUnitChoiceHBox/PlayerBVBox/ConfirmB
@onready var totalLabel := $MoveStormUI/PlayerUnitChoiceHBox/TotalVBox/Total

signal _bothPlayersConfirmed 

func setStormChoiceMinMax(currentTurn):
	if currentTurn == 0:
		stormChoiceMax = 18
		stormChoiceMin = 0
		playerASpinBox.max_value = stormChoiceMax
		playerBSpinBox.max_value = stormChoiceMax
		playerASpinBox.min_value = stormChoiceMin
		playerBSpinBox.min_value = stormChoiceMin
		pass
	else :
		stormChoiceMax = 3
		stormChoiceMin = 1
		playerASpinBox.max_value = stormChoiceMax
		playerBSpinBox.max_value = stormChoiceMax
		playerASpinBox.min_value = stormChoiceMin
		playerBSpinBox.min_value = stormChoiceMin
		pass

func updateTotalText():
	totalLabel.text = str(int(playerASpinBox.value + playerBSpinBox.value))

func resetMoveStormUI():
	playerAChoiceConfirmed = false
	playerBChoiceConfirmed = false
	playerASpinBox.editable = true
	playerAConfirm.disabled = false
	playerBSpinBox.editable = true
	playerBConfirm.disabled = false
	MoveStormUI.visible = true

func moveStorm():
	for i in moveStormTotal:
		if i == BoardState.stormSectors.max():
			BoardState.currentStormSector = 0
		else:
			BoardState.currentStormSector += 1


##Standard Functions
func _ready() -> void:
	setStormChoiceMinMax(BoardState.currentTurn)
	updateTotalText()



func _process(_delta: float) -> void:
	if playerAChoiceConfirmed and playerBChoiceConfirmed:
		emit_signal("_bothPlayersConfirmed")


## Signal Functions

func _on_confirm_a_pressed() -> void:
	playerAChoice = playerASpinBox.value
	playerASpinBox.editable = false
	playerAConfirm.disabled = true
	playerAChoiceConfirmed = true

func _on_confirm_b_pressed() -> void:
	playerBChoice = playerBSpinBox.value
	playerBSpinBox.editable = false
	playerBConfirm.disabled = true
	playerBChoiceConfirmed = true

func _on_player_a_value_changed(_value: float) -> void:
	updateTotalText()

func _on_player_b_value_changed(_value: float) -> void:
	updateTotalText()

func _on__both_players_confirmed() -> void:
	moveStormTotal = playerAChoice + playerBChoice
	moveStorm()
	GlobalSignals._endPhaseSignal.emit()
	resetMoveStormUI()
	self.queue_free()
