extends Node
class_name Inventory

var items:Array = []
var equippedItems:Dictionary = {}

signal equipped_items_changed

func _ready():
	name = "Inventory"

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

func addItemID(itemID:String):
	var newItem = GlobalRegistry.createItem(itemID)
	if(newItem == null):
		return false
	addItem(newItem)
	return true

func forceEquipItemID(itemID:String):
	var newItem = GlobalRegistry.createItem(itemID)
	if(newItem == null):
		return false
	if(newItem.getClothingSlotSafe().empty()):
		return false
	return forceEquipStoreOtherUnlessRestraint(newItem)

func addXOfItemID(itemID:String, amount:int):
	var theRef = GlobalRegistry.getItemRef(itemID)
	if(theRef == null):
		return false
	
	var canStack = theRef.canCombine()
	
	if(canStack):
		var newItem = GlobalRegistry.createItem(itemID)
		newItem.setAmount(Util.maxi(0, amount))
		if(newItem == null):
			return false
		addItem(newItem)
		return true
	else:
		for _i in range(amount):
			var newItem = GlobalRegistry.createItem(itemID)
			if(newItem == null):
				return false
			addItem(newItem)
		return true

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

func getEquippedItems() -> Dictionary:
	return equippedItems

func getAllItemsCanDye() -> Array:
	var result := []
	for item in items:
		if(item.canDye()):
			result.append(item)
	for itemSlot in equippedItems:
		if(equippedItems[itemSlot].canDye()):
			result.append(equippedItems[itemSlot])
	return result

func getAllSellableItems() -> Array:
	var result := []
	for item in items:
		if(item.canSell()):
			result.append(item)
	return result

func getItemsAndEquippedItemsTogether() -> Array:
	var result := []
	result.append_array(equippedItems.values())
	result.append_array(items)
	return result

func getItemsAndEquippedItemsTogetherGrouped() -> Dictionary:
	var result := {}
	for item in equippedItems.values():
		result["%$%"+item.id] = [item]
	
	for item in items:
		var invGroupID:String = item.getInventoryGroupID()
		if(!result.has(invGroupID)):
			result[invGroupID] = [item]
		else:
			result[invGroupID].append(item)
	
	return result

func getAllOf(itemID: String) -> Array:
	var result := []
	
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
			
	for slot in equippedItems.keys():
		var item = equippedItems[slot]
		if(item.uniqueID == uniqueID):
			return item
	return null

func getEquippedItemByUniqueID(uniqueID: String):
	for slot in equippedItems.keys():
		var item = equippedItems[slot]
		if(item.uniqueID == uniqueID):
			return item
	return null

func hasEquippedItemWithUniqueID(uniqueID: String):
	for slot in equippedItems.keys():
		var item = equippedItems[slot]
		if(item.uniqueID == uniqueID):
			return true
	return false

func getEquippedItemByID(theID: String):
	for slot in equippedItems.keys():
		var item = equippedItems[slot]
		if(item.id == theID):
			return item
	return null

func removeItem(item):
	if(items.has(item)):
		items.erase(item)
		item.currentInventory = null
		return item
	return null

func removeFirstOf(itemID:String) -> bool:
	var theItem = getFirstOf(itemID)
	if(theItem != null):
		removeItem(theItem)
		return true
	return false

func removeXFromItemOrDelete(item, amount:int):
	assert(items.has(item))
	
	item.removeXOrDestroy(amount)

func getAmountOf(itemID:String) -> int:
	var item = getFirstOf(itemID)
	if(!item):
		return 0
	return item.amount

func getUniqueAmountOf(itemID:String) -> int:
	var result := 0
	for item in items:
		if(item.id == itemID):
			result += 1
	return result

func hasXOf(itemID:String, amount:int) -> bool:
	var item = getFirstOf(itemID)
	if(!item):
		return false
	if(item.amount >= amount):
		return true
	else:
		return false

func getXOfTotal(itemID:String) -> int:
	var result := 0
	for item in items:
		if(item.id == itemID):
			result += item.amount
	return result

func hasXOfTotal(itemID:String, amount:int) -> bool:
	var itemTotal = getXOfTotal(itemID)
	
	if(itemTotal >= amount):
		return true
	return false

func removeXOfOrDestroy(itemID:String, amount:int):
	var item = getFirstOf(itemID)
	if(item == null):
		return
	
	item.removeXOrDestroy(amount)

