extends ItemBase

var prisonerNumber = ""

func _init():
	id = "inmateuniform_general"

func getVisibleName():
	return "General inmate uniform"
	
func setPrisonerNumber(newnumber):
	prisonerNumber = newnumber
	
func getDescription():
	var text = "A short sleeved shirt and some shorts, both are made out of black cloth with an orange trim to it."

	if(prisonerNumber != null && prisonerNumber != ""):
		text += " The shirt has a prisoner number attached to it that says \""+prisonerNumber+"\""
	
	return text

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		]

func saveData():
	var data = .saveData()
	
	data["prisonerNumber"] = prisonerNumber
	
	return data
	
func loadData(data):
	.loadData(data)
	
	prisonerNumber = SAVE.loadVar(data, "prisonerNumber", "")

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your inmate shirt and pulls down the shorts"
	else:
		return "take off your inmate shirt and pull down the shorts"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your inmate shirt and the shorts"
	else:
		return "put on your inmate shirt and the shorts"
