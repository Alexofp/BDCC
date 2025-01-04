extends "res://Game/Transformation/TFs/SpeciesTF.gd"

func _init():
	id = "Demonification"

func getName() -> String:
	return "Demonification"

func isPossibleFor(_char) -> bool:
	if(Species.Demon in _char.getSpecies()):
		return false
	return true

func start(_args:Dictionary):
	newSpecies = [Species.Demon]

func getSlotsToTransform() -> Array:
	return [
		BodypartSlot.Horns,
		BodypartSlot.Tail,
		BodypartSlot.Penis,
		BodypartSlot.Legs,
	]

func allowsRemovingParts() -> bool:
	return false

func canTransformFurther() -> bool:
	var theChar:BaseCharacter = getChar()
	if(theChar.hasPenis() && theChar.getPenisSize() <= 20):
		return true
	return .canTransformFurther()

func doProgress(_context:Dictionary) -> Dictionary:
	var result:Dictionary = .doProgress(_context)
	
	if(!result.empty()):
		return result
	
	var theChar:BaseCharacter = getChar()
	if(theChar.hasPenis() && theChar.getPenisSize() <= 20):
		return {
			showPenis = true,
			effects = [
				partEffect("penLen", BodypartSlot.Penis, "PenisLengthChange", [RNG.randi_range(4, 5)])
			],
		}
	return {}
