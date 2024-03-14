extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter


func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

func _reactInit():
	processTime(10*60)
	npc.afterTakingAShower()
	
	var npcSlavery:NpcSlave = npc.getNpcSlavery()
	if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
		npcSlavery.getActivity().satisfyWant("shower")

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _init():
	sceneID = "SlaveryPetWalkiesShower"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.PuppySexOral, "tease", {pc="pc", npc=npcID, npcBodyState={naked=true, leashedBy="pc"}})

		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(GM.pc.getLocation() == "main_dressing2"):
			aimCameraAndSetLocName("main_shower2")
		else:
			aimCameraAndSetLocName("main_shower1")
		
		saynn("You bring your pet under one of the free shower heads and start washing {npc.him} under the running cold water, your hands gently grooming {npc.his} fur.")
		
		saynn("[say=pc]Bath time![/say]")
		
		if(npcSlavery.isActivelyResisting()):
			saynn("Your pet grumbles and tries to resist but the puppy restraints keep {npc.him} mostly helpless.")
		elif(npcSlavery.getFear() >= 40):
			saynn("Your pet shivers and keeps {npc.his} head low.")
		else:
			saynn("Your pet wiggles {npc.his} rear and barks playfully.")
			
		saynn("Soon, any mess that was on your precious puppy goes away.")
		
		addButton("Enough", "That was fun", "endthescene")
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 5):
			addButton("Wash inside", "Clean inside their holes too", "clean_inside")
		else:
			addDisabledButton("Wash inside", "Pet skill D+ or higher required")
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 8):
			addButtonWithChecks("Feed cum", "Fuck your pet's throat", "start_feed_cum", [], [[ButtonChecks.HasReachablePenis]])
			addButtonWithChecks("Feed girlcum", "Grind your pet's face", "start_feed_girlcum", [], [[ButtonChecks.HasReachableVagina]])
		else:
			addDisabledButton("Feed cum", "Pet skill B- or higher required")
		
	if(state == "start_feed_cum"):
		playAnimation(StageScene.PuppySexOral, "sex", {pc="pc", npc=npcID, npcBodyState={naked=true, hard=true, leashedBy="pc"}, bodyState={naked=true,hard=true}})
		
		saynn("Seeing your happy clean pet makes you want to get a little more kinky with {npc.him}.")
		
		saynn("You decide to feed your pet a treat.. a different kind of treat. Your pet watches with big interest as you turn off the water and kneel nearby. {npc.His} mouth is watering in anticipation as you expose your {pc.penis} and bring {npc.his} head closer.")
		
		saynn("[say=pc]Be a good {npc.boy} and open your mouth.[/say]")
		
		saynn("With a firm yet gentle hand, you guide your cock to your pet’s waiting lips. Your pet obeys as you slide your hard member between them, past {npc.his} fangs, the tip meeting {npc.his} throat.")
		
		saynn("[say=pc]If you want a treat, suck it well.[/say]")
		
		saynn("Your pet closes {npc.his} lips around your cock as you start fucking {npc.his} mouth, the tip going deep down {npc.his} throat, testing the gag-reflex!")
		
		addButton("Feed", "Feed them good", "do_feed_cum")
		
	if(state == "do_feed_cum"):
		playAnimation(StageScene.PuppySexOral, "fast", {pc="pc", npc=npcID, npcBodyState={naked=true, hard=true, leashedBy="pc"}, bodyState={naked=true,hard=true}})
		
		saynn("Your pet is working {npc.his} tongue so well that it only takes a few minutes before your member starts throbbing inside {npc.his} mouth.")
		
		saynn("You grunt as your {pc.penis} releases its load directly inside. Your seed, thick and creamy, coats {npc.his} tongue and starts sliding smoothly down {npc.his} throat, many waves of it. Your pet is obediently swallowing everything, {npc.his} throat kneading your cock with its walls.")
		
		saynn("[say=pc]Good {npc.boy}, here is your treat.[/say]")
		
		saynn("After you’ve finished feeding your pet your {pc.cum}, you offer {npc.him} some pets and scritches.")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "start_feed_girlcum"):
		playAnimation(StageScene.PuppySexOral, "grind", {pc="pc", npc=npcID, npcBodyState={naked=true, hard=true, leashedBy="pc"}, bodyState={naked=true,hard=true}})
		
		saynn("Seeing your happy clean pet makes you want to get a little more kinky with {npc.him}.")
		
		saynn("You decide to feed your pet a treat.. a different kind of treat. Your pet watches with big interest as you turn off the water and stand nearby. {npc.His} mouth is watering in anticipation as you expose your {pc.pussyStretch} pussy and bring {npc.his} head closer.")
		
		saynn("[say=pc]Be a good {npc.boy} and use your tongue.[/say]")
		
		saynn("After saying that, you push your pussy slit against {npc.his} lips, your slick folds brushing against them. As you feel {npc.his} tongue start exploring your petals, you proceed to slowly grind {npc.his} face, dragging your pussy along {npc.his} tongue and face features.")
		
		saynn("With each motion, you mark your pet with your pussy juices, forcing your scent into {npc.him}. It feels good, your cute moans begin to fill the room..")
		
		addButton("Feed", "Feed them good", "do_feed_girlcum")
		
	if(state == "do_feed_girlcum"):
		playAnimation(StageScene.PuppySexOral, "grind", {pc="pc", npc=npcID, npcBodyState={naked=true, hard=true, leashedBy="pc"}, bodyState={naked=true,hard=true}})
		
		saynn("You grind your pet’s face faster and harder, your pussy twitching a lot around that tongue.. until the orgasm washes over you.")
		
		saynn("Your body starts squirming as your clenching pussy releases a fountain of {pc.girlcum} directly into your pet’s mouth. Your warm juices flow down {npc.his} tongue and throat as {npc.he} eagerly laps them up. The orgasmic sensations sends lots of shivers through you, many more cute moans escaping from you.")
		
		saynn("[say=pc]Good {npc.boy}.. Lap them all up.. yeah, just like that.[/say]")
		
		saynn("After you’ve finished feeding your pet your {pc.girlcum}, you offer {npc.him} some pets and scritches.")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "clean_inside"):
		playAnimation(StageScene.PuppyPinned, "pinned", {pc="pc", npc=npcID, npcBodyState={naked=true, hard=true, leashedBy="pc"}})
		
		if(npc.hasReachableVagina()):
			saynn("You also want to wash inside your pet's holes so you get up and put your foot on {npc.his} head, pinning {npc.him} to the cold wet floor while also making {npc.him} stick {npc.his} butt high up, {npc.his} pussy and ass positioned directly under the shower head.")
			
			saynn("[say=pc]Gotta get you washed everywhere, puppy.[/say]")
			
			saynn("Water starts flowing along your pet's private bits and washing away any mess with it. A bit humiliating.. but not for good puppies.")
			
			saynn("Your pet moans softly as the water flows along and between {npc.his} sensetive pussy folds.")
		else:
			saynn("You also want to wash inside your pet's tailhole so you get up and put your foot on {npc.his} head, pinning {npc.him} to the cold wet floor while also making {npc.him} stick {npc.his} butt high up, ass positioned directly under the shower head.")
			
			saynn("[say=pc]Gotta get you washed everywhere, puppy.[/say]")
			
			saynn("Water starts flowing along your pet's private bits and washing away any mess with it. A bit humiliating.. but not for good puppies.")
			
			if(npc.isWearingChastityCage()):
				saynn("Your pet moans softly as the water stimulates {npc.his} tailhole, {npc.his} caged up cock is twitching slightly.")
			elif(npc.hasReachablePenis()):
				saynn("Your pet moans softly as the water stimulates {npc.his} tailhole, {npc.his} {npc.penis} is hard and twitching slightly.")
		
		addButton("Continue", "See what happens next", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "clean_inside"):
		processTime(10*60)
		if(!npc.clearOrificeFluidsCheckBlocked()):
			addMessage("Something prevented you from clearing every hole")

	if(_action == "start_feed_cum"):
		processTime(5*60)
	
	if(_action == "start_feed_girlcum"):
		processTime(5*60)
	
	if(_action == "do_feed_cum"):
		processTime(5*60)
		npc.gotThroatFuckedBy("pc")
		npc.cummedInMouthBy("pc")
		GM.pc.orgasmFrom(npcID)
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
			npcSlavery.getActivity().satisfyWant("food")
		
	if(_action == "do_feed_girlcum"):
		processTime(5*60)
		npc.cummedInMouthBy("pc", FluidSource.Vagina)
		GM.pc.orgasmFrom(npcID)
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
			npcSlavery.getActivity().satisfyWant("food")
		
	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
