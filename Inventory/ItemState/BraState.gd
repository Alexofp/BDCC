extends ItemState
class_name BraState

var pulledUp = false
var casualName = "bra"

func isBraPulledUp():
	return pulledUp

func pullBraUp():
	pulledUp = true
	removed = false

func getActions():
	return [
		"BraPullUp",
		"BraShakeOff",
	]

func resetState():
	.resetState()
	pulledUp = false

func saveData():
	var data = .saveData()
	
	data["pulledUp"] = pulledUp
	data["casualName"] = casualName

	return data
	
func loadData(_data):
	.loadData(_data)
	pulledUp = SAVE.loadVar(_data, "pulledUp", false)
	casualName = SAVE.loadVar(_data, "casualName", "bra")

func coversBodyparts():
	if(removed || pulledUp):
		return []
	
	return [BodypartSlot.Breasts]

func getStateText():
	var text = ""
	if(pulledUp):
		text += casualName.capitalize()+" is pulled up. "
	if(removed):
		text = casualName.capitalize()+" is removed. "
	return text
