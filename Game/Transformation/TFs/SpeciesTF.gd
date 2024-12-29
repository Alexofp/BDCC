extends TFBase

var newSpecies = Species.Canine
var affectedSlots:Dictionary = {}

func _init():
	id = "SpeciesTF"

func getMaxStage() -> int:
	return 10

func start(_args:Dictionary):
	if(_args.has("species")):
		newSpecies = _args["species"]

func getSlotsLeft() -> Array:
	var result:Array = []
	for bodypartSlot in BodypartSlot.getAll():
		if(bodypartSlot in [BodypartSlot.Hair, BodypartSlot.Vagina, BodypartSlot.Anus]):
			continue
		if(affectedSlots.has(bodypartSlot)):
			continue
		result.append(bodypartSlot)
	return result

func hasAnySlotsLeftToTranform() -> bool:
	var theChar:BaseCharacter = getChar()
	var slotsLeft:Array = getSlotsLeft()
	for bodypartSlot in slotsLeft:
		var possiblePartIDs:Dictionary = Bodypart.findPossibleBodypartIDsDict(bodypartSlot, theChar, newSpecies if newSpecies is Array else [newSpecies])
		if(possiblePartIDs.empty()):
			continue
		
		var currentBodypart:Bodypart = theChar.getBodypart(bodypartSlot)
		var currPartID:String = "" if currentBodypart == null else currentBodypart.id
		
		if(!possiblePartIDs.has(currPartID)):
			return true
	return false
		
func canTransformFurther() -> bool:
	if(!hasAnySlotsLeftToTranform()):
		return false
	return true#!isMaxStage()
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 120
	return 240
	
func doProgress(_context:Dictionary) -> Dictionary:
	var theSlots:Array = getSlotsLeft()
	theSlots.shuffle()
	while(theSlots.size() > 0):
		var bodypartSlot = theSlots.pop_front()
		var theChar:BaseCharacter = getChar()
		
		var possiblePartIDs:Dictionary = Bodypart.findPossibleBodypartIDsDict(bodypartSlot, theChar, newSpecies if newSpecies is Array else [newSpecies])
		if(possiblePartIDs.empty()):
			continue
		
		var currentBodypart:Bodypart = theChar.getBodypart(bodypartSlot)
		var currPartID:String = "" if currentBodypart == null else currentBodypart.id
		
		if(possiblePartIDs.has(currPartID)):
			continue
		
		var newPartID:String = RNG.pickWeightedDict(possiblePartIDs)
		affectedSlots[bodypartSlot] = true
		
		return {
			slot = bodypartSlot,
			effects = [
				partEffect("newpart", bodypartSlot, "SwitchPart", [newPartID]),
				charEffect("speciescalc", "SpeciesCalculate", []),
			]
		}
	return {}

func reactProgress(_context:Dictionary, _result:TFResult):
	var slot = _result.getField("slot", BodypartSlot.Body)
	
#	if(isFirstTime()):
#		addText(("Something is happening to your chest.."))
#	else:
#		addText("A sudden warmth envelops your chest, and you feel an electrifying tingling sensation that sends shivers down your spine.")
#
	addText(_result.getAllTFTexts())
	
	
	if(slot in [BodypartSlot.Head, BodypartSlot.Ears, BodypartSlot.Hair, BodypartSlot.Horns]):
		playAnim(StageScene.Solo, "struggle_gag")
	elif(slot == BodypartSlot.Legs):
		playAnim(StageScene.Solo, "struggle_legs")
	elif(slot in [BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]):
		playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	else:
		playAnim(StageScene.Solo, "struggle", {bodyState={naked=true}})
	
#	if(isFirstTime()):
#		addText("Wow.. You can't help but to grope your new chest a little, your nips more sensitive.. You now have {pc.breasts}.")
#	else:
#		addText("You cup your new tits and give your nips a few rubs.. You now have {pc.breasts}.")
#
	#addText("THEN WE SWITCH LEGS.")
	#addText(_result.getTFText("legs"))
	#addText("AND ALSO MAKE YOU MORE THICK.")
	#addText(_result.getTFText("thick"))
#
#func onSexEvent(_event : SexEvent):
#	var _npc = getChar()
#	if(_event.getType() in [SexEvent.BreastFeeding, SexEvent.BreastsGroped, SexEvent.BreastsPumpMilked]):
#		if(_event.getTargetChar() == _npc):
#			accelerateTimer(0.5)
