extends Reference
class_name SensitiveZone

var sensitivity:float = 1.0

var stimulation:float = 0.0
var overstimulation:float = 0.0


var extraSensitivity:float = 0.0
var orgasmModTimer:float = 0.0


var sensitivityGainModifier:float = 0.01
var overstimSensLoseModifier:float = 1.0
var stimulationGainModifier:float = 1.0
var extraSensGainModifier:float = 1.0

var arousalGainModifier:float = 1.0
var lowSensitivityRestoreRate:float = 0.05 # per day

var bodypart: WeakRef = null

var zoneName:String = "FILL ME"
var zoneNameIs:String = "is"

func getName() -> String:
	return zoneName

func getNameIs() -> String:
	return getName()+" "+zoneNameIs

func setBodypart(theBodypart):
	bodypart = weakref(theBodypart)

func getBodypart():
	if(bodypart == null):
		return null
	return bodypart.get_ref()

func getCharacter():
	var thebodypart = getBodypart()
	if(thebodypart == null):
		return null
	return thebodypart.getCharacter()

func getSensitivityGainModifier() -> float:
	return sensitivityGainModifier

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
	
	stimulation += _howMuch / sqrt(1.0 + abs(2.0 - 2.0*sensitivity)) * 0.1 * stimulationGainModifier
	if(stimulation > 1.0 && stimulation > overstimulation):
		overstimulation = max(overstimulation, stimulation)
		stimulation = 0.0
	
	if(isOverstimulated()):
		sensitivity -= _howMuch * 0.05 * sensitivity * overstimSensLoseModifier
		if(sensitivity < 0.1):
			sensitivity = 0.1
	elif(sensitivity > 0.9):
		var toAdd:float = pow(_howMuch * getSensitivityGainModifier(), min(0.8+sensitivity/20.0, 0.9)) #1.0/sensitivity
		#print("GAINED SENS: "+str(toAdd))
		sensitivity += toAdd

func onDenyTick():
	extraSensitivity += 0.01 / (1.0 + extraSensitivity) * extraSensGainModifier

func onOrgasm():
	extraSensitivity = 0.0
	orgasmModTimer = 1.0

func processTime(_seconds:int):
	var partOfMinute:float = float(_seconds) / 60.0
	
	stimulation -= 0.02 * partOfMinute * stimulationGainModifier
	if(stimulation < 0.0):
		stimulation = 0.0
	overstimulation -= 0.3 * partOfMinute
	if(overstimulation < 0.0):
		overstimulation = 0.0
	
	if(orgasmModTimer > 0.0):
		orgasmModTimer -= partOfMinute * 0.2
		if(orgasmModTimer < 0.0):
			orgasmModTimer = 0.0
	
#	if(sensitivity < 1.0):
#		var partOfDay:float = float(_seconds) / 86400.0 # seconds in a day
#
#		sensitivity += partOfDay * lowSensitivityRestoreRate
#		if(sensitivity > 1.0):
#			sensitivity = 1.0
	pass

func processSexTurn():
	pass

func hoursPassed(_hours:int):
	if(sensitivity < 1.0):
		var partOfDay:float = float(_hours) / 24.0
		
		sensitivity += partOfDay * lowSensitivityRestoreRate
		if(sensitivity > 1.0):
			sensitivity = 1.0
	
	if(extraSensitivity > 0.0):
		extraSensitivity -= 0.004 * _hours
		
		if(extraSensitivity < 0.0):
			extraSensitivity = 0.0

func getInfo() -> Array:
	var result:= []
	
	result.append("Name: "+getName())
	result.append("Sensitivity: "+str(getSensitivity()))
	result.append("Raw sensitivity: "+str(getRawSensitivity()))
	result.append("Stimulation: "+str(stimulation))
	result.append("Overstimulation: "+str(overstimulation))
	
	return result

func getInfoString() -> String:
	return Util.join(getInfo(), "\n")
