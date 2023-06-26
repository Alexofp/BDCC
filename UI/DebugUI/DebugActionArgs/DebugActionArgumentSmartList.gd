extends HBoxContainer

var id

var allValues = {}
var categories = []
var myvalues = []
var defaultValue

func setArgs(_args):
	if("value" in _args):
		defaultValue = _args["value"]
	if("name" in _args):
		$Label.text = _args["name"]
#	if("values" in _args):
#		myvalues = _args["values"]
#		var i = 0
#		for valueData in myvalues:
#			$OptionButton.add_item(valueData[1])
#			if(valueData[0] == defaultValue):
#				$OptionButton.select(i)
#			i += 1
#	if("npc" in _args && _args["npc"]):
#		for npcID in GlobalRegistry.getCharacters():
#			myvalues.append([npcID, npcID])
#			$OptionButton.add_item(npcID)
	if("item" in _args && _args["item"]):
		var itemRefs = GlobalRegistry.getItemRefs()
		for itemID in itemRefs:
			var item:ItemBase = itemRefs[itemID]
			var category = item.getItemCategory()
			
			if(!allValues.has(category)):
				allValues[category] = []
				$VBoxContainer/OptionButton.add_item(category)
				categories.append(category)
			
			allValues[category].append(itemID)
		_on_OptionButton_item_selected(0)
	if("npc" in _args && _args["npc"]):
		var theValue = ""
		if("value" in _args):
			theValue = _args["value"]
		for npcID in (GlobalRegistry.getCharacters().keys()+["pc"]):
			var theNpc = GlobalRegistry.getCharacter(npcID)
			var npcType = theNpc.getCharacterType()
			
			if(!allValues.has(npcType)):
				allValues[npcType] = []
				$VBoxContainer/OptionButton.add_item(npcType)
				categories.append(npcType)
			
			allValues[npcType].append(npcID)
			#myvalues.append([itemID, itemID])
		if(theValue == ""):
			_on_OptionButton_item_selected(0)
		else:
			var currentCategoryI = 0
			while(currentCategoryI < categories.size()):
				var categ = categories[currentCategoryI]
				var currentItemI = 0
				while(currentItemI < allValues[categ].size()):
					if(allValues[categ][currentItemI] == theValue):
						$VBoxContainer/OptionButton.select(currentCategoryI)
						_on_OptionButton_item_selected(currentCategoryI)
						$VBoxContainer/ItemList.select(currentItemI)
						return
					currentItemI += 1
				
				currentCategoryI += 1
			
#	if("skill" in _args && _args["skill"]):
#		for thingID in GlobalRegistry.getSkills():
#			myvalues.append([thingID, thingID])
#			$OptionButton.add_item(thingID)

func getResult():
	if($VBoxContainer/ItemList.get_selected_items().size() == 0):
		return null
	if($VBoxContainer/ItemList.get_selected_items()[0] >= myvalues.size()):
		return null
	
	return myvalues[$VBoxContainer/ItemList.get_selected_items()[0]]


func _on_OptionButton_item_selected(index):
	if(index >= categories.size()):
		return
	
	var newCategory = categories[index]
	myvalues = allValues[newCategory]
	$VBoxContainer/ItemList.clear()
	
	for itemID in allValues[newCategory]:
		$VBoxContainer/ItemList.add_item(itemID)
		
