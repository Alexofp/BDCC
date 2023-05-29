extends "res://Scenes/SceneBase.gd"

var anims = {
	StageScene.SexFullNelson: ["tease", "inside", "sex", "fast"],
	StageScene.SexRimming: ["tease", "sex", "fast"],
	StageScene.Slutwall: ["idle"],
	StageScene.SlutwallSex: ["tease", "inside", "sex", "fast"],
	StageScene.SlutwallSexOral: ["tease", "lick", "handjob", "blowjob"],
	StageScene.Sleeping: ["sleep"],
	StageScene.GivingBirth: ["idle", "birth"],
	StageScene.Hug: ["hug"],
}

var currentCategory = ""

func _init():
	sceneID = "SimpleAnimPlayerScene"

func _run():
	if(state == ""):
		addButton("Close", "Meow", "endthescene")
		
		for stageScene in anims:
			addButton(stageScene, "Choose this", "pickcat", [stageScene])

	if(state == "pickcat"):
		addButton("Back", "Nya", "")
		
		var theanims = anims[currentCategory]
		for a in theanims:
			addButton(a, "play this", "playa", [a])

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "pickcat"):
		currentCategory = _args[0]
	if(_action == "playa"):
		playAnimation(currentCategory, _args[0], {npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		return
	
	setState(_action)
	
func saveData():
	var data = .saveData()
	
	data["currentCategory"] = currentCategory
	
	return data
	
func loadData(data):
	.loadData(data)
	
	currentCategory = SAVE.loadVar(data, "currentCategory", "")
