extends SceneBase

var ambushPlace:String = "" # normal, shower, canteen, cell
var ambushType:String = "" # showeritems, normalshiv, normaldrugged, canteendrugged, cellbondage
var npcMain:String = ""
var npcExtra1:String = ""
var npcExtra2:String = ""

func _initScene(_args = []):
	ambushPlace = _args[0]
	npcMain = _args[1]
	npcExtra1 = _args[2]
	npcExtra2 = _args[3]

func _reactInit():
	#addCharacter(npcMain)
	#addCharacter(npcExtra1)
	#addCharacter(npcExtra2)
	
	GM.main.IS.deletePawn(npcMain)
	GM.main.IS.deletePawn(npcExtra1)
	GM.main.IS.deletePawn(npcExtra2)
	
	if(ambushPlace == "shower"):
		ambushType = RNG.pick(["showeritems"])
	elif(ambushPlace == "canteen"):
		ambushType = RNG.pick(["canteendrugged_lust"])
	elif(ambushPlace == "cell"):
		ambushType = RNG.pick(["cellbondage"])
	else:
		ambushType = RNG.pick(["normalshiv", "normaldrugged_stamina"])
	
	if(ambushType == "showeritems"):
		transferAllEquippedItems(GM.pc, getCharacter("TempAmbushStash"))
		transferHelpfulItems(GM.pc, getCharacter("TempAmbushStash"))
		GM.pc.afterTakingAShower()
	if(ambushType == "canteendrugged_lust"):
		GM.pc.addLust(GM.pc.lustThreshold())
		GM.pc.forceIntoHeat()
		addMessage("You feel VERY lusty..")
	if(ambushType == "normaldrugged_stamina"):
		GM.pc.addStamina(-GM.pc.getMaxStamina())
		addMessage("You feel VERY weak..")
	if(ambushType == "normalshiv"):
		GM.pc.addPain(40)
		addMessage("It hurts..")
	
	setState(ambushType)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcMain
	if(_charID == "npc1"):
		return npcExtra1
	if(_charID == "npc2"):
		return npcExtra2

