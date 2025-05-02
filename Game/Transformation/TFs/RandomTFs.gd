extends TFBase

var lastStep:String = ""
var howOftenTime:int = -1

func _init():
	id = "RandomTFs"
	
	pointsOnUnlock = 50

func getName() -> String:
	return "???"

func getPillName() -> String:
	return "Unstable Mutagen"

func getUnlockData() -> Dictionary:
	return {
		eliza = "Interesti-.. wait.. The heck is this. Wow. Wow! It's changing! Like.. the molecular structure of this drug is changing as we speak. I honestly have no idea if this is even safe to injest.. it could do anything. It's not even a drug at that point, it's just a concentrated dose of 'Unstable mutagen'.",
	}

func getPillDatabaseDesc() -> String:
	return "This drug will cause a random effect. The list of possible effects:\n- Random hair.\n- Random body part morphing into a different body part.\n- Breast size increase or decrease.\n- Penis length increase or decrease.\n- Femininity increase or decrease.\n- Body thickness increase or decrease.\n- Random colors and skin.\n\nThe first stage will happen after about 15 minutes. After that, the next ones will happen roughly every 25 hours. This could only be accelerated by using the QuickShift drug.\n\nThis drug doesn’t have a set amount of stages. It will gradually morph your body forever and can only be stopped by the MorphIn or MorphOut drugs. It's possible to alter the frequency of mutations by using the advanced lab equipment."

func getTFCheckTags() -> Dictionary:
	return {
		"gender": true,
	}

func getPillFluidsRequired() -> Dictionary:
	return {
		"Cum": 2000.0,
		"Milk": 5000.0,
		"WhiteGoo": 50.0,
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
	if(_args.has("howOftenTime")):
		howOftenTime = _args["howOftenTime"]

func getPillOptions() -> Dictionary:
	return {
		"howOftenTime": {
			name = "Frequency",
			desc = "How often should the changes happen",
			value = 60*60*25,
			values = [
				[60*10, "10 minutes"],
				[60*30, "30 minutes"],
				[60*60, "1 hour"],
				[60*60*2, "2 hours"],
				[60*60*6, "6 hours"],
				[60*60*12, "12 hours"],
				[60*60*25, "25 hours"],
				[60*60*50, "50 hours"],
				[60*60*100, "100 hours"],
			],
		},
	}

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
	
func canBeTested() -> bool:
	return stage >= 5
	
func getTimerForStage(_theStage:int) -> int:
	if(howOftenTime > 0):
		return howOftenTime
	if(_theStage == 0):
		return 900
	return 60*60*25
	
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
			step = nextStep,
			bodypartSlot = slot,
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
	
	if(step in ["hair"]):
		playAnim(StageScene.TFLook, "head")
	elif(step in ["breastsize"]):
		playAnim(StageScene.TFLook, "breasts", {bodyState={exposedChest=true}})
	elif(step in ["bodypart"]):
		var bodypartSlot:String = _result.getField("bodypartSlot", "")
		if(bodypartSlot in [BodypartSlot.Head, BodypartSlot.Hair, BodypartSlot.Ears, BodypartSlot.Horns]):
			playAnim(StageScene.TFLook, "head")
		elif(bodypartSlot in [BodypartSlot.Vagina, BodypartSlot.Penis, BodypartSlot.Tail]):
			playAnim(StageScene.TFLook, "crotch", {bodyState={exposedCrotch=true,hard=true}})
		elif(bodypartSlot in [BodypartSlot.Anus, BodypartSlot.Legs]):
			playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
		elif(bodypartSlot in [BodypartSlot.Breasts]):
			playAnim(StageScene.TFLook, "breasts", {bodyState={exposedChest=true}})
		else:
			playAnim(StageScene.TFLook, "hands")
	elif(step in ["skin"]):
		playAnim(StageScene.TFLook, "hands", {bodyState={naked=true}})
	else:
		playAnim(StageScene.TFLook, "hands")
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["ls"] = lastStep
	data["hot"] = howOftenTime
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	lastStep = SAVE.loadVar(_data, "ls", "")
	howOftenTime = SAVE.loadVar(_data, "hot", -1)
