extends ItemBase

var isLegal = false

func _init():
	id = "appleitem"

# apple is illegal only temporally as a test item
func getVisibleName():
	if(isLegal):
		return "Tasty Apple"
	return "Stolen Apple"
	
func getDescription():
	if(isLegal):
		return "Tasty looking apple. Will remove 30 pain and give 30 stamina. This one has a special sticker that makes it legal for inmates to have!"
	return "Tasty looking apple. Will remove 30 pain and give 30 stamina"

func setIsLegal(legal):
	isLegal = legal

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	_attacker.addPain(-30)
	_attacker.addStamina(30)
	removeXOrDestroy(1)
	return _attacker.getName() + " ate an apple"

func getPossibleActions():
	return [
		{
			"name": "Eat one!",
			"scene": "UseItemLikeInCombatScene",
			"description": "Eat the apple",
		},
	]

func getPrice():
	return 0

func canSell():
	return true

func canCombine():
	return true

func tryCombine(_otherItem):
	if(isLegal != _otherItem.isLegal):
		return false
	amount += _otherItem.amount
	return true

func getTags():
	if(isLegal):
		return []
	return [ItemTag.Illegal]

func getItemCategory():
	return ItemCategory.Medical

func saveData():
	var data = .saveData()
	
	data["isLegal"] = isLegal
	
	return data
	
func loadData(data):
	.loadData(data)
	
	isLegal = SAVE.loadVar(data, "isLegal", false)

func getInventoryImage():
	return "res://Images/Items/medical/apple.png"
