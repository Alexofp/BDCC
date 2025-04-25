extends TFBase

var removedVag:bool = false
var addedPenis:bool = false
var switchedbreasts:bool = false
var switchedhair:bool = false

func _init():
	id = "Masculinization"
	
	pointsOnUnlock = 15

func getName() -> String:
	return "Masculinization"

func getPillName() -> String:
	return "TestosteGo"

func getUnlockData() -> Dictionary:
	return {
		eliza = "Interesting! This pill appears to contain a potent mix of testosterone boosters and androgenic compounds that could promote masculinization. When ingested, it will probably initiate the transformation of female characteristics into male ones.. all of the characteristics. I think I’ll call it.. 'TestosteGo.' Yes.. It will give you balls~.",
	}

func getPillDatabaseDesc() -> String:
	return "This drug will turn you into a guy. It will achieve that by doing the following:\n- Increasing your overall masculinity.\n- Changing the shape of your chest from round breasts to a more masculine set of pecs.\n- Gradually decrease your breast size until your chest is completely flat.\n- Morph away your vagina if you have one.\n- Grow a penis and gradually increase its length until it's at least 15cm.\n- Changing your haircut to a more masculine one.\n\nThe first stage will happen after a few minutes. After that, the next ones will happen roughly every 10 hours. This could be accelerated by using the QuickShift drug or by making the test subject [b]orgasm[/b].\n\nThis drug doesn’t have a set amount of stages. It will reach its final stage when there is nothing left to transform. It’s possible to disable some of the effects of this drug by using advanced lab equipment."

func getTFCheckTags() -> Dictionary:
	return {
		"gender": true,
		"breasts": true,
	}

func getPillFluidsRequired() -> Dictionary:
	return {
		"Milk": 2500.0,
	}

func isPossibleFor(_char) -> bool:
	if(getPossibleSteps(_char).empty()):
		return false
	return true

func start(_args:Dictionary):
	if(_args.has("addPenis")):
		addedPenis = !_args["addPenis"]
	if(_args.has("removeVag")):
		removedVag = !_args["removeVag"]
	if(_args.has("switchBreasts")):
		switchedbreasts = !_args["switchBreasts"]
	if(_args.has("switchHair")):
		switchedhair = !_args["switchHair"]

func getPillOptions() -> Dictionary:
	return {
		"addPenis": {
			name = "Grow penis",
			desc = "Should the drug grow a fully-functional penis",
			value = true,
			values = [[true, "Yes"], [false, "No"]],
		},
		"removeVag": {
			name = "Remove pussy",
			desc = "Should the drug remove the vagina",
			value = true,
			values = [[true, "Yes"], [false, "No"]],
		},
		"switchBreasts": {
			name = "Male breasts",
			desc = "Should the drug morph female breasts to male pecs",
			value = true,
			values = [[true, "Yes"], [false, "No"]],
		},
		"switchHair": {
			name = "Switch hair",
			desc = "Should the drug grow male hair (only if it's not male already)",
			value = true,
			values = [[true, "Yes"], [false, "No"]],
		},
	}

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
		return 200
	return 60*60*10
	
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
	
	
	if(step in ["extendpenis", "remvagina", "vagtopenis", "growpenis"]):
		playAnim(StageScene.TFLook, "crotch", {bodyState={exposedCrotch=true,hard=true}})
	elif(step in ["switchbreasts", "decbreasts"]):
		playAnim(StageScene.TFLook, "breasts", {bodyState={exposedChest=true}})
	elif(step in ["switchhair"]):
		playAnim(StageScene.TFLook, "head")
	else:
		playAnim(StageScene.TFLook, "hands")
	
func onSexEvent(_event : SexEvent):
	var _npc = getChar()
	if(_event.getType() in [SexEvent.Orgasmed]):
		if(_event.getTargetChar() == _npc):
			accelerateTimer(1.0)
	
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
