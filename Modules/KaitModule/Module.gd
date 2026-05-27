extends Module

func getFlags():
	return {
		"gotMetByKait": flag(FlagType.Bool), # We met Kait and got told to find her in the arena
		"talkedKaitArena": flag(FlagType.Bool), # We have talked with Kait near the arena
		"joinedTeam": flag(FlagType.Bool), # PC joined Kait's team, we have committed to the dom main route
		
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
		"res://Modules/KaitModule/Chapter1/DomCh1RahiBreakIntroScene.gd",
		"res://Modules/KaitModule/Chapter1/DomCh1RahiBreakAfterScene.gd",
		"res://Modules/KaitModule/Hideout/KaitMissionSelectorScene.gd",
		"res://Modules/KaitModule/Hideout/MissionSimpleScene.gd",
	]
	characters = [
	]
	items = []
	events = [
		"res://Modules/KaitModule/Chapter0/KaitMeetOfferEvent.gd",
		"res://Modules/KaitModule/Hideout/EnterHideoutEvent.gd",
		"res://Modules/KaitModule/Chapter0/DomCh0KaitTalkEvent.gd",
	]
	quests = [
		"res://Modules/KaitModule/Chapter0/DomRouteIntroQuest.gd",
	]

func resetFlagsOnNewDay():
	pass

func incKaitSubmission():
	pass

func incKaitLove():
	pass

func incAvySubmission():
	pass

func incAvyLove():
	pass

func hasHideoutAccess() -> bool:
	if(!getFlag("KaitModule.joinedTeam")):
		return false
	return true

func resetMainRoute():
	resetAllFlagsWithExceptions({
		
	})
	GM.main.MS.resetMainRoute()
	GM.main.RCS.resetMainRoute()
