extends Reference
class_name LightInventory
# Just a simple item storage. No equipped items support. Also is a reference instead of a node

var items:Array = []

func addItem(item: Reference):
	if(item.currentInventory != null):
		assert(false)
	
	if(item.canCombine()):
		for myitem in items:
			if(myitem.id == item.id):
				if(myitem.tryCombine(item)):
					#item.queue_free()
					return
		
	items.append(item)
	item.currentInventory = self

func hasItem(item) -> bool:
	return items.has(item)

func hasItemID(itemID: String) -> bool:
	for item in items:
		if(item.id == itemID):
			return true
	return false

func getItems() -> Array:
	return items

func getAllItems() -> Array:
	return items

func getAllOf(itemID: String) -> Array:
	var result:Array = []
	
	for item in items:
		if(item.id == itemID):
			result.append(item)
	
	return result
	
func getFirstOf(itemID: String):
	for item in items:
		if(item.id == itemID):
			return item
	return null

func hasItemWithUniqueID(uniqueID: String) -> bool:
	for item in items:
		if(item.uniqueID == uniqueID):
			return true
	return false

func getItemByUniqueID(uniqueID: String):
	for item in items:
		if(item.uniqueID == uniqueID):
			return item
	return null

func removeItem(item):
	if(items.has(item)):
		items.erase(item)
		item.currentInventory = null
		return item
	return null

func removeXFromItemOrDelete(item, amount:int):
	assert(items.has(item))
	
	item.removeXOrDestroy(amount)

func getAmountOf(itemID:String) -> int:
	var item = getFirstOf(itemID)
	if(item == null):
		return 0
	return item.amount

func hasXOf(itemID:String, amount:int) -> bool:
	var item = getFirstOf(itemID)
	if(item == null):
		return false
	if(item.amount >= amount):
		return true
	else:
		return false

func removeXOfOrDestroy(itemID:String, amount:int):
	var item = getFirstOf(itemID)
	if(item == null):
		return
	
	item.removeXOrDestroy(amount)

func getAllCombatUsableItems() -> Array:
	var result:Array = []
	
	for item in items:
		if(item.canUseInCombat()):
			result.append(item)
	
	return result

func clear():
	for item in items:
		item.currentInventory = null
		#item.queue_free()
	items.clear()

func removeItemsList(itemsToDelete: Array):
	for item in itemsToDelete:
		removeItem(item)

func getItemsWithTag(tag:String) -> Array:
	var result:Array = []
	for item in items:
		if(item.hasTag(tag)):
			result.append(item)
	return result

func isEmpty() -> bool:
	return items.empty()

func getCharacter():
	return null

func getTotalAmountOfItemsWithStack() -> int:
	var result:int = 0
	for theItem in items:
		result += theItem.getAmount()
	return result

func saveData() -> Dictionary:
	var data:Dictionary = {}
	
	data["items"] = []
	
	for item in items:
		var itemData = {
			"id": item.id,
			"uniqueID": item.uniqueID,
		}
		itemData["data"] = item.saveData()
		
		data["items"].append(itemData)
		
	return data
	
func loadData(data:Dictionary):
	clear()
	var loadedItems:Array = SAVE.loadVar(data, "items", [])
	
	for loadedItem in loadedItems:
		var id:String = SAVE.loadVar(loadedItem, "id", "")
		var uniqueID = SAVE.loadVar(loadedItem, "uniqueID", "")
		var itemLoadedData:Dictionary = SAVE.loadVar(loadedItem, "data", {})
		
		var newItem: ItemBase = GlobalRegistry.createItem(id, false)
		if(!newItem):
			Log.printerr("ITEM WITH ID "+str(id)+" WASN'T FOUND IN REGISTRY")
			continue
		newItem.uniqueID = uniqueID
		newItem.loadData(itemLoadedData)
		addItem(newItem)

