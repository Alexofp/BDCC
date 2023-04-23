extends SceneBase

var pickedLoc = ""
var endLocation = ""
var path = []
var npc_id = ""

func _init():
	sceneID = "rahiActivityPetplayWalkiesScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npc_id

func _run():
	if(state == ""):
		addCharacter("rahi", ["naked"])
		playAnimation(StageScene.PuppyDuo, "stand", {npc="rahi", npcBodyState={naked=true}})
		saynn("[say=pc]Who wants some walkies, huh?[/say]")

		saynn("Walkies! Walkies, walkies, walkies. Rahi's ears perk at your offer. She eagerly crawls to you, her tail swishing excitedly behind her. The restraints are still limiting her available range of motion but your pup has learned how to walk around efficiently, her natural feline grace showing through.")

		saynn("You make sure to check her puppy restraints and tighten them up, this will be a good test for them. Then you click a leash to Rahi's collar and lead her out of the cell. She eagerly follows along, panting like a happy pup.")

		saynn("Where do you wanna go?")

		addButton("Yard", "Visit the yard area", "go_yard")
		addButton("Canteen", "Go eat some food", "go_canteen")
		addButton("Shower", "A good place to wash your pet", "go_shower")
		addButton("Gym", "A place for some exercises", "go_gym")
	if(state == "start_walkies"):
		saynn("You and Rahi begin your journey.")

		addButtonAt(6, "Walk", "Walk to the destination", "do_walkies")
		if (false):
			addButton("Walk", "You shouldn't see this", "do_walkies")
	if(state == "walkies"):
		var _roomInfo = GM.world.getRoomByID(path[0])
		var roomName = str(_roomInfo.getName())
		var possibleBarks = ["You are leading your leashed Rahi.", "Rahi eagerly sniffs around the "+roomName+".", "Rahi eagerly follows you, her tail wagging with excitement as she eagerly sniffs at the various objects in her path.", "Rahi lags behind, her restraints slowing her down. You tug on the leash, urging her to keep moving.", "Rahi catches up and walks beside you, her fluffy body pressed close to your leg as she leans against you for comfort.", "As you walk, Rahi occasionally tugs on the leash, prompting you to correct her behavior and keep her in line.", "Rahi wags her tail happily as you walk her around on the leash", "You hear Rahi's happy panting as she follows you obediently on the leash.", "You notice Rahi's tongue hanging out of her mouth as she pants excitedly during walkies.", "Rahi lets out a playful bark, remaining you that she's still a happy pup.", "You feel Rahi's fluffy tail brushing against your leg as she walks beside you on the leash."]
		var rareBarks = ["You notice a group of inmates eyeing your pet hungrily and tug on the leash a little firmer.", "Rahi starts to pull on the leash, trying to chase after a nearby mouse. What a silly pet. You make sure to explain her that she is a pup and not a cat.", "Rahi gets distracted by a shiny object on the ground before you tug on her leash.", "One of the female guards gives Rahi a disapproving look as you walk by. Better behave.", "You spot a group of inmates fighting in the distance. Better avoid them.", "Rahi suddenly stops and softly barks at a passing guard. She seems to be in a playful mood.", "Rahi's ears perk up as she catches some unknown scent, causing her to strain against the leash in excitement.", "Rahi gets excited about something and starts to pull on the leash, trying to explore her surroundings."]
		if (RNG.chance(70)):
			saynn(RNG.pick(possibleBarks))
		else:
			saynn(RNG.pick(rareBarks))
		saynn(_roomInfo.getDescription())
		addButtonAt(6, "Walk", "Walk to the destination", "do_walkies")
	if(state == "ev1"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc="maleguard_canine", npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		saynn("As you and your pup make your way through the prison, a guard suddenly steps in front of you, blocking the way. The guard stares down at Rahi, and then looks up at you.")

		saynn("[say=maleguard_canine]Does your pet bite?[/say]")

		saynn("The guard keeps his hand on his stun baton.")

		addButton("No", "Tell the guard that Rahi is a good girl", "ev1_no")
		addButton("Only if danger", "Tell the guard that Rahi is trained not to bite unless someone tries to attack you", "ev1_danger")
		if (getModule("RahiModule").getSkillScore("rahiSkillMasochist") > 5):
			addButton("Masochist", "(Masochism) Tell the guard that Rahi loves receiving pain instead of inflicting it", "ev1_masochist")
	if(state == "ev1_no"):
		saynn("[say=pc]No, she is a good girl. She won't hurt anyone[/say]")

		saynn("The guard narrows his eyes suspiciously at your statement.")

		saynn("[say=maleguard_canine]Well, I hope you're telling the truth, inmate.[/say]")

		saynn("He takes a step closer to Rahi and then cautiously reaches out his hand before giving Rahi some pats. Rahi wags her tail excitedly and sniffs the guard's armored palm, not even thinking about biting.")

		saynn("The guard nods in approval and steps back, allowing you to continue on your way.")

		saynn("[say=maleguard_canine]Just be careful.[/say]")

		addButton("Continue", "Continue on your way", "do_continue")
	if(state == "ev1_danger"):
		saynn("[say=pc]She's trained not to bite. But I can't make any guarantees if someone tries to attack us.[/say]")

		saynn("The guard raises an eyebrow in suspicion upon hearing your response.")

		saynn("[say=maleguard_canine]I hope you're not trying to be funny, inmate. If your pet even thinks about biting someone, I will put a muzzle on her faster than you can say 'Good girl'.[/say]")

		saynn("He steps closer to naked Rahi and inspects her puppy restraints before nodding in approval.")

		saynn("[say=maleguard_canine]Now move along before I change my mind.[/say]")

		addButton("Continue", "Continue on your way", "do_continue")
	if(state == "ev1_masochist"):
		saynn("[say=pc]She won't bite you. My pet is trained to be a masochist, she enjoys receiving pain instead of inflicting it.[/say]")

		saynn("The guard raises an eyebrow and looks at Rahi with suspicion.")

		saynn("[say=maleguard_canine]I will have to test that.[/say]")

		saynn("The guard crouches near Rahi and gives her a firm spank on the ass before pinching her nipple. Rahi moans and whimpers in response, her body tensing up while her pussy slit visible gets more wet.")

		saynn("[say=maleguard_canine]Huh. Sure, you and your painslut pet can pass.[/say]")

		addButton("Continue", "Continue on your way", "do_continue")
	if(state == "ev2"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc=npc_id, npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		saynn("As you walk Rahi through the prison, you come across one of the inmates who seems to be very curious about your pet.")

		var randomAsk = RNG.pick(["Aww, what a cute little puppy you have there. Can I pet her?", "Excuse me, could I please pet your puppy?", "Mmm, that's a fine looking pup you've got there. Mind if I give her a little pat?", "Aww, what a cute little puppy! Can I give her a scratch behind the ears?", "I wanna pet that pup of yours. And you wouldn't want to say no to me, would you?", "Hey, why is your puppy naked? Can I touch her fur?"])
		saynn("[say=npc]"+str(randomAsk)+"[/say]")

		addButton("No", "You don't wanna anyone petting Rahi", "ev2_no")
		addButton("Sure", "Let them pet Rahi", "ev2_sure")
	if(state == "ev2_no"):
		saynn("[say=pc]No. She is not here for your amusement.[/say]")

		saynn("The inmate huffs and walks away.")

		addButton("Continue", "Continue on your way", "do_continue")
	if(state == "ev2_sure"):
		saynn("[say=pc]Sure. Pup, be a good girl and let {npc.him} pet you.[/say]")

		saynn("Rahi looks up at the inmate with a submissive gaze, waiting for {npc.his} touch. The inmate begins to scritch Rahi behind the ears and pet Rahi's head, running {npc.his} fingers down the pup's spine. Rahi lets out a soft purr, enjoying the attention.")

		if (RNG.chance(70)):
			saynn("[say=npc]Good pup.[/say]")

			addButton("Continue", "Continue on your way", "do_continue")
		else:
			saynn("[say=npc]I wonder. Can I touch her pussy?[/say]")

			saynn("That's.. a way bigger ask.")

			addButton("Allow it", "Let the inmate rub Rahi's pussy", "ev2_allowrub")
			addButton("No", "That's going too far", "ev2_norub")
	if(state == "ev2_norub"):
		saynn("[say=pc]No. Petting is enough.[/say]")

		saynn("The inmate pouts but lets you go.")

		addButton("Continue", "Continue on your way", "do_continue")
	if(state == "ev2_allowrub"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {pc=npc_id, npc="rahi", npcBodyState={naked=true}})
		saynn("You hesitate for a moment before nodding. Rahi obediently lifts her tail, exposing her feline pussy to the inmate. {npc.He} rubs {npc.his} fingers over the sensitive lips, making them slick with juices and causing Rahi to let out a soft moan.")

		saynn("After a few more moments of teasing, the inmate smiles.")

		saynn("[say=npc]Thanks. She is quite a good girl.[/say]")

		saynn("Rahi now leaves a little trail of her juices as she crawls around.")

		addButton("Continue", "Continue on your way", "do_continue")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "go_yard"):
		var startLocation = "cellblock_orange_nearcell"
		pickedLoc = "yard"
		endLocation = "yard_northCorridor"
		path = GM.world.calculatePath(startLocation, endLocation)
		path.remove(0)
		setState("start_walkies")
		return

	if(_action == "do_walkies"):
		var nextLoc = path[0]
		path.remove(0)
		
		if(!GM.world.hasRoomID(nextLoc)):
			return
		
		GM.pc.setLocation(nextLoc)
		aimCameraAndSetLocName(nextLoc)
		if(path.size() == 0):
			setState("arrived")
			return
		
		if(RNG.chance(30)):
			var possibleEvents = ["ev1", "ev2"]
		
			var randEvent = RNG.pick(possibleEvents)
			if(randEvent in ["ev2"]):
				npc_id = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new(), {NpcGen.Level: RNG.randi_range(1, 10)})
				addCharacter(npc_id)
			setState(randEvent)
			return
		
		playAnimation(StageScene.PuppyDuo, "walk", {npc="rahi", npcAction="walk", npcBodyState={naked=true}})
		setState("walkies")
		return

	if(_action == "do_continue"):
		if(npc_id != ""):
			removeCharacter(npc_id)
			npc_id = ""
		setState("walkies")
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["pickedLoc"] = pickedLoc
	data["endLocation"] = endLocation
	data["path"] = path
	data["npc_id"] = npc_id

	return data

func loadData(data):
	.loadData(data)

	pickedLoc = SAVE.loadVar(data, "pickedLoc", "")
	endLocation = SAVE.loadVar(data, "endLocation", "")
	path = SAVE.loadVar(data, "path", [])
	npc_id = SAVE.loadVar(data, "npc_id", "")
