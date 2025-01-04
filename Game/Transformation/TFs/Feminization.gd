extends TFBase

var addedVag:bool = false
var removedPenis:bool = false
var switchedbreasts:bool = false
var switchedhair:bool = false

func _init():
	id = "Feminization"

func getName() -> String:
	return "Feminization"

func isPossibleFor(_char) -> bool:
	if(getPossibleSteps(_char).empty()):
		return false
	return true

func start(_args:Dictionary):
	pass

func charHasMaleBreasts(theChar) -> bool:
	return theChar.bodypartHasTrait(BodypartSlot.Breasts, PartTrait.BreastsMale)

func getPossibleSteps(_char:BaseCharacter) -> Array:
	var result:Array = []
	
	if(_char.getFemininity() > 70 && _char.getGender() != Gender.Female):
		result.append("gender")
		
	if(_char.getFemininity() > 10):
		if(_char.hasPenis() && !removedPenis):
			var penisLen = _char.getPenisSize()
			
			if(penisLen > 8):
				result.append("shrinkpenis")
	
	if(_char.getFemininity() > 40):
		if(charHasMaleBreasts(_char) && !switchedbreasts):
			result.append("switchbreasts")
		var goodBreastSize:int = BreastsSize.B
		if(_char.getThickness() >= 50):
			goodBreastSize = BreastsSize.C
		if(_char.getThickness() >= 80):
			goodBreastSize = BreastsSize.D
		var currentBreastSize:int = _char.getBreastsSize()
		
		if(currentBreastSize < goodBreastSize):
			result.append("incbreasts")
	
	if(!switchedhair && _char.getFemininity() > 50):
		var hairPart:Bodypart = _char.getBodypart(BodypartSlot.Hair)
		if(hairPart != null && hairPart.femaleWeight < 0.6):
			result.append("switchhair")
	
	if(_char.getFemininity() > 60):
		if(_char.hasPenis() && !removedPenis):
			var penisLen = _char.getPenisSize()
			if(!addedVag && penisLen <= 8):
				if(_char.hasVagina()):
					result.append("rempenis")
				else:
					result.append("penistovag")
		elif(!_char.hasVagina() && !addedVag):
			result.append("growvag")
	
	if(result.empty() && _char.getFemininity() < 100):
		if(_char.getFemininity() < 45):
			result.append("femincmale")
		else:
			result.append("feminc")
	
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
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [10]),
			]
		}
	
	if(nextStep == "femincmale"):
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [RNG.randi_range(15, 25)]),
			]
		}
		
	if(nextStep == "gender"):
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [5]),
				charEffect("gender", "GenderChange", [Gender.Female]),
			]
		}
	if(nextStep == "switchbreasts"):
		switchedbreasts = true
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [5]),
				partEffect("breasts", BodypartSlot.Breasts, "SwitchPart", ["humanbreasts"]),
			]
		}
	if(nextStep == "incbreasts"):
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [5]),
				partEffect("breasts", BodypartSlot.Breasts, "BreastSizeChange", [1]),
			]
		}
	if(nextStep == "switchhair"):
		switchedhair = true
		
		var theChar = getChar()
		var possiblePartIDs:Dictionary = Bodypart.findPossibleBodypartIDsDict(BodypartSlot.Hair, theChar, theChar.getSpecies(), NpcGender.Female)
		if(possiblePartIDs.empty()):
			return {}
		var newPartID:String = RNG.pickWeightedDict(possiblePartIDs)
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [5]),
				partEffect("newpart", BodypartSlot.Hair, "SwitchPart", [newPartID]),
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
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [10]),
				partEffect("penLen", BodypartSlot.Penis, "PenisLengthChange", [-RNG.randi_range(2,4)*mod]),
			]
		}
	if(nextStep == "rempenis"):
		addedVag = true
		removedPenis = true
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [10]),
				partEffect("rempenis", BodypartSlot.Penis, "SwitchPart", [""]),
			]
		}
	if(nextStep == "penistovag"):
		removedPenis = true
		addedVag = true
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [10]),
				partEffect("rempenis", BodypartSlot.Penis, "SwitchPart", [""]),
				partEffect("addvag", BodypartSlot.Vagina, "SwitchPart", ["vagina"]),
			]
		}
	if(nextStep == "growvag"):
		removedPenis = true
		addedVag = true
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [10]),
				partEffect("addvag", BodypartSlot.Vagina, "SwitchPart", ["vagina"]),
			]
		}
	
	return {
	}


func reactProgress(_context:Dictionary, _result:TFResult):
	var step:String = _result.getField("step", "")
	
	#var stage:int = getStage()
	
	if(isFirstTime()):
		addText("Without warning, a jolt of energy surges through your body, leaving you breathless. Confusion and fear grip you as you realize something is happening against your will.")
	
	addText(_result.getAllTFTexts())
	
	if(isFirstTime()):
		addText("What is happening with your body..")
	
	
	if(step in ["feminc", "femincmale", "gender"]):
		playAnim(StageScene.Solo, "stand")
	else:
		playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["av"] = addedVag
	data["rp"] = removedPenis
	data["sb"] = switchedbreasts
	data["sh"] = switchedhair
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	addedVag = SAVE.loadVar(_data, "av", false)
	removedPenis = SAVE.loadVar(_data, "rp", false)
	switchedbreasts = SAVE.loadVar(_data, "sb", false)
	switchedhair = SAVE.loadVar(_data, "sh", false)
