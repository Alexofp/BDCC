extends "res://Scenes/SceneBase.gd"

var uniqueItemID = ""

func _init():
	sceneID = "TakeAnyItemOffScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]
	
func _reactInit():
	if(uniqueItemID == null || uniqueItemID == ""):
		return
		
	var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
	if(item == null):
		return
	
	if(item.isRestraint()):
		var restraintData = item.getRestraintData()
		if(restraintData != null && restraintData.hasSmartLock()):
			setState("smartlocked")
			return
	
	if(!GM.pc.hasBlockedHands()):
		if(GM.pc.hasBoundArms()):
			setState("awkwardtakeoff")
		
		item.resetLustState()
		GM.pc.getInventory().removeEquippedItem(item)
		GM.pc.getInventory().addItem(item)
		GM.pc.updateAppearance()
		GM.main.updateSubAnims()
	else:
		setState("blockedhands")

func _run():
	if(state == ""):
		if(uniqueItemID == null || uniqueItemID == ""):
			addButton("Continue", "Oops", "endthescene")
			return
		
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
		if(item == null):
			saynn("Error: no item found")
		else:
			saynn("You "+item.getTakingOffStringLong(false))
		
		addButton("Continue", "You took off an item", "endthescene")

	if(state == "smartlocked"):
		saynn("This item is smartlocked.. so you can't remove it.")
		
		addButton("Continue", "Aww", "endthescene")

	if(state == "awkwardtakeoff"):
		if(uniqueItemID == null || uniqueItemID == ""):
			addButton("Continue", "Oops", "endthescene")
			return
		
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
		if(item == null):
			saynn("Error: no item found")
		else:
			saynn("It's very awkward to do with bound arms but you just about managed. You "+item.getTakingOffStringLong(false))
		
		addButton("Continue", "You took off an item", "endthescene")

	if(state == "blockedhands"):
		saynn("You really try to take anything off but your blocked hands prevent you from doing so")
		
		addButton("Continue", "Aww", "endthescene")


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