func getAllCombatUsableItems() -> Array:
	var result := []
	
	for item in items:
		if(item.canUseInCombat()):
			result.append(item)
	
	return result
		
func getAllCombatUsableRestraints() -> Array:
	var result := []
	
	for item in items:
		if(item.canForceOntoNpc()):
			result.append(item)
		
	return result
		
func getAllCombatUsableRestraintsForStaticNpc() -> Array:
	var result := []
	
	for item in items:
		if(item.canForceOntoStaticNpc()):
			result.append(item)
		
	return result
		
func canEquipSlot(slot:String) -> bool:
	if(get_parent() != null && get_parent().has_method("invCanEquipSlot")):
		return get_parent().invCanEquipSlot(slot)
	return true
		
func getCharacter():
	if(get_parent() != null):
		return get_parent()
	return null

func equipItem(item) -> bool:
	if(hasItem(item)):
		removeItem(item)
	
	var slot:String = item.getClothingSlotSafe()
	
	if(equippedItems.has(slot)):
		Log.printerr("Trying to equip an item to slot "+str(slot)+" when there is already an item")
		return false
		#assert(false)
	
	if(!canEquipSlot(slot)):
		return false
	
	equippedItems[slot] = item
	item.currentInventory = self
	#add_child(item)
	emit_signal("equipped_items_changed")
	
	if(SexToyManager.enabled && item.isRestraint()):
		var theChar = getCharacter()
		if(theChar && theChar.isPlayer()):
			SexToyManager.sendTrigger(SexToyTrigger.OnBondageLocked)
	
	return true

func unequipItem(item) -> bool:
	var theitem = removeEquippedItem(item)
	if(theitem):
		addItem(theitem)
		return true
	return false

func clearSlot(slot:String):
	return removeItemFromSlot(slot)

# Returns the unequipped item or null
func unequipSlot(slot:String):
	var theitem = removeItemFromSlot(slot)
	if(theitem):
		addItem(theitem)
	return theitem

func unequipSlotUnlessRestraint(slot:String):
	var theitem = getEquippedItem(slot)
	if(theitem != null):
		if(theitem.isRestraint()):
			return null
		
		return unequipItem(theitem)
	return null

func unequipSlotRemoveIfRestraint(slot:String):
	var theitem = getEquippedItem(slot)
	if(!theitem):
		return null

	removeItemFromSlot(slot)
	if(!theitem.isRestraint() || theitem.isImportant()):
		addItem(theitem)
	return theitem

func forceEquipRemoveOther(item) -> bool:
	var slot:String = item.getClothingSlotSafe()
	
	if(hasSlotEquipped(slot)):
		removeItemFromSlot(slot)
	
	return equipItem(item)

func forceEquipStoreOther(item) -> bool:
	var slot:String = item.getClothingSlotSafe()
	
	if(hasSlotEquipped(slot)):
		var storedItem = removeItemFromSlot(slot)
		addItem(storedItem)
	
	return equipItem(item)

func forceEquipStoreOtherUnlessRestraint(item) -> bool:
	var slot:String = item.getClothingSlotSafe()
	
	if(hasSlotEquipped(slot)):
		var storedItem = removeItemFromSlot(slot)
		if(!storedItem.isRestraint() || storedItem.isImportant() || storedItem.isRestraintShouldKeep()):
			addItem(storedItem)
	
	return equipItem(item)
	
func equipItemBy(item, equipper) -> bool:
	if(equipItem(item)):
		item.onEquippedBy(equipper, false)
		return true
	return false

func forceEquipByRemoveOther(item, forcer, canSmartLock=true) -> bool:
	if(forceEquipRemoveOther(item)):
		item.onEquippedBy(forcer, true)
		if(canSmartLock):
			item.tryAddSmartLock(forcer)
		return true
	return false
		
func forceEquipByStoreOther(item, forcer, canSmartLock=true) -> bool:
	if(forceEquipStoreOther(item)):
		item.onEquippedBy(forcer, true)
		if(canSmartLock):
			item.tryAddSmartLock(forcer)
		return true
	return false
		
func forceEquipByStoreOtherUnlessRestraint(item, forcer, canSmartLock:bool=true) -> bool:
	if(forceEquipStoreOtherUnlessRestraint(item)):
		item.onEquippedBy(forcer, true)
		if(canSmartLock):
			item.tryAddSmartLock(forcer)
		return true
	return false

