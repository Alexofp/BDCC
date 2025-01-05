extends TFBase

var removedVag:bool = false
var addedPenis:bool = false
var switchedbreasts:bool = false
var switchedhair:bool = false

func _init():
	id = "Masculinization"

func getName() -> String:
	return "Masculinization"

func getPillName() -> String:
	return "TestosteGo"

func isPossibleFor(_char) -> bool:
	if(getPossibleSteps(_char).empty()):
		return false
	return true

func start(_args:Dictionary):
	pass

func charHasMaleBreasts(theChar) -> bool:
	return theChar.bodypartHasTrait(BodypartSlot.Breasts, PartTrait.BreastsMale)

func charHasFemaleBreasts(theChar) -> bool:
	return !theChar.bodypartHasTrait(BodypartSlot.Breasts, PartTrait.BreastsMale)

func getPossibleSteps(_char:BaseCharacter) -> Array:
	var result:Array = []
	
	if(_char.getFemininity() < 30 && _char.getGender() != Gender.Male):
		result.append("gender")
		
	if(_char.getFemininity() < 90):
		if(_char.hasPenis() && addedPenis):
			var penisLen = _char.getPenisSize()
			
			if(penisLen < 15):
				result.append("extendpenis")
	
	if(_char.getFemininity() < 60):
		if(charHasFemaleBreasts(_char) && !switchedbreasts):
			result.append("switchbreasts")

		var currentBreastSize:int = _char.getBreastsSize()
		
		if(currentBreastSize > BreastsSize.FLAT):
			result.append("decbreasts")
	
	if(!switchedhair && _char.getFemininity() < 50):
		var hairPart:Bodypart = _char.getBodypart(BodypartSlot.Hair)
		if(hairPart != null && hairPart.maleWeight < 0.6):
			result.append("switchhair")
	
	if(_char.getFemininity() < 40):
		if(_char.hasVagina() && !removedVag):
			if(!addedPenis):
				if(_char.hasPenis()):
					result.append("remvagina")
				else:
					result.append("vagtopenis")
		elif(!_char.hasPenis() && !addedPenis):
			result.append("growpenis")
	
	if(result.empty() && _char.getFemininity() > 0):
		if(_char.getFemininity() > 55):
			result.append("femdecfemale")
		else:
			result.append("femdec")
	
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
	
	if(nextStep == "femdec"):
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [-10]),
			]
		}
	
	if(nextStep == "femdecfemale"):
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [-RNG.randi_range(15, 25)]),
			]
		}
		
	if(nextStep == "gender"):
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [-5]),
				charEffect("gender", "GenderChange", [Gender.Male]),
			]
		}
	if(nextStep == "switchbreasts"):
		switchedbreasts = true
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [-5]),
				partEffect("breasts", BodypartSlot.Breasts, "SwitchPart", ["malebreasts"]),
			]
		}
	if(nextStep == "decbreasts"):
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [-5]),
				partEffect("breasts", BodypartSlot.Breasts, "BreastSizeChange", [-1]),
			]
		}
	if(nextStep == "switchhair"):
		switchedhair = true
		
		var theChar = getChar()
		var possiblePartIDs:Dictionary = Bodypart.findPossibleBodypartIDsDict(BodypartSlot.Hair, theChar, theChar.getSpecies(), NpcGender.Male)
		if(possiblePartIDs.empty()):
			return {}
		var newPartID:String = RNG.pickWeightedDict(possiblePartIDs)
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [-5]),
				partEffect("newpart", BodypartSlot.Hair, "SwitchPart", [newPartID]),
			]
		}
	if(nextStep == "extendpenis"):
#		var currentPenLen = getChar().getPenisSize()
#		var mod:float = 1.0
#		if(currentPenLen >= 20):
#			mod = 2.0
#		if(currentPenLen >= 30):
#			mod = 3.0
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [-10]),
				partEffect("penLen", BodypartSlot.Penis, "PenisLengthChange", [RNG.randi_range(3,5)]),
			]
		}
	if(nextStep == "remvagina"):
		addedPenis = true
		removedVag = true
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [-10]),
				partEffect("remvag", BodypartSlot.Vagina, "SwitchPart", [""]),
			]
		}
	if(nextStep == "vagtopenis"):
		addedPenis = true
		removedVag = true
		
		var theChar = getChar()
		var possiblePartIDs:Dictionary = Bodypart.findPossibleBodypartIDsDict(BodypartSlot.Penis, theChar, theChar.getSpecies(), NpcGender.Male)
		if(possiblePartIDs.has("")):
			possiblePartIDs.erase("")
		if(possiblePartIDs.empty()):
			return {}
		var newPartID:String = RNG.pickWeightedDict(possiblePartIDs)
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [-10]),
				partEffect("remvag", BodypartSlot.Vagina, "SwitchPart", [""]),
				partEffect("addpenis", BodypartSlot.Penis, "SwitchPart", [newPartID]),
			]
		}
	if(nextStep == "growpenis"):
		addedPenis = true
		removedVag = true
		
		var theChar = getChar()
		var possiblePartIDs:Dictionary = Bodypart.findPossibleBodypartIDsDict(BodypartSlot.Penis, theChar, theChar.getSpecies(), NpcGender.Male)
		if(possiblePartIDs.has("")):
			possiblePartIDs.erase("")
		if(possiblePartIDs.empty()):
			return {}
		var newPartID:String = RNG.pickWeightedDict(possiblePartIDs)
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [-10]),
				partEffect("addvag", BodypartSlot.Vagina, "SwitchPart", [newPartID]),
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
	
	
	if(step in ["femdec", "femdecfemale", "gender"]):
		playAnim(StageScene.Solo, "stand")
	else:
		playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["rv"] = removedVag
	data["ap"] = addedPenis
	data["sb"] = switchedbreasts
	data["sh"] = switchedhair
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	removedVag = SAVE.loadVar(_data, "rv", false)
	addedPenis = SAVE.loadVar(_data, "ap", false)
	switchedbreasts = SAVE.loadVar(_data, "sb", false)
	switchedhair = SAVE.loadVar(_data, "sh", false)
