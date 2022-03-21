extends ItemBase

var locked = true

func _init():
	id = "ballgag"

func getVisibleName():
	if(!locked):
		return "Ball Gag (Unlocked)"
	
	return "Ball Gag"
	
func getDescription():
	return "Can be used to gag those cheeky brats"

func getClothingSlot():
	return InventorySlot.Mouth

func getBuffs():
	return [
		buff(Buff.GagBuff),
		buff(Buff.AmbientLustBuff, [10]),
		]

func unlock():
	locked = false

func getTakeOffScene():
	if(locked):
		return "GagTuggingScene"
	else:
		return .getTakeOffScene()

func saveData():
	var data = .saveData()
	
	data["locked"] = locked
	
	return data
	
func loadData(data):
	.loadData(data)
	
	locked = SAVE.loadVar(data, "locked", true)

func getPrice():
	return 0

func canSell():
	return true

func getTags():
	return [ItemTag.BDSMRestraint]

func isRestraint():
	return true
