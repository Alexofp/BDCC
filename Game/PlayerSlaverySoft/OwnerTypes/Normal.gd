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
		var theTraitTags:Dictionary = theTrait.getTraits(self)
		for theTag in theTraitTags:
			if(!theTags.has(theTag)):
				theTags[theTag] = theTraitTags[theTag]
			else:
				theTags[theTag] *= theTraitTags[theTag]
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
	if(traits.size() >= 3):
		return false
	return addRandomTrait(_announce)

func getPossiblePCNamesForLevel(_level:int) -> Array:
	var result:Array = .getPossiblePCNamesForLevel(_level)
	for traitID in traits:
		var theTrait:NpcOwnerTraitBase = GlobalRegistry.getNpcOwnerTrait(traitID)
		if(!theTrait):
			continue
		result.append_array(theTrait.getPossiblePCNamesForLevel(self, _level))
	return result

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
