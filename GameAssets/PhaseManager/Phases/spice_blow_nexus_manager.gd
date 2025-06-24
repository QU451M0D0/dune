extends Node

@onready var confirm: Button = $VBoxContainer/Confirm


func setupSpiceDeck():
	BoardState.spiceBlowDiscardA.clear()
	BoardState.spiceBlowDiscardB.clear()
	BoardState.spiceBlowDeck = GlobalDictionaries.spiceBlowDeckDictionary.keys()
	BoardState.spiceBlowDeck.shuffle()


func drawSpiceCard(targetDiscard: Array):
	var drawnCard = BoardState.spiceBlowDeck.pop_front()
	var drawnCardInfo = getCardInfo(drawnCard)
	while BoardState.currentTurn == 0 and drawnCardInfo[0] == "Shai-Hulud":
		BoardState.spiceBlowDeck.push_front(drawnCard)
		BoardState.spiceBlowDeck.shuffle()
		drawnCard = BoardState.spiceBlowDeck.pop_front()
		drawnCardInfo = getCardInfo(drawnCard)
	targetDiscard.push_front(drawnCard)
	return drawnCard

func getCardInfo(card : String):
	var cardInfo = GlobalDictionaries.spiceBlowDeckDictionary[card]
	return cardInfo

func getCardLocationInfo(cardInfo):
	var cardLocationInfo = BoardState.positions[cardInfo[0]]
	return cardLocationInfo

#func checkForShaiHulud(drawnCard, targetDiscard):
	#var drawnCardInfo = getCardInfo(drawnCard)
	#if drawnCardInfo[0] == "Shai-Hulud":
		#var shaiHuludLocationCardInfo = getCardInfo(targetDiscard[0])
		#if shaiHuludLocationCardInfo[0] == "Shai-Hulud":
			#placeSpice(getCardInfo(drawSpiceCard()), targetDiscard)
			#pass
		#else:
			#
			#var shaiHuludLocationInfo = BoardState.positions[shaiHuludLocationCardInfo[0]]
			#shaiHuludLocationInfo["Spice"] = 0
			#GlobalSignals._shaiHuludDrawn.emit()
			#placeSpice(getCardInfo(drawSpiceCard()), targetDiscard)
		#pass

func placeSpice(targetDiscard : Array):
	var cardInfo = getCardInfo(targetDiscard[0])
	var spiceTargetPositionInfo = BoardState.positions[cardInfo[0]]
	var spiceAmount = cardInfo[1]
	spiceTargetPositionInfo["Spice"] += spiceAmount
	GlobalSignals._updateSpiceValues.emit()
	pass

func resolveSpiceCard(targetDiscard : Array):
	var cardInfo = getCardInfo(targetDiscard[0])
	if cardInfo[0] == "Shai-Hulud":
		var shaiHuludTargetCardInfo = getCardInfo(targetDiscard[1])
		var shaiHuludTargetPositionInfo = BoardState.positions[shaiHuludTargetCardInfo[0]]
		shaiHuludTargetPositionInfo["Spice"] = 0
#		come back here after developing shaiHuludDrawn signal to give position
		GlobalSignals._shaiHuludDrawn.emit()
		while cardInfo[0] == "Shai-Hulud" :
			drawSpiceCard(targetDiscard)
			cardInfo = getCardInfo(targetDiscard[0])
		placeSpice(targetDiscard)
	else:
		placeSpice(targetDiscard)

func _ready() -> void:
	if BoardState.currentTurn == 0:
		setupSpiceDeck()
	drawSpiceCard(BoardState.spiceBlowDiscardA)
	resolveSpiceCard(BoardState.spiceBlowDiscardA)
	drawSpiceCard(BoardState.spiceBlowDiscardB)
	resolveSpiceCard(BoardState.spiceBlowDiscardB)

func _on_confirm_pressed() -> void:
	GlobalSignals._endPhaseSignal.emit()
	self.queue_free()
