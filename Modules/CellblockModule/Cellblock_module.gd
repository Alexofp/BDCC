extends Module
class_name CellblockModule

const Cellblock_FreeToPassCheckpoint = "Cellblock_FreeToPassCheckpoint"
const Cellblock_CheckpointVisited = "Cellblock_CheckpointVisited"
const Cellblock_GreenhouseLooted = "Cellblock_GreenhouseLooted"
const Cellblock_GreenhouseFoundChip = "Cellblock_GreenhouseFoundChip"

func _init():
	id = "CellblockModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/CellblockModule/MainCheckpointScene.gd",
		"res://Modules/CellblockModule/MaleGuardCanineOffLimits.gd",
		"res://Modules/CellblockModule/FemaleGuardFelineOffLimits.gd",
		"res://Modules/CellblockModule/StealingFromGreenhouseScene.gd",
		
		"res://Modules/CellblockModule/TestMasturbationSpottedScene.gd",
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

func getRandomSceneFor(sceneType):
	var result = []
	if(sceneType == RandomSceneType.MasturbationSpottedGuard):
		result.append_array([["TestMasturbationSpottedScene", 0.001]])
	if(sceneType == RandomSceneType.MasturbationSpottedInmate):
		result.append_array([["TestMasturbationSpottedScene", 0.001]])
		
	return result
