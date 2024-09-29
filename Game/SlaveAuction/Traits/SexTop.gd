extends AuctionTrait

func _init():
	id = "SexTop"

func getTraitType():
	return AuctionTraitType.Fetish

func getName() -> String:
	return "SEX (TOP)"

func getPresentName() -> String:
	return getName()

func getPresentText(_char:BaseCharacter) -> String:
	return "SLAVE CAN FUCK VERY WELL!"

func getPositiveReaction(_char:BaseCharacter) -> String:
	return "NICE, I COULD USE A SERVICE TOP."

func calculateScore(_char:BaseCharacter) -> float:
	var result:float = 0.0
	
	var totalChecks:int = 2
	result += _char.fetishHolder.scoreFetish({
		Fetish.AnalSexGiving: 1.0,
		Fetish.VaginalSexGiving: 1.0,
		Fetish.StraponSexAnal: 1.0,
		Fetish.StraponSexVaginal: 1.0,
		})
	
	return clamp(result / totalChecks * 3.0, -1.0, 1.0)
