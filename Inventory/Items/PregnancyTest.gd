extends ItemBase

func _init():
	id = "PregnancyTest"

func getVisibleName():
	return "Pregnancy test"
	
func getDescription():
	return "Tests if you are pregnant. The package claims that it has 0.01% chance of false-positives."

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	removeXOrDestroy(1)
	
	var text = "You follow the intruction on how to use the test and then wait for an answer..\n\n"
	
	if(_attacker.isPregnant()):
		text += "The little screen shows [b]two black lines[/b]."
	else:
		text += "The little screen shows [b]one black line[/b]. Phew."
	
	return text

func getPossibleActions():
	return [
		{
			"name": "Use",
			"scene": "UseItemLikeInCombatScene",
			"description": "Use the test",
		},
	]

func getPrice():
	return 1

func canSell():
	return true

func canCombine():
	return true

func getTags():
	return [
		ItemTag.SoldByMedicalVendomat,
		]

func getBuyAmount():
	return 3

func getItemCategory():
	return ItemCategory.Medical

func getInventoryImage():
	return "res://Images/Items/medical/pregnancy-test.png"
