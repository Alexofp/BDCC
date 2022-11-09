extends Reference
class_name SexInfoBase

var sexEngineRef: WeakRef
var charID = null
var arousal: float = 0.0
var timesCame: int = 0
var memory:Dictionary = {}
var tick:int = 0
var lustFull: float = 0.0

func getSexEngine():
	if(sexEngineRef == null):
		return null
	return sexEngineRef.get_ref()

func initInfo(theCharID, sexengine):
	charID = theCharID
	sexEngineRef = weakref(sexengine)
	initFromPersonality()
	
func getChar() -> BaseCharacter:
	if(charID == null):
		return null
	
	return GlobalRegistry.getCharacter(charID)

func getInfoString():
	return ""

func initFromPersonality():
	pass

func processTurn():
	tick += 1
	lustFull += getChar().getLustLevel()

func getAverageLust():
	return lustFull / float(Util.maxi(1, tick))

func addArousal(howmuch: float):
	arousal += howmuch
	arousal = clamp(arousal, 0.0, 1.0)

func addPain(newpain):
	getChar().addPain(newpain)

func addLust(newlust):
	getChar().addLust(newlust)

func canDoActions():
	return true

func arousalNaturalFade():
	addArousal(-0.01)

func addArousalForeplay(howmuch: float):
	#var lustLevel = getChar().getLustLevel()
	# should be less efficient at high lust. or not
	if(arousal < 0.5):
		addArousal(howmuch)

func addArousalSex(howmuch: float):
	var lustLevel = getChar().getLustLevel()
	if(lustLevel < 0.4):
		# should be less efficient at low lust
		addArousal(howmuch * max(lustLevel, 0.1))
	else:
		addArousal(howmuch)

func getArousal() -> float:
	return arousal

func isCloseToCumming() -> bool:
	return arousal >= 0.7

func isReadyToCum() -> bool:
	return arousal >= 1.0
	
func cum():
	arousal = 0.0
	getChar().addLust(-int(getChar().getLust()/2.0))
	timesCame += 1

func getTimesCame():
	return timesCame

func isReadyToPenetrate() -> bool:
	return getChar().getLustLevel() >= 0.5 || getChar().getLust() >= 50

func fetishScore(fetishes = {}, addscore = 0.0):
	var fetishHolder: FetishHolder = getChar().getFetishHolder()
	
	var result = addscore
	for fetishID in fetishes:
		var fetishValue = fetishHolder.getFetishValue(fetishID)
		result += fetishValue * fetishes[fetishID]
	
	return result

func personalityScore(personalityStats = {}, addscore = 0.0):
	var personality: Personality = getChar().getPersonality()
	
	var result = addscore
	for personalityStatID in personalityStats:
		var personalityValue = personality.getStat(personalityStatID)
		result += personalityValue * personalityStats[personalityStatID]
	
	return result

func remember(keyid, value = true):
	memory[keyid] = value

func hasMemory(keyid):
	if(memory.has(keyid)):
		return true
	return false

func getMemory(keyid, defaultValue = null):
	if(!memory.has(keyid)):
		return defaultValue
	return memory[keyid]

func increaseMemory(keyid):
	if(!memory.has(keyid)):
		memory[keyid] = 0
	
	memory[keyid] += 1

func getSexEndInfo():
	var texts = []
	
	if(timesCame > 0):
		texts.append("Times came: "+str(timesCame))
	texts.append("Average lust: "+str(Util.roundF(getAverageLust()*100.0, 1))+"%")
	
	return texts

func hasTag(thetag):
	return getSexEngine().hasTag(charID, thetag)
