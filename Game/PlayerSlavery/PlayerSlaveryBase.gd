extends Reference
class_name PlayerSlaveryBase

# Contains the actual logic/data. This class only gets created when the slavery starts

var id:String = ""

func onSlaveryStart():
	pass

# Gets called after onSlaveryStart()
func getStartScene() -> String:
	return ""

func saveData() -> Dictionary:
	return {}

func loadData(_data:Dictionary):
	pass
