extends TFBase

var noPenisShrink:bool = false
var switchedbreasts:bool = false
var switchedhair:bool = false
var nipsStage:int = 0
var anusStage:int = 0
var penisStage:int = 0

func _init():
	id = "Sissification"
	
	pointsOnUnlock = 15

func getName() -> String:
	return "Sissification"

func getPillName() -> String:
	return "SissyMoldPro"

func getUnlockData() -> Dictionary:
	return {
		eliza = "Ooh, what do we have here! You found such a little gem. This pill looks like it's packed with estrogen.. a very targeted kind of estrogen that doesn't replace testosterone.. but suppresses it instead. When taken, it will probably enhance those softer, more feminine traits while making you crave a little more submission. So much fun! I will call it.. 'SissyMoldPro'! Because it does just that~.",
	}

func getPillDatabaseDesc() -> String:
	return "This drug will transform you into a sissy slut. It will achieve that by doing the following:\n- Make your body at least 75% thick.\n- Shrink the length of your penis until it is below 10cm.\n- Switch your hair to a more feminine one.\n- Switch pecs for round breasts.\n- If you have a flat chest, give you ‘A-cup’ breasts.\n- Make your anus more sensitive.\n- Make your nipples more sensitive.\n- Make your penis [b]less[/b] sensitive.\n\nThe drug will only begin its effects if you have a penis with a length of at least 11cm. The first stage will happen after about 15 minutes. After that, the next ones will happen roughly every 10 hours. This could only be accelerated by using the QuickShift drug or by making the test subject [b]orgasm[/b].\n\nThis drug doesn’t have a set amount of stages. It will reach its final stage when there is nothing left to transform. It's possible to disable the penis shrinking aspect of this drug by using the advanced lab equipment.\n\nBeing under the effects of this transformation will make others more likely to want to have anal sex with you."

func getTFCheckTags() -> Dictionary:
	return {
		"gender": true,
	}

func getPillFluidsRequired() -> Dictionary:
	return {
		"Cum": 3000.0,
	}

func getSexGoalWeightModifier(_sexGoalID:String) -> float:
	if(_sexGoalID == SexGoal.FuckAnal):
		return 5.0
	if(_sexGoalID == SexGoal.StraponAnal):
		return 5.0
	if(_sexGoalID == SexGoal.GropeBreasts):
		return 5.0
	return 0.0

func isPossibleFor(_char) -> bool:
	if(!_char.hasPenis() || _char.getPenisSize() < 10):
		return false
	if(getPossibleSteps(_char).empty()):
		return false
	return true

func start(_args:Dictionary):
	if(_args.has("noPenisShrink")):
		noPenisShrink = _args["noPenisShrink"]

func getPillOptions() -> Dictionary:
	return {
		"noPenisShrink": {
			name = "Penis shrinking",
			desc = "Should the drug make the penis smaller",
			value = false,
			values = [[false, "Enabled"], [true, "Disabled"]],
		},
	}

func charHasMaleBreasts(theChar) -> bool:
	return theChar.bodypartHasTrait(BodypartSlot.Breasts, PartTrait.BreastsMale)

func getPossibleSteps(_char:BaseCharacter) -> Array:
	var result:Array = []
	
	var fem:int = _char.getFemininity()
	var thick:int = _char.getThickness()
	
	if(fem < 80 || thick < 75):
		result.append("femthick")
	
	if(fem > 20 && _char.hasPenis() && _char.getPenisSize() > 10 && !noPenisShrink):
		result.append("shrinkpenis")
	
	if(!switchedhair && fem > 70):
		var hairPart:Bodypart = _char.getBodypart(BodypartSlot.Hair)
		if(hairPart != null && hairPart.femaleWeight < 0.6):
			result.append("switchhair")
	
	if(fem > 30):
		if(fem > 70 && charHasMaleBreasts(_char) && !switchedbreasts):
			result.append("switchbreasts")
		var goodBreastSize:int = BreastsSize.A
		var currentBreastSize:int = _char.getBreastsSize()
		
		if(currentBreastSize < goodBreastSize):
			result.append("incbreasts")
	
	if(fem > 30 && anusStage < 3):
		result.append("anusSen")
	
	if(fem > 30 && nipsStage < 3):
		result.append("nipSen")
	
	if(fem > 30 && penisStage < 3):
		result.append("penSen")
	
	return result

func canTransformFurther() -> bool:
	if(!getPossibleSteps(getChar()).empty()):
		return true
	return false
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 500
	return 60*60*10
	
