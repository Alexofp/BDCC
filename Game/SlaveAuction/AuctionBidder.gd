extends Reference
class_name AuctionBidder

var name:String = ""
var desire:float = 0.0
var instantDesire:float = 0.0
var likes:Dictionary = {}
var dislikes:Dictionary = {}

func getFinalDesire() -> float:
	return desire + instantDesire
