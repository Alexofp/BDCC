extends TFBase

var newSpecies:Array = [Species.Canine]
var affectedSlots:Dictionary = {}

func _init():
	id = "SpeciesTF"
	
	canStack = false
	
	pointsOnUnlock = 25

func getName() -> String:
	return "Changes species"

func getPillName() -> String:
	return "WildShift"

func getUnlockData() -> Dictionary:
	return {
		eliza = "Wow! This one is just.. packed.. with all sorts of DNA. I see a lot of different patterns.. but they do share something in common. I think this one has the potential to completely change you into something else! To override your species! Just imagine the adventures you could have in a new body. I will call it.. 'WildShift'.",
		tryOptions = [
			{
				name = "Make Eliza eat it",
				desc = "Ask if she is brave enough to try her own product. This might be funny or sad, who knows.",
				sceneID = "ElizaDrugTestSpeciesScene",
			},
		],
	}

func getPillDatabaseDesc() -> String:
	return "This drug will gradually switch your species, morphing your body parts one by one.\n\nThe first stage will happen after about 15 minutes. After that, the next ones will happen roughly every 10 hours. Each next stage will take longer than the last. This could be accelerated only by using the QuickShift drug.\n\nThis drug doesn’t have a set amount of stages. It will reach its final stage when there is nothing left to transform. It’s possible to modify the drug to pick the target species and which parts should be kept as is by using the advanced lab equipment."

func getTFCheckTags() -> Dictionary:
	return {
		"species": true,
	}

func getPillFluidsRequired() -> Dictionary:
	return {
		"Milk": 5000.0,
		"GirlCum": 3000.0,
		"Cum": 1000.0,
	}

func start(_args:Dictionary):
	if(_args.has("species")):
		newSpecies = _args["species"] if (_args["species"] is Array) else [_args["species"]]
	else:
		var randomSpecies:String = GM.main.getEncounterSettings().generateSpeciesBlacklist(getChar().getSpecies())
		if(randomSpecies == ""):
			randomSpecies = Species.Canine
			doCancelDelayed()
		newSpecies = [randomSpecies]
	
	for bodypartSlot in BodypartSlot.getAll():
		if(_args.has("no"+bodypartSlot) && _args["no"+bodypartSlot]):
			affectedSlots[bodypartSlot] = true

func getPillOptions() -> Dictionary:
	var speciesArray:Array = []
	for speciesID in GlobalRegistry.getAllPlayableSpecies():
		speciesArray.append([speciesID, GlobalRegistry.getSpecies(speciesID).getVisibleName()])
	var result:Dictionary = {
		"species": {
			name = "Species",
			desc = "What species should the drug transform you into.",
			value = Species.Canine,
			values = speciesArray,
		},
	}
	
	for bodypartSlot in BodypartSlot.getAll():
		if(bodypartSlot in [BodypartSlot.Hair, BodypartSlot.Vagina, BodypartSlot.Anus]):
			continue
		result["no"+bodypartSlot] = {
			name = "Skip "+BodypartSlot.getVisibleNameNoCap(bodypartSlot),
			desc = "Should this bodypart not be morphed?",
			value = false,
			values = [[false, "No"], [true, "Yes"]]
		}
	
	return result

func getSlotsToTransform() -> Array:
	return BodypartSlot.getAll()

func allowsRemovingParts() -> bool:
	return true

func getSlotsLeft() -> Array:
	var result:Array = []
	for bodypartSlot in getSlotsToTransform():
		if(bodypartSlot in [BodypartSlot.Hair, BodypartSlot.Vagina, BodypartSlot.Anus]):
			continue
		if(affectedSlots.has(bodypartSlot)):
			continue
		result.append(bodypartSlot)
	return result

func hasAnySlotsLeftToTranform() -> bool:
	var theChar:BaseCharacter = getChar()
	var allowsRemoving:bool = allowsRemovingParts()
	var slotsLeft:Array = getSlotsLeft()
	for bodypartSlot in slotsLeft:
		var possiblePartIDs:Dictionary = Bodypart.findPossibleBodypartIDsDict(bodypartSlot, theChar, newSpecies)
		if(!allowsRemoving && possiblePartIDs.has("") && theChar.hasBodypart(bodypartSlot)):
			possiblePartIDs.erase("")
		if(possiblePartIDs.empty()):
			continue
		
		var currentBodypart:Bodypart = theChar.getBodypart(bodypartSlot)
		var currPartID:String = "" if currentBodypart == null else currentBodypart.id
		
		if(!possiblePartIDs.has(currPartID)):
			return true
	return false
		
func shouldCancelItself() -> bool:
	for species in newSpecies:
		if(GlobalRegistry.getSpecies(species) == null):
			return true
	return false
		
func canTransformFurther() -> bool:
	if(!hasAnySlotsLeftToTranform()):
		return false
	return true#!isMaxStage()
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 500
	return 60*60*10 + 60*60*2*_theStage
	
func doProgress(_context:Dictionary) -> Dictionary:
	var allowsRemoving:bool = allowsRemovingParts()
	var theSlots:Array = getSlotsLeft()
	theSlots.shuffle()
	var theChar:BaseCharacter = getChar()
	while(theSlots.size() > 0):
		var bodypartSlot = theSlots.pop_front()
		
		var possiblePartIDs:Dictionary = Bodypart.findPossibleBodypartIDsDict(bodypartSlot, theChar, newSpecies)
		if(!allowsRemoving && possiblePartIDs.has("") && theChar.hasBodypart(bodypartSlot)):
			possiblePartIDs.erase("")
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
	var bodypartSlot = _result.getField("slot", BodypartSlot.Body)
	
	addText(_result.getAllTFTexts())
	
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
	
#
#func onSexEvent(_event : SexEvent):
#	var _npc = getChar()
#	if(_event.getType() in [SexEvent.BreastFeeding, SexEvent.BreastsGroped, SexEvent.BreastsPumpMilked]):
#		if(_event.getTargetChar() == _npc):
#			accelerateTimer(0.5)

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["ns"] = newSpecies
	data["as"] = affectedSlots
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	newSpecies = SAVE.loadVar(_data, "ns", [])
	affectedSlots = SAVE.loadVar(_data, "as", {})
