extends ItemBase

var size = 10

func _init():
	id = "vaginalplug"

func getVisibleName():
	return "Vaginal plug"
	
func getDescription():
	return "A classic plug made out of black silicon, this one has a length of "+str(size)+"cm and also features a vibro-motor inside"

func getClothingSlot():
	return InventorySlot.Vagina

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
	restraintData = RestraintVaginalplug.new()
	restraintData.setLevel(calculateBestRestraintLevel())

func getTakingOffStringLong(withS):
	if(withS):
		return "slides the vaginal plug out from your pussy"
	else:
		return "slide the vaginal plug out from your pussy"

func getPuttingOnStringLong(withS):
	if(withS):
		return "inserts the vaginal plug into your pussy"
	else:
		return "insert the vaginal plug into your pussy"
