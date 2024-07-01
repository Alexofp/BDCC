extends ItemBase

var whoGaveBirth = ""

func _init():
	id = "PlantEgg"

func getVisibleName():
	return "Plant Egg"
	
func getDescription():
	var byWho = ""
	if(whoGaveBirth != ""):
		var theChar = GlobalRegistry.getCharacter(whoGaveBirth)
		if(theChar == null):
			byWho = "\nThis egg was laid by someone unknown.."
		elif(whoGaveBirth == "pc"):
			byWho = "\nThis egg was laid by you!"
		else:
			byWho = "\nThis egg was laid by "+str(theChar.getName())
	
	return "A very nutrious seed with an incredibly sweet taste. Eating it will remove 50 pain and add 50 stamina.. but also add 20 lust."+byWho

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	_attacker.addPain(-50)
	_attacker.addStamina(50)
	_attacker.addLust(20)
	removeXOrDestroy(1)
	return _attacker.getName() + " ate a plant egg! Very crunchy.."

func getPossibleActions():
	return [
		{
			"name": "Eat one!",
			"scene": "UseItemLikeInCombatScene",
			"description": "Eat the egg",
		},
	]

func getPrice():
	return 0

func canSell():
	return true

func canCombine():
	return true

func tryCombine(_otherItem):
	if(whoGaveBirth != _otherItem.whoGaveBirth):
		return false
	return .tryCombine(_otherItem)

func getTags():
	return []

func getItemCategory():
	return ItemCategory.Medical

func saveData():
	var data = .saveData()
	
	data["whoGaveBirth"] = whoGaveBirth
	
	return data
	
func loadData(data):
	.loadData(data)
	
	whoGaveBirth = SAVE.loadVar(data, "whoGaveBirth", "")
	
func getInventoryImage():
	return "res://Images/Items/medical/pkantegg.png"
