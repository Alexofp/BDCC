extends Module
class_name CellblockModule

const Cellblock_FreeToPassCheckpoint = "Cellblock_FreeToPassCheckpoint"
const Cellblock_CheckpointVisited = "Cellblock_CheckpointVisited"

func _init():
	id = "CellblockModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/CellblockModule/MainCheckpointScene.gd",
		]
	characters = [
		"res://Modules/CellblockModule/CheckpointGuardCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/CellblockModule/MainCheckpointEvent.gd",
	]

func resetFlagsOnNewDay():
	GM.main.setFlag(Cellblock_FreeToPassCheckpoint, false)
