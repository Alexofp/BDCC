extends AuctionAction

func _init():
	id = "Continue"

func getName() -> String:
	return "Continue"

func getActionType():
	return AuctionActionType.Continue

func getTraits() -> Dictionary:
	return {}
