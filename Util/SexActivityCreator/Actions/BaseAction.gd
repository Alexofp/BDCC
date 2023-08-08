extends Reference

var id = "error"

func getName():
	return "Error"

func getVisibleText():
	return generateCode()

func getArgs():
	return null

func applyArgs(_data):
	pass

func generateCode():
	return ""

func preChangeFlow():
	return 0

func changesFlow():
	return 0

func isAction():
	return true

func isCondition():
	return false

func saveData():
	pass

func loadData(_data):
	pass

func processString(line):
	line = line.replace("\"", "'")
	line = line.replace("{{", '"+str(')
	line = line.replace("}}", ')+"')
	return line

func processStringArray(ar):
	var newAr = []
	for theString in ar:
		newAr.append(processString(theString))
	return newAr

func shouldAddDomSubReactions():
	return false
