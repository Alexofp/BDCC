extends Reference
class_name AuctionTrait

var ids:Array = []

func getTraitType(_id:String):
	return AuctionTraitType.Fetish

func getName(_id:String) -> String:
	return "ERROR? FILL ME"

func calculateScore(_id:String, _char:BaseCharacter) -> float:
	return 0.0

func getBidderChance(_id:String) -> float:
	return 65.0#33.34#100.0#
