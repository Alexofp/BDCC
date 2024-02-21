extends Module

func getFlags():
	return {
		"socketIntroduced": flag(FlagType.Bool),
		"askedWhyWorkHere": flag(FlagType.Bool),
		"touchedPussy": flag(FlagType.Bool),
		"punishLineShouldSay": flag(FlagType.Bool),
		
		"removedWombImplant": flag(FlagType.Bool),
		"socketWillPunish": flag(FlagType.Bool),
		"punishReason": flag(FlagType.Text), # stuckroughfuck stuckroughassfuck spikeddrink hadcumafterbrainwash
		
		"ch1HelpedTimes": flag(FlagType.Number),
		
		"h3BeatRisha": flag(FlagType.Bool),
		
		"hasPortalPussy": flag(FlagType.Bool),
		
		"h1completed": flag(FlagType.Bool),
		"h2completed": flag(FlagType.Bool),
		"h3completed": flag(FlagType.Bool),
		"h4completed": flag(FlagType.Bool),
		"h5completed": flag(FlagType.Bool),
		
		"fastTravelMedical": flag(FlagType.Bool),
		"fastTravelGym": flag(FlagType.Bool),
		"fastTravelUnder": flag(FlagType.Bool),
	}

func _init():
	id = "SocketModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/SocketModule/SocketIntroScene.gd",
		"res://Modules/SocketModule/SocketTalkScene.gd",
		"res://Modules/SocketModule/SocketPunishmentScene.gd",
		"res://Modules/SocketModule/SocketBuyFastTravelScene.gd",
		"res://Modules/SocketModule/SocketFastTravelScene.gd",
		
		"res://Modules/SocketModule/HelpScenes/SocketHelp1Mineshaft.gd",
		"res://Modules/SocketModule/HelpScenes/SocketHelp2Scene.gd",
		"res://Modules/SocketModule/HelpScenes/SocketHelp3Scene.gd",
		"res://Modules/SocketModule/HelpScenes/SocketHelp4Scene.gd",
		"res://Modules/SocketModule/HelpScenes/SocketHelp5Scene.gd",
		]
	characters = [
		"res://Modules/SocketModule/SocketCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/SocketModule/SocketIntroEvent.gd",
		"res://Modules/SocketModule/SocketPunishmentEvent.gd",
		"res://Modules/SocketModule/SocketFastTravelEvent.gd",
	]

func resetFlagsOnNewDay():
	pass

func getFastTravelData():
	var result = {}
	result["fastTravelMedical"] = {
		cost = 15,
		name = "Medical",
		location = "med_lobby_start",
		buydesc = "Vent that goes straight to the medical wing lobby",
	}
	result["fastTravelGym"] = {
		cost = 10,
		name = "Gym",
		location = "gym_nearbathroom",
		buydesc = "Vent that goes straight to the gym where all the training equipment is",
	}
	if(getFlag("SocketModule.h4completed") && getFlag("FightClubModule.BulldogBypassed")):
		result["fastTravelUnder"] = {
			cost = 30,
			name = "Underground",
			location = "fight_neararena",
			buydesc = "Vent that goes to the abandoned maintenance area. Socket doesn't understand why would you be interested in this particular space but she is willing to do it for some extra credits.",
		}
	
	return result

func hasAnyVentsUnlocked():
	var ventData = getFastTravelData()
	
	for ventID in ventData:
		if(getFlag("SocketModule."+ventID, false)):
			return true
	return false
