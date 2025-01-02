extends "res://Game/Transformation/TFs/SpeciesTF.gd"

func _init():
	id = "SpeciesTFMinor"

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
