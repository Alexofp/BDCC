extends TFBase

var lastStep:String = ""

func _init():
	id = "RandomTFs"

func getName() -> String:
	return "Random Transformations"

func getPillName() -> String:
	return "Unstable Mutagen"

func getTFCheckTags() -> Dictionary:
	return {
		"gender": true,
	}

#func getSexGoalWeightModifier(_sexGoalID:String) -> float:
#	if(_sexGoalID == SexGoal.FuckAnal):
#		return 100000.0
#	if(_sexGoalID == SexGoal.StraponAnal):
#		return 100000.0
#	return 0.0

func isPossibleFor(_char) -> bool:
	if(getPossibleSteps(_char).empty()):
		return false
	return true

func start(_args:Dictionary):
	pass

func getPossibleSteps(_char:BaseCharacter) -> Array:
	var result:Array = [
		"hair",
		"bodypart",
		"bodypart",
		"breastsize",
		"thick",
		"fem",
		"skin",
	]
	if(_char.hasPenis()):
		result.append("penlen")
	
	if(result.has(lastStep)):
		result.erase(lastStep)
	
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
	lastStep = nextStep
	
	if(nextStep == "fem"):
		return {
			step = nextStep,
			effects = [
				charEffect("fem", "AddFemininity", [RNG.randi_range(10, 20) if RNG.chance(50) else -RNG.randi_range(10, 20)]),
			]
		}
	if(nextStep == "thick"):
		return {
			step = nextStep,
			effects = [
				charEffect("thi", "AddThickness", [RNG.randi_range(7, 20) if RNG.chance(50) && getChar().getThickness() < 130 else -RNG.randi_range(7, 20)]),
			]
		}
	if(nextStep == "hair"):
		var theChar = getChar()
		var possiblePartIDs:Dictionary = Bodypart.findPossibleBodypartIDsDict(BodypartSlot.Hair, theChar, theChar.getSpecies(), theChar.calculateNpcGender())
		if(theChar.hasBodypart(BodypartSlot.Hair)):
			var currentPart:String = theChar.getBodypart(BodypartSlot.Hair).id
			if(possiblePartIDs.has(currentPart)):
				possiblePartIDs.erase(currentPart)
		if(possiblePartIDs.empty()):
			return {}

		var newPartID:String = RNG.pickWeightedDict(possiblePartIDs)
		return {
			step = nextStep,
			effects = [
				partEffect("newpart", BodypartSlot.Hair, "SwitchPart", [newPartID]),
			]
		}
		
	if(nextStep == "bodypart"):
		var theChar = getChar()
		var bodypartSlots:Array = BodypartSlot.getAll()
		bodypartSlots.erase(BodypartSlot.Body)
		
		var slot = RNG.pick(bodypartSlots)
		var possiblePartIDs:Array = GlobalRegistry.getBodypartsIdsBySlot(slot)#Bodypart.findPossibleBodypartIDsDict(BodypartSlot.Penis, theChar, theChar.getSpecies(), NpcGender.Male)
		if(possiblePartIDs.has("")):
			possiblePartIDs.erase("")
		if(slot in [BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Horns, BodypartSlot.Tail]):
			if(theChar.hasBodypart(slot)):
				possiblePartIDs.append("")
		if(theChar.hasBodypart(slot)):
			var currPenis:String = theChar.getBodypart(slot).id
			if(possiblePartIDs.has(currPenis)):
				possiblePartIDs.erase(currPenis)
		if(possiblePartIDs.empty()):
			return {}
		var newPartID:String = RNG.pick(possiblePartIDs)
		
		return {
			effects = [
				partEffect("newpart", slot, "SwitchPart", [newPartID]),
				charEffect("speciescalc", "SpeciesCalculate", []),
			]
		}
	if(nextStep == "breastsize"):
		var canDecrease:bool = getChar().hasNonFlatBreasts()
		return {
			step = nextStep,
			effects = [
				partEffect("breasts", BodypartSlot.Breasts, "BreastSizeChange", [RNG.randi_range(1, 3) if (RNG.chance(50) || !canDecrease) else -RNG.randi_range(1, 3)]),
			]
		}
	if(nextStep == "penlen"):
		var canDecrease:bool = getChar().getPenisSize() > 10
		return {
			step = nextStep,
			effects = [
				partEffect("penLen", BodypartSlot.Penis, "PenisLengthChange", [RNG.randi_range(1, 4) if (RNG.chance(50) || !canDecrease) else -RNG.randi_range(1, 4)]),
			]
		}
	if(nextStep == "skin"):
		var theChar = getChar()
		var pickedColors = TFUtil.getRandomColorsForSpecies(theChar.getSpecies())
		var pickedSkin = TFUtil.getRandomSkinForSpecies(theChar.getSpecies())
		return {
			step = nextStep,
			effects = [
				charEffect("skin", "SkinSet", [pickedSkin, pickedColors]),
			]
		}
	
	return {
	}

func reactProgressShort(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts(" ", false))
	var step:String = _result.getField("step", "")
	if(step == "skin"):
		addText("{npc.YourHis} colors begin to change rapidly.. making {npc.youHim} look very different.")
	
func reactProgress(_context:Dictionary, _result:TFResult):
	var step:String = _result.getField("step", "")
	
	#var stage:int = getStage()
	
	if(isFirstTime()):
		addText("Without warning, a jolt of energy surges through your body, leaving you breathless. Confusion and fear grip you as you realize something is happening against your will.")
	
	addText(_result.getAllTFTexts())
	if(step == "skin"):
		addText("{npc.YourHis} colors begin to change rapidly.. making {npc.youHim} look very different.")
	
	if(isFirstTime()):
		addText("What is happening with your body..")
	elif(getStage() % 5 == 0):
		addText("There is no pattern to these transformations.. they seem completely random..")
	
	if(step in ["feminc", "femincmale", "gender"]):
		playAnim(StageScene.Solo, "stand")
	else:
		playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["ls"] = lastStep
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	lastStep = SAVE.loadVar(_data, "ls", "")
