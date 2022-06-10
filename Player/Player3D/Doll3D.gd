extends Spatial
class_name Doll3D

var state = {}
var parts = {}

func getDollSkeleton():
	return $DollSkeleton

func _ready():
	var body:PackedScene = load("res://Player/Player3D/Parts/Body/HumanBody/HumanBody.tscn")
	var bodyObject = body.instance()
	addPart("body", bodyObject)
	
	var legs:PackedScene = load("res://Player/Player3D/Parts/Legs/HumanLegs/HumanLegs.tscn")
	var legsObject = legs.instance()
	addPart("legs", legsObject)
	
	var head:PackedScene = load("res://Player/Player3D/Parts/Head/HumanHead/HumanHead.tscn")
	var headObject = head.instance()
	addPart("head", headObject)
	
	addPart("breasts", load("res://Player/Player3D/Parts/Breasts/Curvy/BreastsCurvy.tscn").instance())
	addPart("hands", load("res://Player/Player3D/Parts/Arms/HumanArms/HumanArms.tscn").instance())
	addPart("ears", load("res://Player/Player3D/Parts/Ears/HumanEars/HumanEars.tscn").instance())
	
	setState("gag", "gagged")
	setState("blindfold", "blindfolded")
	
	setShapeKeyValue("Pregnant", 0.0)
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
