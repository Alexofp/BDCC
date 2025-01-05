extends "res://Game/Transformation/TFs/SpeciesTF.gd"

func _init():
	id = "SpeciesTFMinor"

func getName() -> String:
	return "Create a hybrid"

func getPillName() -> String:
	return "Hybridizer"

func getSlotsToTransform() -> Array:
	return [
		BodypartSlot.Ears,
		BodypartSlot.Horns,
		BodypartSlot.Tail,
		BodypartSlot.Penis,
		BodypartSlot.Legs,
	]

func allowsRemovingParts() -> bool:
	return false
