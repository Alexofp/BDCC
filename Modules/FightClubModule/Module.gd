extends Module
class_name FightClubModule

func getFlags():
	return {
		"BulldogFirstTimeHappened": flag(FlagType.Bool),
		"BulldogSeduced": flag(FlagType.Bool),
		"BulldogBeatenUp": flag(FlagType.Bool),
		"BulldogBypassed": flag(FlagType.Bool),
		"AnnouncerIntroduced": flag(FlagType.Bool),
		"AnnouncerAskedAboutShop": flag(FlagType.Bool),
		"AvyIntroduced": flag(FlagType.Bool),
		"FightClubPCRank": flag(FlagType.Text),
		"FightClubDefeatedFighters": flag(FlagType.Dict),
		"FightClubFirstArenaIntroduction": flag(FlagType.Bool),
		"AttemptedAvyFight": flag(FlagType.Bool),
		"ManagedToWinDruggedAvy": flag(FlagType.Bool),
		"GotDestroyedByAvy": flag(FlagType.Bool),
		"GotFuckedByAvy": flag(FlagType.Bool),
		"GotKnockedOutByAvy": flag(FlagType.Bool),
		"GotTaskToStealPlant": flag(FlagType.Bool),
		"StolePlantForEliza": flag(FlagType.Bool),
		"ReturnedPlantToEliza": flag(FlagType.Bool),
		"AvyApproachAfterRektHappened": flag(FlagType.Bool),
		"AvyGotRekt": flag(FlagType.Bool),
		"AvyGotCaged": flag(FlagType.Bool),
		"AvyIsInSlutwall": flag(FlagType.Bool),
		"AvySlutWallBroken": flag(FlagType.Number),
	}

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
		"res://Modules/FightClubModule/Announcer/AnnouncerBuySellScene.gd",
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
		
		"res://Modules/FightClubModule/Fighters/Jack/JackLostToScene.gd",
		"res://Modules/FightClubModule/Fighters/Jack/JackWonScene.gd",
		
		"res://Modules/FightClubModule/Avy/ArenaQuest/AvyFirstArenaBattleScene.gd",
		"res://Modules/FightClubModule/Avy/ArenaQuest/WakingUpAfterFirstAvyBattleScene.gd",
		"res://Modules/FightClubModule/Avy/ArenaQuest/AvyApproachAfterRektScene.gd",
		"res://Modules/FightClubModule/Avy/ArenaQuest/GivingElizaPlantForAvyFightScene.gd",
		"res://Modules/FightClubModule/Avy/ArenaQuest/AvyArenaPittyFuckScene.gd",
		"res://Modules/FightClubModule/Avy/ArenaQuest/AvyFinalArenaBattleScene.gd",
		"res://Modules/FightClubModule/Avy/ArenaQuest/AvySlutwallScene.gd",
		
		"res://Modules/FightClubModule/Slutwall/SlutwallPlayerScene.gd",
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
		"res://Modules/FightClubModule/Fighters/Jack/JackCharacter.gd",
		"res://Modules/FightClubModule/Fighters/Avy/AvyArenaCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/FightClubModule/Entrance/FightClubEntranceEvent.gd",
		"res://Modules/FightClubModule/Announcer/FightClubAnnouncerTalkEvent.gd",
		"res://Modules/FightClubModule/Avy/FightClubAvyTalkEvent.gd",
		"res://Modules/FightClubModule/Avy/ArenaQuest/AvyApproachAfterRektEvent.gd",
		"res://Modules/FightClubModule/Avy/ArenaQuest/AvyQuestStealDrugsEvent.gd",
		"res://Modules/FightClubModule/Avy/ArenaQuest/GivingElizaPlantForAvyFightEvent.gd",
		"res://Modules/FightClubModule/Avy/ArenaQuest/AvySlutwallEvent.gd",
		"res://Modules/FightClubModule/Slutwall/SlutwallPlayerEvent.gd",
	]
	quests = [
		"res://Modules/FightClubModule/Avy/ArenaQuest/AvyArenaQuest.gd",
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
	GlobalRegistry.registerFightClubFighter("res://Modules/FightClubModule/Fighters/Jack/JackFighter.gd")
	GlobalRegistry.registerFightClubFighter("res://Modules/FightClubModule/Fighters/Avy/AvyFighter.gd")

func registerEventTriggers():
	GM.ES.registerEventTrigger("ArenaFighterPCLost", EventTriggerLocation.new())
	GM.ES.registerEventTrigger("ArenaFighterPCWon", EventTriggerLocation.new())

func resetFlagsOnNewDay():
	pass

static func getPCRank():
	return GM.main.getFlag("FightClubModule.FightClubPCRank", FightClubRank.FuckMeat)

static func raisePCRankTo(newRank):
	var currentRank = getPCRank()
	var currentRankOrder = FightClubRank.getOrder(currentRank)
	var newRankOrder = FightClubRank.getOrder(newRank)
	
	if(newRankOrder < currentRankOrder):
		GM.main.setFlag("FightClubModule.FightClubPCRank", newRank)
		return true
	return false

static func isFighterDefeated(fighterID):
	var defeated = GM.main.getFlag("FightClubModule.FightClubDefeatedFighters", {})
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
				var fighter: FightClubFighter = GlobalRegistry.getFightClubFighter(fighterID)
				if(!fighter.canFight()):
					return null
				
				return fighterID
	return null

static func markFighterAsDefeated(fighterID):
	var defeated = GM.main.getFlag("FightClubModule.FightClubDefeatedFighters", {})
	defeated[fighterID] = true
	GM.main.setFlag("FightClubModule.FightClubDefeatedFighters", defeated)

func isReadyToFightAvy():
	var ranks = FightClubRank.getAll()
	
	for i in ranks.size():
		var rankID = ranks[-i-1]
		
		var fighters = GlobalRegistry.getFightClubFightersIDsByRank(rankID)
		for i2 in fighters.size():
			var fighterID = fighters[-i2-1]
			if(fighterID == "avy"):
				continue
			if(!isFighterDefeated(fighterID)):
				return false
				
	return true

# For debug/cheats
func forceWinEveryoneExpectAvy():
	var ranks = FightClubRank.getAll()
	
	for i in ranks.size():
		var rankID = ranks[-i-1]
		
		var fighters = GlobalRegistry.getFightClubFightersIDsByRank(rankID)
		for i2 in fighters.size():
			var fighterID = fighters[-i2-1]
			if(fighterID == "avy"):
				continue
			markFighterAsDefeated(fighterID)
	
	raisePCRankTo(FightClubRank.AttentionWhore)