func doProgress(_context:Dictionary) -> Dictionary:
	var allSteps:Array = getPossibleSteps(getChar())
	if(allSteps.empty()):
		return {}
	var nextStep:String = RNG.pick(allSteps)
	
	var theChar = getChar()
	
	if(nextStep == "femthick"):
		var effects:Array = []
		var fem:int = theChar.getFemininity()
		var thick:int = theChar.getThickness()
		
		if(fem < 80):
			effects.append(charEffect("fem", "AddFemininity", [RNG.randi_range(7, 13)]))
		
		if(thick < 75):
			effects.append(charEffect("thi", "AddThickness", [RNG.randi_range(7, 13)]))
		
		return {
			step = nextStep,
			effects = effects,
		}
	
	if(nextStep == "shrinkpenis"):
		var currentPenLen = getChar().getPenisSize()
		var mod:float = 1.0
		if(currentPenLen >= 20):
			mod = 2.0
		if(currentPenLen >= 30):
			mod = 3.0
			
		var penStageInc:bool = false
		if(penisStage < 3 && RNG.chance(50)):
			penisStage += 1
			penStageInc = true
			theChar.increaseBodypartSensitivity(BodypartSlot.Penis, -0.2*penisStage)
		
		var toRemove:float = -RNG.randf_range(2,4)*mod
		if(currentPenLen+toRemove <= 10.0):
			toRemove = 10.0 - currentPenLen
		
		return {
			step = nextStep,
			penStageInc = penStageInc,
			effects = [
				#charEffect("fem", "AddFemininity", [10]),
				partEffect("penLen", BodypartSlot.Penis, "PenisLengthChange", [toRemove]),
			]
		}
	
	if(nextStep == "switchbreasts"):
		var nipStageInc:bool = false
		if(nipsStage < 3 && RNG.chance(100)):
			nipsStage += 1
			nipStageInc = true
			theChar.increaseBodypartSensitivity(BodypartSlot.Breasts, 0.2*nipsStage)
		switchedbreasts = true
		return {
			step = nextStep,
			nipStageInc = nipStageInc,
			effects = [
				charEffect("fem", "AddFemininity", [5]),
				partEffect("breasts", BodypartSlot.Breasts, "SwitchPart", ["humanbreasts"]),
			]
		}
	if(nextStep == "incbreasts"):
		var nipStageInc:bool = false
		if(nipsStage < 3 && RNG.chance(100)):
			nipsStage += 1
			nipStageInc = true
			theChar.increaseBodypartSensitivity(BodypartSlot.Breasts, 0.2*nipsStage)
		
		return {
			step = nextStep,
			nipStageInc = nipStageInc,
			effects = [
				charEffect("fem", "AddFemininity", [5]),
				partEffect("breasts", BodypartSlot.Breasts, "BreastSizeChange", [1]),
			]
		}
	if(nextStep == "switchhair"):
		switchedhair = true
		
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

	if(nextStep == "anusSen"):
		anusStage += 1
		theChar.increaseBodypartSensitivity(BodypartSlot.Anus, 0.2*anusStage)
		return {
			step = nextStep,
			anusStageInc = true,
			effects = [
			]
		}

	if(nextStep == "nipSen"):
		nipsStage += 1
		theChar.increaseBodypartSensitivity(BodypartSlot.Breasts, 0.2*nipsStage)
		return {
			step = nextStep,
			nipStageInc = true,
			effects = [
			]
		}

	if(nextStep == "penSen"):
		penisStage += 1
		theChar.increaseBodypartSensitivity(BodypartSlot.Penis, -0.2*penisStage)
		return {
			step = nextStep,
			penStageInc = true,
			effects = [
			]
		}
	
	return {
	}

func reactProgressShort(_context:Dictionary, _result:TFResult):
	.reactProgressShort(_context, _result)
	
	if(_result.getField("penStageInc", false)):
		addText("{npc.YourHis} penis is now less sensitive!")
	
	if(_result.getField("nipStageInc", false)):
		addText("{npc.YourHis} nipples are now more sensitive!")
	
	if(_result.getField("anusStageInc", false)):
		addText("{npc.YourHis} anus is now more sensitive!")

