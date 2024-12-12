extends Reference
class_name SensitiveZone

var sensitivity:float = 1.0

var stimulation:float = 0.0
var overstimulation:float = 0.0


var extraSensitivity:float = 0.0
var orgasmModTimer:float = 0.0


var sensitivityGainModifier:float = 0.001

var arousalGainModifier:float = 1.0
const LowSensitivityRestoreRate = 0.05 # per day

func getName() -> String:
	return "FILL ME"

func getSensitivity() -> float:
	return sensitivity + extraSensitivity

func getArousalGainModifier() -> float:
	return getSensitivity() * arousalGainModifier

func getRawSensitivity() -> float:
	return sensitivity

func isOverstimulated() -> bool:
	return overstimulation > 0.0

func stimulate(_howMuch:float = 1.0):
	if(orgasmModTimer > 0.0): # High sensitivity right after orgasm
		_howMuch *= (orgasmModTimer*3.0+1.0)
	
	stimulation += _howMuch / sqrt(sensitivity) * 0.2
	if(stimulation > 1.0):
		overstimulation = max(overstimulation, stimulation)
	
	if(isOverstimulated()):
		sensitivity -= _howMuch * 0.005
		if(sensitivity < 0.1):
			sensitivity = 0.1
	elif(sensitivity > 0.9):
		sensitivity += pow(_howMuch * sensitivityGainModifier, 1.0/sensitivity)

func onDenyTick():
	extraSensitivity += 0.01 / (1.0 + extraSensitivity)

func onOrgasm():
	extraSensitivity = 0.0
	orgasmModTimer = 1.0

func processTime(_seconds:int):
	var partOfMinute:float = float(_seconds) / 60.0
	
	stimulation -= 0.1 * partOfMinute
	if(stimulation < 0.0):
		stimulation = 0.0
	
	if(orgasmModTimer > 0.0):
		orgasmModTimer -= partOfMinute * 0.4
		if(orgasmModTimer < 0.0):
			orgasmModTimer = 0.0
	
#	if(sensitivity < 1.0):
#		var partOfDay:float = float(_seconds) / 86400.0 # seconds in a day
#
#		sensitivity += partOfDay * LowSensitivityRestoreRate
#		if(sensitivity > 1.0):
#			sensitivity = 1.0
	pass

func processSexTurn():
	pass

func hoursPassed(_hours:int):
	if(sensitivity < 1.0):
		var partOfDay:float = float(_hours) / 24.0
		
		sensitivity += partOfDay * LowSensitivityRestoreRate
		if(sensitivity > 1.0):
			sensitivity = 1.0
	
	if(extraSensitivity > 0.0):
		extraSensitivity -= 0.004 * _hours
		
		if(extraSensitivity < 0.0):
			extraSensitivity = 0.0

func getInfo():
	var result:= []
	
	result.append("Name: "+getName())
	result.append("Sensitivity: "+str(getSensitivity()))
	result.append("Raw sensitivity: "+str(getRawSensitivity()))
	result.append("Stimulation: "+str(stimulation))
	result.append("Overstimulation: "+str(overstimulation))
	
	return result
