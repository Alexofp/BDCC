extends HBoxContainer

var id

var myvalues = []
var defaultValue

func setArgs(_args):
	if("value" in _args):
		defaultValue = _args["value"]
	if("name" in _args):
		$Label.text = _args["name"]
	if("values" in _args):
		myvalues = _args["values"]
		var i = 0
		for valueData in myvalues:
			$OptionButton.add_item(valueData[1])
			if(valueData[0] == defaultValue):
				$OptionButton.select(i)
			i += 1
	if("npc" in _args && _args["npc"]):
		for npcID in GlobalRegistry.getCharacters():
			myvalues.append([npcID, npcID])
			$OptionButton.add_item(npcID)
	if("item" in _args && _args["item"]):
		for itemID in GlobalRegistry.getItemRefs():
			myvalues.append([itemID, itemID])
			$OptionButton.add_item(itemID)
	if("skill" in _args && _args["skill"]):
		for thingID in GlobalRegistry.getSkills():
			myvalues.append([thingID, thingID])
			$OptionButton.add_item(thingID)

func getResult():
	if($OptionButton.get_selected_id() >= myvalues.size()):
		return null
	
	return myvalues[$OptionButton.get_selected_id()][0]
