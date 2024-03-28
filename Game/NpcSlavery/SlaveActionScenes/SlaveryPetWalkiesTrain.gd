extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter

var isSuccess = false

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

#func _reactInit():
#	processTime(10*60)
#	npc.afterTakingAShower()
#
#	var npcSlavery:NpcSlave = npc.getNpcSlavery()
#	if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
#		npcSlavery.getActivity().satisfyWant("pee")

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _init():
	sceneID = "SlaveryPetWalkiesTrain"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcBodyState={naked=true, leashedBy="pc"}})

		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		saynn("What kind of commands do you want to train with your pet?")
		
		addButton("Simple", "Try one of the simple commands", "try_simple")
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 8):
			addButton("Advanced", "Really test your pet", "try_advanced")
		else:
			addDisabledButton("Advanced", "Pet skill B- or higher required")
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 11):
			addButton("Lewd ones", "See how kinky your pet can get", "try_lewd")
		else:
			addDisabledButton("Lewd ones", "Pet skill A or higher required")
		
		
	if(state == "s_sit"):
		saynn("You gently guide your restrained puppy into a sitting position, your voice firm.")
		
		saynn("[say=pc]Sit.[/say]")
		
		saynn("You repeat it a few times, trying to make your puppy associate the command with the right action.")
		
		if(isSuccess):
			playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcAction="sit", npcBodyState={naked=true, leashedBy="pc"}})
			
			saynn("{npc.name} responds well, lowering {npc.his} hind paws and sitting on them. {npc.He} looks up at you with bright eyes.")
			
			saynn("[say=pc]Good.[/say]")
		else:
			saynn("Your pet struggles to both understand and execute the command, {npc.his} attempts to sit resulting in awkward movements and confusion.")
			
			saynn("[say=pc]We will work on that a bit more.[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "s_lay"):
		saynn("You demonstrate the action of laying down to your puppy by lowering your head and reaching your hands forward, your tone is firm.")
		
		saynn("[say=pc]Lay down.[/say]")
		
		saynn("You repeat it a few times, trying to make your puppy associate the command with the right action.")
		
		if(isSuccess):
			playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcAction="sad", npcBodyState={naked=true, leashedBy="pc"}})
			
			saynn("{npc.name} obeys your command with enthusiasm, gracefully lowering {npc.himself} to the ground and stretching out in a comfortable position. {npc.He} looks up at you, waiting for any feedback.")
			
			saynn("[say=pc]Good job.[/say]")
		else:
			saynn("Despite your best efforts, your puppy struggles to understand the command, tilting {npc.his} head a lot and whining quietly.")
			
			saynn("[say=pc]Guess you need some more training.[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "s_voice"):
		saynn("You encourage your puppy to be vocal by making barking sounds yourself. Then you point at your pet and say the command firmly.")
		
		saynn("[say=pc]Voice.[/say]")
		
		if(isSuccess):
			saynn("{npc.name} obeys eagerly, letting out many barks and yips in response.")
			
			saynn("[say=npc]"+RNG.pick([
				"Woof! Bark!",
				"Woof.. woof.",
				"Woof? Wruff..",
				"Bark, bark-bark!",
				])+"[/say]")
			
			saynn("[say=pc]That's it, good puppy.[/say]")
		else:
			playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcAction="sad", npcBodyState={naked=true, leashedBy="pc"}})
			
			saynn("Despite {npc.his} best efforts, your puppy struggles to understand the command, {npc.his} attempts to bark sounding pathetic.")
			
			saynn("[say=npc]"+RNG.pick([
				"Um.. aff?",
				"Ar..f?",
				"Bar..-f?",
				"This is humiliating..",
				"Do I really have to..",
				])+"[/say]")
			
			saynn("[say=pc]Such a silly pup. We will get you barking in no time.[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "a_givepaw"):
		saynn("You gently take hold of your puppy's paw, shaking it a little as you issue the command.")
		
		saynn("[say=pc]Give paw.[/say]")
		
		saynn("You repeat the training a few times and then say the command without doing the action yourself.")
		
		if(isSuccess):
			playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcAction="paw", npcBodyState={naked=true, leashedBy="pc"}})
			
			saynn("{npc.name} responds to your command with enthusiasm, sitting up and lifting {npc.his} paw high, offering it for you to shake. You do so and give {npc.him} a pat.")
			
			saynn("[say=pc]Very nice.[/say]")
		else:
			playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcAction="sad", npcBodyState={naked=true, leashedBy="pc"}})
			
			saynn("Despite {npc.his} best efforts, your puppy struggles to understand what {npc.he} should do, {npc.he} looks at {npc.his} firm restraints and let's out a whine of confusion.")
			
			saynn("[say=pc]You still have paws, silly pup.[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "a_presentbelly"):
		saynn("You stroke your pet's back and reach for {npc.his} belly, trying to make {npc.him} show it to you.")
		
		saynn("[say=pc]Belly rubs. Who wants belly rubs?[/say]")
		
		if(isSuccess):
			playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcAction="back", npcBodyState={naked=true, leashedBy="pc"}})
			
			saynn("{npc.name} hears your words and is quick to roll onto {npc.his} back, presenting you {npc.his} naked belly. Obviously, you give {npc.him} all of the belly rubs, making {npc.him} squirm.")
			
			saynn("[say=pc]That's right, you like belly rubs, don't you?[/say]")
		else:
			playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcAction="sad", npcBodyState={naked=true, leashedBy="pc"}})
			
			saynn("Despite {npc.his} best efforts, your puppy struggles to roll onto {npc.his} back, the restraints making it extremely awkward to do anything.")
			
			saynn("[say=pc]You will get there, I'm sure. But no belly rubs for you for now.[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "a_heel"):
		saynn("You wonder if your pet can do a command without you explaining it. You point down at the floor just beside you.")
		
		saynn("[say=pc]Heel.[/say]")
		
		if(isSuccess):
			playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcAction="walk", npcBodyState={naked=true, leashedBy="pc"}})
			
			saynn("{npc.name} hears the command and is quick to take the offered position, looking ready to follow you.")
			
			saynn("[say=pc]That was some fast thinking, good job.[/say]")
		else:
			playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcAction="sad", npcBodyState={naked=true, leashedBy="pc"}})
			
			saynn("Your puppy tilts {npc.his} head and struggles to figure out what {npc.he} should do with your heels.. and why are you pointing there. You hear confused whining.")
			
			saynn("[say=pc]Heel means stand beside me and follow, silly pup.[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "l_lick"):
		playAnimation(StageScene.PuppySexOral, "tease", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		
		if(GM.pc.isWearingChastityCage()):
			saynn("You decide to get a little kinky and put your chastity out on display before crouching near your puppy and pointing at it.")
		
			saynn("[say=pc]Lick.[/say]")
			
			saynn("That command is quite unusual for pets.. but {npc.name} obeys anyway and proceeds to drag {npc.his} tongue over your cage, occasionally giving your balls a small lick too.")
		
			saynn("[say=pc]Good {npc.boy}.[/say]")
		elif(GM.pc.hasReachablePenis()):
			saynn("You decide to get a little kinky and put your {pc.penis} out on display before crouching near your puppy and pointing at it.")
		
			saynn("[say=pc]Lick.[/say]")
			
			saynn("That command is quite unusual for pets.. but {npc.name} obeys anyway and proceeds to drag {npc.his} tongue over your shaft, occasionally giving your balls a small lick too.")
		
			saynn("[say=pc]Good {npc.boy}.[/say]")
		elif(GM.pc.hasReachableVagina()):
			saynn("You decide to get a little kinky and put your pussy slit out on display before crouching near your puppy and pointing at it.")
		
			saynn("[say=pc]Lick.[/say]")
			
			saynn("That command is quite unusual for pets.. but {npc.name} obeys anyway and proceeds to drag {npc.his} tongue over your sensetive folds, occasionally giving your clit a little smooch and lick too.")
		
			saynn("[say=pc]Good {npc.boy}.[/say]")
		else:
			saynn("You decide to get a little kinky and put your naked crotch out on display before crouching near your puppy and pointing at it.")
		
			saynn("[say=pc]Lick.[/say]")
			
			saynn("That command is quite unusual for pets.. but {npc.name} obeys anyway and proceeds to drag {npc.his} tongue over your crotch, occasionally giving a little smooch too.")
		
			saynn("[say=pc]Good {npc.boy}.[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "l_presentbutt"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcAction="sad", flipNPC=true, npcBodyState={naked=true, leashedBy="pc"}})
		
		saynn("You twirl your finger and use your strict voice.")
		
		saynn("[say=pc]Present yourself, pup.[/say]")
		
		if(npc.isWearingChastityCage()):
			saynn("Not the usual command that an owner gives to their pet.. But {npc.name} obeys, turning around and lowering {npc.his} head low while sticking {npc.his} {npc.masc} butt high up, giving you the perfect view of {npc.his} caged up cock"+(", slick pussy" if npc.hasReachableVagina() else "")+" and {npc.analStretch} tailhole. Your pet seems to be ready for breeding at any time.")
		elif(npc.hasReachablePenis()):
			saynn("Not the usual command that an owner gives to their pet.. But {npc.name} obeys, turning around and lowering {npc.his} head low while sticking {npc.his} {npc.masc} butt high up, giving you the perfect view of {npc.his} {npc.penis}"+(", slick pussy" if npc.hasReachableVagina() else "")+" and {npc.analStretch} tailhole. Your pet seems to be ready for breeding at any time.")
		elif(npc.hasReachableVagina()):
			saynn("Not the usual command that an owner gives to their pet.. But {npc.name} obeys, turning around and lowering {npc.his} head low while sticking {npc.his} {npc.masc} butt high up, giving you the perfect view of {npc.his} slick pussy and {npc.analStretch} tailhole. Your pet seems to be ready for breeding at any time.")
		else:
			saynn("Not the usual command that an owner gives to their pet.. But {npc.name} obeys, turning around and lowering {npc.his} head low while sticking {npc.his} {npc.masc} butt high up, giving you the perfect view of {npc.his} {npc.analStretch} tailhole. Your pet seems to be ready for breeding at any time.")
		
		saynn("[say=pc]Great ass, pup.[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "l_kissfeet"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcAction="sad", npcBodyState={naked=true, leashedBy="pc"}})
		
		saynn("You raise one of your legs slightly and present your foot to your puppy. Your lips let out a strict command.")
		
		saynn("[say=pc]Kiss.[/say]")
		
		saynn("{npc.name} responds by crawling a little closer and leaning in to leave a few small kisses on your toes.")
		
		saynn("[say=pc]More.[/say]")
		
		saynn("{npc.He} barks softly and starts covering your foot with more little smooches, {npc.his} lips woshipping your skin with each tender touch.")
		
		saynn("[say=pc]Gooood puppy, such an obedient pet.[/say]")
		
		saynn("You notice {npc.his} tail wiggling.")
		
		addButton("Continue", "See what happens next", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "try_simple"):
		processTime(10*60)
		var succChance = 60
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 8):
			succChance = 100
		
		if(RNG.chance(succChance)):
			isSuccess = true
		else:
			isSuccess = false
		npcSlavery.getActivity().satisfyWant("train")
		setState(RNG.pick(["s_sit", "s_lay", "s_voice"]))
		return

	if(_action == "try_advanced"):
		processTime(10*60)
		var succChance = 50
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 11):
			succChance = 75
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 13):
			succChance = 90
		
		if(RNG.chance(succChance)):
			isSuccess = true
		else:
			isSuccess = false
		npcSlavery.getActivity().satisfyWant("train")
		setState(RNG.pick(["a_givepaw", "a_presentbelly", "a_heel"]))
		return

	if(_action == "try_lewd"):
		processTime(10*60)
		var succChance = 60
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 13):
			succChance = 80
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 15):
			succChance = 100
		
		if(RNG.chance(succChance)):
			isSuccess = true
		else:
			isSuccess = false
		npcSlavery.getActivity().satisfyWant("train")
		setState(RNG.pick(["l_lick", "l_presentbutt", "l_kissfeet"]))
		return

	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["isSuccess"] = isSuccess

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
	isSuccess = SAVE.loadVar(data, "isSuccess", false)
