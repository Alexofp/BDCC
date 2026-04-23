extends ItemBase

var whoGaveBirth:String = ""

func _init():
	id = "LatexEgg"

func getVisibleName():
	return "Latex Egg"
	
func getDescription():
	var byWho = ""
	if(whoGaveBirth != ""):
		var theChar = GlobalRegistry.getCharacter(whoGaveBirth)
		if(theChar == null):
			byWho = "\n\nThis egg was laid by someone unknown.."
		elif(whoGaveBirth == "pc"):
			byWho = "\n\nThis egg was laid by you!"
		else:
			byWho = "\n\nThis egg was laid by "+str(theChar.getName())
	
	return "Some weird egg. It probably doesn't have any uses."+byWho

func canUseInCombat():
	return false

func useInCombat(_attacker, _receiver):
	_attacker.addPain(-50)
	_attacker.addStamina(50)
	_attacker.addLust(20)
	removeXOrDestroy(1)
	return _attacker.getName() + " ate a plant egg! Very crunchy.."

func getPossibleActions():
	return [
#		{
#			"name": "Eat one!",
#			"scene": "UseItemLikeInCombatScene",
#			"description": "Eat the egg",
#		},
	]

func getPrice():
	return 10

func canSell():
	return true

func canCombine():
	return false

func tryCombine(_otherItem):
	if(whoGaveBirth != _otherItem.whoGaveBirth):
		return false
	return .tryCombine(_otherItem)

func getTags():
	return []

func getItemCategory():
	return ItemCategory.Medical

func createEggCellForOviposition() -> EggCell:
	var newEggCell := EggCell.new()
	newEggCell.lifeSpan = 12*60*60 # 12 hours before having to lay it
	newEggCell.bigEggType = BigEggType.Latex
	newEggCell.bigEgg = true
	return newEggCell

func saveData():
	var data = .saveData()
	
	data["whoGaveBirth"] = whoGaveBirth
	
	return data
	
func loadData(data):
	.loadData(data)
	
	whoGaveBirth = SAVE.loadVar(data, "whoGaveBirth", "")
	
func getInventoryImage():
	return "res://Images/Items/medical/egg-latex.png"
