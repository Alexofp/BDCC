extends "res://Scenes/SceneBase.gd"

var savedItemUniqueID

func _init():
	sceneID = "InventoryScene"

func _run():
	if(state == ""):
		saynn("What do you wanna do")
		
		say("Your equipped items:\n")
		for slot in InventorySlot.getAll():
			if(!GM.pc.getInventory().hasSlotEquipped(slot)):
				say(InventorySlot.getVisibleName(slot)+": "+"Nothing"+"\n")
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
		
		say("Your equipped items:\n")
		for slot in InventorySlot.getAll():
			if(!GM.pc.getInventory().hasSlotEquipped(slot)):
				say(InventorySlot.getVisibleName(slot)+": "+"Nothing"+"\n")
				continue
			
			var item = GM.pc.getInventory().getEquippedItem(slot)
			
			say(InventorySlot.getVisibleName(slot)+": "+item.getVisibleName()+"\n")
			addButton(item.getVisibleName(), item.getVisisbleDescription(), "takeoff", [item.getUniqueID()])
		
		addButton("Back", "Go back", "")
		
	if(state == "putonmenu"):
		saynn("Pick an item you wanna put on")
		
		say("Your equipped items:\n")
		for slot in InventorySlot.getAll():
			if(!GM.pc.getInventory().hasSlotEquipped(slot)):
				say(InventorySlot.getVisibleName(slot)+": "+"Nothing"+"\n")
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
			
			addButton(item.getVisibleName(), item.getVisisbleDescription(), "puton", [item.getUniqueID()])
		
		addButton("Back", "Go back", "")
		
	if(state == "interactmenu"):
		saynn("Pick an item you wanna interact with")
		
		var items = GM.pc.getInventory().getAllItems()
		for item in items:
			addButton(item.getStackName(), item.getVisisbleDescription(), "lookat", [item.getUniqueID()])
		
		addButton("Back", "Go back", "")

		
	if(state == "lookat"):
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(savedItemUniqueID)
		assert(item != null)
		
		saynn("What do you wanna do with "+item.getStackName())
		
		for action in item.getPossibleActions():
			addButton(action["name"], action["description"], "doitemaction", [action["scene"]])
		
		addButton("Back", "Do nothing with it", "")


func _react(_action: String, _args):
	if(_action == "takeoff"):
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(_args[0])
		runScene(item.getTakeOffScene(), [_args[0]])
		return
	if(_action == "puton"):
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(_args[0])
		runScene(item.getPutOnScene(), [_args[0]])
		return
	if(_action == "doitemaction"):
		var sceneToRun = _args[0]
		runScene(sceneToRun, [savedItemUniqueID])
		return
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "lookat"):
		savedItemUniqueID = _args[0]
	
	setState(_action)

func _react_scene_end(_tag, _result):
	setState("")

func saveData():
	var data = .saveData()
	
	data["savedItemUniqueID"] = savedItemUniqueID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	savedItemUniqueID = SAVE.loadVar(data, "savedItemUniqueID", "")
