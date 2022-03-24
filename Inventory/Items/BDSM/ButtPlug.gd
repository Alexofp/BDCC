extends ItemBase

var size = 10

func _init():
	id = "buttplug"

func getVisibleName():
	return "Buttplug"
	
func getDescription():
	return "A classic plug made out of black silicon, this one has a length of "+str(size)+"cm"

func getClothingSlot():
	return InventorySlot.Anal

func getBuffs():
	return [
		buff(Buff.AmbientLustBuff, [10]),
		]

func saveData():
	var data = .saveData()
	
	data["size"] = size
	
	return data
	
func loadData(data):
	.loadData(data)
	
	size = SAVE.loadVar(data, "size", 10)

func getPrice():
	return 0

func canSell():
	return true

func getTags():
	return []#[ItemTag.BDSMRestraint]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintButtplug.new()
	restraintData.setLevel(calculateBestRestraintLevel())

func getTakingOffStringLong(withS):
	if(withS):
		return "pulls the buttplug out from your butt"
	else:
		return "pull the buttplug out from your butt"

func getPuttingOnStringLong(withS):
	if(withS):
		return "inserts the buttplug into your butt"
	else:
		return "insert the buttplug into your butt"
