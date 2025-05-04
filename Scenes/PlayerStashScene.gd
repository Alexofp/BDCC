extends "res://Scenes/SceneBase.gd"

var inventoryScreenScene = preload("res://UI/Inventory/InventoryScreen.tscn")

func _init():
	sceneID = "PlayerStashScene"

func _run():
	if(state == ""):
		if(GM.pc.getLocation() != GM.pc.getCellLocation()):
			saynn("What do you want to do with your stash.")
		else:
			saynn("You find a place you can stash some items in, it's under your pillow. What do you wanna do")
		
		var items = GlobalRegistry.getCharacter("playerstash").getInventory().getAllItems()
		var itemNames = []
		for item in items:
			itemNames.append(item.getVisibleName())
		say("Items in the stash:\n")
		say(Util.join(itemNames, ", "))
		say("\n\n")
		
		items = GM.pc.getInventory().getAllItems()
		itemNames = []
		for item in items:
			itemNames.append(item.getVisibleName())
		say("Your items:\n")
		say(Util.join(itemNames, ", "))
		
		addButton("Stash item", "Hide an item", "hideitemmenu")
		addButton("Take item", "Take an item", "takeitemmenu")
		addButton("Step away", "You're done", "endthescene")
	if(state == "hideitemmenu"):
		var theItems = []
		theItems.append_array(GM.pc.getInventory().getItems())
		if(GM.pc.getCredits() > 0):
			var credsItem = GlobalRegistry.createItem("WorkCredit")
			credsItem.setAmount(GM.pc.getCredits())
			theItems.append(credsItem)
		
		var inventory = inventoryScreenScene.instance()
		GM.ui.addFullScreenCustomControl("inventory", inventory)
		inventory.setItems(theItems, "stash")
		var _ok = inventory.connect("onItemSelected", self, "onInventoryItemSelected")
		var _ok2 = inventory.connect("onInteractWith", self, "onInventoryItemInteracted")
		var _ok3 = inventory.connect("onInteractWithGroup", self, "onInventoryItemGroupInteracted")
		addButton("Back", "Go back", "")
	
	if(state == "takeitemmenu"):
		var inventory = inventoryScreenScene.instance()
		GM.ui.addFullScreenCustomControl("inventory", inventory)
		inventory.setItems(GlobalRegistry.getCharacter("playerstash").getInventory().getAllItems(), "take")
		var _ok = inventory.connect("onItemSelected", self, "onInventoryItemSelected")
		var _ok2 = inventory.connect("onInteractWith", self, "onInventoryItemInteracted")
		var _ok3 = inventory.connect("onInteractWithGroup", self, "onInventoryItemGroupInteracted")
		addButton("Back", "Go back", "")

