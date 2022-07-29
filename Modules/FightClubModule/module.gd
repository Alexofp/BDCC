extends Module
class_name FightClubModule

const ModID = "FightClubModule"

const BulldogFirstTimeHappened = "BulldogFirstTimeHappened"
const BulldogSeduced = "BulldogSeduced"
const BulldogBeatenUp = "BulldogBeatenUp"
const BulldogBypassed = "BulldogBypassed"

const AnnouncerIntroduced = "AnnouncerIntroduced"

const AvyIntroduced = "AvyIntroduced"

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
		]
	characters = [
		"res://Modules/FightClubModule/Entrance/Bulldog.gd",
		"res://Modules/FightClubModule/Announcer/TheAnnouncer.gd",
		"res://Modules/FightClubModule/Entrance/KaitCharacter.gd",
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

func resetFlagsOnNewDay():
	pass
