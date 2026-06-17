extends Module

func getFlags():
	return {
		"bredByAviArena": flag(FlagType.Bool), # Did player watch Kait get bred by Avy in the arena intro scene
		"gotMetByKait": flag(FlagType.Bool), # We met Kait and got told to find her in the arena
		"talkedKaitArena": flag(FlagType.Bool), # We have talked with Kait near the arena
		"toldSaved": flag(FlagType.Bool), # The player has told Kait that they have saved her from getting bred by Avy
		"joinedTeam": flag(FlagType.Bool), # PC joined Kait's team, we have committed to the dom main route
		"caughtRahi": flag(FlagType.Bool), # Did we catch Rahi and bring her for recruiting
		"introCompleted": flag(FlagType.Bool), # Did we recruit Rahi and got access to everything now
		
		"m1gotpills": flag(FlagType.Bool), # mission 1, did we receive painkillers from Avy? Not a mission flag because we only wanna receive them once
	}

func _init():
	id = "KaitModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/KaitModule/Chapter0/DomCh0ArenaApproachFirst.gd",
		"res://Modules/KaitModule/Chapter0/DomCh0OfferGotApple.gd",
		"res://Modules/KaitModule/Chapter0/DomCh0OfferWonTavi.gd",
		"res://Modules/KaitModule/Chapter0/DomCh0ArenaApproach.gd",
		"res://Modules/KaitModule/Chapter0/DomCh0KaitTalkScene.gd",
	
		"res://Modules/KaitModule/Chapter1/DomCh1s1AgreeScene.gd",
		"res://Modules/KaitModule/Chapter1/DomCh1RahiRecScene.gd",
		"res://Modules/KaitModule/Chapter1/DomCh1RahiRecEnsScene.gd",
		"res://Modules/KaitModule/Hideout/KaitMissionSelectorScene.gd",
		"res://Modules/KaitModule/Hideout/MissionSimpleScene.gd",
		
		"res://Modules/KaitModule/Avy/AvyObedienceMenuScene.gd",
		"res://Modules/KaitModule/Avy/AvyObedienceLightDomScene.gd",
	]
	characters = [
	]
	items = []
	events = [
		"res://Modules/KaitModule/Chapter0/KaitMeetOfferEvent.gd",
		"res://Modules/KaitModule/Hideout/EnterHideoutEvent.gd",
		"res://Modules/KaitModule/Chapter0/DomCh0KaitTalkEvent.gd",
		"res://Modules/KaitModule/Chapter1/DomCh1RahiRecEvent.gd",
		"res://Modules/KaitModule/Hideout/HideoutFunctionsEvent.gd",
	]
	quests = [
		"res://Modules/KaitModule/Chapter0/DomRouteIntroQuest.gd",
	]
	worldEdits = [
		"res://Modules/KaitModule/Chapter0/KaitWorldEdit.gd",
	]

func resetFlagsOnNewDay():
	pass

func hasHideoutAccess() -> bool:
	if(!getFlag("KaitModule.introCompleted")):
		return false
	return true

func resetMainRoute():
	resetAllFlagsWithExceptions({
		
	})
	GM.main.MS.resetMainRoute()
	GM.main.RCS.resetMainRoute()
