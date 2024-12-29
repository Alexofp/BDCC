extends TFBase

var didChangeBreasts:bool = false

# Will increase your breasts 2 times
# +1 size
# +2 sizes

func _init():
	id = "TestTF"

func getMaxStage() -> int:
	if(didChangeBreasts):
		return 3
	return 2

func charHasMaleBreasts() -> bool:
	var theChar = getChar()
	if(theChar == null):
		return false
	return theChar.bodypartHasTrait(BodypartSlot.Breasts, PartTrait.BreastsMale)

func canTransformFurther() -> bool:
	if(!didChangeBreasts && charHasMaleBreasts()):
		return true
	return !isMaxStage()
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 120
	return 240
	
func doProgress(_context:Dictionary) -> Dictionary:
	if(isFirstTime()):
		return {
			effects = [
				partEffect("breasts", BodypartSlot.Breasts, "BreastSizeInc"),
				#partEffect("legs", BodypartSlot.Legs, "SwitchPart", ["plantilegs"]),
				#partEffect("hair", BodypartSlot.Hair, "SwitchPart", ["manehair"]),
				#charEffect("thick", "AddThickness", [10]),
				#charEffect("asd", "SpeciesReplace", [[Species.Human, Species.Feline, Species.Canine]]),
				#partEffect("nohorns", BodypartSlot.Horns, "SwitchPart", [null]),
				#partEffect("testpenis", BodypartSlot.Penis, "SwitchPart", [null]),
				#partEffect("testvag", BodypartSlot.Vagina, "SwitchPart", ["vagina"]),
			]
		}
	if(charHasMaleBreasts() && !didChangeBreasts):
		didChangeBreasts = true
		return {
			#noStageAdvance = true,
			effects = [
				partEffect("breasts", BodypartSlot.Breasts, "SwitchPart", ["humanbreasts"]),
			]
		}
	return {
		effects = [
			partEffect("breasts", BodypartSlot.Breasts, "BreastSizeInc", [2]),
			#partEffect("testpenis", BodypartSlot.Penis, "SwitchPart", ["felinepenis"]),
		]
	}

func reactProgress(_context:Dictionary, _result:TFResult):
	if(isFirstTime()):
		addText(("Something is happening to your chest.."))
	else:
		addText("A sudden warmth envelops your chest, and you feel an electrifying tingling sensation that sends shivers down your spine.")
	
	#addText(_result.getTFText("breasts"))
	addText(_result.getAllTFTexts())
	playAnim(StageScene.Solo, "struggle", {bodyState={exposedChest=true}})
	
	if(isFirstTime()):
		addText("Wow.. You can't help but to grope your new chest a little, your nips more sensitive.. You now have {pc.breasts}.")
	else:
		addText("You cup your new tits and give your nips a few rubs.. You now have {pc.breasts}.")
	
	#addText("THEN WE SWITCH LEGS.")
	#addText(_result.getTFText("legs"))
	#addText("AND ALSO MAKE YOU MORE THICK.")
	#addText(_result.getTFText("thick"))

func onSexEvent(_event : SexEvent):
	var _npc = getChar()
	if(_event.getType() in [SexEvent.BreastFeeding, SexEvent.BreastsGroped, SexEvent.BreastsPumpMilked]):
		if(_event.getTargetChar() == _npc):
			accelerateTimer(0.5)
