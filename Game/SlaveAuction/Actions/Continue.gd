extends AuctionAction

func _init():
	id = "Continue"

func getName() -> String:
	return "Continue"

func getButtonDesc() -> String:
	return "See what happens next.."

func getActionType():
	return AuctionActionType.Continue

func getTraits() -> Dictionary:
	return {}