func _react(_action: String, _args):
	if(_action == "hideitem"):
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(_args[0])
		GM.pc.getInventory().removeItem(item)
		GlobalRegistry.getCharacter("playerstash").getInventory().addItem(item)
		
		#setState("")
		return
	if(_action == "takeitem"):
		var item: ItemBase = GlobalRegistry.getCharacter("playerstash").getInventory().getItemByUniqueID(_args[0])
		GlobalRegistry.getCharacter("playerstash").getInventory().removeItem(item)
		GM.pc.getInventory().addItem(item)
		
		#setState("")
		return
	if(_action == "stashx"):
		var item: ItemBase = _args[0]
		
		var newItem = item.splitAmount(_args[1])
		
		if(newItem != null):
			if(newItem.id == "WorkCredit"):
				GM.pc.addCredits(-newItem.getAmount())
			GlobalRegistry.getCharacter("playerstash").getInventory().addItem(newItem)
		
		return
		
	if(_action == "takex"):
		var item: ItemBase = _args[0]
		
		var newItem = item.splitAmount(_args[1])
		
		if(newItem != null):
			if(item.id == "WorkCredit"):
				GM.pc.addCredits(newItem.getAmount())
			else:
				GM.pc.getInventory().addItem(newItem)
		
		return
		
	if(_action == "hideallitems"):
		var itemsToCheck = GM.pc.getInventory().getItems().duplicate()
		for item in itemsToCheck:
			if(item.id == _args[0]):
				GM.pc.getInventory().removeItem(item)
				GlobalRegistry.getCharacter("playerstash").getInventory().addItem(item)
		return
		
	if(_action == "takeallitems"):
		var itemsToCheck = GlobalRegistry.getCharacter("playerstash").getInventory().getItems().duplicate()
		for item in itemsToCheck:
			if(item.id == _args[0]):
				GlobalRegistry.getCharacter("playerstash").getInventory().removeItem(item)
				GM.pc.getInventory().addItem(item)
		return
		
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func onInventoryItemSelected(item: ItemBase):
	if(state == "hideitemmenu"):
		GM.ui.clearButtons()
		addButton("Back", "Go back", "")
		
		if(item.canCombine() && item.getAmount() > 1):
			var amounts = [1, 2, 3, 4, 5, int(item.getAmount() * 0.5)]
			amounts.sort()
			var checkedAmounts = {}
			for amount in amounts:
				if(amount > item.getAmount()):
					break
				if(checkedAmounts.has(str(amount))):
					continue
				checkedAmounts[str(amount)] = true
				
				addButton("Stash "+str(amount), "Stash this amount", "stashx", [item, amount])
	if(state == "takeitemmenu"):
		GM.ui.clearButtons()
		addButton("Back", "Go back", "")
		
		if(item.canCombine() && item.getAmount() > 1):
			var amounts = [1, 2, 3, 4, 5, int(item.getAmount() * 0.5)]
			amounts.sort()
			var checkedAmounts = {}
			for amount in amounts:
				if(amount > item.getAmount()):
					break
				if(checkedAmounts.has(str(amount))):
					continue
				checkedAmounts[str(amount)] = true
				
				addButton("Take "+str(amount), "Take this amount", "takex", [item, amount])

func onInventoryItemGroupInteracted(item: ItemBase):
	if(state == "hideitemmenu"):
		GM.main.pickOption("hideallitems", [item.id])
	if(state == "takeitemmenu"):
		GM.main.pickOption("takeallitems", [item.id])

func onInventoryItemInteracted(item: ItemBase):
	if(state == "hideitemmenu"):
		#GM.main.pickOption("hideitem", [item.getUniqueID()])
		if(item.id == "WorkCredit"):
			GM.pc.addCredits(-GM.pc.getCredits())
		GM.pc.getInventory().removeItem(item)
		GlobalRegistry.getCharacter("playerstash").getInventory().addItem(item)
		var inv = GM.ui.getCustomControl("inventory")
		if(inv.selectedItem == item):
			inv.selectedItem = null
			inv.updateSelectedInfo()
			GM.ui.clearButtons()
			addButton("Back", "Don't do anything", "")
		var theItems = []
		theItems.append_array(GM.pc.getInventory().getItems())
		if(GM.pc.getCredits() > 0):
			var credsItem = GlobalRegistry.createItem("WorkCredit")
			credsItem.setAmount(GM.pc.getCredits())
			theItems.append(credsItem)
		inv.setItems(theItems, "stash")
	if(state == "takeitemmenu"):
		#GM.main.pickOption("takeitem", [item.getUniqueID()])
		GlobalRegistry.getCharacter("playerstash").getInventory().removeItem(item)
		if(item.id == "WorkCredit"):
			GM.pc.addCredits(item.getAmount())
		else:
			GM.pc.getInventory().addItem(item)
		var inv = GM.ui.getCustomControl("inventory")
		if(inv.selectedItem == item):
			inv.selectedItem = null
			inv.updateSelectedInfo()
			GM.ui.clearButtons()
			addButton("Back", "Don't do anything", "")
		inv.setItems(GlobalRegistry.getCharacter("playerstash").getInventory().getAllItems(), "take")
