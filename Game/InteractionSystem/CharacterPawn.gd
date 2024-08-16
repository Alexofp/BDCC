extends Reference
class_name CharacterPawn

var location:String = "main_punishment_spot"
var charID:String = ""
var isDeleted:bool = false

var currentInteraction

var hunger:float = 0.0
var timeSinceLastWork:int = 0.0
var fightExhaustion:float = 0.0

const hungerPerHour:float = 0.2

func saveData():
	var data = {
		"loc": location,
		"charID": charID,
		"isD": isDeleted,
		"hunger": hunger,
		"tslw": timeSinceLastWork,
		"fe": fightExhaustion,
	}
	return data

func loadData(_data):
	location = SAVE.loadVar(_data, "loc", "main_punishment_spot")
	charID = SAVE.loadVar(_data, "charID", "")
	isDeleted = SAVE.loadVar(_data, "isD", false)
	hunger = SAVE.loadVar(_data, "hunger", 0.0)
	timeSinceLastWork = SAVE.loadVar(_data, "tslw", 0)
	fightExhaustion = SAVE.loadVar(_data, "fe", 0.0)

func onSpawn():
	hunger = RNG.randf_range(0.0, 0.3)
	timeSinceLastWork = RNG.randi_range(0, 6000)

func getChar() -> BaseCharacter:
	if(charID == ""):
		return null
	return GlobalRegistry.getCharacter(charID)

func getCharacter() -> BaseCharacter:
	return getChar()

func getLocation() -> String:
	if(isPlayer()):
		return GM.pc.getLocation()
	return location

func setLocation(newLoc:String):
	var oldLoc = location
	location = newLoc
	if(isPlayer() && newLoc != GM.pc.getLocation()):
		GM.pc.setLocation(newLoc)
	GM.main.IS.onPawnMoved(charID, oldLoc, getLocation())
	print(charID+" set lock: "+newLoc)

func processTime(_howMuch:int):
	hunger += float(_howMuch) * hungerPerHour / 3600.0
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
		if(getExhaustion() > 0.0):
			GM.main.IS.startInteraction("FightExhaustion", {main = charID}, {})
			return
		
		GM.main.IS.startInteraction("AloneInteraction", {main = charID}, {})

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

func isDoingTask(_taskID:String) -> bool:
	if(currentInteraction == null):
		return false
	return currentInteraction.isDoingTask(_taskID)

func getCharType() -> String:
	var thechar = getChar()
	if(thechar == null):
		return CharacterType.Generic
	return thechar.getCharacterType()

func isInmate() -> bool:
	return getCharType() == CharacterType.Inmate

func isGuard() -> bool:
	return getCharType() == CharacterType.Guard

func isNurse() -> bool:
	return getCharType() == CharacterType.Nurse

func isEngineer() -> bool:
	return getCharType() == CharacterType.Engineer

func isLilac() -> bool:
	return isInmate() && getChar().getInmateType() == InmateType.SexDeviant

func isGeneralInmate() -> bool:
	return isInmate() && getChar().getInmateType() == InmateType.General

func isHighSecInmate() -> bool:
	return isInmate() && getChar().getInmateType() == InmateType.HighSec

func getPawnTexture():
	var theChar = getChar()
	if(theChar == null):
		return RoomStuff.PawnTexture.Masc
	var femi = theChar.getFemininity()
	
	if(femi >= 50):
		return RoomStuff.PawnTexture.Fem
	return RoomStuff.PawnTexture.Masc

func getPawnColor() -> Color:
	if(isLilac()):
		return Color.purple
	if(isGeneralInmate()):
		return Color.orange
	if(isHighSecInmate()):
		return Color.red
	if(isGuard()):
		return Color.blue
	if(isNurse()):
		return Color.yellowgreen
	if(isEngineer()):
		return Color.orangered
	
	return Color.pink

func afterLostFight():
	if(isPlayer()):
		return
	#fightExhaustion = 1.0

func afterWonFight():
	pass

func getExhaustion() -> float:
	return fightExhaustion

func recoverExhaustion(howMuch:float = 0.1):
	fightExhaustion -= howMuch
	if(fightExhaustion < 0.0):
		fightExhaustion = 0.0

func makeExhausted():
	if(isPlayer()):
		return
	fightExhaustion = 1.0
	if(canBeInterrupted()):
		GM.main.IS.startInteraction("FightExhaustion", {main = charID}, {})

func calculatePowerScore(ignoreCurrentState:bool = false) -> float:
	var theChar:BaseCharacter = getChar()
	if(theChar == null):
		return 0.0
	
	var finalScore:float = 0.0
	
	finalScore += theChar.painThreshold() * 0.01
	finalScore += theChar.lustThreshold() * 0.01
	finalScore += theChar.getMaxStamina() * 0.005
	
	finalScore += theChar.getLevel() * 0.1
	finalScore += theChar._getAttacks().size() * 0.1
	
	if(!ignoreCurrentState):
		finalScore *= (1.0 - theChar.getPainLevel()*0.9)
		finalScore *= (1.0 - theChar.getLustLevel()*0.8)
		finalScore *= (1.0 - theChar.getStaminaLevel()*0.5)
	
	return finalScore
