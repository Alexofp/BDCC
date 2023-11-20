extends "res://Scenes/SceneBase.gd"

var inventoryScreenScene = preload("res://UI/Inventory/InventoryScreen.tscn")

var sellingItemsTags = [
	ItemTag.SoldByGeneralVendomat,
]
var sellingItems = [
	]
var sellItemsData = {}
var sortedItemsIds = []
var finalSellingItemsObjects = []

var lockedInto = false

func _initScene(_args = []):
	if(_args.size() > 0):
		lockedInto = true
		setState(_args[0])

func _init():
	sceneID = "VendomatScene"
	
func _reactInit():
	updateSellingItems()
	
func updateSellingItems():
	sellItemsData.clear()
	sortedItemsIds.clear()
	
	var finalSellingItems = []
	finalSellingItems.append_array(sellingItems)
	
	for itemTag in sellingItemsTags:
		var itemIDs = GlobalRegistry.getItemIDsByTagSlow(itemTag)
		finalSellingItems.append_array(itemIDs)
	
	for itemID in finalSellingItems:
		if(sellItemsData.has(itemID)):
			continue
		
		var itemObject = GlobalRegistry.getItemRef(itemID)
		sellItemsData[itemID] = {
			"name": itemObject.getVisibleName(),
			"desc": itemObject.getVisisbleDescription(),
			"price": itemObject.getPrice(),
			"amount": itemObject.getBuyAmount(),
		}
		sortedItemsIds.append(itemID)
		finalSellingItemsObjects.append(itemObject)
	sortedItemsIds.sort_custom(self, "sort_stock")	
	
func sort_stock(a, b):
	if sellItemsData[a]["price"] < sellItemsData[b]["price"]:
		return true
	return false


func _run():
	if(state == ""):
		saynn("You approach the vendomat, it's a bulky machine that has a screen, a few buttons and an open compartment. Seems like you can get some things here in exchange for your credits")
		
		saynn("What do you wanna do?")

		addButton("Buy", "See what the machine has to sell", "buymenu")
		addButton("Sell", "See what you can sell", "sellmenu")
		addButton("Step away", "Step away from the machine", "endthescene")
	
	if(state == "buymenu"):
		var inventory = inventoryScreenScene.instance()
		GM.ui.addFullScreenCustomControl("inventory", inventory)
		inventory.setItems(finalSellingItemsObjects, "buy")
		var _ok = inventory.connect("onItemSelected", self, "onInventoryItemSelected")
		var _ok2 = inventory.connect("onInteractWith", self, "onInventoryItemInteracted")

		addButton("Back", "Don't buy anything", "")

	if(state == "sellmenu"):
		var inventory = inventoryScreenScene.instance()
		GM.ui.addFullScreenCustomControl("inventory", inventory)
		inventory.setItems(GM.pc.getInventory().getAllSellableItems(), "sell")
		var _ok = inventory.connect("onItemSelected", self, "onInventoryItemSelected")
		var _ok2 = inventory.connect("onInteractWith", self, "onInventoryItemInteracted")
		var _ok3 = inventory.connect("onInteractWithGroup", self, "onInventoryItemGroupInteracted")

		addButton("Back", "Don't sell anything", "")
		
