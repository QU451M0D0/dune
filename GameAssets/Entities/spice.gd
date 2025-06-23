extends Node2D

@onready var spiceAmount 
@onready var parentPositionName : String = self.get_parent().positionName
@onready var spiceAmountLabelRef = $MainVBox/SpiceAmountLabel

func _ready() -> void:
	GlobalSignals._updateSpiceValues.connect(updateSpiceLabel)

func updateSpiceLabel ():
	
	var parentPositionInfo = BoardState.positions[parentPositionName]
	
	spiceAmount = parentPositionInfo["Spice"]
	spiceAmountLabelRef.text = "Spice: " + str(spiceAmount)
	
	if spiceAmount == 0:
		self.hide()
	else:
		self.show()
