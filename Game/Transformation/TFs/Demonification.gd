extends "res://Game/Transformation/TFs/SpeciesTF.gd"

func _init():
	id = "Demonification"
	
	canStack = false
	
	pointsOnUnlock = 15

func getName() -> String:
	return "Demonification"

func getPillName() -> String:
	return "DemoniX"

func getPillDatabaseDesc() -> String:
	return "This drug will turn you into a half-demon. It does so by making you grow horns, a demon tail and hooves. It will also morph your existing penis into an equine variant and increase its length to roughly 20cm if it’s currently below that length.\n\nThe first stage will happen after a few minutes. Stage 2 will happen roughly after 5 hours. Stage 3 will happen after 10 hours, stage 4 will happen after 15 hours, etc. This could be accelerated by using the QuickShift drug or by letting the test subject cause [b]pain[/b] to others during sexual intercources.\n\nThis drug doesn’t have a set amount of stages. It will reach its final stage when there is nothing left to transform."

func getTFCheckTags() -> Dictionary:
	return {
		"species": true,
	}

func getPillFluidsRequired() -> Dictionary:
	return {
		"Cum": 1000.0,
	}

func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 300
	return 60*60*5*_theStage

func isPossibleFor(_char) -> bool:
	if(Species.Demon in _char.getSpecies()):
		return false
	return true

func start(_args:Dictionary):
	newSpecies = [Species.Demon]

func getPillOptions() -> Dictionary:
	return {}

func getUnlockData() -> Dictionary:
	return {
		eliza = "Looks like this one will give you horns, a unique tail and hoofs. I'm gonna call it.. "+getPillName()+". I think that name will fit it nicely.",
		tryOptions = [
			{
				name = "Make Eliza eat it",
				desc = "(Submissive sex) Ask if she is brave enough to try her own product. She will probably become horny and dominant.. very dominant..",
				sceneID = "ElizaDrugTestDemoniXScene",
			},
		],
	}

func getSlotsToTransform() -> Array:
	return [
		BodypartSlot.Horns,
		BodypartSlot.Tail,
		BodypartSlot.Penis,
		BodypartSlot.Legs,
	]

func allowsRemovingParts() -> bool:
	return false

func canTransformFurther() -> bool:
	var theChar:BaseCharacter = getChar()
	if(theChar.hasPenis() && theChar.getPenisSize() <= 20):
		return true
	return .canTransformFurther()

func doProgress(_context:Dictionary) -> Dictionary:
	var result:Dictionary = .doProgress(_context)
	
	if(!result.empty()):
		return result
	
	var theChar:BaseCharacter = getChar()
	if(theChar.hasPenis() && theChar.getPenisSize() <= 20):
		return {
			showPenis = true,
			effects = [
				partEffect("penLen", BodypartSlot.Penis, "PenisLengthChange", [RNG.randi_range(4, 5)])
			],
		}
	return {}

func onSexEvent(_event : SexEvent):
	var _npc = getChar()
	if(_event.getType() in [SexEvent.PainInflicted, SexEvent.Choking]):
		if(_event.getSourceChar() == _npc):
			accelerateTimer(0.4)
