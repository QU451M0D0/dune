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
	BoardState.spiceBlowDiscardA.push_front(drawnCardA)
	print(drawnCardA)
	drawnCardB = BoardState.spiceBlowDeck.pop_front()
	BoardState.spiceBlowDiscardB.push_front(drawnCardB)
	print(drawnCardB)

func placeSpice():
	var cardInfoA = GlobalDictionaries.spiceBlowDeckDictionary[drawnCardA]
	var cardInfoB = GlobalDictionaries.spiceBlowDeckDictionary[drawnCardB]

	if cardInfoA != null :
		var cardPositionA : String = cardInfoA[0]
		var cardAmountA : int = cardInfoA[1]
		#print(cardPositionA)
		#print(cardAmountA)
		var positionInfoA = BoardState.positions[cardPositionA]
		positionInfoA["Spice"] += cardAmountA
		#print(positionInfoA["Spice"])
		GlobalSignals._spawnSpice.emit(cardPositionA, cardAmountA)
	if cardInfoB != null :
		var cardPositionB : String = cardInfoB[0]
		var cardAmountB : int = cardInfoB[1]
		#print(cardPositionB)
		#print(cardAmountB)
		var positionInfoB = BoardState.positions[cardPositionB]
		positionInfoB["Spice"] += cardAmountB
		#print(positionInfoB["Spice"])
		GlobalSignals._spawnSpice.emit(cardPositionB, cardAmountB)

func _ready() -> void:
	if BoardState.currentTurn == 0:
		setupSpiceDeck()
		drawSpiceCard()
		placeSpice()
	else:
		drawSpiceCard()
		placeSpice()

func _on_confirm_pressed() -> void:
	GlobalSignals._endPhaseSignal.emit()
	self.queue_free()
