extends SceneBase

var breastsMilked = false
var penisMilked = false
var vaginaMilked = false
var hasPenisPump = false
var amountCollected = 0.0
var removedItemIDs:Array = []

func _init():
	sceneID = "ElizaQuickMilkingScene"

func saveSlotToBeReequipped(_slot:String):
	var theItem:ItemBase = GM.pc.getInventory().unequipSlot(_slot)
	if(theItem && theItem.uniqueID != null):
		removedItemIDs.append(theItem.uniqueID)

func _reactInit():
	processTime(30*60)
	if(GM.pc.canBeMilked()):
		amountCollected += GM.main.SCI.processMilkPlayerBreasts()
		breastsMilked = true
		var thePump = GlobalRegistry.createItem("BreastPump")
		if(thePump):
			var theFluids = thePump.getFluids()
			if(theFluids):
				theFluids.addFluid("Milk", 400.0)

		saveSlotToBeReequipped(InventorySlot.UnderwearTop)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(thePump)
	if(GM.pc.hasReachablePenis() || GM.pc.isWearingChastityCage()):
		amountCollected += GM.main.SCI.processMilkPlayerPenis()
		penisMilked = true
	if(GM.pc.hasReachablePenis()):
		saveSlotToBeReequipped(InventorySlot.Penis)
		
		var thePump = GlobalRegistry.createItem("PenisPump")
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(thePump)
		hasPenisPump = true
	if(GM.pc.hasReachableVagina()):
		amountCollected += GM.main.SCI.processMilkPlayerVagina()
		vaginaMilked = true
	GM.pc.orgasmFrom("eliza")

func _run():
	if(state == ""):
		addCharacter("eliza")
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.Sybian, "intense", {pc="pc", chained=true, bodyState={naked=true, hard=true}})
		saynn("You ask Eliza to be fully milked.. and you get your wish granted.")

		saynn("Eliza sets you up on a sybian.."+str(" With a penis pump stroking your cock and a set of breasts pumps sucking away at your nips.." if (GM.pc.hasReachablePenis() && breastsMilked) else "")+""+str(" With a penis pump stroking your cock and a toy vibrating against your prostate.." if (GM.pc.hasReachablePenis() && !breastsMilked) else "")+""+str(" With a dildo vibrating against your prostate and a set of breast pumps sucking away at your nips.." if (GM.pc.isWearingChastityCage() && breastsMilked) else "")+""+str(" With a dildo vibrating against your prostate.." if (GM.pc.isWearingChastityCage() && !breastsMilked) else "")+""+str(" With a set of breast pumps sucking away at your nips.." if (!penisMilked && breastsMilked) else "")+"")

		saynn("It doesn't take long for you to cum.."+str(" Your pussy gushing from overstimulation, your girlcum collected into the funnel beneath the grated platform.." if vaginaMilked else "")+""+str(" Your {pc.cum} shooting out of your chastity cage, your prostate pulsing.." if GM.pc.isWearingChastityCage() else "")+""+str(" Your throbbing cock filling the penis pump with many spurts of your {pc.cum}.." if GM.pc.hasReachablePenis() else "")+""+str(" Your breasts squirting with {pc.milk}.." if breastsMilked else "")+"")

		saynn("After the process is done, Eliza brings you back into the lobby..")

		addButton("Continue", "See what happens next", "endthescene_removestuff")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "endthescene_removestuff"):
		var theInv := GM.pc.getInventory()
		if(hasPenisPump):
			theInv.clearSlot(InventorySlot.Penis)
		if(breastsMilked):
			theInv.clearSlot(InventorySlot.UnderwearTop)
		
		for theUniqueItemID in removedItemIDs:
			var theItem = theInv.getItemByUniqueID(theUniqueItemID)
			if(theItem):
				theInv.equipItem(theItem)
		
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		aimCameraAndSetLocName(GM.pc.getLocation())
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["breastsMilked"] = breastsMilked
	data["penisMilked"] = penisMilked
	data["vaginaMilked"] = vaginaMilked
	data["hasPenisPump"] = hasPenisPump
	data["amountCollected"] = amountCollected
	data["removedItemIDs"] = removedItemIDs

	return data

func loadData(data):
	.loadData(data)

	breastsMilked = SAVE.loadVar(data, "breastsMilked", false)
	penisMilked = SAVE.loadVar(data, "penisMilked", false)
	vaginaMilked = SAVE.loadVar(data, "vaginaMilked", false)
	hasPenisPump = SAVE.loadVar(data, "hasPenisPump", false)
	amountCollected = SAVE.loadVar(data, "amountCollected", 0.0)
	removedItemIDs = SAVE.loadVar(data, "removedItemIDs", [])
