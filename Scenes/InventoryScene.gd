extends "res://Scenes/SceneBase.gd"

var inventoryScreenScene = preload("res://UI/Inventory/InventoryScreen.tscn")

var savedItemUniqueID = ""
var fightMode = false

func _init():
	sceneID = "InventoryScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		fightMode = _args[0]
		
		if(fightMode && false):
			setState("interactmenu")

func _run():
	if(state == ""):
		if(true):
			var inventory = inventoryScreenScene.instance()
			GM.ui.addFullScreenCustomControl("inventory", inventory)
			inventory.setItems(GM.pc.getInventory().getItemsAndEquippedItemsTogetherGrouped(), ("fight" if fightMode else ""))
			var _ok = inventory.connect("onItemSelected", self, "onInventoryItemSelected")
			var _ok2 = inventory.connect("onInteractWith", self, "onInventoryItemInteracted")
			
		else:
			saynn("What do you wanna do")
			
			say("Your equipped items:\n")
			for slot in InventorySlot.getAll():
				if(!GM.pc.getInventory().hasSlotEquipped(slot) && GM.pc.invCanEquipSlot(slot)):
					say(InventorySlot.getVisibleName(slot)+": "+"Nothing"+"\n")
					continue
				if(!GM.pc.invCanEquipSlot(slot)):
					continue
				
				var item = GM.pc.getInventory().getEquippedItem(slot)
				
				say(InventorySlot.getVisibleName(slot)+": "+item.getVisibleName()+"\n")
			
			say("\n")
			var items = GM.pc.getInventory().getAllItems()
			var itemNames = []
			for item in items:
				itemNames.append(item.getStackName())
			say("Your items:\n")
			say(Util.join(itemNames, ", "))
		
			addButton("Take off", "Take off an item", "takeoffmenu")
			addButton("Put on", "Put on an item", "putonmenu")
			addButton("Use item", "Pick an item to use", "interactmenu")
		addButton("Close", "Close the inventory", "endthescene")
		
	if(state == "takeoffmenu"):
		saynn("Pick an item you wanna take off")
		
		addButton("Back", "Go back", "")
		
		say("Your equipped items:\n")
		for slot in InventorySlot.getAll():
			if(!GM.pc.getInventory().hasSlotEquipped(slot) && GM.pc.invCanEquipSlot(slot)):
				say(InventorySlot.getVisibleName(slot)+": "+"Nothing"+"\n")
				continue
			if(!GM.pc.invCanEquipSlot(slot)):
				continue
			
			var item = GM.pc.getInventory().getEquippedItem(slot)
			
			say(InventorySlot.getVisibleName(slot)+": "+item.getVisibleName()+"\n")
			addButton(item.getVisibleName(), item.getVisisbleDescription(), "takeoff", [item.getUniqueID()])
		
	if(state == "putonmenu"):
		saynn("Pick an item you wanna put on")
		
		addButton("Back", "Go back", "")
		
		say("Your equipped items:\n")
		for slot in InventorySlot.getAll():
			if(!GM.pc.getInventory().hasSlotEquipped(slot) && GM.pc.invCanEquipSlot(slot)):
				say(InventorySlot.getVisibleName(slot)+": "+"Nothing"+"\n")
				continue
			if(!GM.pc.invCanEquipSlot(slot)):
				continue
			
			var item = GM.pc.getInventory().getEquippedItem(slot)
			
			say(InventorySlot.getVisibleName(slot)+": "+item.getVisibleName()+"\n")
		
		for item in GM.pc.getInventory().getAllItems():
			var slot = item.getClothingSlot()
			if(slot == null):
				continue
				
			if(GM.pc.getInventory().hasSlotEquipped(slot)):
				addDisabledButton(item.getVisibleName(), "This item's slot is already occupied")
				continue
			if(!GM.pc.invCanEquipSlot(slot)):
				addDisabledButton(item.getVisibleName(), "You can't equip this item")
				continue
			
			addButton(item.getVisibleName(), item.getVisisbleDescription(), "puton", [item.getUniqueID()])
		
		
	if(state == "interactmenu"):
		saynn("Pick an item you wanna interact with")
		#if(fightMode):
		#	saynn("Press back to be able to equip and unequip items in a fight.")
		
		if(fightMode):
			addButton("Back", "You don't wanna use anything", "endthescene")
		else:
			addButton("Back", "Go back", "")
		
		var savedDisabled = []
		var equippeditems = GM.pc.getInventory().getAllEquippedItems()
		for invSlot in equippeditems:
			var item = equippeditems[invSlot]
			var actions = item.getPossibleActions()
			if(actions.size() > 0):
				addButton("(worn)"+item.getStackName(), item.getVisisbleDescription(), "lookat", [item.getUniqueID()])
		
		var items = GM.pc.getInventory().getAllItems()
		for item in items:
			var actions = item.getPossibleActions()
			if(actions.size() > 0):
				addButton(item.getStackName(), item.getVisisbleDescription(), "lookat", [item.getUniqueID()])
			else:
				savedDisabled.append([item.getStackName(), item.getVisisbleDescription()])
		
		for disabledRecord in savedDisabled:
			addDisabledButton(disabledRecord[0], disabledRecord[1])
			

		
	if(state == "lookat"):
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(savedItemUniqueID)
		assert(item != null)
		
		saynn("What do you wanna do with "+item.getStackName())
		
		for action in item.getPossibleActions():
			if(!canDoAction(action)):
				addDisabledButton(action["name"], "(Can't do this now)\n\n"+action["description"])
			else:
				addButton(action["name"], action["description"], "doitemaction", [action["scene"]])
		
		addButton("Back", "Do nothing with it", "interactmenu")

