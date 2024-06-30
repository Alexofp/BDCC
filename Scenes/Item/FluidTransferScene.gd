extends "res://Scenes/SceneBase.gd"

var uniqueItemID = ""
var interactionItemID = ""
var item: ItemBase

func _init():
	sceneID = "FluidTransferScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]
	
func _reactInit():
	if(uniqueItemID == null || uniqueItemID == ""):
		return
		
	item = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)

func _run():
	if(state == ""):
		saynn("What do you wanna do with the contents of "+item.getVisibleName())
		
		if(item.getFluids() != null):
			var fluids = item.getFluids()
			if(fluids.isCapacityLimited()):
				sayn("Max volume: "+str(Util.roundF(fluids.getFluidAmount()))+"/"+str(Util.roundF(fluids.getCapacity(), 1))+" ml")
			if(!fluids.isEmpty()):
				saynn("Contents:\n"+Util.join(fluids.getContentsHumanReadableArray(),"\n"))
			else:
				saynn("Contents: Empty")
			
			sayn("Transfer to = transfer fluids from this item to another")
			saynn("Fill = transfer fluids from some other item to this one")
			
			if(fluids.isEmpty()):
				addDisabledButton("Transfer to", "It's empty")
			else:
				addButton("Transfer to", "Transfer fluids to other item", "transferFluids")
			addButton("Fill", "Use other item to fill this item", "fillWithFluids")
			if(!fluids.isEmpty()):
				addButton("Empty it!", "Remove any fluids from this item", "empty_warning")
			else:
				addDisabledButton("Empty it!", "It's already empty")
		
		addButton("Close", "Enough messing around", "endthescene")

	if(state == "empty_warning"):
		saynn("You sure you wanna empty this item?")
		
		saynn("The fluids inside it will be lost forever.")
		
		addButton("Confirm", "Empty it", "do_empty")
		addButton("Cancel", "You changed your mind", "")

	if(state == "fillWithFluids"):
		saynn("Pick which item you wanna use to fill selected one with")

		addButton("Back", "Go back a menu", "")
		
		var equippedItems = GM.pc.getInventory().getAllEquippedItems()
		for slot in equippedItems:
			var equippedItem:ItemBase = equippedItems[slot]
			if(equippedItem == item):
				continue
			
			if(equippedItem.getFluids() != null):
				addButton(equippedItem.getStackName(), equippedItem.getVisisbleDescription(), "pickFillFrom", [equippedItem.getUniqueID()])
		for theitem in GM.pc.getInventory().getItems():
			if(theitem == item):
				continue
			
			if(theitem.getFluids() != null):
				if(theitem.getFluids().isEmpty()):
					addDisabledButton(theitem.getStackName(), "(This item is empty)\n\n"+theitem.getVisisbleDescription())
				else:
					addButton(theitem.getStackName(), theitem.getVisisbleDescription(), "pickFillFrom", [theitem.getUniqueID()])

	if(state in ["pickFillFrom", "enteramounttofill"]):
		saynn("How much do you wanna transfer?")
		
		sayn("To:")
		if(item.getFluids() != null):
			sayn(item.getStackName())
			var fluids = item.getFluids()
			if(fluids.isCapacityLimited()):
				sayn("Max volume: "+str(Util.roundF(fluids.getFluidAmount()))+"/"+str(Util.roundF(fluids.getCapacity(), 1))+" ml")
			if(!fluids.isEmpty()):
				saynn("Contents:\n"+Util.join(fluids.getContentsHumanReadableArray(),"\n"))
			else:
				saynn("Contents: Empty")
		
		sayn("From:")
		var item2 = GM.pc.getInventory().getItemByUniqueID(interactionItemID)
		if(item2.getFluids() != null):
			sayn(item2.getStackName())
			var fluids = item2.getFluids()
			if(fluids.isCapacityLimited()):
				sayn("Max volume: "+str(Util.roundF(fluids.getFluidAmount()))+"/"+str(Util.roundF(fluids.getCapacity(), 1))+" ml")
			if(!fluids.isEmpty()):
				saynn("Contents:\n"+Util.join(fluids.getContentsHumanReadableArray(),"\n"))
			else:
				saynn("Contents: Empty")
		
		if(state == "enteramounttofill"):
			saynn("Enter how much you wanna transfer in ml")
			
			var textBox:LineEdit = addTextbox("transfer_ml")
			var _ok = textBox.connect("text_entered", self, "onFillMLEnterPressed")
			addButton("Confirm", "pick this amount", "confirmtextfill")
			
			addButton("Back", "Go back a menu", "fillWithFluids")
		else:
			addButton("Back", "Go back a menu", "fillWithFluids")
			var variants = [0.1, 0.25, 0.5, 0.75, 1.0]
			var fluids = item2.getFluids()
			var howMuch = fluids.getFluidAmount()
			for howMuchPercent in variants:
				var willTransfer = howMuch * howMuchPercent
				addButton(str(Util.roundF(willTransfer, 1))+" ml", "Transfer "+(str(howMuchPercent*100.0))+"%", "doFill", [willTransfer])
			addButton("Specific amount", "Enter the amount of ml you wanna transfer", "enteramounttofill")
					

	if(state == "transferFluids"):
		saynn("Where do you wanna transfer the fluids to")
		
		addButton("Back", "Go back a menu", "")
		
		var equippedItems = GM.pc.getInventory().getAllEquippedItems()
		for slot in equippedItems:
			var equippedItem:ItemBase = equippedItems[slot]
			if(equippedItem == item):
				continue
			
			if(equippedItem.getFluids() != null):
				addButton(equippedItem.getStackName(), equippedItem.getVisisbleDescription(), "pickTransferTo", [equippedItem.getUniqueID()])
		for theitem in GM.pc.getInventory().getItems():
			if(theitem == item):
				continue
			
			if(theitem.getFluids() != null):
				addButton(theitem.getStackName(), theitem.getVisisbleDescription(), "pickTransferTo", [theitem.getUniqueID()])
		
	if(state in ["pickTransferTo", "enteramounttotransfer"]):
		saynn("How much do you wanna transfer?")
		
		sayn("From:")
		if(item.getFluids() != null):
			sayn(item.getStackName())
			var fluids = item.getFluids()
			if(fluids.isCapacityLimited()):
				sayn("Max volume: "+str(Util.roundF(fluids.getFluidAmount()))+"/"+str(Util.roundF(fluids.getCapacity(), 1))+" ml")
			if(!fluids.isEmpty()):
				saynn("Contents:\n"+Util.join(fluids.getContentsHumanReadableArray(),"\n"))
			else:
				saynn("Contents: Empty")
		
		sayn("To:")
		var item2 = GM.pc.getInventory().getItemByUniqueID(interactionItemID)
		if(item2.getFluids() != null):
			sayn(item2.getStackName())
			var fluids = item2.getFluids()
			if(fluids.isCapacityLimited()):
				sayn("Max volume: "+str(Util.roundF(fluids.getFluidAmount()))+"/"+str(Util.roundF(fluids.getCapacity(), 1))+" ml")
			if(!fluids.isEmpty()):
				saynn("Contents:\n"+Util.join(fluids.getContentsHumanReadableArray(),"\n"))
			else:
				saynn("Contents: Empty")
		
		if(state == "enteramounttotransfer"):
			saynn("Enter how much you wanna transfer in ml")
			
			var textBox:LineEdit = addTextbox("transfer_ml")
			var _ok = textBox.connect("text_entered", self, "onTransferMLEnterPressed")
			addButton("Confirm", "pick this amount", "confirmtexttransfer")
			
			addButton("Back", "Go back a menu", "transferFluids")
		else:
			addButton("Back", "Go back a menu", "transferFluids")
			var variants = [0.1, 0.25, 0.5, 0.75, 1.0]
			var fluids = item.getFluids()
			var howMuch = fluids.getFluidAmount()
			for howMuchPercent in variants:
				var willTransfer = howMuch * howMuchPercent
				addButton(str(Util.roundF(willTransfer, 1))+" ml", "Transfer "+(str(howMuchPercent*100.0))+"%", "doTransfer", [willTransfer])
			addButton("Specific amount", "Enter the amount of ml you wanna transfer", "enteramounttotransfer")
			
