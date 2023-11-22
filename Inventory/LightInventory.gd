extends Reference
class_name LightInventory
# Just a simple item storage. No equipped items support. Also is a reference instead of a node

var items = []

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

func hasItem(item):
	return items.has(item)

func hasItemID(itemID: String):
	for item in items:
		if(item.id == itemID):
			return true
	return false

func getItems():
	return items

func getAllItems():
	return items

func getAllOf(itemID: String):
	var result = []
	
	for item in items:
		if(item.id == itemID):
			result.append(item)
	
	return result
	
func getFirstOf(itemID: String):
	for item in items:
		if(item.id == itemID):
			return item
	return null

func hasItemWithUniqueID(uniqueID: String):
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

func removeXFromItemOrDelete(item, amount):
	assert(items.has(item))
	
	item.removeXOrDestroy(amount)

func getAmountOf(itemID):
	var item = getFirstOf(itemID)
	if(item == null):
		return 0
	return item.amount

func hasXOf(itemID, amount):
	var item = getFirstOf(itemID)
	if(item == null):
		return false
	if(item.amount >= amount):
		return true
	else:
		return false

func removeXOfOrDestroy(itemID, amount):
	var item = getFirstOf(itemID)
	if(item == null):
		return
	
	item.removeXOrDestroy(amount)

func getAllCombatUsableItems():
	var result = []
	
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

func getItemsWithTag(tag):
	var result = []
	for item in items:
		if(item.hasTag(tag)):
			result.append(item)
	return result

func isEmpty():
	return items.empty()

func getCharacter():
	return null

func saveData():
	var data = {}
	
	data["items"] = []
	
	for item in items:
		var itemData = {
			"id": item.id,
			"uniqueID": item.uniqueID,
		}
		itemData["data"] = item.saveData()
		
		data["items"].append(itemData)
		
	return data
	
func loadData(data):
	clear()
	var loadedItems = SAVE.loadVar(data, "items", [])
	
	for loadedItem in loadedItems:
		var id = SAVE.loadVar(loadedItem, "id", "")
		var uniqueID = SAVE.loadVar(loadedItem, "uniqueID", "")
		var itemLoadedData = SAVE.loadVar(loadedItem, "data", {})
		
		var newItem: ItemBase = GlobalRegistry.createItem(id, false)
		if(newItem == null):
			Log.printerr("ITEM WITH ID "+str(id)+" WASN'T FOUND IN REGISTRY")
			continue
		newItem.uniqueID = uniqueID
		newItem.loadData(itemLoadedData)
		addItem(newItem)

