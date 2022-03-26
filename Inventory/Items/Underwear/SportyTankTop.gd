extends ItemBase

func _init():
	id = "sportyTankTop"

func getVisibleName():
	return "Sporty Tank Top"
	
func getDescription():
	var text = "A cotton tank top, perfect to wear during exercises."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearTop

func getBuffs():
	return [
		buff(Buff.PhysicalArmorBuff, [5]),
		buff(Buff.MaxStaminaBuff, [5]),
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your sporty tank top"
	else:
		return "take off your sporty tank top"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the sporty tank top"
	else:
		return "put on the sporty tank top"

func coversBodyparts():
	return [BodypartSlot.Breasts]
