extends Reference
class_name CharacterPawn

var location:String = "main_punishment_spot"
var charID:String = ""

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
	location = newLoc

func processTime(_howMuch:int):
	var randomDir = RNG.pick(GameWorld.getAllDirections())
	
	if(GM.world.canGoID(location, randomDir)):
		setLocation(GM.world.applyDirectionID(location, randomDir))

func setInteraction(newInt):
	currentInteraction = newInt

func getInteraction():
	if(currentInteraction != null):
		return currentInteraction
	
	var aloneInteraction = load("res://Game/InteractionSystem/Interactions/AloneInteraction.gd").new()
	setInteraction(aloneInteraction)
	aloneInteraction.start({main = charID})
	return currentInteraction
