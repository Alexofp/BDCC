extends ItemBase

var prisonerNumber = ""
var inmateType = InmateType.General

func _init():
	id = "inmateuniform"

func getVisibleName():
	return InmateType.getOfficialName(inmateType).capitalize() + " inmate uniform"
	
func setPrisonerNumber(newnumber):
	prisonerNumber = newnumber
	
func setInmateType(newtype):
	inmateType = newtype
	
func getDescription():
	var text = "A short sleeved shirt and some shorts, both are made out of black cloth with "+InmateType.getColorName(inmateType)+" trim."

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
	data["inmateType"] = inmateType
	
	return data
	
func loadData(data):
	.loadData(data)
	
	prisonerNumber = SAVE.loadVar(data, "prisonerNumber", "")
	inmateType = SAVE.loadVar(data, "inmateType", InmateType.General)

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

func coversBodyparts():
	return [BodypartSlot.Body, BodypartSlot.Breasts, BodypartSlot.Vagina, BodypartSlot.Penis, BodypartSlot.Anus]
