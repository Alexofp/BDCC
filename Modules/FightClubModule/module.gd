extends Module
class_name FightClubModule

const ModID = "FightClubModule"

const BulldogFirstTimeHappened = "BulldogFirstTimeHappened"
const BulldogSeduced = "BulldogSeduced"
const BulldogBeatenUp = "BulldogBeatenUp"
const BulldogBypassed = "BulldogBypassed"

const AnnouncerIntroduced = "AnnouncerIntroduced"

const AvyIntroduced = "AvyIntroduced"

const FightClubPCRank = "FightClubPCRank"
const FightClubDefeatedFighters = "FightClubDefeatedFighters"
const FightClubFirstArenaIntroduction = "FightClubFirstArenaIntroduction"

func _init():
	id = "FightClubModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/FightClubModule/Entrance/BulldogFirstTimeScene.gd",
		"res://Modules/FightClubModule/Entrance/BulldogTalkScene.gd",
		"res://Modules/FightClubModule/Entrance/BulldogSexScene.gd",
		"res://Modules/FightClubModule/Entrance/FightClubIntroScene.gd",
		"res://Modules/FightClubModule/Announcer/AnnouncerFirstTimeTalkScene.gd",
		"res://Modules/FightClubModule/Announcer/AnnouncerTalkScene.gd",
		"res://Modules/FightClubModule/Avy/AvyFirstTimeTalkScene.gd",
		"res://Modules/FightClubModule/Avy/AvyTalkScene.gd",
		
		"res://Modules/FightClubModule/Fighters/Rubi/RubiLostToScene.gd",
		"res://Modules/FightClubModule/Fighters/Rubi/RubiWonScene.gd",
		
		"res://Modules/FightClubModule/Fighters/Volk/VolkLostToScene.gd",
		"res://Modules/FightClubModule/Fighters/Volk/VolkWonScene.gd",
		
		"res://Modules/FightClubModule/Fighters/Ferri/FerriLostToScene.gd",
		"res://Modules/FightClubModule/Fighters/Ferri/FerriWonScene.gd",
		
		"res://Modules/FightClubModule/Fighters/Rebel/RebelLostToScene.gd",
		"res://Modules/FightClubModule/Fighters/Rebel/RebelWonScene.gd",
		
		"res://Modules/FightClubModule/Fighters/Nova/NovaLostToScene.gd",
		"res://Modules/FightClubModule/Fighters/Nova/NovaWonScene.gd",
		
		"res://Modules/FightClubModule/Fighters/Axis/AxisLostToScene.gd",
		"res://Modules/FightClubModule/Fighters/Axis/AxisWonScene.gd",
		
		"res://Modules/FightClubModule/Fighters/Kait/KaitLostToScene.gd",
		"res://Modules/FightClubModule/Fighters/Kait/KaitWonScene.gd",
		]
	characters = [
		"res://Modules/FightClubModule/Entrance/Bulldog.gd",
		"res://Modules/FightClubModule/Announcer/TheAnnouncer.gd",
		"res://Modules/FightClubModule/Fighters/Rubi/RubiCharacter.gd",
		"res://Modules/FightClubModule/Fighters/Volk/VolkCharacter.gd",
		"res://Modules/FightClubModule/Fighters/Ferri/FerriCharacter.gd",
		"res://Modules/FightClubModule/Fighters/Rebel/RebelCharacter.gd",
		"res://Modules/FightClubModule/Fighters/Nova/NovaArenaCharacter.gd",
		"res://Modules/FightClubModule/Fighters/Axis/AxisCharacter.gd",
		"res://Modules/FightClubModule/Fighters/Kait/KaitCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/FightClubModule/Entrance/FightClubEntranceEvent.gd",
		"res://Modules/FightClubModule/Announcer/FightClubAnnouncerTalkEvent.gd",
		"res://Modules/FightClubModule/Avy/FightClubAvyTalkEvent.gd",
	]
	quests = [
	]

func register():
	.register()
	
	GlobalRegistry.registerFightClubFighter("res://Modules/FightClubModule/Fighters/Rubi/RubiFighter.gd")
	GlobalRegistry.registerFightClubFighter("res://Modules/FightClubModule/Fighters/Volk/VolkFighter.gd")
	GlobalRegistry.registerFightClubFighter("res://Modules/FightClubModule/Fighters/Ferri/FerriFighter.gd")
	GlobalRegistry.registerFightClubFighter("res://Modules/FightClubModule/Fighters/Rebel/RebelFighter.gd")
	GlobalRegistry.registerFightClubFighter("res://Modules/FightClubModule/Fighters/Nova/NovaFighter.gd")
	GlobalRegistry.registerFightClubFighter("res://Modules/FightClubModule/Fighters/Axis/AxisFighter.gd")
	GlobalRegistry.registerFightClubFighter("res://Modules/FightClubModule/Fighters/Kait/KaitFighter.gd")

func resetFlagsOnNewDay():
	pass

static func getPCRank():
	return GM.main.getModuleFlag(ModID, FightClubPCRank, FightClubRank.FuckMeat)

static func raisePCRankTo(newRank):
	var currentRank = getPCRank()
	var currentRankOrder = FightClubRank.getOrder(currentRank)
	var newRankOrder = FightClubRank.getOrder(newRank)
	
	if(newRankOrder < currentRankOrder):
		GM.main.setModuleFlag(ModID, FightClubPCRank, newRank)
		return true
	return false

static func isFighterDefeated(fighterID):
	var defeated = GM.main.getModuleFlag(ModID, FightClubDefeatedFighters, {})
	if(defeated.has(fighterID) && defeated[fighterID]):
		return true
	
	return false

static func getNextFighter():
	var ranks = FightClubRank.getAll()
	
	# iterating backwards over ranks and fighters to find the first one we didn't fight yet
	for i in ranks.size():
		var rankID = ranks[-i-1]
		
		var fighters = GlobalRegistry.getFightClubFightersIDsByRank(rankID)
		for i2 in fighters.size():
			var fighterID = fighters[-i2-1]
			if(!isFighterDefeated(fighterID)):
				return fighterID
	return null

static func markFighterAsDefeated(fighterID):
	var defeated = GM.main.getModuleFlag(ModID, FightClubDefeatedFighters, {})
	defeated[fighterID] = true
	GM.main.setModuleFlag(ModID, FightClubDefeatedFighters, defeated)
