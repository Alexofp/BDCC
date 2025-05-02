extends "res://Scenes/SceneBase.gd"

var page:int = -1

var anims = {
#	StageScene.SexFullNelson: ["tease", "inside", "sex", "fast"],
#	StageScene.SexRimming: ["tease", "sex", "fast"],
#	StageScene.Slutwall: ["idle"],
#	StageScene.SlutwallSex: ["tease", "inside", "sex", "fast"],
#	StageScene.SlutwallRide: ["tease", "inside", "sex", "fast"],
#	StageScene.SlutwallSexOral: ["tease", "lick", "handjob", "blowjob"],
#	StageScene.Sleeping: ["sleep"],
#	StageScene.GivingBirth: ["idle", "birth"],
#	StageScene.Hug: ["hug"],
}
var animsOnlyList:Array = [
#	StageScene.MilkingStallDuo,
#	StageScene.MilkingStallSolo,
#	StageScene.TFLook,
#	StageScene.MilkingProstate,
#	StageScene.MilkingProstateFuck,
#	StageScene.Showering,
#	StageScene.ShoweringDuo,
#	StageScene.SexDoubleDown,
#	StageScene.SexOralForced,
#	StageScene.SexAgainstWall,
#	StageScene.SexLowDoggy,
#	StageScene.SexCowgirlAmazon,
]

var currentCategory = ""
var firstNPC = "pc"
var secondNPC = "pc"
var lastSceneString = ""
var everyoneCumming = false

func _init():
	sceneID = "SimpleAnimPlayerScene"

func _reactInit():
	anims = GlobalRegistry.getStageScenesCachedStates()
	if(!animsOnlyList.empty()):
		anims = anims.duplicate()
		for animID in anims.keys():
			if(!(animID in animsOnlyList)):
				anims.erase(animID)

func _run():
	if(state == ""):
		addButton("Close", "Meow", "endthescene")
		addButton("SETTINGS", "Change some stuff", "settingsmenu")
		
		for stageScene in anims:
			addButton(stageScene, "Choose this", "pickcat", [stageScene])
			
		if(page > 0):
			GM.ui.setCurrentPage(page)

	if(state == "settingsmenu"):
		playAnimation(StageScene.Duo, "stand", {pc=firstNPC, npc=secondNPC})
		saynn("pc=\""+firstNPC+"\"")
		saynn("npc=\""+secondNPC+"\"")
		
		if(everyoneCumming):
			saynn("Everyone will be shown orgasming")
		
		addButton("PC", "change first character", "changepcmenu")
		addButton("NPC", "change second character", "changenpcmenu")
		addButton("Toggle cum", "Change if everyone is cumming or not", "toggle_cum")
		addButton("Back", "Meow", "")

	if(state == "changepcmenu" || state == "changenpcmenu"):
		addButton("Back", "Meow", "settingsmenu")
		addButton("PLAYER", "Set to pc", state+"_pick", ["pc"])
		for charID in GlobalRegistry.getCharacters():
			var character = GlobalRegistry.getCharacter(charID)
			if(character == null || charID == "errorerror"):
				continue
			addButton(character.getName(), "Set to "+str(charID), state+"_pick", [charID])

	if(state == "pickcat"):
		addButton("Back", "Nya", "")
		saynn(lastSceneString)
		
		var theanims = anims[currentCategory]
		for a in theanims:
			addButton(a, "play this", "playa", [a])

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "pickcat"):
		page = GM.ui.getCurrentPage()
		lastSceneString = ""
		currentCategory = _args[0]
	if(_action == "playa"):
		playAnimation(currentCategory, _args[0], {pc=firstNPC, npc=secondNPC, pcCum=everyoneCumming, npcCum=everyoneCumming, cum=everyoneCumming, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		lastSceneString = "playAnimation(StageScene."+currentCategory+", \""+_args[0]+"\", \\{pc=\""+firstNPC+"\", npc=\""+secondNPC+"\", bodyState=\\{naked=true, hard=true}, npcBodyState=\\{naked=true, hard=true}})"
		return
	if(_action == "changepcmenu_pick"):
		firstNPC = _args[0]
		setState("settingsmenu")
		return
	if(_action == "changenpcmenu_pick"):
		secondNPC = _args[0]
		setState("settingsmenu")
		return
	if(_action == "toggle_cum"):
		everyoneCumming = !everyoneCumming
		return
	
	setState(_action)
	
func saveData():
	var data = .saveData()
	
	data["currentCategory"] = currentCategory
	data["everyoneCumming"] = everyoneCumming
	data["page"] = page
	
	return data
	
func loadData(data):
	.loadData(data)
	
	currentCategory = SAVE.loadVar(data, "currentCategory", "")
	everyoneCumming = SAVE.loadVar(data, "everyoneCumming", false)
	page = SAVE.loadVar(data, "page", -1)
