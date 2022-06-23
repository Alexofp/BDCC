extends ItemState
class_name PantiesState

var shiftedAside = false

func arePantiesShiftedAside():
	return shiftedAside

func shiftPantiesAside():
	shiftedAside = true

func getActions():
	return [
		"MovePantiesAside",
	]

func resetState():
	shiftedAside = false

func saveData():
	var data = {}
	
	data["shiftedAside"] = shiftedAside

	return data
	
func loadData(_data):
	shiftedAside = SAVE.loadVar(_data, "shiftedAside", false)

func coversBodyparts():
	var result = []
	if(!shiftedAside):
		result.append(BodypartSlot.Vagina)
		result.append(BodypartSlot.Penis)
		result.append(BodypartSlot.Anus)
	
	return result

func getStateText():
	var text = ""
	if(shiftedAside):
		text += "Panties are shifted aside. "
	return text