func onTransferMLEnterPressed(_new_text:String):
	GM.main.pickOption("confirmtexttransfer", [])
		
func onFillMLEnterPressed(_new_text:String):
	GM.main.pickOption("confirmtextfill", [])
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "pickTransferTo"):
		interactionItemID = _args[0]
	
	if(_action == "pickFillFrom"):
		interactionItemID = _args[0]
	
	if(_action == "confirmtexttransfer"):
		_action = "doTransfer"
		_args = [float(getTextboxData("transfer_ml"))]
	
	if(_action == "doTransfer"):
		var fluids:Fluids = item.getFluids()
		var item2 = GM.pc.getInventory().getItemByUniqueID(interactionItemID)
		
		var howMuch = fluids.transferAmountTo(item2, _args[0])
		
		addMessage("You transferred "+str(Util.roundF(howMuch))+" ml from "+item.getVisibleName()+" to "+item2.getVisibleName() )
		
		setState("")
		return
	
	if(_action == "confirmtextfill"):
		_action = "doFill"
		_args = [float(getTextboxData("transfer_ml"))]
	
	if(_action == "doFill"):
		var item2 = GM.pc.getInventory().getItemByUniqueID(interactionItemID)
		var fluids:Fluids = item2.getFluids()
		
		var howMuch = fluids.transferAmountTo(item, _args[0])
		
		addMessage("You transferred "+str(Util.roundF(howMuch))+" ml from "+item2.getVisibleName()+" to "+item.getVisibleName() )
		
		setState("")
		return
	
	if(_action == "do_empty"):
		item.getFluids().clear()
		setState("")
		
		addMessage("You emptied "+item.getVisibleName())
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["uniqueItemID"] = uniqueItemID
	data["interactionItemID"] = interactionItemID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	uniqueItemID = SAVE.loadVar(data, "uniqueItemID", "")
	interactionItemID = SAVE.loadVar(data, "interactionItemID", "")
	item = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
