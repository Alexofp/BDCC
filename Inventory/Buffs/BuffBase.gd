extends Reference
class_name BuffBase

var id = "badbuff"

func _init():
	pass

func initBuff(_args):
	pass

func getVisibleDescription():
	return "Please change me"

func apply(_buffHolder):
	pass

func getBuffColor():
	return Color.white

func getVisibleDescriptionColored():
	return "[color=#"+getBuffColor().to_html(false)+"]" + getVisibleDescription() + "[/color]"

func saveData():
	var data = {}

	return data
	
func loadData(_data):
	pass

func canCombine(_otherBuff):
	return true

func combine(_otherBuff):
	pass
