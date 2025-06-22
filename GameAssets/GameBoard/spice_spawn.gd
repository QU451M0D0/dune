extends Node2D

@onready var spiceObjectRef : PackedScene = preload("res://GameAssets/Entities/spice.tscn")
@export var positionName : String



func spawnSpiceInstance() :
	var spiceInstance = spiceObjectRef.instantiate()
	add_child(spiceInstance)
	pass