func _init():
	sceneID = "NemesisAmbushScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc=npcMain})
		saynn("AMBUSH. BUT THIS SHOULDN'T HAPPEN.")

		addButton("Continue", "See what happens next", "show_others")
	
	if(state == "normaldrugged_stamina"):
		addCharacter(npcMain)
		addCharacter(npcExtra1)
		addCharacter(npcExtra2)
		playAnimation(StageScene.Duo, "hurt", {npc=npcMain})
		
		saynn("YOU GOT SYRINGE'D. YOU FEEL WEAK.")
		
		saynn("[say=npc]"+RNG.pick([
			"HAHA.",
		])+"[/say]")
		
		saynn("It's {npc.him}.. your nemesis.")
		
		#TODO: Specific line maybe
		
		saynn("Looks like {npc.he} brought some friends.")
		
		saynn("[say=npc]"+RNG.pick([
			"You will do as I say. And we won't have any problems.",
			"Don't do anything stupid, please.",
			"Don't be stupid. It's three against one.",
		])+"[/say]")
		
		saynn("Something tells you they won't let you go take a nap to get your strength back..")
		
		addButton("Continue", "See what happens next", "show_others")
	
	if(state == "normalshiv"):
		addCharacter(npcMain)
		addCharacter(npcExtra1)
		addCharacter(npcExtra2)
		playAnimation(StageScene.Duo, "hurt", {npc=npcMain, npcAction="shiv"})
	
		saynn("YOU GOT SHIVED! OW.")
	
		saynn("[say=npc]"+RNG.pick([
			"HAHA.",
		])+"[/say]")
		
		saynn("It's {npc.him}.. your nemesis.")
		
		#TODO: Specific line maybe
		
		saynn("Looks like {npc.he} brought some friends.")
		
		saynn("[say=npc]"+RNG.pick([
			"You will do as I say. And we won't have any problems.",
			"Don't do anything stupid, please.",
			"Don't be stupid. It's three against one.",
		])+"[/say]")
		
		saynn("Something tells you they won't give you a bondage to help stop the bleeding..")
		
		addButton("Continue", "See what happens next", "show_others")
	
	if(state == "cellbondage"):
		playAnimation(StageScene.Sleeping, "sleep")
	
		saynn("YOU WAKE UP WITH BONDAGE ITEMS ON YOU.")
		
		addButton("Continue", "See what happens next", "cellbondage_reveal")
	
	if(state == "cellbondage_reveal"):
		addCharacter(npcMain)
		addCharacter(npcExtra1)
		addCharacter(npcExtra2)
		playAnimation(StageScene.Duo, "stand", {npc=npcMain})
		
		saynn("You get up.. and see three figures surrounding you. The leader steps closer.")
		
		saynn("[say=npc]"+RNG.pick([
			"HAHA.",
		])+"[/say]")
		
		saynn("It's {npc.him}.. your nemesis.")
		
		#TODO: Specific line maybe
		
		saynn("Looks like {npc.he} brought some friends.")
		
		saynn("[say=npc]"+RNG.pick([
			"You will do as I say. And we won't have any problems.",
			"Don't do anything stupid, please.",
			"Don't be stupid. It's three against one.",
		])+"[/say]")
		
		saynn("Something tells you they won't give you time to struggle out of your new bondage gear..")
		
		addButton("Continue", "See what happens next", "show_others")
	
	if(state == "canteendrugged_lust"):
		playAnimation(StageScene.Duo, "sit")
	
		saynn("You're busy finishing your meal..")
		
		saynn("But as you do.. you begin to feel something. It suddenly became very hot in here.")
		
		if(GM.pc.isWearingChastityCage()):
			saynn("Your locked away cock is getting really tight in its small cage.. You feel so needy all of the sudden.")
		elif(GM.pc.hasReachablePenis()):
			saynn("Your cock is getting hard and drippy.. leaking pre.. You feel so needy all of the sudden.")
		elif(GM.pc.hasReachableVagina()):
			saynn("Your pussy is getting wet and sensitive.. you're falling into heat.. you need to do something about it..")
		else:
			saynn("You feel so needy all of the sudden..")
		
		saynn("[say=npc]"+RNG.pick([
			"Feeling hot, huh?",
			"Enjoying the food?",
		])+"[/say]")
		
		addButton("Continue", "See what happens next", "canteendrugged_lust_reveal")
		
	if(state == "canteendrugged_lust_reveal"):
		addCharacter(npcMain)
		addCharacter(npcExtra1)
		addCharacter(npcExtra2)
		playAnimation(StageScene.Duo, "stand", {npc=npcMain})
		
		saynn("You get up.. and see three figures surrounding you. The leader steps closer.")
		
		saynn("[say=npc]"+RNG.pick([
			"I asked the chef to make your food a little.. spicier.",
			"I asked the chef to add a little something into your meal.",
		])+"[/say]")
		
		saynn("It's {npc.him}.. your nemesis.")
		
		#TODO: Specific line maybe
		
		saynn("Looks like {npc.he} brought some friends.")
		
		saynn("[say=npc]"+RNG.pick([
			"You will do as I say. And we won't have any problems.",
			"Don't do anything stupid, please.",
			"Don't be stupid. It's three against one.",
		])+"[/say]")
		
		saynn("Something tells you they won't give you time to solve your lust problem..")
		
		addButton("Continue", "See what happens next", "show_others")
		
	if(state == "showeritems"):
		playAnimation(StageScene.Showering, "head", {pc="pc", bodyState={naked=true}})
		
		saynn("You were taking a normal shower.. washing yourself, letting the water get rid of any filth.")

		saynn("But, for some reason, you get a feeling that you are being [b]watched[/b]..")
		
		addButton("Continue", "See what happens next", "showeritems_reveal")
		
	if(state == "showeritems_reveal"):
		addCharacter(npcMain)
		addCharacter(npcExtra1)
		addCharacter(npcExtra2)
		playAnimation(StageScene.Duo, "stand", {npc=npcMain})
		
		saynn("Suddenly, three figures enter the room and surround you. The leader steps closer.")
		
		saynn("[say=npc]"+RNG.pick([
			"Hi. Remember me?",
			"How is the water?",
			"Hey there. Missed me?",
		])+"[/say]")
		
		saynn("It's {npc.him}.. your nemesis.")
		
		#TODO: Specific line maybe
		
		saynn("Looks like {npc.he} brought some friends.")
		
		saynn("[say=npc]"+RNG.pick([
			"You will do as I say. And we won't have any problems.",
			"Don't do anything stupid, please.",
			"Don't be stupid. It's three against one.",
		])+"[/say]")
		
		saynn("You left all your items in the locker. Something tells you they won't let you get to them..")
		
		addButton("Continue", "See what happens next", "show_others")
	
	if(state == "show_others"):
		playAnimation(StageScene.Duo, "stand", {pc=npcExtra1, npc=npcExtra2})
		
		saynn("There are others with {npc.him}! You will have to win 3 fights in a row.")
		
		saynn("Or just let {npc.name} do whatever {npc.he} wants with you. You get a feeling that it won't end well for you though..")
		
		if(ambushType == "normalshiv"):
			saynn("You got stabbed.. so you will also start the first fight with a [color=red]huge[/color] bleeding.")
		if(ambushType == "showeritems"):
			saynn("You got ambushed in a shower room. You will have to fight [b]naked[/b] and with no access to your weapons or other helpful items like painkillers.")
		
		addButton("Fight", "You'd rather fight", "first_fight")
		addButton("Submit", "See what happens..", "do_submit")
	
	if(state == "first_fight"):
		playAnimation(StageScene.Duo, "stand", {npc=npcExtra1})
		
		saynn("You prepare to fight back.")
		
		saynn("[say=npc]"+RNG.pick([
			"That a dumb decision.",
			"Really? You think you can win?",
			"What do you think will happen when you lose?",
			"You're only making it worse for yourself.",
		])+"[/say]")
		
		saynn("{npc.name} decides to let {npc.his} friends soften you up first.")
		
		addButton("Fight", "Start the fight", "start_first_fight")
	
	if(state == "second_fight"):
		playAnimation(StageScene.Duo, "stand", {npc=npcExtra2})
		
		saynn("You won. The first friend is kissing the floor.")
		
		saynn("But you're not free yet.")
		
		saynn("{npc2.name} approaches you, eager to fight.")
		
		addButton("Fight", "Start the fight", "start_second_fight")
	
	if(state == "third_fight"):
		playAnimation(StageScene.Duo, "stand", {npc=npcMain})
		
		saynn("Both of {npc.nameS} friends got defeated.")
		
		saynn("[say=npc]"+RNG.pick([
			"Alright. Lets dance.",
			"Alright. Lets see what you can do.",
			"Alright. Lets play.",
			"This is not over yet.",
			"How are you feeling? Maybe you should just give up already.",
			"I guess it's time to show you your place.",
		])+"[/say]")
		
		saynn("Last fight. It's your nemesis.")
		
		addButton("Fight", "Start the fight", "start_third_fight")
	
	if(state == "won_all_fights"):
		playAnimation(StageScene.Duo, "stand", {npc=npcMain, npcAction="defeat"})
		
		saynn("You won! Your nemesis hits the floor, unable to continue fighting.")
		
		saynn("[say=npc]"+RNG.pick([
			"Hey.. Listen.. Let's talk.",
			"Argh.. you.. bitch..",
			"Fuck you.. whatever..",
		])+"[/say]")
		
		addButton("Leave", "Just leave them be", "decideLeave")
		addButton("Punish", "Do something fun with them", "startPunish")
	
	if(state == "decideLeave"):
		playAnimation(StageScene.Solo, "stand")
		
		saynn("{npc.He} {npc.isAre} not worth your time.")
		
		saynn("After teaching {npc.him} a lesson, you decide to just leave.")
		
		saynn("Hopefully {npc.he} won't be a problem anymore.")
		
		addButton("Continue", "See what happens next", "endthescene")
	
	if(state == "lost_fight"):
		playAnimation(StageScene.Solo, "defeat")
		
		saynn("You lost. Your nemesis has won.")
		
		saynn("You're on the floor, trying to catch your breath.")
		
		saynn("[say=npc]"+RNG.pick([
			"That was dumb.",
			"Was it worth it?",
			"You tried. But you're too weak.",
			"Pathetic display.",
			"That was way too easy.",
			"Time for the fun part.",
		])+"[/say]")
		
		saynn("{npc.name} approaches you and quickly injects your neck with some syringe..")
		
		addButton("Continue", "See what happens next..", "get_knocked_out")
	
	if(state == "do_submit"):
		playAnimation(StageScene.Duo, "knee", {npc=npcMain})
		
		saynn("Fighting.. is not worth it. You decide to submit.")
		
		saynn("You get on your knees before {npc.name}.. and wait for {npc.his} next decision.")
		
		saynn("[say=npc]"+RNG.pick([
			"Good {pc.boy}. You won't regret it.",
			"Maybe you're not as dumb as I thought.",
			"Thank you. Thank you for making it easy for me.",
			"That was a smart choice. Thank you.",
		])+"[/say]")
		
		saynn("{npc.name} approaches you and quickly injects your neck with some syringe..")
		
		addButton("Continue", "See what happens next", "get_knocked_out")
	
	if(state == "get_knocked_out"):
		removeCharacter(npcMain)
		removeCharacter(npcExtra1)
		removeCharacter(npcExtra2)
		playAnimation(StageScene.Sleeping, "sleep")
		
		saynn("Whatever it is.. it's working fast.")
		
		saynn("You collapse completely, your body not responding anymore. Your mind is getting sleepier and sleepier..")
		
		saynn("The last thing you hear is..")
		
		saynn("[say=npc]"+RNG.pick([
			"This is just the beginning.",
			"Enjoy your new life.",
			"Let's hope I won't see you ever again.",
			"We're almost done here. Only one last thing left.",
		])+"[/say]")
		
		saynn("And then everything goes dark..")
		
		addButton("Continue", "See what happens next", "start_slavery")
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		transferAllItems(getCharacter("TempAmbushStash"), GM.pc)
		if(ambushType == "showeritems"):
			addMessage("All your items were returned to your inventory.")
		endScene()
		return
	if(_action == "start_first_fight"):
		runScene("FightScene", [npcExtra1], "first_fight")
		if(ambushType == "normalshiv"):
			GM.pc.addEffect(StatusEffect.Bleeding, [8])
		return
	if(_action == "start_second_fight"):
		runScene("FightScene", [npcExtra2], "second_fight")
		return
	if(_action == "start_third_fight"):
		runScene("FightScene", [npcMain], "third_fight")
		return
	if(_action == "start_slavery"):
		transferAllItems(getCharacter("TempAmbushStash"), GM.pc)
		endScene()
		runScene(getModule("PlayerSlaveryModule").getSlaveryStartScene())
		return
	if(_action == "startPunish"):
		transferAllItems(getCharacter("TempAmbushStash"), GM.pc)
		endScene()
		var thePawn = GM.main.IS.spawnPawn(npcMain)
		if(thePawn):
			thePawn.setLocation(GM.pc.getLocation())
			GM.main.IS.startInteraction("PunishInteraction", {punisher="pc", target=npcMain})
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "first_fight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		if(battlestate == "win"):
			setState("second_fight")
		else:
			setState("lost_fight")
	if(_tag == "second_fight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		if(battlestate == "win"):
			setState("third_fight")
		else:
			setState("lost_fight")
	if(_tag == "third_fight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		if(battlestate == "win"):
			GM.main.RS.stopSpecialRelationship(npcMain)
			setState("won_all_fights")
		else:
			setState("lost_fight")

func saveData():
	var data = .saveData()
	
	data["ambushType"] = ambushType
	data["ambushPlace"] = ambushPlace
	data["npcMain"] = npcMain
	data["npcExtra1"] = npcExtra1
	data["npcExtra2"] = npcExtra2
	
	return data
	
func loadData(data):
	.loadData(data)
	
	ambushType = SAVE.loadVar(data, "ambushType", "")
	ambushPlace = SAVE.loadVar(data, "ambushPlace", "")
	npcMain = SAVE.loadVar(data, "npcMain", "")
	npcExtra1 = SAVE.loadVar(data, "npcExtra1", "")
	npcExtra2 = SAVE.loadVar(data, "npcExtra2", "")




func transferAllItems(_charFrom, _charTo):
	if(!_charFrom || !_charTo):
		return
	var theItems:Array = _charFrom.getInventory().getItems()
	while(!theItems.empty()):
		var theItem = theItems[0]
		
		_charFrom.getInventory().removeItem(theItem)
		_charTo.getInventory().addItem(theItem)

func transferHelpfulItems(_charFrom, _charTo):
	if(!_charFrom || !_charTo):
		return
	var theItems:Array = _charFrom.getInventory().getItems()
	var toTransfer:Array = []
	for item in theItems:
		if(item.getItemCategory() == ItemCategory.Medical || item.getItemCategory() == ItemCategory.Weapons):
			toTransfer.append(item)
	
	for theItem in toTransfer:
		_charFrom.getInventory().removeItem(theItem)
		_charTo.getInventory().addItem(theItem)

func transferAllEquippedItems(_charFrom, _charTo):
	for slot in _charFrom.getInventory().getEquippedItems():
		var theItem:ItemBase = _charFrom.getInventory().getEquippedItem(slot)
		if(theItem.isImportant() || theItem.isRestraint()):
			continue
		_charFrom.getInventory().clearSlot(slot)
		_charTo.getInventory().addItem(theItem)