func getSmartLockedItemsAmount() -> int:
	var result:int = 0
	for slot in equippedItems:
		var item = equippedItems[slot]
		if(item.restraintData != null && item.restraintData.hasSmartLock()):
			result += 1
	return result

func getAllSmartLocks() -> Array:
	var result:Array = []
	for slot in equippedItems:
		var item = equippedItems[slot]
		if(item.restraintData != null && item.restraintData.hasSmartLock()):
			result.append(item.restraintData.getSmartLock())
	return result

func hasItemIDEquipped(itemID: String) -> bool:
	for slot in equippedItems:
		var item = equippedItems[slot]
		if(item.id == itemID):
			return true
	return false

# If your code crashes here, replace getClothingSlot() with getClothingSlotSafe()
func hasSlotEquipped(slot:String) -> bool:
	return equippedItems.has(slot) && equippedItems[slot] != null

func getEquippedItem(slot:String):
	if(equippedItems.has(slot)):
		return equippedItems[slot]
	return null

func getAllEquippedItems() -> Dictionary:
	return equippedItems

func removeItemFromSlot(slot:String):
	if(equippedItems.has(slot)):
		var item = equippedItems[slot]
		item.onUnequipped()
		equippedItems.erase(slot)
		item.currentInventory = null
		emit_signal("equipped_items_changed")
		return item
	return null

func removeEquippedItem(item):
	for slot in equippedItems.keys():
		var myitem = equippedItems[slot]
		
		if(myitem == item):
			item.onUnequipped()
			equippedItems.erase(slot)
			item.currentInventory = null
			emit_signal("equipped_items_changed")
			return item
	return null

func clear():
	for item in items:
		item.currentInventory = null
		#item.queue_free()
	items.clear()
	
	
	for itemSlot in equippedItems.keys():
		#equippedItems[itemSlot].queue_free()
		equippedItems[itemSlot].currentInventory = null
	equippedItems.clear()
	emit_signal("equipped_items_changed")

func clearEquippedItems():
	for itemSlot in equippedItems.keys():
		#equippedItems[itemSlot].queue_free()
		equippedItems[itemSlot].currentInventory = null
	equippedItems.clear()
	emit_signal("equipped_items_changed")
	
func clearEquippedItemsKeepPersistent():
	var persistent = {}
	for itemSlot in equippedItems.keys():
		#equippedItems[itemSlot].queue_free()
		if(equippedItems[itemSlot].isPersistent()):
			persistent[itemSlot] = equippedItems[itemSlot]
		else:
			equippedItems[itemSlot].currentInventory = null
	equippedItems.clear()
	equippedItems = persistent
	emit_signal("equipped_items_changed")

func getEquippedItemsWithBuff(buffID) -> Array:
	var result:Array = []
	for itemSlot in equippedItems.keys():
		var item = equippedItems[itemSlot]
		
		var buffs = item.getBuffs()
		
		for buff in buffs:
			if(buff.id == buffID):
				result.append(item)
				continue
	return result

func removeItemsList(itemsToDelete: Array):
	for item in itemsToDelete:
		removeItem(item)

func removeEquippedItemsList(itemsToDelete: Array):
	for item in itemsToDelete:
		removeEquippedItem(item)

func removeEquippedItemsWithBuff(buffID) -> bool:
	var founditems := getEquippedItemsWithBuff(buffID)
	var hasItem = false
	if(founditems.size() > 0):
		hasItem = true
	removeEquippedItemsList(founditems)
	return hasItem

func getItemsWithTag(tag) -> Array:
	var result := []
	for item in items:
		if(item.hasTag(tag)):
			result.append(item)
	return result
		
func hasItemsWithTag(tag) -> bool:
	return getItemsWithTag(tag).size() > 0

func getItemsWithTagCount(tag) -> int:
	return getItemsWithTag(tag).size()

func removeItemsWithTag(tag):
	removeItemsList(getItemsWithTag(tag))

func getEquippedItemsWithTag(tag) -> Array:
	var result := []
	for itemSlot in equippedItems.keys():
		var item = equippedItems[itemSlot]

		if(item.hasTag(tag)):
			result.append(item)
	return result
	
func hasEquippedItemWithTag(tag) -> bool:
	for itemSlot in equippedItems.keys():
		var item = equippedItems[itemSlot]

		if(item.hasTag(tag)):
			return true
	return false
	
func getEquippedItemsWithTagCount(tag) -> int:
	return getEquippedItemsWithTag(tag).size()
	
