extends Reference
class_name LootTableBase

var id = "base"
var loot = []
var minCredits = 0
var maxCredits = 0
var creditsChance = 100

func addLoot(chance, items):
	loot.append([chance, items])

func generateCredits():
	if(!RNG.chance(creditsChance)):
		return 0
	return RNG.randi_range(minCredits, maxCredits)

func getPossibleLoot(characterID, battleName):
	var resultLoot = loot
	
	var handledLists = {}
	
	var lootLists = GlobalRegistry.getLootLists(id)
	for lootList in lootLists:
		if(handledLists.has(lootList)):
			continue
		handledLists[lootList] = true
		var newLoot = lootList.getLoot(id, characterID, battleName)
		if(newLoot is Array):
			resultLoot.append_array(newLoot)
	
	if(characterID != null):
		var charLootLists = GlobalRegistry.getLootListsByCharacter(characterID)
		for lootList in charLootLists:
			if(handledLists.has(lootList)):
				continue
			handledLists[lootList] = true
			var newLoot = lootList.getLoot(id, characterID, battleName)
			if(newLoot is Array):
				resultLoot.append_array(newLoot)
	
	if(battleName != null):
		var battleLootLists = GlobalRegistry.getLootListsByCharacter(battleName)
		for lootList in battleLootLists:
			if(handledLists.has(lootList)):
				continue
			handledLists[lootList] = true
			var newLoot = lootList.getLoot(id, characterID, battleName)
			if(newLoot is Array):
				resultLoot.append_array(newLoot)
	
	for allLootList in GlobalRegistry.getLootListsAll():
		if(handledLists.has(allLootList)):
			continue
		handledLists[allLootList] = true
		var newLoot = allLootList.getLoot(id, characterID, battleName)
		if(newLoot is Array):
			resultLoot.append_array(newLoot)
	
	return resultLoot

func generate(characterID = null, battleName = null):
	var items = []
	
	for lootLine in getPossibleLoot(characterID, battleName):
		var chance = lootLine[0]
		var possibleItems = lootLine[1]
		
		if(!RNG.chance(chance)):
			continue
		
		if(possibleItems is String):
			items.append([possibleItems, 1])
		
		for possibleItemData in possibleItems:
			if(possibleItemData is String):
				items.append([possibleItemData, 1])
				continue
			
			var amountOfData = possibleItemData.size()
			if(amountOfData == 1):
				items.append([possibleItemData[0], 1])
			elif(amountOfData == 2):
				items.append([possibleItemData[0], possibleItemData[1]])
			elif(amountOfData > 2):
				items.append([possibleItemData[0], RNG.randi_range(possibleItemData[1], possibleItemData[2])])
	
	return {"items": items, "credits": generateCredits()}

func generateAndCreateItems(characterID = null, battleName = null):
	var generatedloot = generate(characterID, battleName)
	
	var createdItems = []
	
	if(generatedloot.has("items")):
		for generatedItemData in generatedloot["items"]:
			var generatedItem = GlobalRegistry.createItem(generatedItemData[0])
			if(generatedItemData[1] > 1):
				generatedItem.setAmount(generatedItemData[1])
			createdItems.append(generatedItem)
			
	generatedloot["items"] = createdItems
	return generatedloot
