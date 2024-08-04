extends Reference
class_name CharacterPawn

var location:String = "main_punishment_spot"
var charID:String = ""
var isDeleted:bool = false

var currentInteraction

var hunger:float = 0.0


func onSpawn():
	hunger = RNG.randf_range(0.0, 1.0)

func getChar() -> BaseCharacter:
	if(charID == ""):
		return null
	return GlobalRegistry.getCharacter(charID)

func getLocation() -> String:
	return location

func setLocation(newLoc:String):
	var oldLoc = getLocation()
	location = newLoc
	GM.main.IS.onPawnMoved(charID, oldLoc, getLocation())

func processTime(_howMuch:int):
	hunger += 0.02

func setInteraction(newInt):
	currentInteraction = newInt

func getInteraction():
	if(currentInteraction != null):
		return currentInteraction
	
	var aloneInteraction = load("res://Game/InteractionSystem/Interactions/AloneInteraction.gd").new()
	setInteraction(aloneInteraction)
	aloneInteraction.start({main = charID})
	return currentInteraction

func getHunger() -> float:
	return hunger

func wasDeleted() -> bool:
	return isDeleted

func deleteMe():
	GM.main.IS.deletePawn(self)

func getDebugInfo():
	var res = [
		"ID: "+str(charID),
		"Location: "+str(location),
		"Hunger: "+str(Util.roundF(hunger, 2)),
		"currentInteraction: "+str(currentInteraction.id if currentInteraction != null else "null"),
	]
	if(currentInteraction != null):
		res.append_array(currentInteraction.getDebugInfo())

	return res
