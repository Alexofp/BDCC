extends "res://Scenes/SceneBase.gd"

var levelUpScreenScene = preload("res://UI/SkillsUI/DungeonLevelUpScreen.tscn")

var perksList:Array = []

func _init():
	sceneID = "DungeonLevelUpScene"
	
func _reactInit():
	perksList = GM.main.DrugDenRun.getPerksForReachingLevel(GM.main.DrugDenRun.handledPCLevel+1)

func _run():
	if(state == ""):
		var levelUpScreen = levelUpScreenScene.instance()
		GM.ui.addFullScreenCustomControl("levelUpScreen", levelUpScreen)
		levelUpScreen.setData(GM.main.DrugDenRun.handledPCLevel+1, perksList, GM.main.DrugDenRun.lastSelectedStat if GM.main.DrugDenRun != null else "")
		var _ok = levelUpScreen.connect("onConfirm", self, "onConfirmPressed")
		
		addButton("Confirm", "You're content with this", "doConfirm")

func onConfirmPressed(selectedStat:String, selectedPerk:String):
	if(selectedStat != ""):
		GM.pc.getSkillsHolder().setStat(selectedStat, GM.pc.getStat(selectedStat) + 3)
	if(selectedPerk != ""):
		GM.pc.getSkillsHolder().addPerk(selectedPerk)
	if(GM.main.DrugDenRun != null):
		GM.main.DrugDenRun.lastSelectedStat = selectedStat
		GM.main.DrugDenRun.afterLevelUp()
		if(!GM.main.DrugDenRun.shouldShowLevelUpScreen()):
			GM.main.pickOption("endthescene", [])
		else:
			perksList = GM.main.DrugDenRun.getPerksForReachingLevel(GM.main.DrugDenRun.handledPCLevel+1)
			GM.main.pickOption("", [])
	else:
		GM.main.pickOption("endthescene", [])
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "doConfirm"):
		GM.ui.getCustomControl("levelUpScreen")._on_ContinueButton_pressed()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["perksList"] = perksList

	return data
	
func loadData(data):
	.loadData(data)
	
	perksList = SAVE.loadVar(data, "perksList", [])
