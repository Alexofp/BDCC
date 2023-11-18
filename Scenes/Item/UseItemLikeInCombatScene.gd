extends "res://Scenes/SceneBase.gd"

var savedText = ""
var uniqueItemID = ""

func _init():
	sceneID = "UseItemLikeInCombatScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]
	
func _reactInit():
	if(uniqueItemID == null || uniqueItemID == ""):
		return
	var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
	
	var intoxic = item.addsIntoxicationToPC()
	if(intoxic > 0.0 && !GM.pc.canIntoxicateMore(intoxic)):
		setState("tooToxic")
		return
		
	var currentEnemy = null
	var theFightScene = GM.main.getCurrentFightScene()
	if(theFightScene != null):
		currentEnemy = theFightScene.enemyCharacter
		
	savedText = item.useInCombatWithBuffs(GM.pc, currentEnemy)
	setState("afteruse")

func _run():
	if(state == ""):
		# Never should be here
		addButton("Continue", "Oops", "endthescene")
		
	if(state == "afteruse"):
		saynn(savedText)
		
		addButton("Continue", "You did it", "endthescene")

	if(state == "tooToxic"):
		saynn("You're too intoxicated to use this")
			
		addButton("Continue", "Aww", "endthescene")
		return

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["savedText"] = savedText
	data["uniqueItemID"] = uniqueItemID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	savedText = SAVE.loadVar(data, "savedText", "")
	uniqueItemID = SAVE.loadVar(data, "uniqueItemID", "")

func resolveCustomCharacterName(_charID):
	if(_charID == "attacker"):
		return "pc"
	
	return null
