extends "res://Scenes/SceneBase.gd"

#var npcID = ""
#var npc:DynamicCharacter
#var bornString = ""
#var bornChildAmount = 0
#
##ACEPREGEXPAC- When I started this pack, I wanted obviously wanted something to expand the pc pregnancy content as well. And as a result, Alex was chosen to be like the inverse of all the interactions the NPCs will give the player.
##the Birth scene was an obvious one, instead of a pregnant NPC coming to the player, have the a pregnant PC take NPC to help them give birth.
##Alex was chosen for these interactions, mainly because hes the only one that makes sense. Rahi has her preg content in base game, Nova lacks content and has a to-be-written plotline only The Holy Loaf knows, same issue with Risha but she's a bitch on top of that. Avy would probably just make your life harder trying to bring her along. As of writing this, I *still* haven't played Tavi's content, so she's out too. And Eliza has the same missing plotline issue like Nova unless its in Tavi content, so sex only.
##Sucks having to cobble this thing together when I dont know how to program nearly at all
##This is gonna be the most broken scene, I swear
#
##func _initScene(_args = []):
##	npcID = _args[0]
##	npc = GlobalRegistry.getCharacter(npcID)
#
##func resolveCustomCharacterName(_charID):
##	if(_charID == "npc"):
##		return npcID
#
#func _init():
#	sceneID = "TakeAlexToPlayerBirth"
#
#func _run():
#	if(state == ""):
#		addCharacter("alexrynard")
##
##		saynn("The nurse gasps when she sees the huge belly of the person on your leash.")
##
##		saynn("Clearly, it's time to let {npc.name} give birth..")
##
##		addButton("Continue", "Time to do this", "before_birth")
###		addButton("Cancel", "You changed your mind", "endthescene")
#
#	if(state == "before_birth"):
#		playAnimation(StageScene.GivingBirth, "birth", {pc="pc", bodyState={naked=true}})
#
##		saynn("You stand by {npc.name} side while {npc.he} listens to the nurse's orders. Then {npc.he} reaches {npc.his} hand to you and smiles nervously. You decide to hold it, to help {npc.him} feel calmer.")
##
##		saynn("Contractions are happening, causing {npc.name} to groan from the pain while clenching your hand.")
##
##		saynn("The room fills with tension as {npc.name} produces more and more painful cries when the contractions become faster and harder.")
##
##		addButton("Continue", "See what happens next", "do_birth")
#	if(state == "do_birth"):
#		playAnimation(StageScene.GivingBirth, "idle", {pc="pc", bodyState={naked=true}})
#		if (bornChildAmount == 1):
#			saynn("{npc.name} gave birth to "+str(bornChildAmount)+" kid!")
#
#		else:
#			saynn("{npc.name} gave birth to "+str(bornChildAmount)+" kids!")
#
#		saynn(""+str(bornString)+"")
#
#		addButton("Continue", "See what happens next", "after_birth")
#
#	if(state == "after_birth"):
#		playAnimation(StageScene.SexStart, "start", {pc = "pc", npc="alexrynard", npcBodyState={naked=true}})
##		if (bornChildAmount <= 1):
#			saynn("Moments pass like an eternity until finally, the sound of a newborn's cry fills the air.")
#
#			saynn("{npc.name}'s eyes shine with tears of relief and joy. She waits for the nurse to carefully clean her child and then begins cradling in her hands.")
#
#		elif (bornChildAmount == 2):
#			saynn("Moments pass like an eternity until finally, the sound of a newborn's cry fills the air. Oh.. But not just one.. Soon {npc.name} gives birth to another kid..")
#
#			saynn("{npc.name}'s eyes shine with tears of relief and joy. She waits for the nurse to carefully clean her child and then begins cradling one of them in her hands.")
#
#		else:
#			saynn("Moments pass like an eternity until finally, the sound of a newborn's cry fills the air. Oh.. But not just one.. Soon {npc.name} gives birth to another kid.. But even after that, {npc.his} belly is still big, meaning there is more..")
#
#			saynn("It's only when {npc.name} gives birth to the last child, {npc.his} eyes begin to shine with tears of relief and joy. She waits for the nurse to carefully clean her child and then begins cradling one of them in her hands.")
#
#		saynn("[say=npc]"+str(RNG.pick(["Oh.. oh my.. so perfect.. Look at the tiny fingers and those little eyes.. So beautiful..", "Hi, mommy loves you more than words can express.. welcome to the world, my precious..", "I can't believe I brought this incredible life into existence.. I can't live without you already..", "I will do everything in my power to give you the life you deserve.."]))+"[/say]")
#
#		saynn("{npc.He} gently kisses {npc.his} baby's forehead while you stand nearby and smile.")
#
#		saynn("[say=pc]You did an amazing job.[/say]")
#
#		saynn("You both just stare at the new life for a while..")
#
#		if (bornChildAmount <= 1):
#			saynn("Sadly, you can only spend so much time with that kid, the strict prison policy forbids prolonged inmate interaction. Fair enough.. You wave the new life goodbye and then step back into the lobby with the mother, your hand quickly leashes {npc.him} again.")
#
#		else:
#			saynn("Sadly, you can only spend so much time with those kids, the strict prison policy forbids inmate interaction with them. Fair enough.. You wave the new life goodbye and then step back into the lobby with the mother, your hand quickly leashes {npc.him} again.")

#		saynn("Time to go..")
#
#		addButton("Continue", "That was something", "endthescene")


#func _react(_action: String, _args):
#	if(_action == "endthescene"):
#		endScene()
#		return
#
#	if(_action == "before_birth"):
#		processTime(3*60)
#
#	if(_action == "do_birth"):
#		processTime(35*60)
#		var bornChilds = GM.pc.giveBirth()
#		bornChildAmount = bornChilds.size()
##		bornString = GM.CS.getChildBirthInfoString(bornChilds)
#
#		GM.pc.addSkillExperience(Skill.Fertility, 150) # 
#
#	setState(_action)


#func saveData():
#	var data = .saveData()
#
##	data["npcID"] = npcID
#	data["bornString"] = bornString
#	data["bornChildAmount"] = bornChildAmount
#
#	return data
#
#func loadData(data):
#	.loadData(data)
#
#	npcID = SAVE.loadVar(data, "npcID", "")
#	npc = GlobalRegistry.getCharacter(npcID)
#	bornString = SAVE.loadVar(data, "bornString", "")
#	bornChildAmount = SAVE.loadVar(data, "bornChildAmount", 0)
