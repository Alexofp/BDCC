extends "res://Scenes/SceneBase.gd"

var uniqueItemID = ""
var temporaryAdded = false
var oldWornItemID = ""

func _init():
	sceneID = "BreastPumpsMilkingScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]
	
func _reactInit():
	if(uniqueItemID == null || uniqueItemID == ""):
		return
		
	if(GM.pc.hasEffect(StatusEffect.SoreNipplesAfterMilking)):
		setState("nipplessore")
		return
		
	var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
	if(item == null):
		return
	
	if(!item.isWornByWearer()):
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
	GM.pc.stimulateLactation()
	if(!GM.pc.hasPerk(Perk.MilkNoSoreNipples)):
		GM.pc.addEffect(StatusEffect.SoreNipplesAfterMilking)
	GM.pc.addSkillExperience(Skill.Milking, 50)

	if(!GM.pc.canBeMilked()):
		setState("pumpfail")
		return
	
	var howMuchTransferred = GM.pc.getBodypart(BodypartSlot.Breasts).getFluids().transferTo(item, 1.0)
	addMessage("You managed to milk your breasts for "+str(Util.roundF(howMuchTransferred))+" ml")

func _run():
	if(state == ""):
		saynn("You take your time, attaching breast pumps to your {pc.breasts}, before pressing a button that makes them work.")
		
		saynn("They start off slow, gently stimulating your nips with a weak pumping rhythm, letting you get used to the sensations. It feels good.. Lonely drips of {pc.milk} already appear all around your nips.")
		
		saynn("Pumps slowly ramp up their strength, the negative pressure that they create tugs on your little nips, forcing more {pc.milk} out of them. It tingles.. Until eventually a bigger flow gets established. The pumps collect everything your breasts make all nice and neatly.")
		
		saynn("Some time passes, the pumps keep steadily working on your chest. You can’t help but to let out a few quiet moans, a warm feeling spreads out through your whole body coming from your lactating babies.")
		
		saynn("Eventually you decide that it’s enough and turn off the pumps. But the sensations continue to echo in your stimulated nips even when all the suction has finished.")
		
		addButton("Continue", "Neat", "endthescene")

	if(state == "pumpfail"):
		saynn("You take your time, attaching breast pumps to your {pc.breasts}, before pressing a button that makes them work.")

		saynn("They start off slow, gently stimulating your nips with a weak pumping rhythm, letting you get used to the sensations. It feels good.. Even if nothing comes out yet.")
		
		saynn("Pumps slowly ramp up their strength, the negative pressure that they create tugs on your little nips, trying to force the milk out of them. It tingles..")
		
		saynn("Some time passes, the pumps steadily work on your breasts. But since you’re not lactating, nothing was produced. At least you got your nips stimulated.")
		
		addButton("Continue", "Fair enough", "endthescene")

	if(state == "nipplessore"):
		saynn("Your nipples are too sore after the last milking, give yourself a break.")
		
		addButton("Continue", "Fair enough", "endthescene")

	if(state == "restraintequipped"):
		saynn("You can't put on the breast pumps because some restraint blocks your breasts")
		
		addButton("Continue", "Aww", "endthescene")

	if(state == "blockedhands"):
		saynn("You really try to put the breast pumps on but your blocked hands prevent you from doing so")
		
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
