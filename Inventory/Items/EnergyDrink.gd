extends ItemBase

func _init():
	id = "EnergyDrink"

func getVisibleName():
	return "Energy drink"
	
func getDescription():
	return "A soda can with the 'Space cola' brand. Reduces drowsiness and gives you energy! +100 stamina on use"

func getA():
	return "an"

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
	_attacker.updateNonBattleEffects()
	_attacker.addStamina(100)
	removeXOrDestroy(1)
	return _attacker.getName() + " opened the soda can with a satisfied click and drank it's contents!"

func getPossibleActions():
	return [
		{
			"name": "Consume",
			"scene": "UseItemLikeInCombatScene",
			"description": "Drink it!",
		},
	]

func getPrice():
	return 2

func canSell():
	return true

func canCombine():
	return true

func addsIntoxication():
	return 0.3

func getTimedBuffs():
	return [
		#buff(Buff.ExposureBuff, [100])
	]

func getBuffsDurationSeconds():
	return 60*60*2

func getTimedBuffsTurns():
	return [
		buff(Buff.MaxStaminaBuff, [40]),
	]

func getBuffsDurationTurns():
	return 5

func getTags():
	return [
		ItemTag.SoldByGeneralVendomat,
		]

func getItemCategory():
	return ItemCategory.Medical

func getInventoryImage():
	return "res://Images/Items/medical/energy-drink.png"
