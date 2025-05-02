extends Reference
class_name TFBase

var id:String = "error"
var holderRef:WeakRef
var uniqueID:int = -1
var canceled:bool = false

var stage:int = 0
var timer:int = 0

const TFTYPE_CHAR = 0
const TFTYPE_PART = 1

var tfTexts:Array = [] # no save
var reactResultData:Dictionary = {} # no save
var pillGenWeight:float = 1.0 # no save
var pointsOnUnlock:int = 10
var canStack:bool = false # allow more than one of the same tf

func saveData() -> Dictionary:
	return {
		uID = uniqueID,
		stage = stage,
		timer = timer,
		canceled = canceled,
	}

func loadData(_data:Dictionary):
	uniqueID = SAVE.loadVar(_data, "uID", -1)
	stage = SAVE.loadVar(_data, "stage", 0)
	timer = SAVE.loadVar(_data, "timer", 0)
	canceled = SAVE.loadVar(_data, "canceled", false)

func canBeStartedFromDebugMenu() -> bool:
	return true

func start(_args:Dictionary):
	pass

func startFinal(_args:Dictionary):
	resetTimer()
	start(_args)

func setHolder(_holder):
	holderRef = weakref(_holder)

func getHolder():
	if(holderRef == null):
		return null
	return holderRef.get_ref()

func getChar() -> BaseCharacter:
	var theHolder = getHolder()
	if(theHolder == null):
		return null
	return theHolder.getChar()

func getName() -> String:
	return id

func getPillName() -> String:
	return getName()

func getPillFluidsRequired() -> Dictionary:
	return {
		"Milk": 50.0,
	}

func getPillOptions() -> Dictionary:
	return {
#		"test": {
#			name = "Meow",
#			desc = "Meow meow.",
#			value = "test",
#			values = [
#				["test", "Test!"],
#				["test2", "Test 2!"],
#			],
#		},
	}

func getPillCanConfigure() -> bool:
	return !getPillOptions().empty()

func getPillDatabaseDesc() -> String:
	return "FILL ME"

# Can't start a tf if we already have one with at least one shared tag
func getTFCheckTags() -> Dictionary:
	return {}

func isPossibleFor(_char) -> bool:
	return true

func shouldCancelItself() -> bool:
	return false#!isPossibleFor(getChar())

func shouldCancelItselfFinal() -> bool:
	return canceled || shouldCancelItself()

func canTransformFurther() -> bool:
	return !isMaxStage()

func canBeTested() -> bool:
	return !canTransformFurther()

func isReadyToProgress() -> bool:
	return (timer <= 0)

func isReadyToProgressFinal() -> bool:
	return canTransformFurther() && isReadyToProgress()

func setTimer(newTime:int):
	timer = newTime

func getTimer() -> int:
	return timer

func accelerateTimerSeconds(howMuch:int):
	timer -= howMuch

func accelerateTimer(share:float, minDecrease:int = 600):
	var newTimer:int = int(float(timer) * (1.0 - clamp(share, 0.0, 1.0)))
	var howMuchRemoved:int = timer - newTimer
	if(howMuchRemoved < minDecrease):
		howMuchRemoved = minDecrease
	timer -= howMuchRemoved

func getTimerForStage(_theStage:int) -> int:
	return 240

func getTimerDeviation() -> float:
	return 0.7

func resetTimer():
	var deviation:float = getTimerDeviation()
	setTimer( int(round(float(getTimerForStage(getStage())) * (1.0 + RNG.randf_range(-deviation, deviation)))) )

func doProgressFinal(_context:Dictionary) -> Dictionary:
	timer = 999999
	return doProgress(_context)

func doProgress(_context:Dictionary) -> Dictionary:
	return {
		effects = [],
	}

func reactProgress(_context:Dictionary, _result:TFResult):
	var resultText:String = _result.getAllTFTexts()
	if(resultText != ""):
		addText(resultText)
	else:
		addText("Nothing happened")
	
func reactProgressFinal(_context:Dictionary, _result:TFResult):
	tfTexts.clear()
	reactResultData.clear()
	reactProgress(_context, _result)
	var reactDialogue:String = getReactionDialogueLine(_context, _result)
	if(!_result.getField("noStageAdvance", false)):
		stage += 1
	resetTimer()
	return {text=Util.join(tfTexts, "\n\n"), anim=(reactResultData["anim"] if reactResultData.has("anim") else []), say=reactDialogue}

func reactProgressShort(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts(" ", false))

func reactProgressShortFinal(_context:Dictionary, _result:TFResult):
	tfTexts.clear()
	reactResultData.clear()
	reactProgressShort(_context, _result)
	var reactDialogue:String = getReactionDialogueLine(_context, _result)
	stage += 1
	resetTimer()
	return {text=Util.join(tfTexts, " "),say=reactDialogue}

