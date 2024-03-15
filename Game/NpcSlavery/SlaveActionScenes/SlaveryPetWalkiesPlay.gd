extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter


func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

func _reactInit():
	pass
	#processTime(10*60)
	#npc.afterTakingAShower()
	
	#var npcSlavery:NpcSlave = npc.getNpcSlavery()
	#if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
	#	npcSlavery.getActivity().satisfyWant("shower")

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _init():
	sceneID = "SlaveryPetWalkiesPlay"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, flipNPC=true, npcBodyState={naked=true, leashedBy="pc"}})
		#var npcSlavery:NpcSlave = npc.getNpcSlavery()

		saynn("How do you want to play with your pet?")
		
		addButton("Fetch", "Make them bring you a stick", "play_fetch")
	
	if(state == "play_fetch"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		playAnimation(StageScene.PuppyDuo, "throw", {npc=npcID, npcAction="walk", flipNPC=true, npcBodyState={naked=true}})
		
		saynn("You find a wooden stick on the floor and pick it up.")
		
		saynn("[say=pc]Look at this, puppy.[/say]")
		
		saynn("You make sure your pet is tracking the stick.. before tossing it in a random direction.")
		
		saynn("[say=pc]"+RNG.pick([
			"Got get it!",
			"Fetch!",
			"Bring it back, {npc.boy}!",
		])+"[/say]")
		
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 15):
			saynn("With a burst of energy, your pet takes off after the stick, {npc.his} movements graceful and agile.. even if the restraints do still limit them quite a bit.")
			
			saynn("{npc.He} grabs the sticks with {npc.his} mouth and brings it back to you, {npc.his} tail wagging furiously as you grab it and give {npc.him} some headpats as a reward.")
		elif(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 11):
			saynn("Your pet takes off after the stick, {npc.his} movements fluint and confident. {npc.He} stumbles a little because of the restraints.. but {npc.he} manages to bring back the stick.")
			
			saynn("Your pet is panting a lot as you retrive the stick from {npc.his} mouth and give {npc.him} some pats as a reward.")
		elif(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 7):
			saynn("Your pet enthusiastically chases after the stick, {npc.his} movements eager and determined. Despite the restraints hindering {npc.him} slightly, {npc.he} manages to retrieve the stick and bring it back to you.")
			
			saynn("With a wagging tail, your pet waits eagerly as you take the stick from {npc.his} mouth and give {npc.him} a few pats on the head as a reward.")
		else:
			if(RNG.chance(33)):
				saynn("Your pet eagerly chases after the stick, but {npc.he} seems to struggle with the restraints, tripping over {npc.his} own paws and losing sight of the stick.")
				
				saynn("Despite {npc.his} best efforts, your pet can't seem to locate the stick, sniffing around in confusion before eventually giving up. Aw. Looks like your pet could use some more training. You give {npc.him} a pat for trying.")
			else:
				saynn("Your pet eagerly chases after the stick, {npc.his} movements filled with enthusiasm but lacking the required muscle memory. {npc.He} struggles to locate it at first, but after some searching, {npc.he} manages to find it, barking happily.")
				
				saynn("Despite it taking a few minutes, your pet eventually retrieves the stick, panting heavily as {npc.he} drops it at your feet. You give {npc.him} a few encouraging pats as a reward.")
			
		addButton("Continue", "See what happens next", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "play_fetch"):
		processTime(10*60)

		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
			npcSlavery.getActivity().satisfyWant("play")
		
	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
