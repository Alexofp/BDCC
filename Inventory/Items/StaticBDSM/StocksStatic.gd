extends ItemBase

func _init():
	id = "StocksStatic"

func getVisibleName():
	return "Stocks"
	
func getDescription():
	return "You're stuck in these"

func getClothingSlot():
	return InventorySlot.Static1

func getBuffs():
	return [
		buff(Buff.RestrainedArmsBuff),
		buff(Buff.RestEffectivenessBuff, [-60]),
		]

func getTakeOffScene():
	return "RestraintTakeOffNopeScene"

func getTags():
	return [ItemTag.BDSMRestraint]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintStocks.new()
	restraintData.setLevel(5)