func removeEquippedItemsWithTag(tag):
	removeEquippedItemsList(getEquippedItemsWithTag(tag))
	
func getEquppedRestraints() -> Array:
	var result := []
	
	for itemSlot in equippedItems:
		var item = equippedItems[itemSlot]
		if(item.isRestraint()):
			result.append(item)
	return result

func getEquippedRestraints() -> Array:
	return getEquppedRestraints()

func getRemovableRestraintsAmount() -> int:
	var result:int = 0
	for itemSlot in equippedItems:
		var item = equippedItems[itemSlot]
		if(item.isRestraint()):
			var restraintData = item.getRestraintData()
			if(restraintData.canStruggle()):
				result += 1
	return result

func hasRemovableRestraints() -> bool:
	return getRemovableRestraintsAmount() > 0

func hasRemovableRestraintsNoLockedSmartlocks() -> bool:
	for itemSlot in equippedItems:
		var item = equippedItems[itemSlot]
		if(item.isRestraint()):
			var restraintData = item.getRestraintData()
			if(restraintData.canStruggleFinal() && restraintData.shouldStruggle()):
				return true
	return false

func getEquppedRemovableRestraints() -> Array:
	var result := []
	
	for itemSlot in equippedItems:
		var item = equippedItems[itemSlot]
		if(item.isRestraint()):
			var restraintData = item.getRestraintData()
			if(restraintData.canStruggle()):
				result.append(item)
	return result

func getEquppedRemovableRestraintsNoLockedSmartlocks() -> Array:
	var result := []
	
	for itemSlot in equippedItems:
		var item = equippedItems[itemSlot]
		if(item.isRestraint()):
			var restraintData = item.getRestraintData()
			if(restraintData.canStruggleFinal()):
				result.append(item)
	return result

func forceRestraintsWithTag(tag, amount:int = 1) -> Array:
	var itemIDs = GlobalRegistry.getItemIDsByTag(tag)
	itemIDs.shuffle()
	var added:int = 0
	var result := []
	
	for itemID in itemIDs:
		var potentialItem = GlobalRegistry.getItemRef(itemID)
		
		var slot:String = potentialItem.getClothingSlotSafe()
		if(slot.empty() || !canEquipSlot(slot)):
			continue
		
		if(hasSlotEquipped(slot)):
			var ourItem = getEquippedItem(slot)
			if(ourItem.isRestraint()):
				continue
		
		var newItem = GlobalRegistry.createItem(itemID)
		if(forceEquipStoreOther(newItem)):
			result.append(newItem)
			added += 1
			
			if(added >= amount):
				return result
	return result

func forceRestraintsList(_itemIDs:Array, maxAmount:int=-1) -> Array:
	var result:Array = []
	var added:int = 0
	
	for itemID in _itemIDs:
		var potentialItem = GlobalRegistry.getItemRef(itemID)
		
		var slot:String = potentialItem.getClothingSlotSafe()
		if(slot.empty() || !canEquipSlot(slot)):
			continue
		
		if(hasSlotEquipped(slot)):
			var ourItem = getEquippedItem(slot)
			if(ourItem.isRestraint() || ourItem.isImportant()):
				continue
		
		var newItem = GlobalRegistry.createItem(itemID)
		if(forceEquipStoreOtherUnlessRestraint(newItem)):
			result.append(newItem)
			added += 1
			
			if(maxAmount >= 0 && added >= maxAmount):
				return result
	
	return result

func getFirstItemThatCoversBodypart(bodypartSlot:String):
	for inventorySlot in InventorySlot.getAll():
		if(!hasSlotEquipped(inventorySlot)):
			continue
		
		var item = getEquippedItem(inventorySlot)
		if(item.isRemoved()):
			continue
		if(item.coversBodypart(bodypartSlot)):
			return item
	
	return null

func getRestraintsThatCanBeForcedDuringSex(tag):
	var itemIDs:Array = GlobalRegistry.getItemIDsByTag(tag)
	var result:Array = []
	
	for itemID in itemIDs:
		var potentialItem = GlobalRegistry.getItemRef(itemID)
		
		var slot:String = potentialItem.getClothingSlotSafe()
		if(slot.empty() || !canEquipSlot(slot)):
			continue

		if(hasSlotEquipped(slot)):
			var ourItem = getEquippedItem(slot)
			if(ourItem.isRestraint() || ourItem.isImportant()):
				continue
		
		var bodypartSlot:String = potentialItem.getRequiredBodypartSafe()
		var coversItem = getFirstItemThatCoversBodypart(bodypartSlot)
		if(!bodypartSlot.empty() && coversItem != null):
			if(coversItem.isRestraint() || coversItem.isImportant()):
				continue
		
		result.append(itemID)
	return result

