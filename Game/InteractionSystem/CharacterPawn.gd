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
	if(currentInteraction == null && !isPlayer()):
		var aloneInteraction = load("res://Game/InteractionSystem/Interactions/AloneInteraction.gd").new()
		GM.main.IS.startInteraction(aloneInteraction, {main = charID}, false)

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
