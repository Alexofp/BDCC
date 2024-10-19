extends Module
class_name CellblockModule

func getFlags():
	return {
		# Cellblock module
		"Cellblock_FreeToPassCheckpoint": flag(FlagType.Bool),
		"Cellblock_CheckpointVisited": flag(FlagType.Bool),
		"Cellblock_GreenhouseLooted": flag(FlagType.Bool),
		"FoundNura": flag(FlagType.Bool),
		"NuraGaveTool": flag(FlagType.Bool),
		"NuraFoundTool": flag(FlagType.Bool),
	}

func _init():
	id = "CellblockModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/CellblockModule/MainCheckpointScene.gd",
		"res://Modules/CellblockModule/MaleGuardCanineOffLimits.gd",
		"res://Modules/CellblockModule/FemaleGuardFelineOffLimits.gd",
		"res://Modules/CellblockModule/StealingFromGreenhouseScene.gd",
		"res://Modules/CellblockModule/RandomEncounters/GuardCaughtOfflimitsScene.gd",
		"res://Modules/CellblockModule/RandomEncounters/GuardOfflimitsCanSlipByScene.gd",
		"res://Modules/CellblockModule/RandomEncounters/InmateExposureForcedSexScene.gd",
		"res://Modules/CellblockModule/RandomEncounters/InmateExposureFlashScene.gd",
		"res://Modules/CellblockModule/RandomEncounters/InmateExposureProstitutionScene.gd",
		"res://Modules/CellblockModule/RandomEncounters/EngineerCaughtOfflimitsScene.gd",
		"res://Modules/CellblockModule/Fluff/EngineeringLoreComputerScene.gd",
		"res://Modules/CellblockModule/Nura/NuraFirstTimeScene.gd",
		"res://Modules/CellblockModule/Nura/NuraTalkScene.gd",
		"res://Modules/CellblockModule/Pregnancy/DynamicCharacterGivingBirthScene.gd",
		]
	characters = [
		"res://Modules/CellblockModule/CheckpointGuardCharacter.gd",
		"res://Modules/CellblockModule/MaleGuardCanine.gd",
		"res://Modules/CellblockModule/FemaleGuardFeline.gd",
		"res://Modules/CellblockModule/Nura/Nura.gd",
	]
	items = []
	events = [
		"res://Modules/CellblockModule/MainCheckpointEvent.gd",
		"res://Modules/CellblockModule/RandomEncounters/GuardCaughtOfflimitsEvent.gd",
		"res://Modules/CellblockModule/GreenhouseStealEvent.gd",
		"res://Modules/CellblockModule/RandomEncounters/GuardOfflimitsCanSlipByEvent.gd",
		"res://Modules/CellblockModule/RandomEncounters/InmateExposureForcedSexEvent.gd",
		"res://Modules/CellblockModule/RandomEncounters/InmateExposureFlashEvent.gd",
		"res://Modules/CellblockModule/RandomEncounters/InmateExposureProstitutionEvent.gd",
		"res://Modules/CellblockModule/RandomEncounters/EngineerCaughtOfflimitsEvent.gd",
		"res://Modules/CellblockModule/PrisonPathShortcutsEvent.gd",
		"res://Modules/CellblockModule/Fluff/EngineeringLoreComputerEvent.gd",
		"res://Modules/CellblockModule/Nura/NuraTalkEvent.gd",
		"res://Modules/CellblockModule/Nura/NuraFindToolEvent.gd",
		"res://Modules/CellblockModule/Pregnancy/DynamicCharacterGivingBirthEvent.gd",
		"res://Modules/CellblockModule/ProstitutionStartEvent.gd",
	]

func resetFlagsOnNewDay():
	GM.main.setModuleFlag("CellblockModule", "Cellblock_FreeToPassCheckpoint", false)
	GM.main.setModuleFlag("CellblockModule", "Cellblock_GreenhouseLooted", false)
