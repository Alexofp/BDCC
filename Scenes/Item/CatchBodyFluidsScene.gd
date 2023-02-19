extends "res://Scenes/SceneBase.gd"

var uniqueItemID = ""
var item: ItemBase = null

func _init():
	sceneID = "CatchBodyFluidsScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]
	
func _reactInit():
	if(GM.pc.hasBlockedHands() || GM.pc.hasBoundArms()):
		setState("cantdoit")
		return
	
	if(uniqueItemID == null || uniqueItemID == ""):
		return
		
	item = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
	if(item == null):
		return
	
	if(GM.pc.getFluids().isEmpty()):
		setState("nofluidsonbody")
		return
	
	processTime(10*60)
	var amount = GM.pc.getFluids().transferTo(item, RNG.randf_range(0.1, 0.2))
	
	addMessage("You managed to collect "+str(Util.roundF(amount))+" ml")

func _run():
	if(state == ""):
		saynn("You spend some time, using "+item.getVisibleName()+" to collect some of the lewd fluids that you are covered with.")
		
		addButton("Continue", "Okay", "endthescene")

	if(state == "nofluidsonbody"):
		saynn("You aren't covered with any fluids that you can collect")
		
		addButton("Continue", "aww", "endthescene")

	if(state == "cantdoit"):
		saynn("Some restraint prevents you from doing this")
		
		addButton("Continue", "aww", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["uniqueItemID"] = uniqueItemID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	uniqueItemID = SAVE.loadVar(data, "uniqueItemID", "")
	item = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
