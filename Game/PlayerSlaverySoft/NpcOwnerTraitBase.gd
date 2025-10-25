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

func getTraitExclusiveType() -> String:
	return ""

func getEventTags(_npcOwner) -> Dictionary:
	return {}

func getNOMs(_npcOwner) -> Dictionary:
	return {}

func getSkipPunishmentChance() -> float:
	return 0.0
