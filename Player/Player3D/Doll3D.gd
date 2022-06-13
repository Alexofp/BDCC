extends Spatial
class_name Doll3D

var state = {}
var parts = {}

func getDollSkeleton():
	return $DollSkeleton

func _ready():
	addPart("body", load("res://Player/Player3D/Parts/Body/HumanBody/HumanBody.tscn").instance())
	#addPart("legs", load("res://Player/Player3D/Parts/Legs/HumanLegs/HumanLegs.tscn").instance())
	addPart("legs", load("res://Player/Player3D/Parts/Legs/DigiLegs/DigiLegs.tscn").instance())
	#addPart("head", load("res://Player/Player3D/Parts/Head/HumanHead/HumanHead.tscn").instance())
	addPart("head", load("res://Player/Player3D/Parts/Head/FelineHead/FelineHead.tscn").instance())
	#addPart("head", load("res://Player/Player3D/Parts/Head/CanineHead/CanineHead.tscn").instance())
	#addPart("head", load("res://Player/Player3D/Parts/Head/FoxHead/FoxHead.tscn").instance())
	#addPart("head", load("res://Player/Player3D/Parts/Head/WolfHead/WolfHead.tscn").instance())
	
	#addPart("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsFlat/BreastsFlat.tscn").instance())
	#addPart("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsSmall/BreastsSmall.tscn").instance())
	#addPart("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsMedium/BreastsMedium.tscn").instance())
	#addPart("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsCurvy/BreastsCurvy.tscn").instance())
	addPart("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsBig/BreastsBig.tscn").instance())
	addPart("hands", load("res://Player/Player3D/Parts/Arms/HumanArms/HumanArms.tscn").instance())
	#addPart("ears", load("res://Player/Player3D/Parts/Ears/HumanEars/HumanEars.tscn").instance())
	#addPart("ears", load("res://Player/Player3D/Parts/Ears/DragonEars/DragonEars.tscn").instance())
	#addPart("ears", load("res://Player/Player3D/Parts/Ears/CanineEars/CanineEars.tscn").instance())
	#addPart("ears", load("res://Player/Player3D/Parts/Ears/CatEars/CatEars.tscn").instance())
	#addPart("ears", load("res://Player/Player3D/Parts/Ears/LynxEars/LynxEars.tscn").instance())
	#addPart("ears", load("res://Player/Player3D/Parts/Ears/LynxEars2/LynxEars2.tscn").instance())
	addPart("ears", load("res://Player/Player3D/Parts/Ears/WolfEars/WolfEars.tscn").instance())
	#addPart("ears", load("res://Player/Player3D/Parts/Ears/DragonEars2/DragonEars2.tscn").instance())
	addPart("tail", load("res://Player/Player3D/Parts/Tail/DragonTail/DragonTail.tscn").instance())
	#addPart("tail", load("res://Player/Player3D/Parts/Tail/FelineTail/FelineTail.tscn").instance())
	#addPart("tail", load("res://Player/Player3D/Parts/Tail/CanineTail/CanineTail.tscn").instance())
	#addPart("tail", load("res://Player/Player3D/Parts/Tail/ShortTail/ShortTail.tscn").instance())
	#addPart("tail", load("res://Player/Player3D/Parts/Tail/HuskyTail/HuskyTail.tscn").instance())
	#addPart("penis", load("res://Player/Player3D/Parts/Penis/DragonPenis/DragonPenis.tscn").instance())
	#addPart("penis", load("res://Player/Player3D/Parts/Penis/HumanPenis/HumanPenis.tscn").instance())
	addPart("penis", load("res://Player/Player3D/Parts/Penis/CaninePenis/CaninePenis.tscn").instance())
	addPart("hair", load("res://Player/Player3D/Parts/Hair/FerriHair/FerriHair.tscn").instance())
	#addPart("hair", load("res://Player/Player3D/Parts/Hair/PonytailHair/PonytailHair.tscn").instance())
	#addPart("hair", load("res://Player/Player3D/Parts/Hair/CombedBackHair/CombedBackHair.tscn").instance())
	#addPart("hair", load("res://Player/Player3D/Parts/Hair/LongHair/LongHair.tscn").instance())
	#addPart("hair", load("res://Player/Player3D/Parts/Hair/MessyHair/MessyHair.tscn").instance())
	#addPart("hair", load("res://Player/Player3D/Parts/Hair/MohawkHair/MohawkHair.tscn").instance())
	#addPart("hair", load("res://Player/Player3D/Parts/Hair/ShortHair/ShortHair.tscn").instance())
	#addPart("hair", load("res://Player/Player3D/Parts/Hair/SimpleHair/SimpleHair.tscn").instance())
	#addPart("head", load("res://Player/Player3D/Parts/Head/DragonHead/DragonHead.tscn").instance())
	addPart("horns", load("res://Player/Player3D/Parts/Horns/DragonHorns/DragonHorns.tscn").instance())
	#addPart("horns", load("res://Player/Player3D/Parts/Horns/DragonHorns2/DragonHorns2.tscn").instance())
	
	setState("gag", "gagged")
	setState("blindfold", "blindfolded")
	
	#setShapeKeyValue("Pregnant", 1.0)
	pass 

func setState(stateID, value):
	state[stateID] = value
	
	for slot in parts:
		var part = parts[slot]
		part.setState(stateID, value)

func clearState():
	for slot in parts:
		var part = parts[slot]
		for stateID in state:
			part.setState(stateID, "")
	state.clear()

func addPart(slot, part: Spatial):
	if(parts.has(slot)):
		parts[slot].queue_free()
		parts.erase(slot)
	
	parts[slot] = part
	getDollSkeleton().getSkeleton().add_child(part)
	
	part.initPart(getDollSkeleton())
	
	for stateID in state:
		part.setState(stateID, state[stateID])
	
func removeSlot(slot):
	if(parts.has(slot)):
		parts[slot].queue_free()
		parts.erase(slot)

func hasSlot(slot):
	if(parts.has(slot)):
		return true
	return false

func setShapeKeyValue(shapeKey: String, value: float):
	for slot in parts:
		var part = parts[slot]
		
		part.setShapeKeyValue(shapeKey, value)
