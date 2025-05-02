extends TFEffect

var newPartID:String = ""
var partArts:Dictionary = {}

func _init():
	id = "SwitchPart"

func initArgs(_args:Array):
	newPartID = _args[0] if (_args[0] is String) else ""
	partArts = _args[1] if _args.size() > 1 else {}

func applyEffect(_data:Dictionary) -> Dictionary:
	var extras:Dictionary = {}
	var oldPartID = _data["bodypartID"] if _data.has("bodypartID") else null
	#var noPartBefore:bool = (oldPartID == "")
	if(newPartID == ""):
		_data["bodypartID"] = null
	else:
		_data["bodypartID"] = newPartID
	
	if(newPartID != ""):
		# Adding missing fields
		var partRef:Bodypart = GlobalRegistry.getBodypartRef(newPartID)
		if(partRef != null):
			assert(partRef.getSlot() == getBodypartSlot(), "WRONG BODYPART SLOT!")
			var tfData:Dictionary = partRef.saveOriginalTFData()
			for tfDataField in tfData:
				if(!_data.has(tfDataField)):
					_data[tfDataField] = tfData[tfDataField]
			
#			if(noPartBefore):
#				partRef.pickedSkin = null
#				partRef.pickedRColor = null
#				partRef.pickedGColor = null
#				partRef.pickedBColor = null
#				var theChar:BaseCharacter = getChar()
#				partRef.generateRandomColors(theChar)
#				partRef.generateRandomSkinIfCan(theChar)
#				if(partRef.pickedSkin != null):
#					_data["skin"] = partRef.pickedSkin
#				if(partRef.pickedRColor != null):
#					_data["r"] = partRef.pickedRColor
#				if(partRef.pickedGColor != null):
#					_data["g"] = partRef.pickedGColor
#				if(partRef.pickedBColor != null):
#					_data["b"] = partRef.pickedBColor

	for partArt in partArts:
		_data[partArt] = partArts[partArt]
	
	if(oldPartID != "" && newPartID == ""):
		if(getBodypartSlot() == BodypartSlot.Penis):
			var theChar:BaseCharacter = getChar()
			
			if(theChar.isWearingChastityCage()):
				extras["lostcage"] = true
				
				if(theChar.isPlayer() || theChar.isSlaveToPlayer()):
					theChar.getInventory().unequipSlot(InventorySlot.Penis)
				else:
					theChar.getInventory().clearSlot(InventorySlot.Penis)
	
	return {
		success = true,
		oldPartID = oldPartID,
		extras = extras,
	}

func generateTransformText(_result:Dictionary):
	var oldPartID = (_result["oldPartID"] if _result.has("oldPartID") else null)
	var hadPartBefore:bool = (oldPartID != null && oldPartID != "")
	var hasPartNow:bool = (newPartID != "")
	var bodypartSlot:String = getBodypartSlot()
	var slotChildName:String = BodypartSlot.getSlotChildName(bodypartSlot)
	var slotName:String = BodypartSlot.getVisibleNameNoCap(bodypartSlot)
	var shouldHaveS:bool = !slotName.ends_with("s") || (slotName in ["penis", "anus"])

	
	var bodypartRefBefore:Bodypart = GlobalRegistry.getBodypartRef(oldPartID) if hadPartBefore else null
	var bodypartRefNow:Bodypart = GlobalRegistry.getBodypartRef(newPartID) if hasPartNow else null
	
	# Bald hair = same as no hair
	if(bodypartRefNow != null && bodypartSlot == BodypartSlot.Hair && bodypartRefNow.hasTrait(PartTrait.HairBald)):
		hasPartNow = false
	if(bodypartRefBefore != null && bodypartSlot == BodypartSlot.Hair && bodypartRefBefore.hasTrait(PartTrait.HairBald)):
		hadPartBefore = false
	
	# Nothing changed?
	if(!hadPartBefore && !hasPartNow):
		addText("{npc.YouHe} {npc.youVerb('get')} a strange tickling feeling around {npc.yourHis} "+slotChildName+" but nothing seems to be changing about it.")
	# Got morphed away
	elif(hadPartBefore && !hasPartNow):
		if(bodypartRefBefore != null):
			addText(bodypartRefBefore.getTransformAwayMessage({result=_result}))
		else:
			addText("{npc.YouHe} {npc.youVerb('feel')} a tingling sensation on {npc.yourHis} scalp as {npc.yourHis} "+slotName+" begin"+("s" if shouldHaveS else "")+" to shift and change. Suddenly, {npc.YourHis} "+slotName+" morph"+("s" if shouldHaveS else "")+" away completely, leaving nothing in its place!")
		
		if(_result.has("extras")):
			if(_result["extras"].has("lostcage") && _result["extras"]["lostcage"]):
				addText("{npc.YourHis} chastity cage hits the floor with a loud metal clang. There is nothing left to hold it in place anymore..")
		
	# Grew something new that you didn't have
	elif(!hadPartBefore && hasPartNow):
		if(bodypartRefNow != null):
			addText(bodypartRefNow.getTransformGrowMessage({result=_result}))
		else:
			addText("A sudden warmth spreads through {npc.yourHis} body, and {npc.youHe} {npc.youVerb('feel')} a peculiar sensation as "+("a " if shouldHaveS else "")+"new "+slotName+" begin"+("s" if shouldHaveS else "")+" to form from {npc.yourHis} "+slotChildName+". "+("It gets" if shouldHaveS else "They get")+" more and more defined, the contours slowly taking shape. The process is quite.. uncomfortable.. to say the least.. but eventually "+("it finishes" if shouldHaveS else "they finish")+" growing, assuming "+("its" if shouldHaveS else "their")+" final form.")
	# Part morphs into a different one
	elif(hadPartBefore && hasPartNow):
		if(bodypartRefNow != null):
			addText(bodypartRefNow.getTransformMorphMessage({result=_result, oldTraits=(bodypartRefBefore.getTraits() if bodypartRefBefore != null else {})}))
		else:
			addText("An unusual sensation courses through {npc.yourHis} body as {npc.yourHis} "+slotName+" begin"+("s" if shouldHaveS else "")+" to shift and change! The familiar contours start to dissolve and reshape, morphing into something different. Gradually, the new "+slotName+" emerge"+("s" if shouldHaveS else "")+", taking on a more defined form. The process is quite painful and uncomfortable, but eventually "+("it settles" if shouldHaveS else "they settle")+" into "+("its" if shouldHaveS else "their")+" final appearance. {npc.YouHe} now {npc.youVerb('have', 'has')} "+bodypartRefNow.getAVulgarName()+".")
	#else:
	#	addText("This shouldn't happen")

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["newPartID"] = newPartID
	data["partArts"] = partArts
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	newPartID = SAVE.loadVar(_data, "newPartID", "")
	partArts = SAVE.loadVar(_data, "partArts", {})
