extends Reference
class_name SensitiveZone

var sensitivity:float = 1.0

var stimulation:float = 0.0
var overstimulation:float = 0.0

var extraSensitivity:float = 0.0
var orgasmModTimer:float = 0.0


var bodypart: WeakRef = null

var zoneName:String = "FILL ME"
var zoneNameIs:String = "is"

func getArousalGainModifier() -> float:
	return getSensitivity()

func getSensitivityGainModifier() -> float:
	return 1.0

func getOverstimSensLoseModifier() -> float:
	return 1.0

func getStimulationGainModifier() -> float:
	return 1.0

func getExtraSensGainModifier() -> float:
	return 1.0

func getOverstimRecoverModifier() -> float:
	return 1.0

func getLowSensitivityRestoreRate() -> float:
	return 0.4 # Per day

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

func getCustomAttribute(id, default=0.0)->float:
	var theChar = getCharacter()
	if(theChar == null):
		return default
	return theChar.getCustomAttribute(id)

func getSensitivity() -> float:
	return sensitivity + extraSensitivity

func canOrgasm() -> bool:
	return getArousalGainModifier() >= 0.7

func getRawSensitivity() -> float:
	return sensitivity

func isOverstimulated() -> bool:
	return overstimulation > 0.0

func isVisiblyOverstimulated() -> bool: # Controls the status effect
	return overstimulation > 0.0

func getOverstimulation() -> float:
	return overstimulation

func onOverstimulation():
	overstimulation = max(overstimulation, stimulation)
	stimulation = 0.0

func stimulate(_howMuch:float = 1.0):
	if(orgasmModTimer > 0.0): # High sensitivity right after orgasm
		_howMuch *= (orgasmModTimer*3.0+1.0)
	
	stimulation += _howMuch / sqrt(1.0 + abs(0.5 - 0.5*sensitivity)) * 0.1 * getStimulationGainModifier()
	if(stimulation > 1.0 && stimulation > overstimulation):
		onOverstimulation()
	
	if(isOverstimulated()):
		sensitivity -= _howMuch * 0.05 * sensitivity * getOverstimSensLoseModifier()
		if(sensitivity < 0.1):
			sensitivity = 0.1
	elif(sensitivity > 0.9):
		var toAdd:float = pow(_howMuch * getSensitivityGainModifier() * 0.01, min(0.8+sensitivity/20.0, 0.9)) #1.0/sensitivity
		#print("GAINED SENS: "+str(toAdd))
		sensitivity += toAdd

func onDenyTick():
	extraSensitivity += 0.01 / (1.0 + extraSensitivity) * getExtraSensGainModifier()

func onOrgasm():
	extraSensitivity = 0.0
	orgasmModTimer = 1.0

func processTime(_seconds:int):
	var partOfMinute:float = float(_seconds) / 60.0
	
	stimulation -= 0.02 * partOfMinute * getStimulationGainModifier()
	if(stimulation < 0.0):
		stimulation = 0.0
	overstimulation -= 0.3 * partOfMinute * getOverstimRecoverModifier()
	if(overstimulation < 0.0):
		overstimulation = 0.0
	
	if(orgasmModTimer > 0.0):
		orgasmModTimer -= partOfMinute * 0.2
		if(orgasmModTimer < 0.0):
			orgasmModTimer = 0.0
	
#	if(sensitivity < 1.0):
#		var partOfDay:float = float(_seconds) / 86400.0 # seconds in a day
#
#		sensitivity += partOfDay * getLowSensitivityRestoreRate()
#		if(sensitivity > 1.0):
#			sensitivity = 1.0
	pass

func hoursPassed(_hours:int):
	if(sensitivity < 1.0):
		var partOfDay:float = float(_hours) / 24.0
		
		sensitivity += partOfDay * getLowSensitivityRestoreRate()
		if(sensitivity > 1.0):
			sensitivity = 1.0
	
	if(extraSensitivity > 0.0):
		extraSensitivity -= 0.004 * _hours
		
		if(extraSensitivity < 0.0):
			extraSensitivity = 0.0

func getInfo() -> Array:
	var result:= []
	
	#result.append("Name: "+getName())
	result.append("Sensitivity: "+str(Util.roundF(getSensitivity()*100.0, 1))+"%")
	#result.append("Raw sensitivity: "+str(getRawSensitivity()))
	result.append("Overstimulation: "+str(Util.roundF(stimulation*100.0 if !isOverstimulated() else getOverstimulation()*100.0, 1))+"%")
	
	return result

func getInfoString() -> String:
	return Util.join(getInfo(), "\n")
