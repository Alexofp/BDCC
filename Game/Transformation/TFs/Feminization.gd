extends TFBase

var addedVag:bool = false
var removedPenis:bool = false

func _init():
	id = "Feminization"

func isPossibleFor(_char) -> bool:
	if(getPossibleSteps(_char).empty()):
		return false
	return true

func start(_args:Dictionary):
	pass

func getPossibleSteps(_char:BaseCharacter) -> Array:
	var result:Array = []
	
	if(_char.getFemininity() < 100):
		result.append("feminc")
	if(_char.getFemininity() > 70 && _char.getGender() != Gender.Female):
		result.append("gender")
		
	if(_char.getFemininity() > 50):
		if(_char.hasPenis() && !removedPenis):
			var penisLen = _char.getPenisSize()
			
			if(penisLen > 8):
				result.append("shrinkpenis")
			elif(!addedVag):
				if(_char.hasVagina()):
					result.append("rempenis")
				else:
					result.append("penistovag")
		elif(!_char.hasVagina() && !addedVag):
			result.append("growvag")
	
	return result

func canTransformFurther() -> bool:
	if(!getPossibleSteps(getChar()).empty()):
		return true
	return false
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 120
	return 240
	
func doProgress(_context:Dictionary) -> Dictionary:
	var allSteps:Array = getPossibleSteps(getChar())
	if(allSteps.empty()):
		return {}
	var nextStep:String = RNG.pick(allSteps)
	
	if(nextStep == "feminc"):
		return {
			effects = [
				charEffect("fem", "AddFemininity", [10]),
			]
		}
		
	if(nextStep == "gender"):
		return {
			effects = [
				charEffect("fem", "AddFemininity", [5]),
				charEffect("gender", "GenderChange", [Gender.Female]),
			]
		}
	if(nextStep == "shrinkpenis"):
		var currentPenLen = getChar().getPenisSize()
		var mod:float = 1.0
		if(currentPenLen >= 20):
			mod = 2.0
		if(currentPenLen >= 30):
			mod = 3.0
		return {
			effects = [
				partEffect("penLen", BodypartSlot.Penis, "PenisLengthChange", [-RNG.randi_range(2,4)*mod]),
			]
		}
	if(nextStep == "rempenis"):
		addedVag = true
		removedPenis = true
		return {
			effects = [
				partEffect("rempenis", BodypartSlot.Penis, "SwitchPart", [""]),
			]
		}
	if(nextStep == "penistovag"):
		removedPenis = true
		addedVag = true
		return {
			effects = [
				partEffect("rempenis", BodypartSlot.Penis, "SwitchPart", [""]),
				partEffect("addvag", BodypartSlot.Vagina, "SwitchPart", ["vagina"]),
			]
		}
	if(nextStep == "growvag"):
		removedPenis = true
		addedVag = true
		return {
			effects = [
				partEffect("addvag", BodypartSlot.Vagina, "SwitchPart", ["vagina"]),
			]
		}
	
	return {
	}


func reactProgress(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts())
	
	playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	
