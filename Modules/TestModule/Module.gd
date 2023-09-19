extends Module

func getFlags():
	return {}

func _init():
	id = "TestModule"
	author = "PTS"
	
	scenes = ["res://Modules/TestModule/Scenes/_LoaderTestScene.gd"]
	perks = [
		"res://Modules/TestModule/Buffs/NewTestBuffPerk.gd",
		"res://Modules/TestModule/Skills/NewSkillPerk.gd"
		]
	
	skills = ["res://Modules/TestModule/Skills/TestSkill.gd"]
	buffs = ["res://Modules/TestModule/Buffs/NewTestBuff.gd"]
