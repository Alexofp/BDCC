extends ItemBase

func _init():
	id = "plainBriefs"

func getVisibleName():
	return "Briefs"
	
func getDescription():
	var text = "Boring but otherwise quite comfy briefs."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "slips down your briefs"
	else:
		return "slip down your briefs"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the briefs"
	else:
		return "put on the briefs"

func coversBodyparts():
	return [BodypartSlot.Vagina, BodypartSlot.Penis, BodypartSlot.Anus]