func _react(_action: String, _args):
	if(_action == ""):
		if(lockedInto):
			endScene()
			return
	
	if(_action == "buy"):
		var itemID = _args[0]
		var amount = 1
		if(_args.size() > 1):
			amount = _args[1]
		var item = sellItemsData[itemID]
		var itemName = item["name"]
		if((item["amount"] * amount) > 1):
			itemName = str(item["amount"] * amount)+"x"+itemName
		
		for _i in range(amount):
			var itemObject = GlobalRegistry.createItem(itemID)
			if(item["amount"] > 1):
				itemObject.setAmount(item["amount"])
			GM.pc.getInventory().addItem(itemObject)
		GM.pc.addCredits(-sellItemsData[itemID]["price"] * amount)

		
		addMessage(""+itemName+" was added to your inventory")
		
		if(lockedInto):
			endScene()
			return
		setState("")
		return
	if(_action == "sell"):
		var item = _args[0]
		var howMuch = 1
		if(_args.size() > 1):
			howMuch = _args[1]
		howMuch = Util.mini(item.getAmount(), howMuch)
		var howMuchStr = str(howMuch)+"x"
		
		GM.pc.addCredits(item.getSellPrice() * howMuch)
		GM.pc.getInventory().removeXFromItemOrDelete(item, howMuch)
		
		addMessage(howMuchStr+item.getVisibleName()+" was sold for "+str(item.getSellPrice() * howMuch) + " credits")
		
		setState("")
		if(lockedInto):
			endScene()
			return
		return

	if(_action == "sellall"):
		var item = _args[0]
		var allSellableItems = GM.pc.getInventory().getAllSellableItems().duplicate()
		var resultAdd = 0
		var howMuch = 0
		
		for sellitem in allSellableItems:
			if(sellitem.id == item.id):
				var amountToSell = sellitem.getAmount()
				howMuch += amountToSell
				
				resultAdd += sellitem.getSellPrice() * amountToSell
				
				GM.pc.getInventory().removeXFromItemOrDelete(sellitem, amountToSell)

		var howMuchStr = str(howMuch)+"x"
		resultAdd = int(resultAdd)
		addMessage(howMuchStr+item.getVisibleName()+" was sold for "+str(resultAdd) + " credits")
		GM.pc.addCredits(resultAdd)
		
		setState("")
		if(lockedInto):
			endScene()
			return
		return

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["lockedInto"] = lockedInto

	return data
	
func loadData(data):
	.loadData(data)
	
	lockedInto = SAVE.loadVar(data, "lockedInto", false)
	
	updateSellingItems()

func onInventoryItemInteracted(item: ItemBase):
	if(state == "buymenu"):
		GM.main.pickOption("buy", [item.id])
	if(state == "sellmenu"):
		GM.main.pickOption("sell", [item, item.getAmount()])

func onInventoryItemSelected(item: ItemBase):
	GM.ui.clearButtons()
	addButton("Back", "Don't do anything", "")
	
	if(state == "buymenu"):
		var itemData = sellItemsData[item.id]
		var itemAmountPerBuy = itemData["amount"]
		var itemPrice = itemData["price"]
		
		var credits = GM.pc.getCredits()
		var amounts = [1, 2, 3, 4, 5, 10, 20]
		for amount in amounts:
			var newPrice = itemPrice * amount
			var newAmount = itemAmountPerBuy * amount
			
			if(credits >= newPrice):
				addButton("Buy "+(str(newAmount))+" for "+str(newPrice)+" credits", "Amount: "+str(newAmount)+"\nPrice: "+str(newPrice)+" credits", "buy", [item.id, amount])
			else:
				addDisabledButton("Buy "+(str(newAmount))+" for "+str(newPrice)+" credits", "Amount: "+str(newAmount)+"\nPrice: "+str(newPrice)+" credits\nYou don't have enough credits")
	if(state == "sellmenu"):
		var itemAmount = item.getAmount()
		var amounts = [1, 2, 3, 4, 5, int(itemAmount * 0.3), int(itemAmount * 0.5), int(itemAmount * 0.7), itemAmount]
		amounts.sort()
		var amountsUsed = {}
		
		for amount in amounts:
			if(amount < 1):
				continue
			if(itemAmount < amount):
				break
			if(amountsUsed.has(str(amount))):
				continue
			amountsUsed[str(amount)] = true
			
			var newSellPrice = item.getSellPrice() * amount
			
			addButton("Sell "+(str(amount))+" for "+str(newSellPrice)+" credits", "Amount: "+str(amount)+"\nPrice: "+str(newSellPrice)+" credits", "sell", [item, amount])
			
func onInventoryItemGroupInteracted(item: ItemBase):
	if(state == "sellmenu"):
		GM.main.pickOption("sellall", [item])
		

		
		
