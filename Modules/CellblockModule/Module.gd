extends Module
class_name CellblockModule

func getFlags():
	return {
		# Cellblock module
		"Cellblock_FreeToPassCheckpoint": flag(FlagType.Bool),
		"Cellblock_CheckpointVisited": flag(FlagType.Bool),
		"Cellblock_GreenhouseLooted": flag(FlagType.Bool),
		"Cellblock_GreenhouseFoundChip": flag(FlagType.Bool),
	}

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
	GM.main.setModuleFlag("CellblockModule", "Cellblock_FreeToPassCheckpoint", false)
	GM.main.setModuleFlag("CellblockModule", "Cellblock_GreenhouseLooted", false)
