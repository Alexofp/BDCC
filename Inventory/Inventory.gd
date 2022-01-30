extends Node
class_name Inventory

var items = []
var equippedItems = {}

signal equipped_items_changed

func _ready():
	name = "Inventory"

func addItem(item: Node):
	if(item.get_parent() != null):
		assert(false)
	items.append(item)
	add_child(item)

func hasItem(item):
	return items.has(item)

func hasItemID(itemID: String):
	for item in items:
		if(item.id == itemID):
			return true
	return false

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
			
	for slot in equippedItems.keys():
		var item = equippedItems[slot]
		if(item.uniqueID == uniqueID):
			return item
	return null

func removeItem(item):
	if(items.has(item)):
		items.erase(item)
		remove_child(item)
		return item
	return null

func getAllCombatUsableItems():
	var result = []
	
	for item in items:
		if(item.canUseInCombat()):
			result.append(item)
	
	return result
		
func equipItem(item):
	if(hasItem(item)):
		removeItem(item)
	
	var slot = item.getClothingSlot()
	
	if(equippedItems.has(slot)):
		assert(false)
	
	equippedItems[slot] = item
	add_child(item)
	emit_signal("equipped_items_changed")

func hasSlotEquipped(slot):
	return equippedItems.has(slot) && equippedItems[slot] != null

func getEquippedItem(slot):
	if(equippedItems.has(slot)):
		return equippedItems[slot]
	return null

func getAllEquippedItems():
#	var result = []
#	for slot in equippedItems:
#		if(equippedItems[slot] == null):
#			continue
#		result.append(equippedItems[slot])
	
	return equippedItems

func removeItemFromSlot(slot):
	if(equippedItems.has(slot)):
		var item = equippedItems[slot]
		equippedItems.erase(slot)
		remove_child(item)
		emit_signal("equipped_items_changed")
		return item
	return null

func removeEquippedItem(item):
	for slot in equippedItems.keys():
		var myitem = equippedItems[slot]
		
		if(myitem == item):
			equippedItems.erase(slot)
			remove_child(item)
			emit_signal("equipped_items_changed")
			return item
	return null

func clear():
	for item in items:
		item.queue_free()
	items.clear()
	
	for itemSlot in equippedItems.keys():
		equippedItems[itemSlot].queue_free()
	equippedItems.clear()
	emit_signal("equipped_items_changed")

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
	
	data["equipped_items"] = {}
	for slot in equippedItems:
		var item = equippedItems[slot]
		var itemData = {
			"id": item.id,
			"uniqueID": item.uniqueID,
		}
		itemData["data"] = item.saveData()
		
		data["equipped_items"][slot] = itemData
		
	return data
	
func loadData(data):
	clear()
	var loadedItems = SAVE.loadVar(data, "items", [])
	
	for loadedItem in loadedItems:
		var id = SAVE.loadVar(loadedItem, "id", "")
		var uniqueID = SAVE.loadVar(loadedItem, "uniqueID", "")
		var itemLoadedData = SAVE.loadVar(loadedItem, "data", {})
		
		var newItem: ItemBase = GlobalRegistry.createItem(id)
		newItem.uniqueID = uniqueID
		newItem.loadData(itemLoadedData)
		addItem(newItem)
		
	var loadedEquippedItems = SAVE.loadVar(data, "equipped_items", {})
	for loadedSlot in loadedEquippedItems:
		var loadedItem = loadedEquippedItems[loadedSlot]
		var id = SAVE.loadVar(loadedItem, "id", "")
		var uniqueID = SAVE.loadVar(loadedItem, "uniqueID", "")
		var itemLoadedData = SAVE.loadVar(loadedItem, "data", {})
		
		var newItem: ItemBase = GlobalRegistry.createItem(id)
		newItem.uniqueID = uniqueID
		newItem.loadData(itemLoadedData)
		equipItem(newItem)
