extends TFBase

var didChangeBreasts:bool = false

var pickedColors:Array = []
var prog:float = 0

# Will increase your breasts 2 times
# +1 size
# +2 sizes

func _init():
	id = "TestTF"

func start(_args:Dictionary):
	pickedColors = TFUtil.getRandomColorsForSpecies([Species.Canine])

func getMaxStage() -> int:
	if(didChangeBreasts):
		return 3
	return 100

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
	prog += 0.1
	if(prog > 1.0):
		prog = 1.0
	if(isFirstTime()):
		return {
			effects = [
				partEffect("breasts", BodypartSlot.Breasts, "BreastSizeChange"),
				charEffect("gender", "GenderChange", [Gender.Male]),
				charEffect("skin", "SkinSet", ["FerriSkin" if prog >= 0.5 else "", pickedColors, prog]),
				#partEffect("breastss", BodypartSlot.Breasts, "FluidTypeChange", ["Piss"]),
				#partEffect("nopenis", BodypartSlot.Penis, "SwitchPart", [""]),
				#partEffect("legs", BodypartSlot.Legs, "SwitchPart", ["plantilegs"]),
				#partEffect("hair", BodypartSlot.Hair, "SwitchPart", ["manehair"]),
				#charEffect("thick", "AddThickness", [10]),
				#charEffect("fem", "AddFemininity", [10]),
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
			partEffect("breasts", BodypartSlot.Breasts, "BreastSizeChange", [2]),
			#charEffect("thick", "AddThickness", [RNG.randi_range(-10, 10)]),
			#partEffect("testpenis", BodypartSlot.Penis, "SwitchPart", ["felinepenis"]),
			charEffect("fem", "AddFemininity", [10]),
			partEffect("penLen", BodypartSlot.Penis, "PenisLengthChange", [10]),
			charEffect("skin", "SkinSet", ["FerriSkin" if prog > 0.5 else "", pickedColors, prog]),
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

func getBuffs() -> Array:
	if(getStage() >= 1):
		return [
			buff(Buff.BreastsMilkProductionBuff, [50]),
			buff(Buff.BreastsForcedLactationBuff),
		]
	return []
