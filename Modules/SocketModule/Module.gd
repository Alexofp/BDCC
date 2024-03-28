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
		"fastTravelMedicalCorridor": flag(FlagType.Bool),
		"fastTravelMineshaft": flag(FlagType.Bool),
		"fastTravelWorkshop": flag(FlagType.Bool),
		"fastTravelCanteen": flag(FlagType.Bool),
		"fastTravelBathroom1": flag(FlagType.Bool),
		"fastTravelBathroom2": flag(FlagType.Bool),
		"fastTravelEngBreakroom": flag(FlagType.Bool),
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

	result["fastTravelCanteen"] = {
		cost = 10,
		name = "Canteen",
		location = "hall_canteen",
		buydesc = "Vent that goes to the canteen of the main floor",
	}
	result["fastTravelGym"] = {
		cost = 10,
		name = "Gym",
		location = "gym_nearbathroom",
		buydesc = "Vent that goes straight to the gym where all the training equipment is",
	}
	result["fastTravelBathroom1"] = {
		cost = 10,
		name = "Main bathroom",
		location = "main_bathroom1",
		buydesc = "Vent that goes to the bathroom connected to the main hall",
	}
	result["fastTravelBathroom2"] = {
		cost = 10,
		name = "Gym bathroom",
		location = "main_bathroom2",
		buydesc = "Vent that goes to the bathroom near the gym",
	}
	result["fastTravelMedical"] = {
		cost = 15,
		name = "Medical lobby",
		location = "med_lobby_start",
		buydesc = "Vent that goes straight to the medical wing lobby",
	}
	result["fastTravelMineshaft"] = {
		cost = 15,
		name = "Mineshafts",
		location = "mining_shafts_entering",
		buydesc = "Vent that goes to the mineshafts",
	}
	result["fastTravelWorkshop"] = {
		cost = 15,
		name = "Workshop",
		location = "eng_workshop",
		buydesc = "Vent that goes to the engineering workshop",
	}
	if(getFlag("SocketModule.h4completed")):
		result["fastTravelMedicalCorridor"] = {
			cost = 25,
			name = "Medical corridor",
			location = "med_nearmilking",
			buydesc = "Vent that bypasses the staff-only doors of the medical wing and leads to one of its corridors.",
		}
		# If can enter it normally
		if(GM.QS.isCompleted("Ch2AlexQuest") || getFlag("AlexRynardModule.ch2CanEnterEngineering")):
			result["fastTravelEngBreakroom"] = {
				cost = 25,
				name = "Eng. break room",
				location = "eng_breakroom",
				buydesc = "Vent that bypasses the staff-only doors of the engineering wing and leads to its break room.",
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
