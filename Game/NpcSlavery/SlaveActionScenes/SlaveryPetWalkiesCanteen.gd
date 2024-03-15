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
	sceneID = "SlaveryPetWalkiesCanteen"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, flipNPC=true, npcBodyState={naked=true, leashedBy="pc"}})
		var npcSlavery:NpcSlave = npc.getNpcSlavery()

		saynn("You bring your pet to the canteen, catching a fair amount of eyes from the inmates around.")
		
		saynn("What do you want to get for {npc.name}? You notice that the kitchen also offers literal dog food.. but only for animals and at a price of 2 credits.. Your pet is an animal, sort of.")
		
		addButton("Inmate food", "Free option that is available for everyone", "feed_inmatefood")
		addButtonWithChecks("Dog food", "Pay 2 credits to get a special treat for your pet", "feed_dogfood", [], [[ButtonChecks.HasCredits, 2]])
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 10):
			addButton("Puppy treats", "Maybe you can get some free treats?", "feed_puppytreats")
		else:
			addDisabledButton("Puppy treats", "Pet skill A- or higher required")
	
	if(state == "feed_inmatefood"):
		playAnimation(StageScene.PuppyDuo, "sit", {npc=npcID, npcAction="sad", flipNPC=true, npcBodyState={naked=true, leashedBy="pc"}})
		
		saynn("You decide not to be too fancy and just order some usual inmate food for your pet.")
		
		saynn("The cook sees who you have on a leash and decides to switch the normal tray with a plastic pet bowl before filling it full of gray tasteless-looking paste. At least it’s free, hey.")
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) < 11):
			saynn("You take a seat on one of the benches and put the bowl on the floor. Your puppy approaches it and awkwardly plops {npc.his} face into it. While {npc.he} {npc.isAre} busy with that, you just admire the view.")
		
			saynn("The paste is clearly not a delicacy.. but it’s enough to satisfy the hunger. Your pet seems slightly more happy.")
		else:
			saynn("You take a seat on one of the benches and put the bowl on the floor. Your puppy approaches it and then carefully lowers {npc.himself} onto the floor, {npc.his} chin resting on the bowl. While {npc.he} {npc.isAre} busy with that, you just admire the view.")
		
			saynn("The paste is clearly not a delicacy.. but it’s enough to satisfy the hunger. Your pet seems happy. {npc.He} even wiggles {npc.his} butt a bit.")
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "feed_dogfood"):
		playAnimation(StageScene.PuppyDuo, "sit", {npc=npcID, npcAction="sad", flipNPC=true, npcBodyState={naked=true, leashedBy="pc"}})
		
		saynn("You decide to pay some credits and get a pet bowl filled to the brim with dog food. Honestly.. it’s not even that bad compared to the paste that everyone else is getting, there are even some meat pieces there and there.")
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) < 12):
			saynn("You take a seat on one of the benches and put the bowl on the floor. Your pet sees the contents.. and looks at you with sad eyes.")
			
			saynn("[say=pc]Hey, c’mon. Maybe you will like it.[/say]")
			
			saynn("{npc.He} sighs and sniffs the dog food.. You can hear {npc.him} swallowing saliva audibly. So humiliating.")
			
			saynn("Looks like the hunger has won though, your pet digs {npc.his} face into the bowl and starts nomming the food. The more {npc.he} does it, the more eagerly {npc.he} crunches on it. Almost makes you feel envious.")
			
			saynn("Your pet leaves the bowl squeaky-clean. Nice.")
		else:
			saynn("You take a seat on one of the benches and put the bowl on the floor. Your pet sees its contents.. and eagerly digs {npc.his} face into it!")
			
			saynn("You can hear eager crunching noises and see {npc.his} rear wiggling happily. After leaving the bowl squeaky-clean, your pet walks up to you and nuzzles your leg thankfully.")
			
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "feed_puppytreats"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcAction="sit", flipNPC=true, npcBodyState={naked=true, leashedBy="pc"}})
		
		saynn("You wonder if you can get something better than inmate food for free. You get your pet’s attention and tell {npc.him} to try something.")
		
		saynn("Your pet nods eagerly and barks to get the cook’s attention. Then {npc.he} swiftly pushes {npc.himself} off the floor to sit up, before putting on {npc.his} best begging eyes.")
		
		saynn("The cook’s stern gaze softens as he sees your pet being all cute and obedient. It doesn’t seem to be enough so your pet also wiggles {npc.his} front paws before rolling around a few times.")
		
		saynn("And soon, the cook gives up and throws your puppy a few puppy treats! Your pet eagerly scoops them up and starts happily crunching on them. What a good {npc.boy}.")
		
		addButton("Continue", "See what happens next", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "feed_inmatefood"):
		processTime(10*60)

		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
			npcSlavery.getActivity().satisfyWant("food")

	if(_action == "feed_puppytreats"):
		processTime(10*60)

		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
			npcSlavery.getActivity().satisfyWant("food")
		npcSlavery.addLove(0.05)
		npcSlavery.addSpoiling(0.03)

	if(_action == "feed_dogfood"):
		processTime(10*60)
		GM.pc.addCredits(-2)

		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
			npcSlavery.getActivity().satisfyWant("food")
		npcSlavery.addObedience(0.05)
		npcSlavery.addLove(0.02)
		
		
	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
