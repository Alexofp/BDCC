extends Reference
class_name LootTableBase

var loot = []
var minCredits = 0
var maxCredits = 0
var creditsChance = 100

func generateCredits():
	if(!RNG.chance(creditsChance)):
		return 0
	return RNG.randi_range(minCredits, maxCredits)

func getPossibleLoot():
	return loot

func generate():
	var items = []
	
	for lootLine in getPossibleLoot():
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
