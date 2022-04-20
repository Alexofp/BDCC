extends ItemBase

var something = "blah"

func _init():
	id = "testitem"

func getVisibleName():
	return "Test item"
	
func getDescription():
	return "Heals you or something"

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	_attacker.addPain(-100)
	destroyMe()
	return _attacker.getName() + " drank a potion"+something

func getPossibleActions():
	return [
		{
			"name": "Eat it!",
			"scene": "UseItemLikeInCombatScene",
			"description": "Eat the thing",
		},
		{
			"name": "Use",
			"scene": "TestScene",
			"description": "Use the thing",
		},
	]

func saveData():
	var data = .saveData()
	
	data["something"] = something
	
	return data
	
func loadData(data):
	.loadData(data)
	
	something = SAVE.loadVar(data, "something", "")

func getPrice():
	return 20

func canSell():
	return true
