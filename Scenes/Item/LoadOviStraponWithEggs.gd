extends "res://Scenes/SceneBase.gd"

var inventoryScreenScene = preload("res://UI/Inventory/InventoryScreen.tscn")
var uniqueItemID:String = ""
var item: ItemBase
var reportText:String = ""

func _init():
	sceneID = "LoadOviStraponWithEggs"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]
	
func _reactInit():
	if(uniqueItemID == null || uniqueItemID == ""):
		return
		
	item = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)

func getMaxAmount() -> int:
	return item.getMaxOvipositorEggAmount()

func getCurrentAmount() -> int:
	return item.eggInv.getTotalAmountOfItemsWithStack()

func canGiveEggs() -> bool:
	return getCurrentAmount() < getMaxAmount()

func updateInvScreen(_screen):
	var theItems:Array = []
	#for theItem in item.eggInv.getItems():
	for theItem in GM.pc.getInventory().getItems():
		if(theItem.has_method("createEggCellForOviposition")):
			theItems.append(theItem)
	_screen.setItems(theItems, "give")

func _run():
	if(state == ""):
		var inventory = inventoryScreenScene.instance()
		inventory.shouldGrabInput = false
		inventory.shouldGroup = false
		GM.ui.addFullScreenCustomControl("inventory", inventory)
		updateInvScreen(inventory)
		#var _ok = inventory.connect("onItemSelected", self, "onInventoryItemSelected")
		var _ok2 = inventory.connect("onInteractWith", self, "onInventoryItemInteracted")
		var _ok3 = inventory.connect("onInteractWithGroup", self, "onInventoryItemGroupInteracted")
		
		addButton("Close", "Enough messing around", "endthescene")
		addButton("Empty it ("+str(getCurrentAmount())+"/"+str(getMaxAmount())+")", "Remove all of the eggs from this strapon", "emptyit")
	
	if(state == "emptyit"):
		saynn(reportText)
		addButton("Continue", "See what happens next", "")

func onInventoryItemGroupInteracted(theItem: ItemBase):
	var theItemID:String = theItem.id
	
	var toTransfer:Array = []
	for theItem in GM.pc.getInventory().getItems():
		if(theItem == theItemID):
			toTransfer.append(theItem)
	
	for theItem in toTransfer:
		if(!canGiveEggs()):
			break
		GM.pc.getInventory().removeItem(theItem)
		item.eggInv.addItem(theItem)
	
	var inv = GM.ui.getCustomControl("inventory")
	#if(shouldResetSelection):
	inv.selectedItem = null
	inv.updateSelectedInfo()
	
	updateInvScreen(inv)
	
	GM.ui.clearButtons()
	addButton("Close", "Enough messing around", "endthescene")
	addButton("Empty it ("+str(getCurrentAmount())+"/"+str(getMaxAmount())+")", "Remove all of the eggs from this strapon", "emptyit")

func onInventoryItemInteracted(theItem: ItemBase):
	if(!canGiveEggs()):
		return
	#var theItemSaved := theItem
	var shouldResetSelection:bool = false
	if(theItem.getAmount() > 1):
		theItem = theItem.splitAmount(1)
	else:
		GM.pc.getInventory().removeItem(theItem)
		shouldResetSelection = true
	
	item.eggInv.addItem(theItem)
	
	var inv = GM.ui.getCustomControl("inventory")
	if(shouldResetSelection):
		inv.selectedItem = null
	inv.updateSelectedInfo()
	
	updateInvScreen(inv)
	
	GM.ui.clearButtons()
	addButton("Close", "Enough messing around", "endthescene")
	addButton("Empty it ("+str(getCurrentAmount())+"/"+str(getMaxAmount())+")", "Remove all of the eggs from this strapon", "emptyit")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "emptyit"):
		var theItems:Array = item.eggInv.getItems().duplicate()
		
		var theAm:int = getCurrentAmount()
		
		for theItem in theItems:
			item.eggInv.removeItem(theItem)
			GM.pc.getInventory().addItem(theItem)
		
		reportText = "You took back "+str(theAm)+" egg"+("s" if theAm != 1 else "")+"!"
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["uniqueItemID"] = uniqueItemID
	data["reportText"] = reportText
	
	return data
	
func loadData(data):
	.loadData(data)
	
	uniqueItemID = SAVE.loadVar(data, "uniqueItemID", "")
	reportText = SAVE.loadVar(data, "reportText", "")
	item = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
