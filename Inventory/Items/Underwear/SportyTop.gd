extends ItemBase

func _init():
	id = "sportyTop"

func getVisibleName():
	return "Sporty Top"
	
func getDescription():
	var text = "A cotton top designed to give breasts support during exercises."

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
		return "takes off your sporty top"
	else:
		return "take off your sporty top"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the sporty top"
	else:
		return "put on the sporty top"

func coversBodyparts():
	return [BodypartSlot.Breasts]
