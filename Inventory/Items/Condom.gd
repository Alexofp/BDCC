extends ItemBase


func _init():
	id = "Condom"

func getVisibleName():
	return "Condom"
	
func getDescription():
	return "Gets sold as a pack of 10! Good against unwanted pregnancies, most of the time.\n\nSmall text on the package says that every tenth one is replaced with a balloon for all your entertaiment needs."

func getPrice():
	return 1

func canSell():
	return true

func canCombine():
	return true

func getBuyAmount():
	return 10

func getTags():
	return [
		ItemTag.Condom,
		ItemTag.SoldByGeneralVendomat,
		]

func getCondomBreakChance():
	if(!OPTIONS.isContentEnabled(ContentType.RiskyCondoms)):
		return 0.0
	
	return 20.0

func getItemCategory():
	return ItemCategory.Medical

func useInCombat(_attacker, _receiver):
	removeXOrDestroy(1)
	
	_attacker.getInventory().addItem(GlobalRegistry.createItem("UsedCondom"))
	
	return _attacker.getName() + " takes one of the condoms out of its package and then stretches it with "+_attacker.hisHer()+" fingers."

func getPossibleActions():
	return [
		{
			"name": "Stretch one",
			"scene": "UseItemLikeInCombatScene",
			"description": "Turn one of the condoms into a used one",
		},
	]

func getInventoryImage():
	return "res://Images/Items/medical/condom.png"
