extends Reference
class_name NpcOwnerTraitBase

var id:String = ""

var npcOwnerRef:WeakRef

func getVisibleName() -> String:
	return "FILL ME!"

func getVisibleDescription() -> String:
	return "FILL ME!"

func getPossiblePCNamesForLevel(_npcOwner, _level:int) -> Array:
	return []

# Relative chance that the owner will develop this trait
func getTraitScore(_npcOwner) -> float:
	return 1.0
