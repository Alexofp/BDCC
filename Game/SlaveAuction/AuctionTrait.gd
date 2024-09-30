extends Reference
class_name AuctionTrait

var id:String = "error"

func getTraitType():
	return AuctionTraitType.Fetish

func getName() -> String:
	return "SEX (BOTTOM)"

func getPresentName() -> String:
	return getName()

func getPresentText(_char:BaseCharacter) -> String:
	return "SLAVE IS INTO BEING FUCKED!"

func getPositiveReaction(_char:BaseCharacter) -> String:
	return "NICE, I COULD USE A BREEDING BITCH."

func getNegativeReaction(_char:BaseCharacter) -> String:
	return "I'M NOT REALLY LOOKING FOR THAT."

func canEmphasize() -> bool:
	return false

func onEmphasize(_char:BaseCharacter, _scene):
	_scene.saynn("MEOW MEOW")

func calculateScore(_char:BaseCharacter) -> float:
	var result:float = 0.0
	
	var totalChecks:int = 2
	result += _char.fetishHolder.scoreFetish({
		Fetish.AnalSexReceiving: 1.0,
		Fetish.OralSexReceiving: 1.0,
		})
	if(_char.hasAnyWomb()):
		result += _char.fetishHolder.scoreFetish({
			Fetish.BeingBred: 1.0,
			})
		totalChecks += 1
	if(_char.hasVagina()):
		result += _char.fetishHolder.scoreFetish({
			Fetish.VaginalSexReceiving: 1.0,
			})
		totalChecks += 1
	
	return clamp(result / totalChecks * 3.0, -1.0, 1.0)

func getBidderChance() -> float:
	return 100.0#33.34