func getAmountOfRestraintsThatCanForceDuringSex(tag) -> int:
	return getRestraintsThatCanBeForcedDuringSex(tag).size()

func clearStaticRestraints():
	for slot in InventorySlot.getStatic():
		removeItemFromSlot(slot)

func hasLockedStaticRestraints():
	for slot in InventorySlot.getStatic():
		if(hasSlotEquipped(slot)):
			return true
	return false

func hasIllegalItems() -> bool:
	for item in items:
		if(item.hasTag(ItemTag.Illegal)):
			return true

	for itemSlot in equippedItems.keys():
		var item = equippedItems[itemSlot]

		if(item.hasTag(ItemTag.Illegal)):
			return true
	return false

func findAndEquipInmateUniform():
	if(hasItemID("inmateuniform")):
		forceEquipStoreOtherUnlessRestraint(getFirstOf("inmateuniform"))
	elif(hasItemID("inmateuniformHighsec")):
		forceEquipStoreOtherUnlessRestraint(getFirstOf("inmateuniformHighsec"))
	elif(hasItemID("inmateuniformSexDeviant")):
		forceEquipStoreOtherUnlessRestraint(getFirstOf("inmateuniformSexDeviant"))

func removeBrokenDuplicatedItems():
	var itemsToRemove := []
	var equippedItemsToRemove := []
	
	var seenIDS := {}
	for item in items:
		if(item.uniqueID == null || item.uniqueID == ""):
			continue
		
		if(seenIDS.has(item.uniqueID)):
			itemsToRemove.append(item)
		else:
			seenIDS[item.uniqueID] = true
	
	for slot in equippedItems.keys():
		var item = equippedItems[slot]
		
		if(item.uniqueID == null || item.uniqueID == ""):
			continue
		
		if(seenIDS.has(item.uniqueID)):
			equippedItemsToRemove.append(item)
		else:
			seenIDS[item.uniqueID] = true
	
	for item in itemsToRemove:
		Log.printerr("REMOVING DUBLICATED ITEM: "+item.id+" UNIQUE ID: "+str(item.uniqueID))
		removeItem(item)
	for equippedItem in equippedItemsToRemove:
		Log.printerr("REMOVING DUBLICATED ITEM: "+equippedItem.id+" UNIQUE ID: "+str(equippedItem.uniqueID))
		removeEquippedItem(equippedItem)

func removeRandomRestraints(removedRestraintsChance:float) -> int:
	var restraints := getEquppedRestraints()
	var howManyRemoved := 0
	if(restraints.size() > 0):
		for restraint in restraints:
			if(restraint.isImportant() || restraint.isPersistent()):
				continue
			
			var chanceModifier = 1.0
			var restraintData:RestraintData = restraint.getRestraintData()
			if(restraintData != null):
				chanceModifier /= restraintData.getLevel()
			
			if(RNG.chance(removedRestraintsChance * chanceModifier)):
				removeEquippedItem(restraint)
				howManyRemoved += 1
	
	return howManyRemoved

func hasKnownTFPillWithEffect(tfID:String) -> bool:
	for item in items:
		if(item.id == "TFPill"):
			var theTFID:String = item.getTFID()
			if(tfID == theTFID && GM.main.SCI.isTransformationUnlocked(theTFID)):
				return true
	return false

func removeTFPillWithEffect(tfID:String):
	for item in items:
		if(item.id == "TFPill"):
			var theTFID:String = item.getTFID()
			if(theTFID == tfID):
				item.removeXOrDestroy(1)
				return

func hasAnyOffspringEggs() -> bool:
	for item in items:
		if(item.id == "EggGeneric"):
			if(item.isOffspringEgg()):
				return true
	return false

func getOffspringEggs() -> Array:
	var result:Array = []
	for item in items:
		if(item.id == "EggGeneric"):
			if(item.isOffspringEgg()):
				result.append(item)
	return result

func saveData() -> Dictionary:
	var data := {}
	
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
	
