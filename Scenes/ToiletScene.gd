extends "res://Scenes/SceneBase.gd"

var usedItemName = ""

func _init():
	sceneID = "ToiletScene"

func _run():
	if(state == ""):
		saynn("You find an empty toilet stall and enter it. Then you sit on the toilet and begin thinking.")
		
		addButton("Fill something", "Maybe you wanna fill one of your items", "fillmenu")
		addButton("Leave", "Enough thinking", "endthescene")
		
	if(state == "fillmenu"):
		saynn("How do you wanna fill something?")
		
		if(GM.pc.getFluidAmount(FluidSource.Pissing) >= 100):
			if(GM.pc.isWearingPortalPanties()):
				addDisabledButton("Pee into..", "Your portal panties prevent you from peeing into containers")
			elif(GM.pc.getInventory().getItemsWithTag(ItemTag.CanPeeInto).size() == 0):
				addDisabledButton("Pee into..", "You don't have any bottles to pee into")
			else:
				addButton("Pee into..", "Pee into one of your bottles", "peeintomenu")
		else:
			addDisabledButton("Pee into..", "You don't feel like peeing")
		if(GM.pc.hasEffect(StatusEffect.HasCumInsideAnus) || GM.pc.hasEffect(StatusEffect.HasCumInsideVagina)):
			if(GM.pc.getInventory().getItemsWithTag(ItemTag.CanForceCumInto).size() == 0):
				addDisabledButton("Push cum out..", "You don't have any bottles to push cum out into")
			else:
				addButton("Push cum out..", "Push cum out of one of your orifices", "pushcummenu")
		else:
			addDisabledButton("Push cum out..", "None of your orifices have any cum in them")
		addButton("Back", "Never mind", "")

	if(state == "peeintomenu"):
		saynn("Pick which container you wanna pee into")
		
		var items = GM.pc.getInventory().getItemsWithTag(ItemTag.CanPeeInto)
		
		for item in items:
			if(item.getFluids().isFull()):
				addDisabledButton(item.getStackName(), item.getVisisbleDescription())
			else:
				addButton(item.getStackName(), item.getVisisbleDescription(), "peeinto", [item.getUniqueID()])
		
		addButton("Back", "Never mind", "fillmenu")
	
	if(state == "peeinto"):
		saynn("You hold the "+usedItemName+" with your hands just above the toilet and then proceed to carefully pee into it.")
		
		addButton("Continue", "What a relief", "")
		
	if(state == "pushcummenu"):
		saynn("What orifice do you wanna push cum out of?")
		
		if(GM.pc.hasReachableVagina()):
			if(GM.pc.hasEffect(StatusEffect.HasCumInsideVagina)):
				addButton("Vagina", "Choose pussy", "pushcumvaginamenu")
			else:
				addDisabledButton("Vagina", "You don't have any cum inside your pussy")
		else:
			addDisabledButton("Vagina", "You don't have a reachable pussy")
		
		if(GM.pc.hasReachableAnus()):
			if(GM.pc.hasEffect(StatusEffect.HasCumInsideAnus)):
				addButton("Anus", "Choose anus", "pushcumanusmenu")
			else:
				addDisabledButton("Anus", "You don't have any cum inside your anus")
		else:
			addDisabledButton("Anus", "Your anus is not reachable")
			
		addButton("Back", "Never mind", "fillmenu")
		
	if(state in ["pushcumvaginamenu", "pushcumanusmenu"]):
		saynn("Pick which container you wanna use")
		
		var items = GM.pc.getInventory().getItemsWithTag(ItemTag.CanForceCumInto)
		
		for item in items:
			if(item.getFluids().isFull()):
				addDisabledButton(item.getStackName(), item.getVisisbleDescription())
			else:
				addButton(item.getStackName(), item.getVisisbleDescription(), state+"do", [item.getUniqueID()])
		
		addButton("Back", "Never mind", "fillmenu")
		
	if(state == "pushcumvaginamenudo"):
		saynn("You hold the "+usedItemName+" near your pussy patiently and begin to try and force out all the fluids that are inside you.")
		
		saynn("It's a slow process so you only manage to squeeze out so much out of you..")
		
		addButton("Continue", "What a relief", "")
		
	if(state == "pushcumanusmenudo"):
		saynn("You hold the "+usedItemName+" near your anus patiently and begin to try and force out all the fluids that are inside you.")
		
		saynn("It's a slow process so you only manage to squeeze out so much out of you..")
		
		addButton("Continue", "What a relief", "")
		
func _react(_action: String, _args):
	if(_action == "peeinto"):
		processTime(5*60)
		setFlag("LastTimePeed", GM.main.getTimeInGlobalSeconds())
		
		var item = GM.pc.getInventory().getItemByUniqueID(_args[0])
		if(item != null):
			var howMuch = GM.pc.cumInItem(item, FluidSource.Pissing)
			usedItemName = item.getVisibleName()
			
			addMessage("You fill the "+usedItemName+" with "+str(Util.roundF(howMuch, 1))+" ml of your piss")
	
	if(_action == "pushcumvaginamenudo"):
		processTime(10*60)
		
		var item = GM.pc.getInventory().getItemByUniqueID(_args[0])
		if(item != null):
			var howMuch = GM.pc.getBodypart(BodypartSlot.Vagina).getFluids().transferTo(item, RNG.randf_range(0.1, 0.3))
			usedItemName = item.getVisibleName()
			
			addMessage("You manage to fill the "+usedItemName+" with "+str(Util.roundF(howMuch, 1))+" ml of stuff")
	
	if(_action == "pushcumanusmenudo"):
		processTime(10*60)
		
		var item = GM.pc.getInventory().getItemByUniqueID(_args[0])
		if(item != null):
			var howMuch = GM.pc.getBodypart(BodypartSlot.Anus).getFluids().transferTo(item, RNG.randf_range(0.1, 0.3))
			usedItemName = item.getVisibleName()
			
			addMessage("You manage to fill the "+usedItemName+" with "+str(Util.roundF(howMuch, 1))+" ml of stuff")
	
	
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["usedItemName"] = usedItemName
	
	return data
	
func loadData(data):
	.loadData(data)
	
	usedItemName = SAVE.loadVar(data, "usedItemName", "")
