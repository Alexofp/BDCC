extends Reference
class_name CharacterPawn

var location:String = "main_punishment_spot"
var charID:String = ""
var isDeleted:bool = false

var currentInteraction

var hunger:float = 0.0
var timeSinceLastWork:int = 0.0


func onSpawn():
	hunger = RNG.randf_range(0.0, 1.0)
	timeSinceLastWork = RNG.randi_range(0, 6000)

func getChar() -> BaseCharacter:
	if(charID == ""):
		return null
	return GlobalRegistry.getCharacter(charID)

func getCharacter() -> BaseCharacter:
	return getChar()

func getLocation() -> String:
	#if(isPlayer()):
	#	return GM.pc.getLocation()
	return location

func setLocation(newLoc:String):
	var oldLoc = getLocation()
	location = newLoc
	if(isPlayer()):
		GM.pc.setLocation(newLoc)
	GM.main.IS.onPawnMoved(charID, oldLoc, getLocation())
	print(charID+" set lock: "+newLoc)

func processTime(_howMuch:int):
	if(isPlayer()):
		var oldLoc = location
		location = GM.pc.getLocation()
		GM.main.IS.onPawnMoved(charID, oldLoc, getLocation())
	hunger += float(_howMuch) / 60.0 * 0.02
	timeSinceLastWork += _howMuch
	checkAloneInteraction()

func setInteraction(newInt):
	currentInteraction = newInt

func getInteraction():
	if(currentInteraction != null):
		return currentInteraction
	
	checkAloneInteraction()
	return currentInteraction

func checkAloneInteraction():
	if(currentInteraction == null):
		GM.main.IS.startInteraction("AloneInteraction", {main = charID}, {}, false)

func canBeInterrupted() -> bool:
	# Make it an interaction function?
	if(isPlayer() && !GM.main.playerCanBeInterrupted()):
		return false
	if(currentInteraction != null && currentInteraction.id != "AloneInteraction"):
		return false
	return true

func onMeetWith(_otherPawn, _otherPawnMoved:bool) -> bool:
	return GM.main.IS.checkOnMeetInteractions(self, _otherPawn, _otherPawnMoved)

func getHunger() -> float:
	return hunger

func wasDeleted() -> bool:
	return isDeleted

func deleteMe():
	GM.main.IS.deletePawn(self)

func getDebugInfo():
	var res = [
		"ID: "+str(charID),
		"Location: "+str(getLocation()),
		"Hunger: "+str(Util.roundF(hunger, 2)),
		"currentInteraction: "+str(currentInteraction.id if currentInteraction != null else "null"),
	]
	if(currentInteraction != null):
		res.append_array(currentInteraction.getDebugInfo())

	return res

func isPlayer() -> bool:
	return charID == "pc"

func isPawn() -> bool:
	return true

func scoreFetish(fetishes:Dictionary, onlyPositive:bool = false) -> float:
	var fetishHolder: FetishHolder = getChar().getFetishHolder()
	return fetishHolder.scoreFetish(fetishes, onlyPositive)

func scoreFetishMax(fetishes:Dictionary, minValue:float = -999.9) -> float:
	var fetishHolder: FetishHolder = getChar().getFetishHolder()
	return fetishHolder.scoreFetishMax(fetishes, minValue)

func scorePersonality(personalityStats:Dictionary, onlyPositive:bool = false) -> float:
	var personality: Personality = getChar().getPersonality()
	return personality.personalityScore(personalityStats, onlyPositive)

func scorePersonalityMax(personalityStats:Dictionary, minValue:float = -999.9) -> float:
	var personality: Personality = getChar().getPersonality()
	return personality.personalityScoreMax(personalityStats, minValue)

func scoreExposed() -> float:
	var value:float = getChar().getExposure()
	return value

func scoreLike(otherCharID) -> float:
	if(!(otherCharID is String)):
		otherCharID = otherCharID.charID
	
	var affectionValue:float = GM.main.RS.getAffection(charID, otherCharID)
	return max(0.0, affectionValue)

func scoreHate(otherCharID) -> float:
	if(!(otherCharID is String)):
		otherCharID = otherCharID.charID
	
	var affectionValue:float = GM.main.RS.getAffection(charID, otherCharID)
	return max(0.0, -affectionValue)

func scoreLust(otherCharID) -> float:
	if(!(otherCharID is String)):
		otherCharID = otherCharID.charID
	
	var lustValue:float = GM.main.RS.getLust(charID, otherCharID)
	return max(0.0, lustValue)

func affectAffection(otherCharID, howMuch:float):
	if(!(otherCharID is String)):
		otherCharID = otherCharID.charID
	
	GM.main.RS.addAffection(charID, otherCharID, howMuch)

func affectLust(otherCharID, howMuch:float):
	if(!(otherCharID is String)):
		otherCharID = otherCharID.charID
	
	GM.main.RS.addLust(charID, otherCharID, howMuch)
