extends SceneBase

var pickedLoc = ""
var endLocation = ""
var path = []
var npc_id = ""
var eventCooldown = 0
var lastEvent = ""

func _init():
	sceneID = "rahiActivityPetplayWalkiesScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npc_id

func _run():
	if(state == ""):
		addCharacter("rahi", ["naked"])
		playAnimation(StageScene.PuppyDuo, "stand", {npc="rahi", npcBodyState={naked=true, leashedBy="pc"}})
		saynn("[say=pc]Who wants some walkies, huh?[/say]")

		saynn("Walkies! Walkies, walkies, walkies. Rahi's ears perk at your offer. She eagerly crawls to you, her tail swishing excitedly behind her. The restraints are still limiting her available range of motion but your pup has learned how to walk around efficiently, her natural feline grace showing through.")

		saynn("You make sure to check her puppy restraints and tighten them up, this will be a good test for them. Then you click a leash to Rahi's collar and lead her out of the cell. She eagerly follows along, panting like a happy pup.")

		saynn("Where do you wanna go?")

		var walkiesStage = getFlag("RahiModule.rahiPetplayWalkiesStage", 0)
		addButton("Waterfall", "Visit the waterfall area", "go_waterfall")
		if (walkiesStage >= 1):
			addButton("Canteen", "Go eat some food", "go_canteen")
		else:
			addDisabledButton("Canteen", "Visit other locations first")
		if (walkiesStage >= 2):
			addButton("Shower", "A good place to wash your pet", "go_shower")
		else:
			addDisabledButton("Shower", "Visit other locations first")
		if (walkiesStage >= 3):
			addButton("Yard", "Visit the yard area", "go_yard")
		else:
			addDisabledButton("Yard", "Visit other locations first")
	if(state == "start_walkies"):
		saynn("You and Rahi begin your journey.")

		addButtonAt(6, "Walk", "Walk to the destination", "do_walkies")
		if (false):
			addButton("Walk", "You shouldn't see this", "do_walkies")
	if(state == "walkies"):
		playAnimation(StageScene.PuppyDuo, "walk", {npc="rahi", npcAction="walk", flipNPC=true, npcBodyState={naked=true, leashedBy="pc"}})
		
		var _roomInfo = GM.world.getRoomByID(path[0])
		var roomName = str(_roomInfo.getName())
		var possibleBarks = ["You are leading your leashed Rahi.", "Rahi eagerly sniffs around the "+roomName+".", "Rahi eagerly follows you, her tail wagging with excitement as she eagerly sniffs at the various objects in her path.", "Rahi lags behind, her restraints slowing her down. You tug on the leash, urging her to keep moving.", "Rahi catches up and walks beside you, her fluffy body pressed close to your leg as she leans against you for comfort.", "As you walk, Rahi occasionally tugs on the leash, prompting you to correct her behavior and keep her in line.", "Rahi wags her tail happily as you walk her around on the leash", "You hear Rahi's happy panting as she follows you obediently on the leash.", "You notice Rahi's tongue hanging out of her mouth as she pants excitedly during walkies.", "Rahi lets out a playful bark, remaining you that she's still a happy pup.", "You feel Rahi's fluffy tail brushing against your leg as she walks beside you on the leash."]
		var rareBarks = ["You notice a group of inmates eyeing your pet hungrily and tug on the leash a little firmer.", "Rahi starts to pull on the leash, trying to chase after a nearby mouse. What a silly pet. You make sure to explain to her that she is a pup and not a cat.", "Rahi gets distracted by a shiny object on the ground before you tug on her leash.", "One of the female guards gives Rahi a disapproving look as you walk by. Better behave.", "You spot a group of inmates fighting in the distance. Better avoid them.", "Rahi suddenly stops and softly barks at a passing guard. She seems to be in a playful mood.", "Rahi's ears perk up as she catches some unknown scent, causing her to strain against the leash in excitement.", "Rahi gets excited about something and starts to pull on the leash, trying to explore her surroundings."]
		if (RNG.chance(70)):
			saynn(RNG.pick(possibleBarks))
		else:
			saynn(RNG.pick(rareBarks))
		saynn(_roomInfo.getDescription())
		addButtonAt(6, "Walk", "Walk to the destination", "do_walkies")
	if(state == "ev1"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc="maleguard_canine", npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		saynn("As you and your pup make your way through the prison, a guard suddenly steps in front of you, blocking the way. The guard stares down at Rahi, and then looks up at you.")

		var possibleLine = RNG.pick(["Does your pet bite?", "I've heard reports of some aggressive pets in the prison, can your pet be trusted not to bite?", "Is your pet aggressive? She doesn't have a muzzle on.", "Are you sure your pet is safe to be around others? Does she bite?"])
		saynn("[say=maleguard_canine]"+str(possibleLine)+"[/say]")

		saynn("The guard keeps his hand on his stun baton.")

		addButton("No biting", "Tell the guard that Rahi is a good girl", "ev1_no")
		addButton("Only if danger", "Tell the guard that Rahi is trained not to bite unless someone tries to attack you", "ev1_danger")
		if (getModule("RahiModule").getSkillScore("rahiSkillMasochist") > 5):
			addButton("Masochist", "(Masochism) Tell the guard that Rahi loves receiving pain instead of inflicting it", "ev1_masochist")
	if(state == "ev1_no"):
		var pcLine = RNG.pick(["No, she is a good girl. She won't hurt anyone.", "No, she's very friendly. She loves attention.", "No, she's very docile. She won't cause any trouble.", "No, she's well-trained. She knows not to bite anyone.", "No, she's never shown any aggression. She's a harmless pet.", "No, she's just a playful puppy. She's never bitten anyone."])
		saynn("[say=pc]"+str(pcLine)+"[/say]")

		saynn("The guard narrows his eyes suspiciously at your statement.")

		var guardLine = RNG.pick(["Well, I hope you're telling the truth, inmate.", "I've had a few run-ins with vicious mutts in my day.", "I've seen some nasty bites from dogs like this before.", "I hope you know what you're doing with that thing.", "You better have control over that animal, or else."])
		saynn("[say=maleguard_canine]"+str(guardLine)+"[/say]")

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

		if (false):
			addButton("Random", "You don't really mind anything", "yard_random")
		addButton("Fetch", "Rahi finds a stick and wants to play fetch", "yard1")
		addButton("Urge to pee", "Rahi suddenly wants to pee", "yard2")
	if(state == "yard1"):
		saynn("You and Rahi follow the stone pathways of the yard. The air here is always so fresh and all the greenery helps to calm your and your pet's minds.")

		saynn("You were about to take a seat on one of the benches when, suddenly, Rahi sees something interesting and takes off running, her tail wagging furiously behind her. It isn't particularly hard to follow her.. but you're curious about what caught her attention.")

		saynn("After this exciting journey, Rahi finally comes to a stop, her nose pressed to the ground as she sniffs around a large stick. She picks it up in her mouth and carries it back to you, swaying her hips eagerly and wagging her tail like a happy puppy.")

		saynn("Huh. A stick. You chuckle at a cute scene and take the stick from Rahi's mouth before patting her on the head. It's quite obvious what she wants.")

		saynn("Your puppy sees you holding the stick and bounces happily, her tongue out and drooling.")

		addButton("Play fetch", "Throw the stick", "yard1_fetch")
		if (getModule("RahiModule").isSkillLearned("rahiSkillSex")):
			if (GM.pc.hasReachablePenis()):
				addButton("Breed Rahi", "(Sex) Tell Rahi that you have a better stick for her", "yard1_breed")
			if (GM.pc.canWearStrapon()):
				addButton("Strapon Rahi", "(Sex) Tell Rahi that you have a better stick for her in a from of a strapon", "yard1_breed_strapon")
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
	if(state == "yard1_breed"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("As you throw the stick somewhere way too far, Rahi whines sadly. But not for long.")

		saynn("[say=pc]I have a better stick for you, puppy.[/say]")

		saynn("You lead Rahi to some secluded spot. There are lots of tall bushes and big rocks, allowing you to be stealthy about it.")

		saynn("As soon as you are out of sight, you wrap the leash tightly around your wrist and expose your {pc.penis}, surprising your pet.")

		saynn("[say=pc]Stay, pet.[/say]")

		saynn("Rahi's body is already shivering in anticipation, she knows what is going to happen. You step behind her and crouch, before roughly grabbing her hips and moving her tail out of the way, getting a great view of her cute pussy folds that already seem to be getting wet.")

		saynn("Rahi's slit produces a scent of an animal in heat. You guide your hard member to rub against her petals, catching some of her arousal and spreading it along your length. But, enough teasing, you're here to breed her.")

		addButton("Fuck her", "Start fucking your pet", "yard1_breed_start")
	if(state == "yard1_breed_start"):
		playAnimation(StageScene.PuppySexAllFours, "fast", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("Almost with a growl, you thrust into Rahi, your shaft spreading her pussy lips and stretching the hole wide until it gives. Your pup yelps at the sudden roughness, the restraints keep her nice and still for you, allowing you to begin pounding into her.")

		saynn("Rahi's soft moans echo around, her body shifting forward with every thrust before you pull her back by her hips. With so much pussy juices acting as lube, you can't help but to fasten your pace, slamming your {pc.penis} into her over and over again.")

		saynn("You shift your grip, suddenly tugging roughly on Rahi's ponytail, forcing her head back, causing a spike of uncomfortable pain. But no matter what you do, your pet is moaning obediently for you.")

		saynn("As Rahi's body continues to be relentlessly pounded by you, she feels an intense build-up of pleasure within her. Her passionate noises become more frequent and her breathing becomes heavier. She sticks her tongue out and pants into the air while you still hold a tight grip on her ponytail.")

		saynn("[say=pc]Hope you're ready, pup.[/say]")

		saynn("Rahi's eyes roll up as she cries out in ecstasy, her pussy clenching tightly around your member as wave after wave of pleasure washes over her, her juices flowing down her thighs. You feel like you won't last long with that pussy basically trying to milk you..")

		addButton("Cum inside", "Breed your pup", "yard1_breed_cum")
		addButton("Outside", "Cum on Rahi's ass", "yard1_breed_cumoutside")
	if(state == "yard1_breed_cum"):
		playAnimation(StageScene.PuppySexAllFours, "inside", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("You continue to thrust into Rahi as she rides the ecstatic waves. Finally, with one last hard hip motion, you ram your {pc.penis} deep inside her until the tip of your member kisses her womb. You groan as the tight inner walls bring you over the edge, forcing you to empty your balls directly inside Rahi's womb, filling her up with your hot seed.")

		saynn("[say=pc]Ngh-h..[/say]")

		saynn("After you've done stuffing Rahi's pussy, you pull out and collapse nearby, panting slightly. Your pet is quite exhausted too but the puppy restraints allow her to just.. stand. Her used pussy is still pulsing weakly and leaking with {pc.cum}.")

		saynn("[say=pc]You make for such a good breeding bitch.[/say]")

		saynn("[say=rahi]Huf-f..[/say]")

		saynn("[say=pc]Now let's head back to the cell.[/say]")

		saynn("The whole way back your pet is blushing, consciousness of her used stuffed slit that she can't do anything about.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "yard1_breed_cumoutside"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("You continue to thrust into Rahi as she rides the ecstatic waves. But when you feel like you can't hold back anymore, you pull your member out, leaving Rahi's pussy empty and instead cumming all over her back.")

		saynn("The more your {pc.penis} throbs, the more thick sprouts of {pc.cum} land on Rahi's fur, messing up her back, tail, ass, thighs..")

		saynn("[say=pc]Ngh-h..[/say]")

		saynn("After you've done turning Rahi into a cum slut, you collapse nearby, panting slightly. Your pet is quite exhausted too but the puppy restraints allow her to just.. stand. Her stretched pussy is still pulsing weakly. But at least you managed to avoid stuffing her womb.")

		saynn("[say=rahi]Huf-f..[/say]")

		saynn("[say=pc]What, puppy? Are you disappointed? Hah.[/say]")

		saynn("You get some rest and then proceed to walk Rahi back to her cell. The whole way back your pet is blushing, consciousness of her stretched dripping slit and her messy fur that she can't do anything about.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "yard1_breed_strapon"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("As you throw the stick somewhere way too far, Rahi whines sadly. But not for long.")

		saynn("[say=pc]I have a better stick for you, puppy.[/say]")

		saynn("You lead Rahi to some secluded spot. There are lots of tall bushes and big rocks, allowing you to be stealthy about it.")

		saynn("As soon as you are out of sight, you expose a strapon that you have prepared just for this occasion. Your pet looks quite surprised, watching you put it on and securing it before her eyes.")

		saynn("[say=pc]Stay, pet.[/say]")

		saynn("Rahi's body is already shivering in anticipation, she already knows what is going to happen. You step behind her and crouch, before roughly grabbing her hips and moving her tail out of the way, getting a great view of her cute pussy folds that already seem to be getting wet.")

		saynn("Rahi's slit produces a scent of an animal in heat. You guide your new rubber member to rub against her petals, catching some of her arousal and spreading it along the length of the toy. But, enough teasing, you're here to fuck her.")

		addButton("Fuck her", "Start fucking your pet", "yard1_breed_start_strapon")
	if(state == "yard1_breed_start_strapon"):
		playAnimation(StageScene.PuppySexAllFours, "fast", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("Almost with a growl, you thrust into Rahi, your rubber shaft spreading her pussy lips and stretching the hole wide until it gives. Your pup yelps at the sudden roughness, the restraints keep her nice and still for you, allowing you to begin pounding into her.")

		saynn("Rahi's soft moans echo around, her body shifting forward with every thrust before you pull her back by her hips. With so much pussy juices acting as lube, you can't help but to fasten your pace, slamming the rubber cock into her over and over again.")

		saynn("You shift your grip, suddenly tugging roughly on Rahi's ponytail, forcing her head back, causing a spike of uncomfortable pain. But no matter what you do, your pet is moaning obediently for you.")

		saynn("As Rahi's body continues to be relentlessly pounded by you, she feels an intense build-up of pleasure within her. Her passionate noises become more frequent and her breathing becomes heavier. She sticks her tongue out and pants into the air while you still hold a tight grip on her ponytail.")

		saynn("[say=pc]Cumming alright, pup?[/say]")

		saynn("Rahi's eyes roll up as she cries out in ecstasy, her pussy clenching tightly around your rubber shaft as wave after wave of pleasure washes over her, her juices flowing down her thighs. That was easy. But not nearly enough to satisfy you.")

		addButton("Make her cum", "Make Rahi feel good", "yard1_breed_cum_strapon")
	if(state == "yard1_breed_cum_strapon"):
		playAnimation(StageScene.PuppySexAllFours, "inside", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("You continue to thrust into Rahi as she rides the ecstatic waves. Finally, with one last hard hip motion, you ram your strapon deep inside her until the tip of your member kisses her womb. It's just a strapon but so much pressure on her pleasure spot causes your pup to climax again, crying out in pleasure, trembling beneath your rough touch.")

		saynn("[say=pc]That's it, keep cumming, bitch..[/say]")

		saynn("Her pussy grips around the strapon so tight that you can't even move it, Rahi moans passionately and squirts girlcum all over the ground until she is completely spent.")

		saynn("After you've done fucking Rahi's pussy, you pull out and collapse nearby, panting slightly. Your pet is quite exhausted too but the puppy restraints allow her to just.. stand. Her stretched pussy is still pulsing weakly.")

		saynn("[say=pc]You make for such a good breeding bitch.[/say]")

		saynn("[say=rahi]Huf-f..[/say]")

		saynn("[say=pc]Now let's head back to the cell.[/say]")

		saynn("The whole way back your pet is blushing, consciousness of her wet fucked slit that she can't do anything about.")

		addButton("Continue", "See what happens next", "returntocellremovestrapon")
	if(state == "yard2"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="rahi", npcAction="sad", npcBodyState={naked=true}})
		saynn("You take a nice walk through the prison yard. This yard is not as.. sandy.. as yards usually. There is actually a lot of greenery, tall green bushes that act like walls, separating all the stone pathways, creating fancy green corridors.")

		saynn("Your leashed Rahi walks alongside you, still wearing her puppy restraints that force her to crawl on her elbows and knees.")

		saynn("Suddenly, your pet stops in her tracks and starts whimpering quietly. You turn around and look down at her.")

		saynn("[say=pc]What's wrong, pup?[/say]")

		saynn("Rahi whines and makes all sorts of puppy noises, trying to avoid breaking out of character but at same time trying to tell you something. You look at her butt and notice that she rubs her legs against each other and looks up at you with very pleading eyes.")

		saynn("[say=pc]Do you want to pee, pup?[/say]")

		saynn("[say=rahi]Wruf!.. Huff-f..[/say]")

		saynn("That sounded like yes. Huh.")

		saynn("[say=pc]Can you hold it until we return?[/say]")

		saynn("You can hear more whining from Rahi. Yeah, she is about to pee herself.")

		saynn("You look around. There are some bushes there that Rahi can use. You wonder if you should control everything or let Rahi do it alone.")

		addButton("Don't watch", "Just let Rahi pee alone", "yard2_alone")
		addButton("Guard her", "Make sure everything goes smooth", "yard2_watch")
	if(state == "yard2_alone"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		saynn("[say=pc]Alright. Let's find a spot for you.[/say]")

		saynn("Rahi's cute eyes light up with hope as she crawls eagerly alongside you. After some time, you find a good secluded area behind some bushes.")

		saynn("[say=pc]That's the best you gonna get, pup.[/say]")

		saynn("You walk Rahi there and stand back, letting her crawl behind the bush. She quietly does her business and returns back to you, wiggling her rear playfully.")

		saynn("[say=pc]All good?[/say]")

		saynn("[say=rahi]Ruff![/say]")

		saynn("You give Rahi some headpats and then take her leash before resuming the walkies.")

		saynn("After you explore most of the yard area, you just return back to Rahi's cell.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "yard2_watch"):
		saynn("[say=pc]Alright. Let's find a spot for you.[/say]")

		saynn("Rahi's cute eyes light up with hope as she crawls eagerly alongside you. After some time, you find a good secluded area behind some bushes.")

		saynn("[say=pc]That's the best you gonna get, pup.[/say]")

		saynn("You bring your pet there and.. just stand nearby. Rahi sees your stare and blushes deeply, whining and rubbing her legs against each other more urgently.")

		saynn("[say=pc]What? Pets pee in public, no one minds that. I'm guarding so no one steals you.[/say]")

		saynn("But Rahi just whines louder.")

		if (getModule("RahiModule").isSkillLearned("rahiSkillWatersports")):
			saynn("Since you've been training your kitty to enjoy activities related to pee.. maybe you can.. encourage her a little?")

		else:
			saynn("Maybe you need to start training your kitty to enjoy watersports for her to feel less ashamed.")

		addButton("Turn away", "Let Rahi have at least some privacy", "yard2_turnaway")
		if (getModule("RahiModule").isSkillLearned("rahiSkillWatersports")):
			addButton("Tickle her", "(Watersports) Help Rahi pee herself by tickling her pussy", "yard2_tickle")
	if(state == "yard2_turnaway"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		saynn("[say=pc]Alright, puppy. Make it quick.[/say]")

		saynn("You decide to give your puppy some privacy and.. just turn away. You are still standing near her so Rahi makes some confused noises. When she tries to crawl away from you, the leash in your hand prevents her.")

		saynn("[say=rahi]Huff-f..[/say]")

		saynn("It seems your pet can no longer endure the urge. You can't see her doing it.. but you sure can hear the sound of her pee hitting the ground while Rahi reliefs herself.. like a dog.")

		saynn("After she is done, you turn around and see a very embarrassed pet. Rahi lowers her head, unable to meet your gaze. To help ease her discomfort, you gently lift her chin and lean in to leave a little reassuring kiss on her forehead.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("Feeling a little better, Rahi follows you as you continue your walk through the yard.")

		saynn("After you explore most of the yard area, you just return back to Rahi's cell.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "yard2_tickle"):
		saynn("You can't watch your puppy struggle with the urge anymore, you decide to help her. Rahi lets out a surprised yelp as you gently take hold of her tail and lift it, exposing her cute fluffy butt and her private bits, including her pink pussy.")

		saynn("You bring your hand to her sensitive folds.. and use two digits to spread them, revealing more of the pinkness. Rahi whines confused.")

		saynn("But as soon as you begin to use the third finger to tickle her little pee hole.. she suddenly understands your intentions. Your pet starts squirming and trying to pull her butt away but you are relentless, abusing her vulnerable spot. You can hear her whine more and more.")

		saynn("And before she knows it, a yellow stream emerges from her slit and hits the ground. Rahi is peeing herself in front of you, her cheeks couldn't be more red.")

		saynn("[say=pc]Nothing to be ashamed of, pet. You're just like a real puppy.[/say]")

		saynn("You can't help but to smile softly, admiring the view of Rahi creating a puddle behind her. Once she finished relieving herself you bring that same hand that rubbed her pussy towards her mouth.")

		saynn("[say=pc]Clean after yourself.[/say]")

		saynn("Rahi sniffs your fingers and huffs. But seeing your strict expression makes her part her lips and take your digits into her mouth, her feline tongue getting dragged over them, cleaning off any urine that might have landed on them.")

		saynn("[say=pc]See, it wasn't so hard. You're such a good girl, I'm proud.[/say]")

		saynn("After she was done licking your fingers, it was time to return back to Rahi's cell.")

		addButton("Enough", "See what happens next", "returntocell")
		if (GM.pc.hasReachablePenis() || GM.pc.hasReachableVagina() || GM.pc.isWearningChastityCage()):
			addButton("Pee on her", "You kinda wanna pee too now..", "yard2_peeonrahi")
	if(state == "yard2_peeonrahi"):
		playAnimation(StageScene.PuppyPinned, "pinned", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("But, the more you think about it.. the more you realize that you also wanna pee. Rahi was crawling on all fours towards the stone path but you hold the leash and prevent her. As your pet looks up at you.. she can notice a mischievous glint in your eyes..")

		saynn("[say=pc]You know what, pet? I kinda have to go too.[/say]")

		saynn("Before Rahi could react, you pull on the leash, causing her to collapse onto her belly. As you pin her to the ground with your foot, Rahi whines.")

		saynn("[say=pc]This is for being so stubborn.[/say]")

		if (GM.pc.hasReachablePenis() || GM.pc.isWearningChastityCage()):
			saynn("You expose your {pc.penis} and begin waiting for the urge to happen. And soon enough, Rahi feels warmth spreading against her fur as a stream of yellow piss begins washing over her.")

		else:
			saynn("You quickly expose your pussy and begin waiting for the urge to happen. And soon enough, Rahi feels warmth spreading against her fur as a stream of yellow piss begins washing over her.")

		saynn("[say=pc]And this is.. because you're a piss-slut.[/say]")

		saynn("As this is happening, Rahi closes her eyes and her mouth, squirming while you mark her. The smell is incredibly gross, she can't help but to let out a quiet whimper as you continue to piss all over her body.. her ass and tail.. her face.")

		saynn("The longer you do it, the more submissive Rahi gets. She stops resisting and just lets you force that piss scent into her fur.")

		saynn("After you finally finish emptying your bladder.. Rahi opens her eyes and looks at the yellow puddle under her paws.. Some yellow drops are still dripping from her fur.")

		saynn("[say=pc]Feels so much better, after marking my property.[/say]")

		saynn("Rahi's eyes look very sorry, she avoids any eye contact with you.")

		saynn("[say=pc]Well, let's go back now.[/say]")

		saynn("You tug on the leash, making your pup get out of the secluded spot. As you continue your walkies, Rahi is constantly conscious about how she looks and smells.. But she doesn't dare to disobey.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "shower1"):
		playAnimation(StageScene.PuppySexOral, "tease", {npc="rahi", npcBodyState={naked=true}, bodyState={naked=true}})
		saynn("You walk into the dressing room and prepare, taking off any clothes until you are naked. Luckily, Rahi is already naked, so you just take her leash and walk into the space where all the showerheads are. Your pet carefully peeks her muzzle from behind the corner first, seeing if anyone is there. But luckily, everyone seems to be busy.")

		saynn("You bring her under one of the showers and show Rahi a little bar of soap that you have saved just for this occasion. She barks softly at you and braces for water, shivering slightly.")

		saynn("[say=pc]Let's wash you, pup.[/say]")

		if (getCharacter("rahi").isCoveredInFluids()):
			saynn("And a wash she does need indeed. The more you look at Rahi, the more you see signs of {rahi.bodyMess} on her body.")

		else:
			saynn("You can't really spot any signs of lewd fluids on your pet but after walking on all fours for so long she surely has accumulated some dirt and dust on her.")

		saynn("As you turn the faucet, a stream of cold refreshing water hits you and your pet. Rahi yelps at first but after living here for so long, you kinda have to get used to that.")

		saynn("You grab the bar of soap and start lathering up Rahi's short fur, mostly focusing on rubbing and massaging her body. You do it quite thoroughly though, making multiple passes. At the same time the water washes you as well. It's just that you're more focused on your pet.")

		saynn("Rahi lets out little whimpers of pleasure as your {pc.masc} hands work on her, the water and soap gradually make her feel calm and remove any tension in her.")

		saynn("After washing Rahi's back and her belly, you move on and soap her ponytail, your digits dividing the hair strands and gently scratch at her head. As the water slowly washes the soap off, you move down to her hind legs..")

		saynn("After you slide your hands over her tail, carefully stroking it, she obediently moves it out of the way, exposing her private bits to you.")

		saynn("The running water and the gentle massage arouses Rahi, she can't help but to start producing little moans of pleasure as you wash and rub her sensitive areas. You run your digits over her wet pussy and tease her clit until Rahi is panting and whimpering with desire.")

		addButton("Finish up", "You've done showering", "shower1_finishup")
		if (getCharacter("rahi").hasEffect(StatusEffect.HasCumInsideVagina) || getCharacter("rahi").hasEffect(StatusEffect.HasCumInsideAnus)):
			addButton("Clean inside", "Remove cum or other fluids from inside Rahi's holes", "shower1_cleaninside")
		else:
			addDisabledButton("Clean inside", "Rahi doesn't have any cum or other fluids inside her holes")
		if (getModule("RahiModule").isSkillLearned("rahiSkillExhibit")):
			addButton("Feet play", "(Exhibitionism) Make Rahi cum with your foot while others are watching", "shower1_feetplay")
	if(state == "shower1_finishup"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		saynn("Finally, after thoroughly washing Rahi's body, you turn off the water and then use a soft towel to dry her off. While you do that, Rahi's fur stands on its ends, making her look.. adorably puffy. As you pat her head affectionately, she wags her tail in delight.")

		saynn("[say=pc]Good puppy.[/say]")

		saynn("[say=rahi]Ruff..[/say]")

		saynn("She still seems quite aroused after your teasing. But it's time to go back. You grab her leash and proceed to walk your pet back to her cell.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "shower1_cleaninside"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {npc="rahi", npcBodyState={naked=true}, bodyState={naked=true}})
		saynn("You weren't done yet. You notice that some lewd stuff is leaking out of Rahi and have decided to fix that.")

		saynn("[say=pc]Stay still, pup.[/say]")

		saynn("With puppy restraints still on, Rahi obediently complies, before letting out a whimper as you suddenly spread her buttcheeks apart. The shower water hits Rahi's back as you examine her holes before using two fingers to widen each one and let any cum or other fluids leak out and get washed away.")

		saynn("Rahi acts incredibly embarrassed by what you're doing to her private bits, blushing and squirming under your touch. A muffled moan sneaks past her lips as you continue to spread her holes, waiting.")

		saynn("Once there is nothing left inside her, you stand up and grin.")

		saynn("[say=pc]There, all clean and ready for more fun.[/say]")

		saynn("Rahi blushes harder and covers herself with her tail. You turn off the water and grab the towel to dry Rahi's fur, making her look fluffy and puffy.")

		saynn("[say=rahi]H-huff..[/say]")

		saynn("After that, you just grab her leash and walk her back to her cell.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "shower1_feetplay"):
		playAnimation(StageScene.PuppyFeetCrotch, "crotch", {npc="rahi", npcBodyState={naked=true}, bodyState={naked=true}})
		saynn("Seeing Rahi so aroused.. It kinda makes you want to help her get the release that she so desires. But.. at the same time.. you kinda wanna make it as humiliating for her as possible.")

		saynn("You turn the water down and then grab Rahi before turning her on her back. She looks up at you with surprised eyes, her restrained paws flailing in the air helplessly.")

		saynn("[say=rahi]Ruff?..[/say]")

		saynn("As you place your foot on Rahi's wet pussy, a few other inmates suddenly enter the room. They see you two and tilt their heads for a second. But after that they just get on with their lives, taking showers.")

		saynn("Rahi sees your foot on her crotch and looks up at you with pleading eyes, her legs close around yours. No, you're not planning to stop because someone is watching. This actually makes it better.")

		saynn("You spread her legs wide apart using some force before proceeding to rub the sole of your foot against Rahi's soft, wet pussy lips. The unusual sensations make your puppy shiver, the pleasure going through her body causing her to let out a low, needy whine.")

		saynn("You slowly increase the pressure, your foot working in small circles, teasing and stimulating Rahi's most sensitive areas. By this pointy you notice that other inmates are, indeed, watching you pleasure her with your foot. Rahi tries to close her legs again but you push them apart, exposing her privates to the onlookers.")

		saynn("You continue to rub her clit relentlessly, forcing little moans and whimpers from Rahi. You yourself get quite aroused too but this time only Rahi gets to cum.")

		saynn("Or does she? As Rahi's body slowly tenses up, approaching the orgasm, you can't help but to feel like being a little cruel. Just before reaching the peak, you stop moving your foot over her pussy, ceasing off the only source of pleasure for her.")

		saynn("[say=rahi]H-huff!..[/say]")

		saynn("Rahi, being so close to the edge, squirms eagerly. She doesn't even care that others are watching her, starts humping your leg, rubbing her slit against your toes and sole just so she can get her release. You don't stop her, letting your pup humiliate herself. She is so adorable.")

		saynn("And finally, your pet manages to bring herself over that last hill. She cries out in pleasure, causing the sound to echo through the showers. Rahi's body is shivering, her pussy is pulsing and spreading its juices over your foot, the onlookers chuckle softly and make some lewd comments.")

		saynn("After cumming in such a humiliating way, you slowly pull away your foot, letting the running water wash away any fluids.")

		saynn("[say=pc]Good puppy.[/say]")

		saynn("She lowers her eyes, still panting softly. But her tail wags ever so slightly.")

		saynn("You both finish showering. You dry Rahi's fur with a towel, making her look all fluffy, and then just return to her cell.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "canteen1"):
		playAnimation(StageScene.PuppyDuo, "sit", {npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		saynn("You lead Rahi into the canteen, a big open space with high ceilings and lots of places to eat. One of the walls is turned into a serve counter that has two windows, one for grabbing the food and one for bringing the trays back. The inmates of all colors are standing behind a little metal fence, forming a queue and waiting for their turn to grab their food.")

		saynn("You immediately get some eyes on you, people seem to be quite interested in your leashed pet. But after they get used to being with a puppy in the same room, it's just business as usual. Rahi is whimpering softly though, feeling the shame of being treated like an animal in front of a crowd.")

		saynn("[say=pc]Relax, puppy. Let's get some food.[/say]")

		saynn("You join the queue and obediently wait for your turn. There is no real choice here, you get what you get, which is usually just some tasteless paste created by mashing all of the vegetables together. But the person behind the counter, noticing your pet, tells the cooks something.")

		saynn("And after some time, you finally get two trays of food. A normal one for you.. and a one that has a metal bowl placed on top of it that's filled with.. what you can only guess is dry dog food.. But to your eye it might be even better than what everyone else gets, there seem to be some pieces of meat and such.")

		saynn("You grab them and go take a seat on the edge of one of the benches. Your tray is placed on the table while Rahi's is on the floor next to you. Your pet sees the metal pet bowl and then moves her gaze up, staring at you with her pleading eyes.")

		saynn("Should you make her eat?")

		addButton("Eat", "Make Rahi eat out of the pet bowl", "canteen1_eat")
		addButton("Offer your tray", "Maybe Rahi would rather eat the paste", "canteen1_cuteeat")
		if (getModule("RahiModule").isSkillLearned("rahiSkillExhibit")):
			addButtonWithChecks("Offer dick", "(Exhibitionism) Maybe she'd rather get her proteins some other way?", "canteen1_suckdick", [], [ButtonChecks.HasReachablePenis])
			addButtonWithChecks("Offer pussy", "(Exhibitionism) Maybe she'd rather eat you out instead?", "canteen1_lickpussy", [], [ButtonChecks.HasReachableVagina])
	if(state == "canteen1_eat"):
		playAnimation(StageScene.PuppyDuo, "sit", {npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		saynn("You notice Rahi's reluctance to approach the bowl and reach out to pet her.")

		saynn("[say=pc]Come on, girl. Time to eat.[/say]")

		saynn("[say=rahi]Ruff..[/say]")

		saynn("With no other choice, Rahi crawls up to the pet bowl and lowers her muzzle into it, nomming the dry puppy treats. Her face burns with humiliation as she hears the snickers of the other inmates around her. She does look incredibly cute though, crunching her food like a real puppy.")

		saynn("While she does that, you slowly consume your paste. It tastes as advertised, enough to keep you from starving but leaving with a thought that maybe you'd rather do that.")

		saynn("Rahi finishes her meal and places her chin on your lap, her eyes full of submission and obedience.")

		saynn("[say=pc]Good girl. Wasn't so bad, was it?[/say]")

		saynn("Your hand lands on Rahi's head and gives her all the scritches, making her purr softly and nuzzle your palm.")

		saynn("After you've finished eating as well, you return the trays and just walk your pet back to her cell, her hunger satisfied.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "canteen1_cuteeat"):
		playAnimation(StageScene.PuppyDuo, "sit", {npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		saynn("You notice Rahi's reluctance to approach the bowl and decide to offer her your tray, placing it on the floor near her.")

		saynn("[say=pc]Maybe you wanna eat this instead, pup?[/say]")

		saynn("Rahi looks at your tray.. with something gray slapped in the middle of it.. Then she looks back at her bowl.. that seems to contain actual food, even if it's food for pets.")

		saynn("After some quick deliberating, she approaches her bowl and dips her muzzle inside it, nomming the dry dog food with newly-found enthusiasm. Her choice made you chuckle though, you pick up the tray and start eating your paste.")

		saynn("The other inmates in the canteen seem to take notice of Rahi's behavior, making her feel somewhat embarrassed. But you're always here to protect her if someone goes too far.")

		saynn("[say=pc]Don't worry, pup, you're doing so well.[/say]")

		saynn("Your words offer much needed comfort to Rahi, she continues to eat her meal.. until about half is left. Then she suddenly stops and paws the pet bowl closer to you, making you confused.")

		saynn("[say=pc]What's up, pet, not hungry anymore?[/say]")

		saynn("Rahi shakes her head and then nosepoints towards the food in her bowl before nosepointing at you. Is she.. offering? It seems that after seeing what you have to eat, Rahi can't help but to want to share her meal with you. That's quite.. cute.")

		saynn("[say=pc]Thank you, cutie. But it's for you.[/say]")

		saynn("Rahi nods and returns to eagerly chowing down on the dry dog food, her tail wagging happily. After she is done, your hand lands on her head and gives her all the scritches, making her purr softly and nuzzle your palm.")

		saynn("You slowly consume the rest of your paste and then return the trays back, before walking your pet back to her cell, her hunger satisfied.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "canteen1_suckdick"):
		playAnimation(StageScene.PuppyDuo, "sit", {npc="rahi", npcAction="sit", npcBodyState={naked=true}, bodyState={hard=true}})
		saynn("You notice Rahi's reluctance to approach the bowl. It seems she really doesn't want to eat that dog food. You snap your fingers to catch her attention before pointing under the table. Rahi sees that and crawls to the spot, ending up roughly between your legs.")

		saynn("[say=pc]If you don't want to eat that, I will satisfy your hunger some other way.[/say]")

		saynn("As you say that, you stealthily expose your {pc.penis} for her. Rahi hesitates for a moment, probably feeling embarrassed and nervous about other inmates noticing her. But ultimately, she gives in to the desire and moves closer before awkwardly climbing your legs until you can feel her warm breath on your crotch.")

		saynn("Rahi wraps her lips around your member and begins to lick and suck it, using her tongue to tease you and making you grow hard in her mouth. Some other inmates probably already noticed what's going on but that only makes it more hot.")

		saynn("Your pet takes more of your member inside her mouth and continues to eagerly suck it, trying to focus on pleasing you, ignoring the stares. It feels.. nice.. you can barely continue to eat your food, your shaft twitching and leaking precum into Rahi's mouth that she makes sure to savor.")

		saynn("As you start to feel your climax building up, you grab a hold of Rahi's hair and pull her head closer. Your pet obediently opens her mouth wider, letting your {pc.penis} to slip further into her mouth, testing how well she can control her gag reflex. Her tongue works on your shaft so well and her throat is so tight that you can only endure this for so long..")

		saynn("With a quiet grunt, you grip the table with your hand and release your hot, stick load into Rahi's mouth. Your dick pulsing against her inner walls while waves of {pc.cum} flow down her throat, stuffing her belly.")

		saynn("Your pet eagerly swallows everything she can and licks her lips clean as the last drop of your seed dribbles down her chin. You lean back slightly and watch Rahi's blushy face, a satisfied smirk appears on your face.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("You pat her head before grabbing both trays and handing them away. Then you just walk your pet back to her cell, her hunger satisfied hopefully.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "canteen1_lickpussy"):
		saynn("You notice Rahi's reluctance to approach the bowl. It seems she really doesn't want to eat that dog food. You snap your fingers to catch her attention before pointing under the table. Rahi sees that and crawls to the spot, ending up roughly between your legs.")

		saynn("[say=pc]If you don't want to eat that, you will have to eat me out instead.[/say]")

		saynn("As you say that, you spread your legs and expose your {pc.pussyStretch} pussy for her. Rahi hesitates for a moment, probably feeling embarrassed and nervous about other inmates noticing her. But ultimately, she gives in to the desire and moves closer before awkwardly climbing your legs until you can feel her warm breath on your crotch.")

		saynn("Rahi starts licking and leaving little kisses on your thighs, gradually reaching your flower and then flicking her tongue over your pussy. She gets you wet quite quickly, a little soft moan escapes you as your pet continues to lick and tease, only using her tongue, dragging it across your folds and lapping up any juices.")

		saynn("You moans grow louder, inmates around are probably wondering why your eyes are so lusty. You keep eating the paste while your free hand lands on Rahi's head, your fingers tangling in her hair, guiding her movement and encouraging her to go faster and harder.")

		saynn("Soon, your pet gets lost in the sensation of licking and sucking on your pussy. You can feel your body beginning to tense up as you start to approach your climax. Rahi can feel it too.. and so she redoubles her efforts, eager to please.")

		saynn("[say=pc]I'm gonna..[/say]")

		saynn("Finally, with a cry of pleasure that is almost impossible to hide, you cum.. hard. You get a tight grip on the table and Rahi's hair while your body shivers from mind-bending pleasure waves, your pussy gushing out girlcum that Rahi eagerly swallows, her tail wagging with excitement.")

		saynn("[say=pc]Ngh-h..[/say]")

		saynn("Even while you are cumming, your pet keeps dragging her feline tongue over your sensitive spots, slowly driving you crazy. The people around probably have noticed what's going on by now but you don't care much, it just feels so good..")

		saynn("It's only when the orgasmic waves are over, you can finally catch your breath. You look down at Rahi, at her cute wet purring muzzle and give her some pats on the head.")

		saynn("[say=pc]Good girl..[/say]")

		saynn("You take some more time to recover before grabbing both trays and handing them away. Then you just walk your pet back to her cell. Feels so strange to catch the glances of others.")

		addButton("Continue", "See what happens next", "returntocell")
	if(state == "ev3"):
		saynn("Rahi happily wags her tail as you lead her through the prison areas. She was sniffing and exploring when suddenly a group of inmates caught sight of her and began approaching her. Rahi's ears perk up, she turns to look at the group of strangers.")

		saynn("[say=inmateMale]Hey, look at that little kitty.[/say]")

		saynn("One of them is making kissing noises and winking at Rahi. The rest just say more suggestive things.")

		addButton("Tell them off", "Be rude with them", "ev3_rude")
		addButtonWithChecks("Punch them", "Use your raw strength", "ev3_fight", [], [[ButtonChecks.StatCheck, Stat.Strength, 7]])
		if (getModule("RahiModule").getSkillScore("rahiSkillDominance") >= 5):
			addButton("Rahi bites!", "(Dominance) Rahi protects herself", "ev3_rahibites")
		else:
			addDisabledButton("Rahi bites!", "Rahi is not dominant enough for this")
	if(state == "ev3_rude"):
		saynn("You tense up and step closer to Rahi, feeling protective and territorial over your pet.")

		saynn("[say=pc]She is not a kitty, she is my pet.[/say]")

		saynn("You growl and give the group of inmates a warning glare.")

		saynn("But they just laughed and continued their suggestive behavior, making Rahi feel uncomfortable and scared. As she begins to whine softly, you just lead her away from the group.")

		saynn("Eventually you reach a quieter area, allowing your pet to calm down. You give her some scritches behind the ear until she starts to purr.")

		addButton("Continue", "Continue on your way", "do_continue")
	if(state == "ev3_fight"):
		saynn("You clench your fists, feeling anger boiling up inside you as the group makes crude comments about your pet.")

		saynn("Without thinking, you pull Rahi away from them and close you, shielding her. The inmates weren't happy, one of them stepped out closer to you.")

		saynn("[say=inmateMale]What the fuck is your problem?[/say]")

		saynn("The guy snarls at you, his voice low and dangerous. All the while other inmates only kept giggling and making even more explicit remarks, noticing that Rahi's private bits are all on display.")

		saynn("It all makes you so mad that you don't hesitate. As you throw the first punch, you hear that satisfying crunch coming from the inmate's jaw as your fist connects perfectly, staggering him back.")

		saynn("[say=inmateMale]Argh![/say]")

		saynn("He loses all his balance and collapses, defeated, already. The other inmates hesitate for a moment before scattering, not wanting to get caught up in this. You begin advancing on the downed inmate, ready to continue the beating. But, sadly, you are interrupted by the sound of a guard's whistle.")

		saynn("Lucky asshole.")

		saynn("Rahi whimpers near your feet, her ears flat against her head. You kneel down and stroke her fur.")

		saynn("[say=pc]It's okay, puppy, no one will hurt you.[/say]")

		saynn("You keep murmuring soothing words into her ear until she calms down.")

		addButton("Continue", "Continue on your way", "do_continue")
	if(state == "ev3_rahibites"):
		saynn("As the group of inmates keeps making suggestive comments and gestures towards Rahi, you get a sense of worry and fear for your pet. But Rahi, feeling threatened, begins to growl and bare her teeth at the inmates.")

		saynn("The inmates, unshaken by Rahi's display of aggression, continue to make advances towards her, reaching out to touch her body until your pet suddenly lashes out and bites the hand of one of the inmates, drawing blood!")

		saynn("[say=rahi]Grr-r-r![/say]")

		saynn("[say=inmateMale]Ow. Stupid mutt.[/say]")

		saynn("The inmate yelps in pain, causing the others to back away from Rahi. However, one of them circles her and tries to grab her by the tail. But Rahi was faster, she turned around and snapped at him, sinking her teeth into his arm.")

		saynn("All of them quickly back away, probably realizing that it's better not to touch your pet.")

		saynn("[say=pc]Wow. Good girl.[/say]")

		saynn("Rahi purrs and nuzzles your leg before picking up her leash with her mouth and offering it to you.")

		addButton("Continue", "Continue on your way", "do_continue")
	if(state == "ev4"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc=npc_id, npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		saynn("As you walk Rahi through the prison grounds, one of the inmates approaches you.")

		saynn("[say=npc]Hey. I saw you walking your little pet. She looks like a fun toy to play with.[/say]")

		saynn("{npc.He} says that with a sly grin on {npc.his} face.")

		saynn("[say=npc]I will give you.. 5 credits.. for her mouth. How about that?[/say]")

		saynn("It sounds like {npc.he} wants you to whore your pet out.")

		addButton("No", "You can't allow that", "ev4_nofuck")
		if (getModule("RahiModule").isSkillLearned("rahiSkillProstitution")):
			if (getCharacter(npc_id).hasPenis()):
				addButton("Sure", "(Prostitution) Allow them to fuck Rahi's mouth", "ev4_facefuck")
			else:
				addButton("Sure", "(Prostitution) Allow them to fuck Rahi's mouth", "ev4_pussygrind")
		else:
			addDisabledButton("Sure", "Rahi needs to have a prostitution skill")
	if(state == "ev4_nofuck"):
		saynn("You shake your head and just walk past the inmate, your hand firmly grasping the leash.")

		saynn("[say=npc]Pff. Your loss.[/say]")

		addButton("Continue", "Continue on your way", "do_continue")
	if(state == "ev4_facefuck"):
		playAnimation(StageScene.PuppySexOral, "fast", {pc=npc_id, npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("It sounds like a.. good deal. So you agree. The inmate hands you the payment before you give her Rahi's leash. Your pet was a little nervous about this. But she knows that she was just a pet, she had to do what her owner tells her.")

		saynn("Without wasting much time, the inmate unzipped {npc.his} pants and pulls out {npc.his} {npc.penis}. {npc.He} grabs Rahi's head and pushes {npc.his} member into her mouth, past her sharp fangs, all the way to the back of her throat. Rahi's eyes get a little watery as she starts gagging on {npc.his} size.")

		saynn("Some other inmates gather around, watching somebody using Rahi's mouth like a sex toy. The main inmate begins to thrust {npc.his} dick in and out of Rahi's drooling mouth while holding her head still with {npc.his} hands, turning this into a rough face-fuck.")

		saynn("It doesn't take long for that cock to start throbbing in her mouth. Your pet can feel that the inmate was close to cum and tries to pull away, but {npc.he} prevented that attempt, instead shooting {npc.his} load into her mouth!")

		saynn("As {npc.his} {npc.cum} fills Rahi's mouth, she struggles to swallow it all. Some of it spills out of her mouth and onto her chin, making your pet look quite messy.")

		saynn("[say=npc]Ngh. Good slut. That was worth it.[/say]")

		saynn("The other inmates cheer as the main one finishes with Rahi's mouth. She looks up at you with her submissive eyes, her mouth still full of some stranger's seed that she has to swallow..")

		saynn("Seeing that there won't be more, the crowd begins to disperse. You pet your Rahi for being an obedient toy and continue on your way.")

		addButton("Continue", "Continue on your way", "do_continue")
	if(state == "ev4_pussygrind"):
		playAnimation(StageScene.PuppySexOral, "grind", {pc=npc_id, npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("It sounds like a.. good deal. So you agree. The inmate hands you the payment before you give her Rahi's leash. Your pet was a little nervous about this. But she knows that she was just a pet, she had to do what her owner tells her.")

		saynn("[say=npc]You're such a cute little thing.[/say]")

		saynn("The inmate runs {npc.his} fingers through Rahi's hair.")

		saynn("[say=npc]But are you a good sex toy?[/say]")

		saynn("With that, {npc.he} reveals {npc.his} pussy that was already glistening with excitement. The inmate grabs Rahi by the hair and pushes her face into {npc.his} crotch, grinding.")

		saynn("Rahi was quite overwhelmed at first by the scent and taste of this inmate's sex. But soon enough, she began licking and sucking at {npc.his} folds, forcing moans of pleasure out of {npc.him}.")

		saynn("Some other inmates gather around, watching somebody using Rahi's face and mouth like a sex toy. As the inmate's eagerness rose, {npc.he} began to thrust {npc.his} hips harder and faster against Rahi's face. So many juices get spread across her fur, marking it with the inmate's lewd scent.")

		saynn("Finally, with a loud cry, {npc.he} came, squirting all over Rahi's muzzle and fur, leaving quite a wet mess. Rahi kept licking up the inmate's juices as they were flowing down her neck and chin.")

		saynn("After the inmate's orgasm fades, {npc.he} leans down and whispers into Rahi's ear.")

		saynn("[say=npc]You're a good little pet. Your owner is quite lucky.[/say]")

		saynn("With that, {npc.he} hands you the leash back before walking away, leaving your pet panting and covered in juices. The crowd slowly starts to disperse as well.")

		addButton("Continue", "Continue on your way", "do_continue")
	if(state == "ev5"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc=npc_id, npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		saynn("As you walk Rahi on a leash towards your destination, one of the inmates slowly approaches you, {npc.his} eyes seem to be glued to your pet, her girly curves and pretty bits.")

		var firstLine = RNG.pick(["Hey, I couldn't help but notice your little pet over here.", "You have such a cute pet. She is a puppy, right?", "Hey, I couldn't help but notice your pet. What an adorable puppy."])
		saynn("[say=npc]"+str(firstLine)+"[/say]")

		saynn("You can't help but to feel your body tense up, ready to defend Rahi if needed.")

		saynn("[say=pc]We're busy.[/say]")

		saynn("You were about to walk past them when the inmate surprised you by pulling out a small credits chip.")

		var secondLine = RNG.pick(["I will pay you.. 5 creds if you let me have some fun with her.", "I'm willing to pay you 5 credits if you let me have a go at her.", "How much would it cost to get some fun time with her? Would 5 credits be enough?", "Would you be willing to let me use her? I pay 5 creds.", "I wanna fuck her so much. I have 5 credits here. Deal?"])
		saynn("[say=npc]"+str(secondLine)+"[/say]")

		saynn("{npc.His} eyes flickering between you and your pet.")

		addButton("No", "You're not gonna let them fuck your pet", "ev5_no")
		if (getModule("RahiModule").isSkillLearned("rahiSkillProstitution")):
			addButton("Sure", "(Prostitution) Let them fuck Rahi", "ev5_fuck")
		if (getModule("RahiModule").getSkillScore("rahiSkillDominance") >= 5):
			addButton("Let Rahi handle it", "(Dominance) Let the Rahi scare off the inmate", "ev5_bonk")
	if(state == "ev5_no"):
		saynn("[say=pc]No, just find yourself a slut.[/say]")

		saynn("You walk into {npc.his} shoulder as you step past, your pet swiftly follows.")

		saynn("You only hear {npc.him} huff behind your back.")

		addButton("Continue", "Continue on your way", "do_continue")
	if(state == "ev5_bonk"):
		playAnimation(StageScene.PuppyDuo, "defeat", {pc=npc_id, npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		saynn("You look down at Rahi and gesture at her, allowing your pet to handle this the way she wants.")

		saynn("Suddenly, Rahi pounces at the inmate and rams her head into {npc.his} crotch, causing a huge spike of pain for {npc.him}!")

		saynn("The poor inmate cries out from pain and instantly collapses, mumbling something incoherent. All the while Rahi climbs {npc.him} and growls into {npc.his} face.")

		saynn("[say=npc]Fine, whatever! Get your dirty mutt out of here.[/say]")

		addButton("Leave", "That was fun", "do_continue")
		if (getModule("RahiModule").isSkillLearned("rahiSkillWatersports")):
			addButton("Let Rahi pee", "(Watersports) Let Rahi mark them with her pee", "ev5_letpee")
	if(state == "ev5_letpee"):
		saynn("Rahi looks at you with pleading eyes, as if asking to do something. You nod back and Rahi smiles.")

		saynn("[say=pc]She is not a mutt.[/say]")

		saynn("The inmate is still too weak to push your pet off. That's when Rahi suddenly lowers herself onto her hind paws and proceeds to pee on {npc.him}! The inmate yelps and desperately tries to resist while Rahi keeps marking her territory and asserting her dominance.")

		saynn("After she is done emptying her bladder, Rahi climbs off and pants proudly of herself for defending her honor. The whole situation is quite amusing. But not for the inmate of course.")

		addButton("Continue", "Continue on your way", "do_continue")
	if(state == "ev5_fuck"):
		playAnimation(StageScene.PuppySexAllFours, "fast", {pc=npc_id, npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("You hesitate for a little. But seeing that chip.. it helped you make the decision.")

		saynn("[say=pc]Alright, you can have fun with her. But you will pull out.[/say]")

		saynn("The inmate grins as {npc.he} hands you the chip and eagerly takes Rahi's leash before leading her somewhere relatively secluded. You follow, of course, to make sure everything goes smoothly.")

		saynn("You got a little distracted with lewd thoughts but Rahi's moans made you snap back to reality. The inmate was already kneeling behind your pet, thrusting {npc.his} {npc.penis} inside her!")

		saynn("{npc.He} grips Rahi's hips tightly while pounding her furiously, {npc.his} balls slapping against your pet's crotch. Occasionally, Rahi whimpers and pants like the animal she is, unable to resist or do anything but take the rough pounding she is receiving. She is quite wet down there though, at least her body is enjoying it.")

		saynn("The inmate's thrusts become faster and Rahi's noises louder as she reaches her climax, her agile feline body shaking uncontrollably while her pussy clenches around that shaft and coats it with all the juices.")

		if (RNG.chance(50)):
			saynn("[say=npc]Ngh.. The bitch is sucking me in. 10 creds if you let me breed her slutty cunt.[/say]")

			addButton("Sure", "Allow them to cum inside Rahi", "ev5_cuminside")
			addButton("No", "Don't allow them to cum inside Rahi", "ev5_cumoutside")
		else:
			addButton("Continue", "See what happens next", "ev5_cumoutside")
	if(state == "ev5_cumoutside"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {pc=npc_id, npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("As the inmate approaches {npc.his} orgasm, {npc.he} pulls out {npc.his} {npc.penis} from Rahi's pussy and strokes it furiously, pushing {npc.himself} over the edge and releasing {npc.his} load all over Rahi's ass and back.")

		saynn("Rahi whimpers while strings of {npc.cum} are landing in thick white streaks all over her fur.")

		saynn("[say=npc]Fuck, that was amazing.[/say]")

		saynn("The inmate pants heavily as {npc.he} admires the mess {npc.he} left on Rahi's body.")

		saynn("{npc.He} thanks you for allowing to fuck your pet and leaves shortly after, leaving you with messy Rahi.")

		saynn("[say=rahi]Ruff..[/say]")

		addButton("Continue", "Continue on your way", "do_continue")
	if(state == "ev5_cuminside"):
		playAnimation(StageScene.PuppySexAllFours, "inside", {pc=npc_id, npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("You fetch the 10 credits chip, silently allowing {npc.him} to do what {npc.he} wants.")

		saynn("After a few powerful thrusts, the inmate grunts and then eagerly slams into Rahi once final time before releasing {npc.his} seed inside her. Rahi can feel {npc.his} {npc.cum} flooding her womb and dripping down her thighs.")

		saynn("Rahi's body gives up, only being supported by the restraints, shaking and shivering. She keeps moaning softly and panting as the warm sensation spreads through her body. Her pussy still twitching with aftershocks as the inmate pulls out of her, the mixture of their juices drips out of her used hole.")

		saynn("[say=npc]Ngh. Such a good breeding bitch.[/say]")

		saynn("The inmate pants heavily too as {npc.he} admires the mess {npc.he} left.")

		saynn("Then {npc.he} thanks you for allowing to fuck your pet and leaves shortly after, leaving you with your satisfied pet.")

		saynn("[say=rahi]Ruff..[/say]")

		addButton("Continue", "Continue on your way", "do_continue")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "go_waterfall"):
		setFlag("RahiModule.rahiPetplayWalkiesStage", Util.maxi(getFlag("RahiModule.rahiPetplayWalkiesStage", 0), 1))
		var startLocation = "cellblock_orange_nearcell"
		pickedLoc = "waterfall"
		endLocation = "yard_waterfall"
		path = GM.world.calculatePath(startLocation, endLocation)
		path.remove(0)
		setState("start_walkies")
		return

	if(_action == "go_canteen"):
		setFlag("RahiModule.rahiPetplayWalkiesStage", Util.maxi(getFlag("RahiModule.rahiPetplayWalkiesStage", 0), 2))
		var startLocation = "cellblock_orange_nearcell"
		pickedLoc = "canteen"
		endLocation = "hall_canteen"
		path = GM.world.calculatePath(startLocation, endLocation)
		path.remove(0)
		setState("start_walkies")
		return

	if(_action == "go_shower"):
		setFlag("RahiModule.rahiPetplayWalkiesStage", Util.maxi(getFlag("RahiModule.rahiPetplayWalkiesStage", 0), 3))
		var startLocation = "cellblock_orange_nearcell"
		pickedLoc = "shower"
		endLocation = "main_shower1"
		path = GM.world.calculatePath(startLocation, endLocation)
		path.remove(0)
		setState("start_walkies")
		return

	if(_action == "go_yard"):
		setFlag("RahiModule.rahiPetplayWalkiesStage", Util.maxi(getFlag("RahiModule.rahiPetplayWalkiesStage", 0), 4))
		var startLocation = "cellblock_orange_nearcell"
		pickedLoc = "yard"
		endLocation = "yard_northCorridor"
		path = GM.world.calculatePath(startLocation, endLocation)
		path.remove(0)
		setState("start_walkies")
		return

	if(_action == "do_walkies"):
		processTime(60)
		var nextLoc = path[0]
		path.remove(0)
		
		if(!GM.world.hasRoomID(nextLoc)):
			return
		
		GM.pc.setLocation(nextLoc)
		aimCameraAndSetLocName(nextLoc)
		if(path.size() == 0):
			#setState("arrived")
			if(pickedLoc == "yard"):
				setState("yard2")
			if(pickedLoc == "waterfall"):
				setState("yard1")
			if(pickedLoc == "shower"):
				setState("shower1")
			if(pickedLoc == "canteen"):
				setState("canteen1")
		
			return
		
		eventCooldown = eventCooldown - 1
		if(RNG.chance(15) && eventCooldown<=0):
			eventCooldown = 3
			var possibleEvents = ["ev1", "ev2", "ev3", "ev4", "ev5"]
			possibleEvents.erase(lastEvent)
		
			var randEvent = RNG.pick(possibleEvents)
			lastEvent = randEvent
			if(randEvent in ["ev2"]):
				npc_id = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new(), {NpcGen.Level: RNG.randi_range(1, 10)})
				addCharacter(npc_id)
			if(randEvent in ["ev4"]):
				npc_id = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.NoChastity: true, NpcGen.Level: RNG.randi_range(1, 10)})
				addCharacter(npc_id)
			if(randEvent in ["ev5"]):
				npc_id = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.NoChastity], [NpcCon.HasPenis]], InmateGenerator.new(), {NpcGen.NoChastity: true, NpcGen.Level: RNG.randi_range(1, 10), NpcGen.HasPenis: true})
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

	if(_action == "yard1_breed"):
		getModule("RahiModule").advanceSkill("rahiSkillSex")

	if(_action == "yard1_breed_strapon"):
		getModule("RahiModule").advanceSkill("rahiSkillSex")
		var straponTypes = ["Strapon", "StraponCanine", "StraponDragon", "StraponFeeldoe", "StraponFeline"]
		var strapon = GlobalRegistry.createItem(RNG.pick(straponTypes))
		#var fluids = strapon.getFluids()
		#fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
		GM.pc.getInventory().equipItem(strapon)

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

	if(_action == "yard1_breed_start"):
		processTime(5*60)

	if(_action == "yard1_breed_cum"):
		processTime(5*60)
		getCharacter("rahi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_vaginal")

	if(_action == "yard1_breed_cumoutside"):
		processTime(5*60)
		getCharacter("rahi").cummedOnBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_vaginal")

	if(_action == "yard1_breed_start_strapon"):
		processTime(5*60)

	if(_action == "yard1_breed_cum_strapon"):
		processTime(5*60)
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_vaginal")

	if(_action == "yard2_tickle"):
		processTime(3*60)
		getModule("RahiModule").advanceSkill("rahiSkillWatersports")

	if(_action == "yard2_peeonrahi"):
		processTime(5*60)
		getCharacter("rahi").pissedOnBy("pc")

	if(_action == "shower1_finishup"):
		processTime(10*60)
		GM.pc.afterTakingAShower()
		getCharacter("rahi").afterTakingAShower()

	if(_action == "shower1_cleaninside"):
		processTime(10*60)
		GM.pc.afterTakingAShower()
		getCharacter("rahi").afterTakingAShower()
		getCharacter("rahi").clearOrificeFluidsCheckBlocked()

	if(_action == "shower1_feetplay"):
		processTime(10*60)
		GM.pc.afterTakingAShower()
		getCharacter("rahi").afterTakingAShower()
		getModule("RahiModule").advanceSkill("rahiSkillExhibit")

	if(_action == "canteen1_eat"):
		processTime(5*60)
		GM.pc.addStamina(100)
		GM.pc.addPain(-30)

	if(_action == "canteen1_cuteeat"):
		processTime(5*60)
		GM.pc.addStamina(100)
		GM.pc.addPain(-30)

	if(_action == "canteen1_suckdick"):
		getModule("RahiModule").advanceSkill("rahiSkillExhibit")
		processTime(10*60)
		GM.pc.addStamina(100)
		GM.pc.addPain(-30)
		getCharacter("rahi").cummedInMouthBy("pc")
		GM.pc.orgasmFrom("rahi")

	if(_action == "canteen1_lickpussy"):
		getModule("RahiModule").advanceSkill("rahiSkillExhibit")
		processTime(10*60)
		GM.pc.addStamina(100)
		GM.pc.addPain(-30)
		getCharacter("rahi").cummedInMouthBy("pc", FluidSource.Vagina)
		GM.pc.orgasmFrom("rahi")

	if(_action == "ev4_facefuck"):
		processTime(5*60)
		getModule("RahiModule").advanceSkill("rahiSkillProstitution")
		GM.pc.addCredits(5)
		getCharacter("rahi").cummedInMouthBy(npc_id)

	if(_action == "ev4_pussygrind"):
		processTime(5*60)
		getModule("RahiModule").advanceSkill("rahiSkillProstitution")
		GM.pc.addCredits(5)
		getCharacter("rahi").cummedInMouthBy(npc_id, FluidSource.Vagina)

	if(_action == "ev5_fuck"):
		processTime(5*60)
		getModule("RahiModule").advanceSkill("rahiSkillProstitution")
		GM.pc.addCredits(5)

	if(_action == "ev5_letpee"):
		getModule("RahiModule").advanceSkill("rahiSkillWatersports")
		processTime(3*60)
		getCharacter(npc_id).pissedOnBy("rahi")

	if(_action == "ev5_cuminside"):
		GM.pc.addCredits(10)
		getCharacter("rahi").cummedInVaginaBy(npc_id)

	if(_action == "ev5_cumoutside"):
		getCharacter("rahi").cummedOnBy(npc_id)

	setState(_action)

func saveData():
	var data = .saveData()

	data["pickedLoc"] = pickedLoc
	data["endLocation"] = endLocation
	data["path"] = path
	data["npc_id"] = npc_id
	data["eventCooldown"] = eventCooldown
	data["lastEvent"] = lastEvent

	return data

func loadData(data):
	.loadData(data)

	pickedLoc = SAVE.loadVar(data, "pickedLoc", "")
	endLocation = SAVE.loadVar(data, "endLocation", "")
	path = SAVE.loadVar(data, "path", [])
	npc_id = SAVE.loadVar(data, "npc_id", "")
	eventCooldown = SAVE.loadVar(data, "eventCooldown", 0)
	lastEvent = SAVE.loadVar(data, "lastEvent", "")