func loadData(data:Dictionary):
	clear()
	
	var loadedItems = SAVE.loadVar(data, "items", [])
	
	for loadedItem in loadedItems:
		var id = SAVE.loadVar(loadedItem, "id", "")
		var uniqueID = SAVE.loadVar(loadedItem, "uniqueID", "")
		if(uniqueID != null && (uniqueID is int)):
			uniqueID = str(uniqueID)
		var itemLoadedData = SAVE.loadVar(loadedItem, "data", {})
		
		var newItem: ItemBase = GlobalRegistry.createItem(id, false)
		if(!newItem):
			Log.printerr("ITEM WITH ID "+str(id)+" WASN'T FOUND IN REGISTRY")
			continue
		if(uniqueID == null || uniqueID == ""):
			uniqueID = "item"+str(GlobalRegistry.generateUniqueID())
		newItem.uniqueID = uniqueID
		newItem.loadData(itemLoadedData)
		addItem(newItem)
		
	var loadedEquippedItems = SAVE.loadVar(data, "equipped_items", {})
	for loadedSlot in loadedEquippedItems:
		var loadedItem = loadedEquippedItems[loadedSlot]
		var id = SAVE.loadVar(loadedItem, "id", "")
		var uniqueID = SAVE.loadVar(loadedItem, "uniqueID", null)
		if(uniqueID != null && (uniqueID is int)):
			uniqueID = str(uniqueID)
		var itemLoadedData = SAVE.loadVar(loadedItem, "data", {})
		
		var newItem: ItemBase = GlobalRegistry.createItem(id, false)
		if(!newItem):
			Log.printerr("ITEM WITH ID "+str(id)+" WASN'T FOUND IN REGISTRY")
			continue
		if(uniqueID == null || uniqueID == ""):
			uniqueID = "item"+str(GlobalRegistry.generateUniqueID())
		newItem.uniqueID = uniqueID
		newItem.loadData(itemLoadedData)
		equipItem(newItem)

func loadDataNPC(data:Dictionary, npc):
	if(true):
		var hasAnyInvData = data.has("equipped_items")
		loadData(data)
		if(!hasAnyInvData):
			npc.resetEquipmentHard() # Recreates all the equipped items because we need fresh uniqueIDs for the items
		return
	
	for item in items:
		item.currentInventory = null
	items.clear()
	for itemSlot in equippedItems.keys():
		if(equippedItems[itemSlot].uniqueID in [null, ""]):
			continue
		equippedItems[itemSlot].currentInventory = null
		equippedItems.erase(itemSlot)
	#equippedItems.clear()
	
	var loadedItems = SAVE.loadVar(data, "items", [])
	for loadedItem in loadedItems:
		var id = SAVE.loadVar(loadedItem, "id", "")
		var uniqueID = SAVE.loadVar(loadedItem, "uniqueID", "")
		var itemLoadedData = SAVE.loadVar(loadedItem, "data", {})
		
		var newItem: ItemBase = GlobalRegistry.createItem(id, false)
		if(!newItem):
			Log.printerr("ITEM WITH ID "+str(id)+" WASN'T FOUND IN REGISTRY")
			continue
		newItem.uniqueID = uniqueID
		newItem.loadData(itemLoadedData)
		addItem(newItem)
	
	var loadedEquippedItems = SAVE.loadVar(data, "equipped_items", {})
	for loadedSlot in loadedEquippedItems:
		var loadedItem = loadedEquippedItems[loadedSlot]
		var id = SAVE.loadVar(loadedItem, "id", "")
		var uniqueID = SAVE.loadVar(loadedItem, "uniqueID", null)
		var itemLoadedData = SAVE.loadVar(loadedItem, "data", {})
		
		# Npc's 'default' equipped items
		if(uniqueID in [null, ""]):
			if(hasSlotEquipped(loadedSlot)):
				var currentItem: ItemBase = getEquippedItem(loadedSlot)
				
				if(currentItem.id != id):
					continue
				currentItem.loadData(itemLoadedData)
		# Anything player might have forced onto them
		else:
			if(!hasSlotEquipped(loadedSlot)):
				var newItem: ItemBase = GlobalRegistry.createItem(id, false)
				if(newItem == null):
					Log.printerr("ITEM WITH ID "+str(id)+" WASN'T FOUND IN REGISTRY")
					continue
				newItem.uniqueID = uniqueID
				newItem.loadData(itemLoadedData)
				equipItem(newItem)
	emit_signal("equipped_items_changed")
