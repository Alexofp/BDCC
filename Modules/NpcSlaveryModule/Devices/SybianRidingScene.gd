extends SceneBase

var npcID = ""
var rideMode = ""

func _init():
	sceneID = "SybianRidingScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		playAnimation(StageScene.Sybian, "idle", {pc="pc", bodyState={naked=true}})
		saynn("You sit on your sybian.")

		addButton("Turn it on", "Start enjoying the vibrations", "turn_on_slave_check")
	if(state == "slave_wants_help"):
		playAnimation(StageScene.SybianOral, "idle", {pc="pc", npc=npcID, bodyState={naked=true}})
		saynn("You turn on the sybian and enjoy the vibrations.")

		saynn("One of your slaves, {npc.name}, sees you!")

		var theNpc = getCharacter(npcID)
		if (theNpc.hasReachablePenis()):
			addButtonWithChecks("Suck them off", "Suck their cock while riding the sybian", "do_ride_while_suck", [], [[ButtonChecks.NotOralBlocked]])
		if (theNpc.hasReachableVagina()):
			addButtonWithChecks("Eat them out", "Lick their pussy while riding the sybian", "do_ride_while_lick", [], [[ButtonChecks.NotOralBlocked]])
		addButton("Just ride", "Ignore them", "just_ride")
		addButton("Hump sybian", "Ignore them and hump the sybian", "just_hump")
		if (GM.pc.hasReachablePenis() && GM.pc.getWornCondom() == null):
			addButtonWithChecks("Put on a condom", "Wear a condom while doing this", "put_a_condom_on", [], [[ButtonChecks.HasCondoms]])
	if(state == "alone_pick_how_ride"):
		saynn("You turn on the sybian and enjoy the vibrations.")

		saynn("How do you want to ride it?")

		addButton("Just ride", "Ignore them", "just_ride")
		addButton("Hump sybian", "Ignore them and hump the sybian", "just_hump")
		if (GM.pc.hasReachablePenis() && GM.pc.getWornCondom() == null):
			addButtonWithChecks("Put on a condom", "Wear a condom while doing this", "put_a_condom_on", [], [[ButtonChecks.HasCondoms]])
		addDisabledButton("Slaves", "You don't have any slaves that can join")
	if(state == "sybian_loop"):
		saynn("You ride the sybian.")

		if (GM.pc.getArousal() >= 1.0):
			addButton("Cum!", "Time to cum", "do_cum")
		else:
			addButton("Continue", "See what happens next", "do_next_loop")
	if(state == "do_cum"):
		saynn("You came!")

		addButton("Continue", "See what happens next", "endthescene_recovercondom")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "turn_on_slave_check"):
		processTime(5*60)
		
		var possibleSlaveIDs = []
		var slaves = GM.main.getPCSlavesIDs()
		for slaveID in slaves:
			var theChar:DynamicCharacter = getCharacter(slaveID)
			if(theChar == null || !theChar.isSlaveToPlayer()):
				continue
			var npcSlavery:NpcSlave = theChar.getNpcSlavery()
			if(npcSlavery.isDoingActivity()):
				continue
			if(theChar.hasReachablePenis() || theChar.hasReachableVagina()):
				possibleSlaveIDs.append(slaveID)
		
		GM.pc.addLust(10)
		GM.pc.addArousal(GM.pc.getLustLevel() * 0.2)
		
		if(RNG.chance(100) && possibleSlaveIDs.size() > 0):
			npcID = RNG.pick(possibleSlaveIDs)
			addCharacter(npcID)
			setState("slave_wants_help")
			return	
		
		setState("alone_pick_how_ride")
		return

	if(_action == "do_ride_while_suck"):
		setState("sybian_loop")
		rideMode = "suck"
		return

	if(_action == "do_ride_while_lick"):
		setState("sybian_loop")
		rideMode = "lick"
		return

	if(_action == "just_ride"):
		if(npcID != ""):
			removeCharacter(npcID)
		setState("sybian_loop")
		rideMode = ""
		return

	if(_action == "just_hump"):
		if(npcID != ""):
			removeCharacter(npcID)
		setState("sybian_loop")
		rideMode = "hump"
		return

	if(_action == "put_a_condom_on"):
		var breakChance = GM.pc.useWorstCondom()
		var condomItem:ItemBase = GlobalRegistry.createItem("UsedCondom")
		condomItem.breakChance = breakChance
		GM.pc.getInventory().forceEquipStoreOther(condomItem)
		return

	if(_action == "do_cum"):
		processTime(3*60)
		GM.pc.orgasmFrom("pc")

	if(_action == "do_next_loop"):
		processTime(1*60)
		GM.pc.addLust(10)
		GM.pc.addArousal(GM.pc.getLustLevel() * 0.2)
		setState("sybian_loop")
		return

	if(_action == "endthescene_recovercondom"):
		if(GM.pc.getWornCondom() != null):
			GM.pc.getInventory().unequipItem(GM.pc.getWornCondom())
			addMessage("You store the used condom!")
		playAnimation(StageScene.Solo, "stand")
		GM.pc.setArousal(0.0)
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["npcID"] = npcID
	data["rideMode"] = rideMode

	return data

func loadData(data):
	.loadData(data)

	npcID = SAVE.loadVar(data, "npcID", "")
	rideMode = SAVE.loadVar(data, "rideMode", "")
