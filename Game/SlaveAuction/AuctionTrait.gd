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
	return 50.0#65.0#33.34#100.0#

func getBidderPositiveChance(_id:String) -> float:
	return 65.0

func calculateFetishScore(_char:BaseCharacter, _fetishes:Dictionary, _difficultyScale:float = 1.0):
	var theScore:float = _char.fetishHolder.scoreFetish(_fetishes)
	
	var maxFetishScore:float = 0.0
	for fetishID in _fetishes:
		maxFetishScore += abs(_fetishes[fetishID])
	
	var minScore:float = (1.0 / maxFetishScore * 0.35) if maxFetishScore != 0 else 1.0
	
	if(theScore < minScore):
		return clamp(theScore - minScore, -1.0, 0.0)
	
	if(maxFetishScore <= 1.0):
		return clamp(theScore, -1.0, 1.0)
	var deviceAmount:float = maxFetishScore * 0.2 * _difficultyScale
	
	return clamp(theScore / deviceAmount, -1.0, 1.0)

func getBidderOutbidReactions(_id:String, _char:BaseCharacter) -> Array:
	return []
