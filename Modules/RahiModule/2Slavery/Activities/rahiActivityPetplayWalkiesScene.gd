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
	if(state == "yard_pick"):
		saynn("You and Rahi have arrived at the yard. What event do you want to happen?")

		addButton("Random", "You don't really mind anything", "yard_random")
		addButton("Fetch", "Rahi finds a stick and wants to play fetch", "yard1")
	if(state == "yard1"):
		saynn("You and Rahi follow the stone pathways of the yard. The air here is always so fresh and all the greenery helps to calm your and your pet's minds.")

		saynn("You were about to take a seat on one of the benches when, suddenly, Rahi sees something interesting and takes off running, her tail wagging furiously behind her. It isn't particularly hard to follow her.. but you're curious about what caught her attention.")

		saynn("After this exciting journey, Rahi finally comes to a stop, her nose pressed to the ground as she sniffs around a large stick. She picks it up in her mouth and carries it back to you, swaying her hips eagerly and wagging her tail like a happy puppy.")

		saynn("Huh. A stick. You chuckle at a cute scene and take the stick from Rahi's mouth before patting her on the head. It's quite obvious what she wants.")

		saynn("Your puppy sees you holding the stick and bounces happily, her tongue out and drooling.")

		addButton("Play fetch", "Throw the stick", "yard1_fetch")
		if (getModule("RahiModule").getSkillScore("rahiSkillAnal") >= 3):
			if (GM.pc.hasReachablePenis()):
				addButton("Anal sex", "(Anal) Tell Rahi that you have a better stick for her", "yard1_anal")
			if (GM.pc.canWearStrapon()):
				addButton("Anal sex", "(Anal) Tell Rahi that you have a better stick for her in a form of a strapon", "yard1_anal_strapon")
	if(state == "yard1_fetch"):
		playAnimation(StageScene.PuppyDuo, "throw", {npc="rahi", npcAction="walk", npcBodyState={naked=true}})
		saynn("[say=pc]You wanna play fetch? Let's do it.[/say]")

		saynn("You aim somewhere not that far away and toss the stick. Rahi watches it create an arc in the air and land somewhere in the grass.")

		saynn("[say=pc]Go-get-the-stick, puppy.[/say]")

		saynn("With a burst of energy, Rahi takes off running, her eyes fixated on the spot where it landed. Without much trouble, Rahi pounces at it and picks it up with her mouth before bringing it back to you, wagging her tail. As you take it from her mouth, Rahi barks happily, clearly wanting more.")

		saynn("[say=pc]Huh. Let's try a harder one.[/say]")

		saynn("Again, your puppy watches you carefully. You bring the stick back and, as you throw it, Rahi suddenly leaps after it, as best as her puppy restraints allow. Sadly, her jump wasn't enough, Rahi flops onto the grass and whines.")

		saynn("You rush to your pet and check on her. Rahi seems alright, just a little dirty.")

		saynn("[say=pc]What a silly puppy.[/say]")

		saynn("You help her up on her paws and quickly swipe the dirt off her belly. Rahi barks and runs after the stick before returning it to you, still wagging her tail.")

		saynn("[say=pc]Good girl. Such a good pet. Maybe that's enough for now?[/say]")

		saynn("[say=rahi]Ruff! Ru-ufff! Wruff![/say]")

		saynn("Rahi barks at the stick and wiggles her body, like she is about to pounce at you. Clearly, your pet wants you to throw it again.")

		saynn("[say=pc]Alright. But this is the last time for sure.[/say]")

		saynn("Rahi suddenly goes quiet, focusing on that stick in your hand. As you move it back a little, preparing for a throw, Rahi lowers herself, her butt wiggling ever so slightly. Her eyes.. shine with that energy of a predator.")

		saynn("You try to throw your puppy off, doing a few fake tossing motions. But Rahi sees right through them. It's only when you actually throw the stick, your pet suddenly leaps into the air, her paws outstretched for the minimal air resistance, her tail being her trail.")

		saynn("Everything happens in less than a second. The stick bounces off Rahi's puppy restraints! But your pet sees that and masterfully bends in the air, reaching for it again before it lands. She just about manages to bite on it with her fangs before landing on all paws, causing a dust cloud around her. Wow! Rahi walks out of it, looking smug and proud, as she carries the stick in her mouth and then offers it to you.")

		saynn("You grab it and offer Rahi all the headpats and scritches. Your pup is panting and purring, her tail wagging furiously.")

		saynn("[say=pc]Great job, puppy. You deserve to be spoiled.[/say]")

		saynn("Rahi has worked off some of her energy and is now ready to go back to the cell. Rahi keeps her chin high while you head back.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "yard1_anal"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("As you break the stick in half and toss it away, Rahi whines sadly. But not for long.")

		saynn("[say=pc]I have a better stick for you, puppy.[/say]")

		saynn("You use the leash to bring the pet somewhere relatively secluded, there are many tall green bushes around that are perfect for that. As you expose your {pc.penis}, Rahi starts blinking many times.")

		saynn("[say=pc]And today, I'm gonna bury it in your ass.[/say]")

		saynn("[say=rahi]R-ruff..[/say]")

		saynn("As you crouch behind her, Rahi wiggles her rear for you. You can see that being your pet has made her pussy quite wet.. but that's not the hole that you wanna fuck today.")

		saynn("Instead, you spread her ass cheeks, revealing her tight pink anus, its muscles clenching slightly as Rahi gets all blushy from you staring at her bits. You spit on the neat little ring and use your fingers to spread your saliva around, teasing a bit before pushing one inside, causing Rahi to moan softly.")

		saynn("Your member is quite hard too, leaking precum. It's time..")

		addButton("Fuck Rahi", "Shove your cock inside her ass", "yard1_anal_shove")
	if(state == "yard1_anal_shove"):
		playAnimation(StageScene.PuppySexAllFours, "sex", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("You pull your wet digit out of her anus, instead grabbing her hips and guiding your {pc.penis} to prod at her star. Rahi's tailhole is quite tight, resisting your attempts to stretch it more. But your pup is trying her best, spreading her hind legs more and relaxing her muscles.")

		saynn("And soon enough, the head of your hard member manages to slide inside, stretching Rahi wide open.")

		saynn("[say=pc]Such a tight bitch.[/say]")

		saynn("Rahi's moans turn into whining as you suddenly throw your hips forward, shoving more of your shaft inside your slutty pet. Her paws shivering slightly as you start pounding her ass, each thrust gradually defeating her butt's resistance, allowing you to go deep, stretching her soft inner walls as well.")

		saynn("You grab her tail and pull on it, making Rahi meet your motions as you fuck her tight asshole so hard that your balls are slapping against her wet pussy. Your pup moans and pants like an animal in heat, probably loving this feeling of being used by you, her owner, way too much.")

		saynn("With each thrust, you bring yourself closer to the edge. But you can also feel her anus ring clenching around your member harder. As you use your free hand to smack her ass, Rahi breaks out of character and mewls in ecstasy, her neglected pussy dripping juices onto the ground.")

		addButton("Inside", "Cum inside Rahi's ass", "yard1_anal_cuminside")
		addButton("Outside", "Cum on Rahi's ass", "yard1_anal_cumoutside")
	if(state == "yard1_anal_cuminside"):
		playAnimation(StageScene.PuppySexAllFours, "inside", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("There is no danger in cumming inside Rahi's ass so might as well do that.")

		saynn("[say=pc]Gonna..[/say]")

		saynn("Finally, with a deep growl, you slam into Rahi one final time, burying your {pc.penis} to the hilt before emptying your balls deep inside her. Rahi's body shivers as she feels the warmth of your {pc.cum} filling her up. Her pussy squirts out some girlcum as the balls slap against her sensitive folds.")

		saynn("After that, you slowly pull out of Rahi's ass and collapse nearby, panting just as heavily as Rahi. You admire her fit agile body and her cute stuffed anus that is leaking your seed and slowly recovering after you absolutely destroyed it.")

		saynn("[say=pc]Such a good pet, taking my cock so well. I think we will have to do this more often during walkies.[/say]")

		saynn("Rahi just lets the restraints keep her standing on all fours, her tongue is out.")

		saynn("[say=rahi]Wuf-f..[/say]")

		saynn("[say=pc]Now let's head back to the cell.[/say]")

		saynn("The whole way back your pet is blushing, consciousness of her used anal hole that she can't do anything about.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "yard1_anal_cumoutside"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("As you feel your orgasm building up, you decide not to stuff Rahi's bowels full of your seed. Instead, just when you go past the point of no return, you pull your member out, leaving your pup feeling empty while your throbbing cock shoots ropes of hot thick {pc.cum} all over Rahi's back and her ass, coating her fur in a sticky layer of your seed. You groan as the last strings of your jizz land on her, marking your pup as your own.")

		saynn("Feeling spent, you collapse onto the ground next to Rahi, admiring her fit messy body and her anal ring struggling to close up. Rahi pants just as heavily, looking back at you with a mix of desire and embarrassment.")

		saynn("[say=rahi]Wuf-f..[/say]")

		saynn("[say=pc]Now let's head back to the cell.[/say]")

		saynn("The whole way back your pet is blushing, consciousness of all the seed that is on her fur that she can't do anything about.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "yard1_anal_strapon"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("As you break the stick in half and toss it away, Rahi whines sadly. But not for long.")

		saynn("[say=pc]I have a better stick for you, puppy.[/say]")

		saynn("You use the leash to bring the pet somewhere relatively secluded, there are many tall green bushes around that are perfect for that. As you suddenly pull out a rubber strapon that you have prepared just for this occasion, Rahi starts blinking many times.")

		saynn("[say=pc]And today, I'm gonna bury it in your ass.[/say]")

		saynn("[say=rahi]R-ruff..[/say]")

		saynn("As you crouch behind her, Rahi wiggles her rear for you. You can see that being your pet has made her pussy quite wet.. but that's not the hole that you wanna fuck today.")

		saynn("Instead, you spread her ass cheeks, revealing her tight pink anus, its muscles clenching slightly as Rahi gets all blushy from you staring at her bits. You spit on the neat little ring and use your fingers to spread your saliva around, teasing a bit before pushing one inside, causing Rahi to moan softly.")

		saynn("You put on the strapon and spread some of Rahi's juices across its rubber texture. It's time..")

		addButton("Fuck Rahi", "Shove your cock inside her ass", "yard1_anal_shove_strapon")
	if(state == "yard1_anal_shove_strapon"):
		playAnimation(StageScene.PuppySexAllFours, "sex", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("You pull your wet digit out of her anus, instead grabbing her hips and guiding your rubber cock to prod at her star. Rahi's tailhole is quite tight, resisting your attempts to stretch it more. But your pup is trying her best, spreading her hind legs more and relaxing her muscles.")

		saynn("And soon enough, the head of your fake member manages to slide inside, stretching Rahi wide open.")

		saynn("[say=pc]Such a tight bitch, huh.[/say]")

		saynn("Rahi's moans turn into whining as you suddenly throw your hips forward, shoving more of your rubber shaft inside your slutty pet. Her paws shivering slightly as you start pounding her ass, each thrust gradually defeating her butt's resistance, allowing you to go deep, stretching her soft inner walls as well.")

		saynn("You grab her tail and pull on it, making Rahi meet your motions as you fuck her tight asshole so hard that hips are slapping against her butt cheeks. Your pup moans and pants like an animal in heat, probably loving this feeling of being fucked by you, her owner, way too much.")

		saynn("With each thrust, you bring your pet closer to her edge. You can feel her anus ring clenching around your strapon harder, increasing the friction. As you use your free hand to smack her ass, Rahi breaks out of character and mewls in ecstasy, her neglected pussy dripping juices onto the ground.")

		addButton("Make her cum", "Make Rahi cum", "yard1_anal_cum_strapon")
	if(state == "yard1_anal_cum_strapon"):
		playAnimation(StageScene.PuppySexAllFours, "inside", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("[say=pc]You gonna cum, bitch?[/say]")

		saynn("As you continue to pound Rahi's tight asshole with the strapon, its tip keeps rubbing her pleasure spot through the inner wall, causing the pleasure to grow more and more for your puppy. She moans and squirms as much as the restraints allow, her tail twitching in ecstasy as your thrusts are still just as remorseful and powerful as ever.")

		saynn("Finally, Rahi's body starts to shake from the sudden anal orgasm, her pussy juices spilling onto the ground beneath her as she cries out in pleasure. While that is happening, you continue to pound her until she is completely spent, only pulling out when that pussy of hers no longer gushes out juices, instead just pulsing, just like her asshole.")

		saynn("After that, you collapse nearby, panting just as heavily as Rahi. You admire her fit agile body and her cute gaping anus that is slowly recovering after you absolutely destroyed it.")

		saynn("[say=pc]Such a good pet, taking my strapon so well. I think we will have to do this more often during walkies.[/say]")

		saynn("Rahi just lets the restraints keep her standing on all fours, her tongue is out.")

		saynn("[say=rahi]Wuf-f..[/say]")

		saynn("[say=pc]Now let's head back to the cell.[/say]")

		saynn("The whole way back your pet is blushing, consciousness of her stretched anal hole that she can't do anything about.")

		addButton("Continue", "See what happens next", "returntocellremovestrapon")

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
			#setState("arrived")
			if(pickedLoc == "yard"):
				setState("yard_pick")
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

	if(_action == "yard_random"):
		_action = RNG.pick(["yard1"])

	if(_action == "yard1_fetch"):
		processTime(30*60)

	if(_action == "yard1_anal"):
		getModule("RahiModule").advanceSkill("rahiSkillAnal")

	if(_action == "yard1_anal_strapon"):
		getModule("RahiModule").advanceSkill("rahiSkillAnal")
		var straponTypes = ["Strapon", "StraponCanine", "StraponDragon", "StraponFeeldoe", "StraponFeline"]
		var strapon = GlobalRegistry.createItem(RNG.pick(straponTypes))
		#var fluids = strapon.getFluids()
		#fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
		GM.pc.getInventory().equipItem(strapon)

	if(_action == "returntocell"):
		GM.pc.setLocation("cellblock_orange_nearcell")
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		endScene()
		return

	if(_action == "yard1_anal_shove"):
		processTime(5*60)

	if(_action == "yard1_anal_cuminside"):
		processTime(5*60)
		getCharacter("rahi").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_anal")

	if(_action == "yard1_anal_cumoutside"):
		processTime(5*60)
		getCharacter("rahi").cummedOnBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_anal")

	if(_action == "yard1_anal_shove_strapon"):
		processTime(5*60)

	if(_action == "yard1_anal_cum_strapon"):
		processTime(5*60)
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_anal")

	if(_action == "returntocellremovestrapon"):
		GM.pc.getInventory().clearSlot(InventorySlot.Strapon)
		GM.pc.setLocation("cellblock_orange_nearcell")
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		endScene()
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
