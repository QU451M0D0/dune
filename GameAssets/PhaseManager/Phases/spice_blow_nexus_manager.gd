extends Node

@onready var drawnCardA
@onready var drawnCardB
@onready var confirm: Button = $VBoxContainer/Confirm


func setupSpiceDeck():
	BoardState.spiceBlowDeck = GlobalDictionaries.spiceBlowDeckDictionary.keys()
	BoardState.spiceBlowDeck.shuffle()

func drawSpiceCard():
	if BoardState.spiceBlowDeck.is_empty() == true:
		setupSpiceDeck()
	drawnCardA = BoardState.spiceBlowDeck.pop_front()
	BoardState.spiceBlowDiscardA.append(drawnCardA)
	drawnCardB = BoardState.spiceBlowDeck.pop_front()
	BoardState.spiceBlowDiscardB.append(drawnCardB)
	print(BoardState.spiceBlowDiscardA[0])
	print(drawnCardB)

func placeSpice():
	for card in GlobalDictionaries.spiceBlowDeckDictionary:
		if card == drawnCardA:
			pass

func _ready() -> void:
	if BoardState.currentTurn == 0:
		setupSpiceDeck()
		drawSpiceCard()
	else:
		drawSpiceCard()

func _on_confirm_pressed() -> void:
	GlobalSignals._endPhaseSignal.emit()
	self.queue_free()
