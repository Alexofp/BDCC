extends Module
class_name FightClubModule

const ModID = "FightClubModule"

const BulldogFirstTimeHappened = "BulldogFirstTimeHappened"
const BulldogSeduced = "BulldogSeduced"
const BulldogBypassed = "BulldogBypassed"

func _init():
	id = "FightClubModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/FightClubModule/Entrance/BulldogFirstTimeScene.gd",
		"res://Modules/FightClubModule/Entrance/BulldogTalkScene.gd",
		"res://Modules/FightClubModule/Entrance/BulldogSexScene.gd",
		]
	characters = [
		"res://Modules/FightClubModule/Entrance/Bulldog.gd",
		"res://Modules/FightClubModule/Entrance/TheAnnouncer.gd",
		
	]
	items = []
	events = [
		"res://Modules/FightClubModule/Entrance/FightClubEntranceEvent.gd",
	]
	quests = [
	]

func resetFlagsOnNewDay():
	pass