func getReactionDialogueLine(_context:Dictionary, _result:TFResult) -> String:
	if(isFirstTime() || RNG.chance(30)):
		if(charLovesTF()):
			return RNG.pick([
				"Oh, sweet!",
				"This is amazing!",
				"I can't believe this is happening!",
				"Yes! Finally!",
				"This feels incredible!",
				"This feels nice..",
				"More! I want more of this.",
				"I'm such a slut for transformations..",
				"Yes, transform me, change my body until I can't recognize it..",
				"I love how it feels..",
				"I crave more..",
				"I hope this will never end..",
			])
		elif(charLikesTF()):
			return RNG.pick([
				"Interesting..",
				"Quite fascinating..",
				"I didn’t expect this..",
				"Hmm.. wow..",
				"I changed..",
				"Hah.. that feels funny.",
				"Doesn't feel too bad..",
				"Could I get used to this?",
				"A bit odd.. but nothing I can't handle.",
				"I'm curious to see what happens next.",
				"I can see the appeal..",
				"Not too bad.",
			])
		elif(charHatesTF()):
			return RNG.pick([
				"No, no no, fuck no!",
				"What the fuck is happening?",
				"No, no, no, I hate it!",
				"Fuck.. Give me my old self back!",
				"NO! What the fuck!?",
				"Stop.. I hate how it feels..",
				"Ugh, this makes me sick.",
				"What the.. Undo this.. How do I undo this shit..",
				"Really.. This is the worst.",
			])
		elif(charDislikesTF()):
			return RNG.pick([
				"I don't.. like this.",
				"This.. doesn't feel good already..",
				"Oh no, how do I stop this..",
				"This isn't what I wanted..",
				"I don't want to go through this..",
				"How do I undo this.. I want my old body..",
				"What is happening.. That's not what I signed up for.",
				"Oh.. how do I.. become normal again..",
				"What is happening.. Why.. ",
			])
		else:
			return RNG.pick([
				"What is happening..",
				"I don't understand..",
				"What? How did this happen?",
				"This is so weird..",
				"Feels so strange.. what is happening..",
				"I feel like I'm losing my mind.",
				"What kind of madness is this?",
				"This is beyond strange..",
			])
	return ""

func getStage() -> int:
	return stage

func isFirstTime() -> bool:
	return stage == 0

func getMaxStage() -> int:
	return 1

func isMaxStage() -> bool:
	return getStage() >= getMaxStage()

func processTime(_seconds:int):
	timer -= _seconds

func onSexEvent(_event : SexEvent):
	pass

func canUnlockAsPill() -> bool:
	return pillGenWeight > 0.0

func getUnlockData() -> Dictionary:
	return {
		eliza = "Not sure what exactly it does. But I'm gonna call it.. "+getPillName()+". I think that name will fit it nicely.",
#		tryOptions = [
#			{
#				name = "Try",
#				desc = "Use it yourself",
#				sceneID = "ASDScene",
#			},
#			{
#				name = "Let Eliza try",
#				desc = "Let Eliza try this pill",
#				sceneID = "ASDScene",
#			},
#			{
#				name = "Nope",
#				desc = "This is a disabled option",
#				sceneID = "ASDASD",
#				disabled = true,
#			},
#		],
	}

func getBuffs() -> Array:
	return []

func buff(buffid, args = []) -> BuffBase:
	var buff: BuffBase = GlobalRegistry.createBuff(buffid)
	buff.initBuff(args)
	return buff

func playAnim(anim:String, animState:String, args:Dictionary={}):
	reactResultData["anim"] = [anim, animState, args]

func doCancelDelayed():
	canceled = true

func charDislikesTF() -> bool:
	var theChar:BaseCharacter = getChar()
	var fetishHolder:FetishHolder = theChar.getFetishHolder()
	
	if(fetishHolder == null):
		return false
	
	return fetishHolder.getFetishValue(Fetish.TFReceiving) < 0.0

func charLikesTF() -> bool:
	var theChar:BaseCharacter = getChar()
	var fetishHolder:FetishHolder = theChar.getFetishHolder()
	
	if(fetishHolder == null):
		return false
	
	return fetishHolder.getFetishValue(Fetish.TFReceiving) > 0.0 || theChar.getForcedObedienceLevel() > 0.01

func charLovesTF() -> bool:
	var theChar:BaseCharacter = getChar()
	var fetishHolder:FetishHolder = theChar.getFetishHolder()
	
	if(fetishHolder == null):
		return false
	
	return fetishHolder.getFetishValue(Fetish.TFReceiving) > 0.5 || theChar.getForcedObedienceLevel() > 0.8

func charHatesTF() -> bool:
	var theChar:BaseCharacter = getChar()
	var fetishHolder:FetishHolder = theChar.getFetishHolder()
	
	if(fetishHolder == null):
		return false
	
	return fetishHolder.getFetishValue(Fetish.TFReceiving) < -0.5

func getPillGenWeight() -> float:
	return pillGenWeight

func canChangeWeight() -> bool:
	return getPillGenWeight() > 0.0

func generatePillArgs() -> Dictionary:
	return {}

func getSexGoalWeightModifier(_sexGoalID:String) -> float:
	return 0.0

func getUnlockPointsAward() -> int:
	return pointsOnUnlock

func getTestingPointsAward() -> int:
	return pointsOnUnlock * 3

func addText(theText:String):
	if(theText == ""):
		return
	#getHolder().addTextToReactQueue(theText)
	tfTexts.append(theText)

func canTFStack() -> bool:
	return canStack

func effect(_effectID:String, _args:Array = [], bodypartSlot:String = ""):
	var theEffect:TFEffect = GlobalRegistry.createTransformationEffect(_effectID)
	theEffect.tfID = uniqueID
	if(bodypartSlot != ""):
		theEffect.setBodypartSlot(bodypartSlot)
	theEffect.initArgs(_args)
	return theEffect

func partEffect(theid:String, part:String, effectID:String, args:Array = []) -> Dictionary:
	return {
		id = theid,
		type = TFTYPE_PART,
		part = part,
		effect = effect(effectID, args, part),
	}
	
func charEffect(theid:String, effectID:String, args:Array = []) -> Dictionary:
	return {
		id = theid,
		type = TFTYPE_CHAR,
		effect = effect(effectID, args),
	}
