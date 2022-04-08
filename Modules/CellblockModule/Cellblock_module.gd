extends Module
class_name CellblockModule

const Cellblock_FreeToPassCheckpoint = "Cellblock_FreeToPassCheckpoint"
const Cellblock_CheckpointVisited = "Cellblock_CheckpointVisited"
const Cellblock_GreenhouseLooted = "Cellblock_GreenhouseLooted"

func _init():
	id = "CellblockModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/CellblockModule/MainCheckpointScene.gd",
		"res://Modules/CellblockModule/MaleGuardCanineOffLimits.gd",
		"res://Modules/CellblockModule/FemaleGuardFelineOffLimits.gd",
		"res://Modules/CellblockModule/StealingFromGreenhouseScene.gd",
		]
	characters = [
		"res://Modules/CellblockModule/CheckpointGuardCharacter.gd",
		"res://Modules/CellblockModule/MaleGuardCanine.gd",
		"res://Modules/CellblockModule/FemaleGuardFeline.gd",
	]
	items = []
	events = [
		"res://Modules/CellblockModule/MainCheckpointEvent.gd",
		"res://Modules/CellblockModule/GuardCaughtOfflimitsEvent.gd",
		"res://Modules/CellblockModule/GreenhouseStealEvent.gd",
	]

func resetFlagsOnNewDay():
	GM.main.setFlag(Cellblock_FreeToPassCheckpoint, false)
	GM.main.setFlag(Cellblock_GreenhouseLooted, false)
