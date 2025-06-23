extends Node

@onready var drawnCardA
@onready var drawnCardB
@onready var confirm: Button = $VBoxContainer/Confirm


func setupSpiceDeck():
	BoardState.spiceBlowDiscardA.clear()
	BoardState.spiceBlowDiscardB.clear()
	BoardState.spiceBlowDeck = GlobalDictionaries.spiceBlowDeckDictionary.keys()
	BoardState.spiceBlowDeck.shuffle()

func drawSpiceCard():
	#if BoardState.spiceBlowDeck.is_empty() == true:
		#setupSpiceDeck()
	drawnCardA = BoardState.spiceBlowDeck.pop_front()
	
	
	drawnCardB = BoardState.spiceBlowDeck.pop_front()
	
	
	var cardInfoA = GlobalDictionaries.spiceBlowDeckDictionary[drawnCardA]
	var cardInfoB = GlobalDictionaries.spiceBlowDeckDictionary[drawnCardB]
	
	while BoardState.currentTurn == 0 and cardInfoA[0] == "Shai-Hulud" or cardInfoA[0] == "Sandtrout":
		BoardState.spiceBlowDeck.append(drawnCardA)
		drawnCardA = BoardState.spiceBlowDeck.pop_front()
		BoardState.spiceBlowDeck.shuffle()
		cardInfoA = GlobalDictionaries.spiceBlowDeckDictionary[drawnCardA]
	print(drawnCardA)
	
	while BoardState.currentTurn == 0 and cardInfoB[0] == "Shai-Hulud" or cardInfoB[0] == "Sandtrout":
		BoardState.spiceBlowDeck.append(drawnCardB)
		drawnCardB = BoardState.spiceBlowDeck.pop_front()
		BoardState.spiceBlowDeck.shuffle()
		cardInfoB = GlobalDictionaries.spiceBlowDeckDictionary[drawnCardB]
	print(drawnCardB)
	
	BoardState.spiceBlowDiscardA.append(drawnCardA)
	BoardState.spiceBlowDiscardB.append(drawnCardB)
	#if cardInfoA[0] == "Shai-Hulud" or "Sandtrout" and BoardState.spiceBlowDiscardA.is_empty() or BoardState.spiceBlowDiscardB.is_empty():
		#setupSpiceDeck()
		#drawSpiceCard()
	#if cardInfoB[0] == "Shai-Hulud" or "Sandtrout" and BoardState.spiceBlowDiscardA.is_empty() or BoardState.spiceBlowDiscardB.is_empty():
		#setupSpiceDeck()
		#drawSpiceCard()

func placeSpice():
	var cardInfoA = GlobalDictionaries.spiceBlowDeckDictionary[drawnCardA]
	var cardInfoB = GlobalDictionaries.spiceBlowDeckDictionary[drawnCardB]

	var cardPositionA : String = cardInfoA[0]
	var cardAmountA : int = cardInfoA[1]
	#print(cardPositionA)
	#print(cardAmountA)
	
	if cardPositionA == "Shai-Hulud":
		var shaiHuludLocationA = BoardState.spiceBlowDiscardA[0]
		var shaiHuludLocationAInfo = GlobalDictionaries.spiceBlowDeckDictionary[shaiHuludLocationA]
		var shaiHuludPositionA = shaiHuludLocationAInfo[0]
		
		var shaiHuludPositionAInfo = BoardState.positions[shaiHuludPositionA]
		shaiHuludPositionAInfo["Spice"] = 0
		GlobalSignals._shaiHuludDrawn.emit()
		drawSpiceCard()
		placeSpice()
		GlobalSignals._updateSpiceValues.emit()
		
	elif cardPositionA == "Sandtrout" :
#		give this functionality when Alliances are implemented
		pass
	else:
		var positionInfoA = BoardState.positions[cardPositionA]
		positionInfoA["Spice"] += cardAmountA
		BoardState.spiceBlowDiscardA.push_front(drawnCardA)
		#print(positionInfoA["Spice"])
		GlobalSignals._spawnSpice.emit(cardPositionA, cardAmountA)
		GlobalSignals._updateSpiceValues.emit()
		
		
	var cardPositionB : String = cardInfoB[0]
	var cardAmountB : int = cardInfoB[1]
	#print(cardPositionB)
	#print(cardAmountB)
	
	if cardPositionB == "Shai-Hulud":
		var shaiHuludLocationB = BoardState.spiceBlowDiscardB[0]
		var shaiHuludLocationBInfo = GlobalDictionaries.spiceBlowDeckDictionary[shaiHuludLocationB]
		var shaiHuludPositionB = shaiHuludLocationBInfo[0]
		
		var shaiHuludPositionBInfo = BoardState.positions[shaiHuludPositionB]
		shaiHuludPositionBInfo["Spice"] = 0
		GlobalSignals._shaiHuludDrawn.emit()
		drawSpiceCard()
		placeSpice()
		GlobalSignals._updateSpiceValues.emit()
	elif cardPositionA == "Sandtrout" :
		
		pass
	else:
		var positionInfoB = BoardState.positions[cardPositionB]
		positionInfoB["Spice"] += cardAmountB
		BoardState.spiceBlowDiscardB.push_front(drawnCardB)
		#print(positionInfoB["Spice"])
		GlobalSignals._spawnSpice.emit(cardPositionB, cardAmountB)
		GlobalSignals._updateSpiceValues.emit()

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
