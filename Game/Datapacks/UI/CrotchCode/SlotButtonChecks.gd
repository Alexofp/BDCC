extends Reference
class_name CrotchSlotButtonChecks

var checks = []

signal onChecksChanged(checks)

func setChecks(newChecks):
	checks = newChecks
	emit_signal("onChecksChanged", checks)

func getValue(_contex:CodeContex):
	return false

func getFinalChecks():
	var result = []
	
	for check in checks:
		var finalCheck = [check["type"]]
		
		var editVars = ButtonChecks.getEditVars(check["type"])
		var ourVars = check["data"] if check.has("data") else {}
		
		for editVar in editVars:
			finalCheck.append(editVars[editVar]["value"] if !ourVars.has(editVar) else ourVars[editVar])
		
		result.append(finalCheck)
	return result

func calcLineNums(_contex:CodeContex):
	pass

func saveData():
	var data = {}
	
	data["checks"] = checks
	
	return data

func loadData(_data):
	checks = loadVar(_data, "checks", [])
	
func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue
