extends NpcOwnerBase

# Normal trait-based owner

var traits:Array = []

func _init():
	id = "Normal"

func getVisibleName() -> String:
	return "Normal"

func onLevelUp():
	addRandomTraitChecked() # Trait should happen first because new picked name depends on traits
	.onLevelUp()

func getEventTags() -> Dictionary:
	var theTags:Dictionary = {}
	for traitID in traits:
		var theTrait:NpcOwnerTraitBase = GlobalRegistry.getNpcOwnerTrait(traitID)
		var theTraitTags:Dictionary = theTrait.getEventTags(self)
		for theTag in theTraitTags:
			if(!theTags.has(theTag)):
				theTags[theTag] = theTraitTags[theTag]
			else:
				theTags[theTag] = (theTraitTags[theTag] * theTags[theTag])
	return theTags

func hasTrait(_traitID:String) -> bool:
	return traits.has(_traitID)

func addRandomTrait(_announce:bool = true) -> bool:
	var possible:Array = []
	var exclusives:Dictionary = {}
	for traitID in traits:
		var theTrait:NpcOwnerTraitBase = GlobalRegistry.getNpcOwnerTrait(traitID)
		if(!theTrait):
			continue
		var theExclusive:String = theTrait.getTraitExclusiveType()
		if(!theExclusive.empty()):
			exclusives[theExclusive] = true
	
	for traitID in GlobalRegistry.getNpcOwnerTraits():
		if(traits.has(traitID)):
			continue
		var theTrait:NpcOwnerTraitBase = GlobalRegistry.getNpcOwnerTrait(traitID)
		var theExclusive:String = theTrait.getTraitExclusiveType()
		if(!theExclusive.empty()):
			if(exclusives.has(theExclusive)):
				continue
			
		var theScore:float = theTrait.getTraitScore(self)
		if(theScore <= 0.0):
			continue
		possible.append([theTrait, theScore])
	
	if(possible.empty()):
		return false
	
	var thePickedTrait:NpcOwnerTraitBase = RNG.pickWeightedPairs(possible)
	traits.append(thePickedTrait.id)
	if(_announce):
		addMessage(getOwnerName()+" has gained a new owner trait: '"+thePickedTrait.getVisibleName()+"'")
	return true

func addRandomTraitChecked(_announce:bool = true) -> bool:
	if(traits.size() >= getMaxAmountOfTraits()):
		return false
	return addRandomTrait(_announce)

func addTrait(traitID:String):
	var theTrait:NpcOwnerTraitBase = GlobalRegistry.getNpcOwnerTrait(traitID)
	if(!theTrait):
		return
	if(traits.has(traitID)):
		return
	traits.append(traitID)

func removeTrait(traitID:String):
	if(!traits.has(traitID)):
		return
	traits.erase(traitID)

func getMaxAmountOfTraits() -> int:
	return 2

func getPossiblePCNamesForLevel(_level:int) -> Array:
	var result:Array = .getPossiblePCNamesForLevel(_level)
	for traitID in traits:
		var theTrait:NpcOwnerTraitBase = GlobalRegistry.getNpcOwnerTrait(traitID)
		if(!theTrait):
			continue
		result.append_array(theTrait.getPossiblePCNamesForLevel(self, _level))
	return result

func getRelationshipFullInfo() -> Array:
	var theInfo := .getRelationshipFullInfo()
	if(!traits.empty()):
		theInfo.append("")
		var traitNames:Array = []
		var traitNamesDescs:Array = []
		for traitID in traits:
			var theTrait:NpcOwnerTraitBase = GlobalRegistry.getNpcOwnerTrait(traitID)
			if(!theTrait):
				continue
			traitNames.append(theTrait.getVisibleName())
			traitNamesDescs.append(" - "+theTrait.getVisibleName()+": "+theTrait.getVisibleDescription())
		theInfo.append("Traits: "+Util.join(traitNames, ", "))
		theInfo.append("")
		theInfo.append_array(traitNamesDescs)
	return theInfo

func getExtraCategoryText() -> String:
	var theText:String = .getExtraCategoryText()
	if(!traits.empty()):
		var traitNames:Array = []
		for traitID in traits:
			var theTrait:NpcOwnerTraitBase = GlobalRegistry.getNpcOwnerTrait(traitID)
			if(!theTrait):
				continue
			traitNames.append(theTrait.getVisibleName())
		theText += "\nTraits: "+Util.join(traitNames, ", ")
	return theText

func debugCanPickTraits() -> bool:
	return true

func checkSkipPunishment() -> bool:
	if(skipPunishCooldown > 0):
		return false
	
	for traitID in traits:
		var theTrait = GlobalRegistry.getNpcOwnerTrait(traitID)
		if(!theTrait):
			continue
		var theChance:float = theTrait.getSkipPunishmentChance()
		if(theChance > 0.0 && RNG.chance(theChance)):
			return true
	return false

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["tr"] = traits
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	var newTraits:Array = SAVE.loadVar(_data, "tr", [])
	traits.clear()
	for traitID in newTraits:
		if(GlobalRegistry.getNpcOwnerTrait(traitID) == null):
			continue
		traits.append(traitID)
