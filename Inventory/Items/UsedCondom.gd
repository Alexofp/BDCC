extends ItemBase

var breakChance = 20

func _init():
	id = "UsedCondom"

func getVisibleName():
	return "Used condom"
	
func getDescription():
	return "A condom that was used."

func getClothingSlot():
	return InventorySlot.Penis

func getBuffs():
	return [
		]

func getCondomBreakChance():
	if(!OPTIONS.isContentEnabled(ContentType.RiskyCondoms)):
		return 0.0
	
	return breakChance

func saveData():
	var data = .saveData()
	
	data["breakChance"] = breakChance
	
	return data
	
func loadData(data):
	.loadData(data)
	
	breakChance = SAVE.loadVar(data, "breakChance", 20)

func onSexEnd():
	destroyMe()
