extends ItemBase

var egg:EggLaid = EggLaid.new()

func _init():
	id = "EggGeneric"

func getVisibleName():
	return egg.getName()

func setEggLaid(_egg:EggLaid):
	egg = _egg

func isOffspringEgg() -> bool:
	if(egg):
		return egg.isOffspringEgg()
	return false

func getDescription():
	if(!egg):
		return ""
	return egg.getEggDescription()

func canUseInCombat():
	return false

#func useInCombat(_attacker, _receiver):
#	_attacker.addPain(-50)
#	_attacker.addStamina(50)
#	_attacker.addLust(20)
#	removeXOrDestroy(1)
#	return _attacker.getName() + " ate a plant egg! Very crunchy.."

func getPossibleActions():
	return [
#		{
#			"name": "Eat one!",
#			"scene": "UseItemLikeInCombatScene",
#			"description": "Eat the egg",
#		},
	]

func getPrice():
	if(egg):
		return egg.getEggSellPrice()
	return 0

func getSellPrice():
	if(egg):
		return egg.getEggSellPrice()
	return 0

func canSell():
	if(egg):
		return egg.canSellEgg()
	return false

func canCombine():
	if(egg.data.empty()):
		return true
	
	return false
#
#func tryCombine(_otherItem):
#	if(whoGaveBirth != _otherItem.whoGaveBirth):
#		return false
#	return .tryCombine(_otherItem)

func getTags():
	return []

func getItemCategory():
	return ItemCategory.Generic

func createEggCellForOviposition() -> EggCell:
	var theEggCell := egg.createEggCell()
	if(theEggCell):
		if(theEggCell.isImpregnated()):
			theEggCell.progress = 0.5 # Half of the normal pregnancy
		else:
			theEggCell.lifeSpan = Util.maxi(theEggCell.lifeSpan, 6*60*60) # 6 hours at least
	return theEggCell

func saveData():
	var data = .saveData()
	
	data["egg"] = egg.saveData()
	
	return data
	
func loadData(data):
	.loadData(data)
	
	egg = EggLaid.new()
	egg.loadData(SAVE.loadVar(data, "egg", {}))
	
func getInventoryImage():
	if(egg):
		return egg.getEggItemImagePath()
	return "res://Images/Items/medical/pkantegg.png"

func getInventoryImageColor():
	if(egg):
		return egg.getEggItemColor()
	return Color.white