func reactProgress(_context:Dictionary, _result:TFResult):
	var step:String = _result.getField("step", "")
	
	#var stage:int = getStage()
	
	if(isFirstTime()):
		addText("Without warning, a jolt of energy surges through your body, leaving you breathless. Confusion and fear grip you as you realize something is happening against your will.")
	
	addText(_result.getAllTFTexts())
	
	if(_result.getField("penStageInc", false)):
		if(penisStage == 1):
			addText(RNG.pick([
				"A shiver runs through {npc.youHim} as an unsettling coldness spreads through {npc.yourHis} cock. A feeling of.. dullness.. is creeping in.. making {npc.yourHis} member less and less sensitive. Good girls only need to focus on pleasing others anyway..",
			]))
		elif(penisStage == 2):
			addText(RNG.pick([
				"A shiver runs through {npc.youHim} as an unsettling coldness spreads through {npc.yourHis} cock. A feeling of.. dullness.. is creeping in.. making {npc.yourHis} member less and less sensitive. {npc.YouHe} {npc.youVerb('don', 'doesn')}'t need it anyway..",
			]))
		else:
			addText(RNG.pick([
				"A shiver runs through {npc.youHim} as a pleasing coolness spreads through {npc.yourHis} prick. A feeling of.. dullness.. is creeping in.. making {npc.yourHis} member less and less sensitive. {npc.YourHis} cock is now almost almost useless.."+(" Good.. It's caged away already anyway." if getChar().isWearingChastityCage() else " Maybe {npc.youHe} should cage it away so {npc.youHe} wouldn't have to worry about it?")
			]))
	if(_result.getField("nipStageInc", false)):
		if(nipsStage == 1):
			addText(RNG.pick([
				"A shiver runs through {npc.youHim} as a warm wave of sensation spreads through {npc.yourHis} nipples. A delightful tingling begins to build in {npc.yourHis} sensitive buds, making them crave attention.",
			]))
		elif(nipsStage == 2):
			addText(RNG.pick([
				"A shiver runs through {npc.youHim} as a warm wave of sensation spreads through {npc.yourHis} nipples. They get incredible stiff just from rubbing them a bit.. and it feels so good.",
			]))
		else:
			addText(RNG.pick([
				"A shiver runs through {npc.youHim} as a thrilling warmth envelops {npc.yourHis} nipples. They are now incredibly sensitive, just begging to be played with!"
			]))
	if(_result.getField("anusStageInc", false)):
		if(anusStage == 1):
			addText(RNG.pick([
				"A shiver runs through {npc.youHim} as a warm wave of sensation spreads through {npc.yourHis} anus. A delightful tingling begins to build, awakening {npc.yourHis} new sensitive spot.. {npc.yourHis} prostate.. making it crave attention.",
			]))
		elif(anusStage == 2):
			addText(RNG.pick([
				"A shiver runs through {npc.youHim} as a thrilling warmth envelops {npc.yourHis} anus. It tightens and quivers with every touch, begging for something to fill it up and bring sweet pleasure.",
			]))
		else:
			addText(RNG.pick([
				"A shiver runs through {npc.youHim} as an overwhelming wave of ecstasy washes over {npc.yourHis} anus. {npc.YourHis} prostate is now incredibly sensitive, practically begging to be destroyed by a cock, ready to unleash waves of pleasure with every thrust!"
			]))
	
	if(isFirstTime()):
		addText("What is happening with your body..")
	else:
		if(getPossibleSteps(getChar()).empty()):
			addText("After all that, a sudden wave of realization washes over {npc.youHim}. {npc.YouHe} {npc.youAre} now a perfect sissy! {npc.YouHe} just need to take some MorphIn and make these changes permanent..")
	
	
	if(step in ["shrinkpenis"]):
		playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	else:
		playAnim(StageScene.Solo, "stand")
		
func getBuffs() -> Array:
	var result:Array = []
	
	if(nipsStage >= 1):
		result.append_array([
			buff(Buff.SensitivityGainBuff, [BodypartSlot.Breasts, 15*nipsStage]),
		])
	if(anusStage >= 1):
		result.append_array([
			buff(Buff.SensitivityGainBuff, [BodypartSlot.Anus, 10*anusStage*anusStage]),
			buff(Buff.GenitalElasticityBuff, [20*anusStage]),
		])
	if(penisStage >= 1):
		result.append_array([
			buff(Buff.SensitivityRestoreBuff, [BodypartSlot.Penis, -10*penisStage*penisStage]),
			buff(Buff.OverstimulationThresholdBuff, [BodypartSlot.Penis, -5*penisStage*penisStage]),
		])
			
	return result
	
func onSexEvent(_event : SexEvent):
	var _npc = getChar()
	if(_event.getType() in [SexEvent.Orgasmed]):
		if(_event.getTargetChar() == _npc):
			accelerateTimer(1.0)
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["sb"] = switchedbreasts
	data["sh"] = switchedhair
	data["ns"] = nipsStage
	data["as"] = anusStage
	data["ps"] = penisStage
	data["nps"] = noPenisShrink
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	switchedbreasts = SAVE.loadVar(_data, "sb", false)
	switchedhair = SAVE.loadVar(_data, "sh", false)
	nipsStage = SAVE.loadVar(_data, "ns", 0)
	anusStage = SAVE.loadVar(_data, "as", 0)
	penisStage = SAVE.loadVar(_data, "ps", 0)
	noPenisShrink = SAVE.loadVar(_data, "nps", false)