func canDoAction(action):
	if(fightMode && action.has("onlyWhenCalm") && action["onlyWhenCalm"]):
		return false
		
	return true

func _react(_action: String, _args):
	if(_action == "takeoff"):
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(_args[0])
		runScene(item.getTakeOffScene(), [_args[0]])
		if(fightMode):
			endScene()
		return
	if(_action == "puton"):
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(_args[0])
		runScene(item.getPutOnScene(), [_args[0]])
		if(fightMode):
			endScene()
		return
	if(_action == "doitemaction"):
		var sceneToRun = _args[0]
		runScene(sceneToRun, [savedItemUniqueID])
		if(fightMode):
			endScene()
		return
	if(_action == "endthescene"):
		endScene([false])
		return
	if(_action == "lookat"):
		savedItemUniqueID = _args[0]
	
		if(fightMode):
			var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(savedItemUniqueID)
			
			var possibleActions = item.getPossibleActions()
			if(possibleActions.size() == 1):
				if(canDoAction(possibleActions[0])):
					runScene(possibleActions[0]["scene"], [savedItemUniqueID])
					endScene()
	
	if(_action == "dofightaction"):
		savedItemUniqueID = _args[0]
	
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(savedItemUniqueID)
			
		var possibleActions = item.getPossibleActions()
		if(possibleActions.size() == 1):
			if(canDoAction(possibleActions[0])):
				runScene(possibleActions[0]["scene"], [savedItemUniqueID])
				endScene()
		return
	
	setState(_action)

func _react_scene_end(_tag, _result):
	setState("")

func onInventoryItemInteracted(item: ItemBase):
	GM.main.pickOption("dofightaction", [item.getUniqueID()])

func onInventoryItemSelected(item: ItemBase):
	GM.ui.clearButtons()
	addButton("Close", "Close the inventory", "endthescene")
	
	if(item == null):
		return
	savedItemUniqueID = item.getUniqueID()
	
	var slot = item.getClothingSlot()
	if(slot != null && !fightMode):
		if(GM.pc.getInventory().hasSlotEquipped(slot)):
			if(GM.pc.getInventory().getEquippedItem(slot) == item):
				addButton("Take off", item.getVisisbleDescription(), "takeoff", [item.getUniqueID()])
			else:
				addDisabledButton("Put on", "This item's slot is already occupied")
		elif(!GM.pc.invCanEquipSlot(slot)):
			addDisabledButton("Put on", "You can't equip this item")
		else:
			addButton("Put on", item.getVisisbleDescription(), "puton", [item.getUniqueID()])
	
	for action in item.getPossibleActions():
		if(!canDoAction(action)):
			addDisabledButton(action["name"], "(Can't do this now)\n\n"+action["description"])
		else:
			addButton(action["name"], action["description"], "doitemaction", [action["scene"]])

func saveData():
	var data = .saveData()
	
	data["savedItemUniqueID"] = savedItemUniqueID
	data["fightMode"] = fightMode
	
	return data
	
func loadData(data):
	.loadData(data)
	
	savedItemUniqueID = SAVE.loadVar(data, "savedItemUniqueID", "")
	fightMode = SAVE.loadVar(data, "fightMode", false)
