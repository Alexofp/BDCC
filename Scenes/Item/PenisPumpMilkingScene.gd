extends "res://Scenes/SceneBase.gd"

var uniqueItemID = ""
var temporaryAdded = false
var oldWornItemID = ""

func _init():
	sceneID = "PenisPumpMilkingScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]
	
func _reactInit():
	if(uniqueItemID == null || uniqueItemID == ""):
		return
		
	var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
	if(item == null):
		return
	
	if(!GM.pc.hasPenis()):
		setState("nopenis")
		return

	if(!item.isWornByWearer()):
		if(!GM.pc.hasReachablePenis()):
			setState("noreachpenis")
			return

		if(!GM.pc.hasBlockedHands()):
			if(GM.pc.getInventory().hasSlotEquipped(item.getClothingSlot())):
				var alreadyEquipped = GM.pc.getInventory().getEquippedItem(item.getClothingSlot())
				if(alreadyEquipped != item && alreadyEquipped.isRestraint()):
					setState("restraintequipped")
					return
				if(alreadyEquipped != item):
					oldWornItemID = alreadyEquipped.getUniqueID()
					GM.pc.getInventory().unequipItem(alreadyEquipped)
			
			temporaryAdded = true
			GM.pc.getInventory().removeItem(item)
			GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(item)
			
		else:
			setState("blockedhands")

	processTime(6*60)
	GM.pc.addSkillExperience(Skill.Breeder, 20, "penis_pump")

	
	var howMuchTransferred = GM.pc.getBodypart(BodypartSlot.Penis).getFluids().transferTo(item, 1.0)
	addMessage("The penis pump has collected "+str(Util.roundF(howMuchTransferred))+" ml of your {pc.cum}")
	GM.pc.orgasmFrom("pc")

func _run():
	if(state == ""):
		playAnimation(StageScene.Sybian, "ride", {nosybian=true,bodyState={exposedCrotch=true}})
		
		saynn("With a press of a button, a gentle hum fills the air as the penis pump activates, creating a stimulating suction.")
		
		saynn("You feel a gradual buildup of arousal with each pump, your penis responding with throbs and twitches as the soft pleasure ring starts to stroke it.")
		
		saynn("Little moans begin to escape from you, blending with the mechanical sounds of the pump.")
		
		saynn("Soon, you begin to approach your climax. Your body squirms as the strokes and pumps are gently pushing you past your edge.")
		
		saynn("With a passionate moan, your {pc.penis} starts throbbing and shooting thick strings of {pc.cum} that are quickly collected by the pump.")
		
		saynn("After that.. you turn the device off.")
		
		addButton("Continue", "Neat", "endthescene")

	if(state == "restraintequipped"):
		saynn("You can't put on the penis pump because some restraint blocks your cock")
		
		addButton("Continue", "Aww", "endthescene")

	if(state == "blockedhands"):
		saynn("You really try to put penis pump on but your blocked hands prevent you from doing so")
		
		addButton("Continue", "Aww", "endthescene")
	
	if(state == "nopenis"):
		saynn("You try to put on the penis pump.. But then you realize that you don't have a penis.. Oh no..")
		
		saynn("You make sure and check again.. nope.."+str(" All you have is a pussy.. You try to pump your pussy.. but this particular pump works by stroking rather than creating negative pressure.. so you fail spectacularly.." if GM.pc.hasReachableVagina() else ""))
		
		addButton("Continue", "Aww", "endthescene")
	
	if(state == "noreachpenis"):
		saynn("You can't reach your penis.. so you can't put on a penis pump on it..")
		
		addButton("Continue", "Aww", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		if(temporaryAdded):
			var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
			GM.pc.getInventory().unequipItem(item)
			
			if(oldWornItemID != ""):
				var item2: ItemBase = GM.pc.getInventory().getItemByUniqueID(oldWornItemID)
				GM.pc.getInventory().equipItem(item2)
		
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["uniqueItemID"] = uniqueItemID
	data["temporaryAdded"] = temporaryAdded
	data["oldWornItemID"] = oldWornItemID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	uniqueItemID = SAVE.loadVar(data, "uniqueItemID", "")
	oldWornItemID = SAVE.loadVar(data, "oldWornItemID", "")
	temporaryAdded = SAVE.loadVar(data, "temporaryAdded", false)
