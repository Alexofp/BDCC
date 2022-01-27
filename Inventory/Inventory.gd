extends Node
class_name Inventory

var items = []
var equippedItems = {}

func _ready():
	name = "Inventory"

func addItem(item: Node):
	if(item.get_parent() != null):
		assert(false)
	items.append(item)
	add_child(item)

func hasItem(itemID: String):
	for item in items:
		if(item.id == itemID):
			return true
	return false

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
		
func equipItem(slot, item):
	equippedItems[slot] = item

func hasSlotEquipped(slot):
	return equippedItems.has(slot) && equippedItems[slot] != null

func getEquippedItem(slot):
	if(equippedItems.has(slot)):
		return equippedItems[slot]
	return null

func getAllEquippedItems():
	var result = []
	for slot in equippedItems:
		if(equippedItems[slot] == null):
			continue
		result.append(equippedItems[slot])
	
	return result

func removeItemFromSlot(slot):
	if(equippedItems.has(slot)):
		var item = equippedItems[slot]
		equippedItems.erase(slot)
		return item
	return null
