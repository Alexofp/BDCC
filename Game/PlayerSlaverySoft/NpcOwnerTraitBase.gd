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

# Which tags does this trait bring
func getEventTags(_npcOwner) -> Dictionary:
	return {}

# Events with tags that are used here are multiplied by the provided values
# NOET.Mean: 0.3, # Means that 'Mean' events will happen 70% less often
func getEventWeightMults(_npcOwner) -> Dictionary:
	return {}

func getNOMs(_npcOwner) -> Dictionary:
	return {}

func getSkipPunishmentChance() -> float:
	return 0.0

func talkAction(_name:String, _desc:String, _id:String, _args:Array=[]) -> Array:
	return [_name, _desc, _id, _args]
	
func talkActionDisabled(_name:String, _desc:String) -> Array:
	return [_name, _desc]

func getTalkActions(_npcOwner, _event) -> Array:
	return []

func doTalkAction(_npcOwner, _event, _actionID:String, _args:Array):
	pass
