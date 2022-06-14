extends Spatial
class_name Doll3D

var state = {}
var parts = {}
var savedCharacterID: String

func getDollSkeleton():
	return $DollSkeleton

func _ready():
	#testBody()
	pass

func testBody():
	addPartObject("body", load("res://Player/Player3D/Parts/Body/HumanBody/HumanBody.tscn").instance())
	#addPartObject("legs", load("res://Player/Player3D/Parts/Legs/HumanLegs/HumanLegs.tscn").instance())
	addPartObject("legs", load("res://Player/Player3D/Parts/Legs/DigiLegs/DigiLegs.tscn").instance())
	#addPartObject("head", load("res://Player/Player3D/Parts/Head/HumanHead/HumanHead.tscn").instance())
	addPartObject("head", load("res://Player/Player3D/Parts/Head/FelineHead/FelineHead.tscn").instance())
	#addPartObject("head", load("res://Player/Player3D/Parts/Head/CanineHead/CanineHead.tscn").instance())
	#addPartObject("head", load("res://Player/Player3D/Parts/Head/FoxHead/FoxHead.tscn").instance())
	#addPartObject("head", load("res://Player/Player3D/Parts/Head/WolfHead/WolfHead.tscn").instance())
	
	#addPartObject("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsFlat/BreastsFlat.tscn").instance())
	#addPartObject("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsSmall/BreastsSmall.tscn").instance())
	#addPartObject("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsMedium/BreastsMedium.tscn").instance())
	#addPartObject("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsCurvy/BreastsCurvy.tscn").instance())
	addPartObject("breasts", load("res://Player/Player3D/Parts/Breasts/BreastsBig/BreastsBig.tscn").instance())
	addPartObject("hands", load("res://Player/Player3D/Parts/Arms/HumanArms/HumanArms.tscn").instance())
	#addPartObject("ears", load("res://Player/Player3D/Parts/Ears/HumanEars/HumanEars.tscn").instance())
	#addPartObject("ears", load("res://Player/Player3D/Parts/Ears/DragonEars/DragonEars.tscn").instance())
	#addPartObject("ears", load("res://Player/Player3D/Parts/Ears/CanineEars/CanineEars.tscn").instance())
	#addPartObject("ears", load("res://Player/Player3D/Parts/Ears/CatEars/CatEars.tscn").instance())
	#addPartObject("ears", load("res://Player/Player3D/Parts/Ears/LynxEars/LynxEars.tscn").instance())
	#addPartObject("ears", load("res://Player/Player3D/Parts/Ears/LynxEars2/LynxEars2.tscn").instance())
	addPartObject("ears", load("res://Player/Player3D/Parts/Ears/WolfEars/WolfEars.tscn").instance())
	#addPartObject("ears", load("res://Player/Player3D/Parts/Ears/DragonEars2/DragonEars2.tscn").instance())
	addPartObject("tail", load("res://Player/Player3D/Parts/Tail/DragonTail/DragonTail.tscn").instance())
	#addPartObject("tail", load("res://Player/Player3D/Parts/Tail/FelineTail/FelineTail.tscn").instance())
	#addPartObject("tail", load("res://Player/Player3D/Parts/Tail/CanineTail/CanineTail.tscn").instance())
	#addPartObject("tail", load("res://Player/Player3D/Parts/Tail/ShortTail/ShortTail.tscn").instance())
	#addPartObject("tail", load("res://Player/Player3D/Parts/Tail/HuskyTail/HuskyTail.tscn").instance())
	#addPartObject("penis", load("res://Player/Player3D/Parts/Penis/DragonPenis/DragonPenis.tscn").instance())
	#addPartObject("penis", load("res://Player/Player3D/Parts/Penis/HumanPenis/HumanPenis.tscn").instance())
	addPartObject("penis", load("res://Player/Player3D/Parts/Penis/CaninePenis/CaninePenis.tscn").instance())
	addPartObject("hair", load("res://Player/Player3D/Parts/Hair/FerriHair/FerriHair.tscn").instance())
	#addPartObject("hair", load("res://Player/Player3D/Parts/Hair/PonytailHair/PonytailHair.tscn").instance())
	#addPartObject("hair", load("res://Player/Player3D/Parts/Hair/CombedBackHair/CombedBackHair.tscn").instance())
	#addPartObject("hair", load("res://Player/Player3D/Parts/Hair/LongHair/LongHair.tscn").instance())
	#addPartObject("hair", load("res://Player/Player3D/Parts/Hair/MessyHair/MessyHair.tscn").instance())
	#addPartObject("hair", load("res://Player/Player3D/Parts/Hair/MohawkHair/MohawkHair.tscn").instance())
	#addPartObject("hair", load("res://Player/Player3D/Parts/Hair/ShortHair/ShortHair.tscn").instance())
	#addPartObject("hair", load("res://Player/Player3D/Parts/Hair/SimpleHair/SimpleHair.tscn").instance())
	#addPartObject("head", load("res://Player/Player3D/Parts/Head/DragonHead/DragonHead.tscn").instance())
	addPartObject("horns", load("res://Player/Player3D/Parts/Horns/DragonHorns/DragonHorns.tscn").instance())
	#addPartObject("horns", load("res://Player/Player3D/Parts/Horns/DragonHorns2/DragonHorns2.tscn").instance())
	
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

func addPart(slot, partPath):
	addPartObject(slot, load(partPath).instance())

func addPartUnlessSame(slot, partPath):
	if(parts.has(slot)):
		var oldpart: Spatial = parts[slot]
		if(oldpart.filename == partPath):
			return
	addPart(slot, partPath)
		

func addPartObject(slot, part: Spatial):
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

func setParts(newparts: Dictionary):
	var dirtyFlags = {}
	for slot in parts:
		dirtyFlags[slot] = false
		
	for newslot in newparts:
		addPartUnlessSame(newslot, newparts[newslot])
		dirtyFlags[newslot] = true
	
	for slot in parts.keys():
		if(!dirtyFlags[slot]):
			removeSlot(slot)

func disconnectFromOld():
	if(savedCharacterID != null && savedCharacterID != ""):
		var ch = GlobalRegistry.getCharacter(savedCharacterID)
		if(ch == null || !is_instance_valid(ch)):
			return
		if(ch.is_connected("bodypart_changed", self, "onCharacterBodypartChanged")):
			ch.disconnect("bodypart_changed", self, "onCharacterBodypartChanged")

func loadCharacter(charID):
	var ch = GlobalRegistry.getCharacter(charID)
	if(ch == null || !is_instance_valid(ch)):
		return
	
	if(ch.has_method("updateDoll")):
		disconnectFromOld()
		ch.updateDoll(self)
		savedCharacterID = charID
		var _ok = ch.connect("bodypart_changed", self, "onCharacterBodypartChanged")
		
func onCharacterBodypartChanged():
	var ch = GlobalRegistry.getCharacter(savedCharacterID)
	if(ch == null || !is_instance_valid(ch)):
		return
	if(ch.has_method("updateDoll")):
		ch.updateDoll(self)
