extends ItemState
class_name PantiesState

var shiftedAside = false
var casualName = "panties"
var canShiftAside = true

func arePantiesShiftedAside():
	return shiftedAside

func shiftPantiesAside():
	shiftedAside = true
	removed = false

func getActions():
	if(canShiftAside):
		return [
			"PantiesMoveAside",
			"PantiesShakeOff",
		]
	else:
		return [
			"PantiesShakeOff",
			"PantiesPullDown",
		]

func resetState():
	.resetState()
	shiftedAside = false

func saveData():
	var data = .saveData()
	
	data["shiftedAside"] = shiftedAside
	data["removed"] = removed
	data["casualName"] = casualName
	data["canShiftAside"] = canShiftAside

	return data
	
func loadData(_data):
	.loadData(_data)
	shiftedAside = SAVE.loadVar(_data, "shiftedAside", false)
	removed = SAVE.loadVar(_data, "removed", false)
	casualName = SAVE.loadVar(_data, "casualName", "panties")
	canShiftAside = SAVE.loadVar(_data, "canShiftAside", true)

func coversBodyparts():
	if(removed || shiftedAside):
		return []
	
	return [BodypartSlot.Vagina, BodypartSlot.Penis, BodypartSlot.Anus]

func getStateText():
	var text = ""
	if(shiftedAside):
		text += casualName.capitalize()+" are shifted aside. "
	if(removed):
		text = casualName.capitalize()+" are pulled down. "
	return text
