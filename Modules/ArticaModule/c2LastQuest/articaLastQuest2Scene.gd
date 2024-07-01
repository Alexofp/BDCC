extends SceneBase

var isSlave = false
var isFullSlave = false

func _init():
	sceneID = "articaLastQuest2Scene"

func _run():
	if(state == ""):
		setFlag("ArticaModule.nextReaction", "rahireturned")
		addCharacter("rahi")
		isSlave = getModule("RahiModule").isInSlavery()
		isFullSlave = getModule("RahiModule").canTalkInFirstPerson()
		if (isSlave):
			playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		else:
			playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("Huh..")

		saynn("You notice that your kitty is playing with something.. She bats it with her paw.. like a silly playful kitten.. and watches it dangle and make noise.")

		saynn("Is that really what you think it is..")

		if (isFullSlave):
			saynn("[say=pc]Rahi? Dear, what's that in your paws?[/say]")

		else:
			saynn("[say=pc]Kitty? What's that in your paws?[/say]")

		saynn("The feline's ears instantly pick up on the strict notes in your voice.. her paws instantly put the object away under her shirt.")

		saynn("[say=rahi]Um.. It's just.. nothing?..[/say]")

		if (isSlave):
			saynn("Wow. You're pretty sure that was more than nothing.")

			saynn("[say=pc]Are you lying to me, my kitty?[/say]")

			saynn("Your gaze is drilling her. Rahi's ears turn down, her gaze jumps all over the cell.")

			if (isFullSlave):
				saynn("[say=rahi]Um.. I.. I j-just found it somewhere.. H-helps me.. you know.. meow..[/say]")

			else:
				saynn("[say=rahi]Um.. She.. she j-just found it somewhere.. It h-helps her.. you know.. meow..[/say]")

			saynn("You close the distance with the kitty.")

			saynn("[say=pc]I think I know where you found it.[/say]")

			saynn("Rahi lowers her head.")

			if (isFullSlave):
				saynn("[say=rahi]It was.. d-dangling so fun.. on that ear.. I liked it so much.. I just.. c-couldn't resist..[/say]")

			else:
				saynn("[say=rahi]It was.. d-dangling so fun.. on that ear.. She liked it so much.. Kitty just.. couldn't resist..[/say]")

		else:
			saynn("You're pretty sure that she is lying to you.")

			saynn("[say=pc]Are you sure about that?[/say]")

			saynn("Your gaze is drilling her. Her ears turn down, her gaze jumps all over the hall.")

			saynn("[say=rahi]Um.. She.. she j-just found it somewhere.. It h-helps her.. you know.. meow..[/say]")

			saynn("You close the distance with the kitty even more.")

			saynn("[say=pc]I think I know where you found it.[/say]")

			saynn("Rahi lowers her head.")

			saynn("[say=rahi]It was.. d-dangling so fun.. on that ear.. She liked it so much.. Kitty just.. couldn't resist..[/say]")

		saynn("She presents you the dreamcatcher, her blue eyes light up when she sees the little feathers swaying in the wind, her primal instincts engage.. making her bat the piercing. Looks like you have found the thief.")

		addButton("Explain", "Explain that Artica is suffering without that dreamcatcher", "explain_to_rahi")
		addButton("Threaten", "Threaten to punish Rahi if she doesn't return that dreamcatcher right now", "do_threaten_rahi")
	if(state == "explain_to_rahi"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		if (isFullSlave):
			saynn("[say=pc]Rahi.. That dreamcatcher was incredibly important for her. We gotta return it.[/say]")

		else:
			saynn("[say=pc]Kitten.. That dreamcatcher was incredibly important for her. We gotta return it.[/say]")

		saynn("You reach out to grab that object from her.. but Rahi still keeps it to herself.")

		if (isFullSlave):
			saynn("[say=rahi]It's.. pretty important for me too.. It's so.. b-boring here.. She was just wearing it.. but I can play with it.. C-can't she just wear s-something else on her ear..[/say]")

		else:
			saynn("[say=rahi]It's.. pretty important for her too.. It's so.. b-boring here.. She was just wearing it.. but kitty can play with it.. C-can't that person just wear s-something else on her ear..[/say]")

		saynn("She really wants to keep it, huh.")

		saynn("[say=pc]You don't understand. That dreamcatcher is the last link to her tribe.[/say]")

		saynn("[say=rahi]Tribe?..[/say]")

		saynn("Rahi tilts her head a bit.")

		saynn("[say=pc]Her family. She is far away from her home planet. But she always has a connection to her parents through it. Had.[/say]")

		saynn("Rahi lowers her head, listening to your words and staying quiet. Her paw bats the dreamcatcher gently.. but her eyes don't show the wild reaction anymore.")

		saynn("She rubs her watering eyes.")

		if (isFullSlave):
			saynn("[say=rahi]Right.. I didn't realize.. I should return it.. right now..[/say]")

		else:
			saynn("[say=rahi]Right.. Kitty didn't realize.. She should return it.. right now..[/say]")

		addButton("Artica", "Bring Rahi to Artica", "go_to_artica")
	if(state == "do_threaten_rahi"):
		playAnimation(StageScene.Choking, "idle", {pc="pc", npc="rahi"})
		saynn("[say=pc]It's not yours, give it to me. Now.[/say]")

		saynn("You reach out to grab that dreamcatcher from her.. but Rahi still keeps it to herself, her feline agility allows her to dodge your attempts with ease.")

		if (isFullSlave):
			saynn("[say=rahi]I can explain myself.. It's just so.. b-boring here.. She was just wearing it.. but I can play with it! C-can't she just wear s-something else on her ear..[/say]")

		else:
			saynn("[say=rahi]She can explain herself.. It's just so.. b-boring here.. She was just wearing it.. but kitty can play with it! C-can't that person just wear s-something else on her ear..[/say]")

		saynn("She really wants to keep it, huh. Rahi protects the dreamcatcher pretty well.. but she wasn't ready when your hand suddenly darted for her neck.")

		saynn("[say=rahi]Ah..[/say]")

		saynn("The bratty feline instantly goes docile in your hands. Your digits put pressure on her throat, making her shiver..")

		saynn("[say=pc]You don't understand. If you don't give it back, you will suffer way more than the person who you took it from. And that person is suffering a lot.[/say]")

		if (isFullSlave):
			saynn("[say=rahi]I u-understand.. khh.. n-now.. S-sorry.. eek..[/say]")

		else:
			saynn("[say=rahi]She u-understands.. khh.. n-now.. S-sorry.. eek..[/say]")

		var masLevel = getModule("RahiModule").getSkillScore("rahiSkillMasochist")
		saynn("You keep eye contact, your gaze full of mean energy."+str(" Strangely enough, her body is clearly aroused, her nips poking through the shirt as you choke her.." if masLevel > 6 else "")+"")

		saynn("[say=pc]Do you?[/say]")

		saynn("Rahi nods as much as your hand allows. So you decide to finally relax the grip. Kitty gasps for air.")

		if (isFullSlave):
			saynn("[say=rahi]Khh.. kh.. I should return it.. right now..[/say]")

		else:
			saynn("[say=rahi]Khh.. kh.. She should return it.. right now..[/say]")

		addButton("Artica", "Bring Rahi to Artica", "go_to_artica")
	if(state == "go_to_artica"):
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		GM.pc.setLocation("cellblock_lilac_nearcell")
		addCharacter("artica", ["shy", "naked"])
		playAnimation(StageScene.Duo, "stand", {pc="rahi", npc="artica", npcBodyState={naked=true}})
		saynn("You bring Rahi to Artica's cell.")

		saynn("As soon as the cat takes a single step inside, the white fluff's ears instantly perk towards her direction.")

		saynn("[say=rahi]..meow..[/say]")

		saynn("[say=artica]..eep..[/say]")

		saynn("Artica gets up from her bed, not caring at all that she is naked in front of you two. You invite Rahi to step further.")

		saynn("[say=pc]Introductions can come later. I think the kitty has something she wants to give to the fluff.[/say]")

		saynn("[say=rahi]Y-yeah..[/say]")

		saynn("Artica's eyes look hopeful.. Rahi takes a few more shy steps deeper into the cell.. her hands producing the stolen dreamcatcher, all of its feathers perfectly preserved.")

		if (isFullSlave):
			saynn("[say=rahi]I'm.. sorry that I took it.. stole it..[/say]")

		else:
			saynn("[say=rahi]She is.. Sorry that she took it.. stole it..[/say]")

		saynn("Artica sees her ear piercing.. her eyes opening wide. She rushes to Rahi and fetches the dreamcatcher, her paws shaking while holding it. Tears begin to rush down her cheeks.")

		saynn("[say=artica]T.. t-t.. thank y-you..[/say]")

		saynn("Artica brings the dreamcatcher closer to her heart, smiling and crying at the same time, going through a full range of emotions..")

		saynn("Rahi grabs her own tail and strokes it idly. Both shy girls are finding it hard to say or do anything.")

		saynn("[say=artica]It m-means a lot to me..[/say]")

		saynn("She tries to attach it to her ear.. but struggles because of the obvious lack of mirrors. Rahi sees that and offers her paws.")

		if (isFullSlave):
			saynn("[say=rahi]..may I?[/say]")

		else:
			saynn("[say=rahi]..may she?[/say]")

		saynn("Artica nods.. and carefully hands her dreamcatcher back to Rahi.")

		addButton("Continue", "See what happens next", "artica_receives_dreamcatcher")
	if(state == "artica_receives_dreamcatcher"):
		addCharacter("artica", ["naked"])
		saynn("Rahi stands to the side of Artica and brings the dreamcatcher piercing to her ear. She finds the hole where it should go.. but there seems to be a problem.")

		saynn("[say=rahi]It.. healed a bit.. not enough space to fit the ring through..[/say]")

		saynn("Artica sighs.")

		if (isFullSlave):
			saynn("[say=rahi]I.. I can use my claw.. but it will hurt..[/say]")

		else:
			saynn("[say=rahi]She.. she can use her claw.. but it will hurt..[/say]")

		saynn("It's never that easy, huh. You look around for any clean surgical instruments.. but fail to find any.")

		saynn("[say=artica]Um.. o-okay.. just.. c-caref.. ah![/say]")

		saynn("Before Artica can even finish her sentence, Rahi licks her claw and pierces the fluff's ear with it.. she then quickly pushes the ring of the piercing through it, making the familiar dreamcatcher now hang from it.")

		saynn("[say=rahi]Here.. That's a good girl..[/say]")

		saynn("Artica blushes and blinks at the feline, the sudden praise catching her off-guard. Rahi smiles cutely.")

		if (isFullSlave):
			saynn("[say=rahi]Name is Rahi.[/say]")

			saynn("[say=artica]T-thank you.. Rahi..[/say]")

		else:
			saynn("[say=rahi]Name is.. kitty. Just call her kitty..[/say]")

			saynn("[say=artica]T-thank you.. k-kitty..[/say]")

		saynn("An awkward silence settles in while the feline stares at the fluff, clearly waiting for something.")

		saynn("[say=artica]..oh.. I'm Artica. Sorry, I'm still a bit..[/say]")

		saynn("Rahi chuckles softly and bats at Artica's dreamcatcher.")

		saynn("[say=rahi]You have a nice name, Artica. Very fitting for your soft fur.. meow..[/say]")

		saynn("[say=artica]Yip..[/say]")

		saynn("Rahi leans in close to that ear that she pierced with her claw.. and whispers something.. something that makes the herm blush. She then gently nibbles on that ear, making Artica's member twitch slightly inside of its sheath..")

		saynn("[say=artica]Ah..[/say]")

		saynn("Kitty smiles and returns to you, her eyes shine with a predator-like aura that you have rarely seen before..")

		saynn("[say=pc]What did you tell her?[/say]")

		saynn("[say=rahi]Nothing.. nothing that Artica doesn't know already..[/say]")

		saynn("Somehow Artica manages to act more subby than the shy kitty. Rahi's gaze quickly switches between you and blushy Artica.. who stares at you..")

		if (isFullSlave):
			saynn("[say=rahi]I will leave you two be.. I didn't steal anything, promise..[/say]")

		else:
			saynn("[say=rahi]She will leave you two be.. She didn't steal anything, promise..[/say]")

		saynn("[say=artica]S-see you-s..[/say]")

		saynn("Rahi winks at Artica.. and that somehow makes the fluff lower her gaze.")

		if (isFullSlave):
			saynn("[say=rahi]Can't wait to get my paws on you~.[/say]")

		else:
			saynn("[say=rahi]She can't wait to get her paws on you~.[/say]")

		saynn("And just like that, Rahi dashes away, leaving you and the red swaying fluff alone..")

		addButton("Continue", "See what happens next", "artica_pc_alone")
	if(state == "artica_pc_alone"):
		removeCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="artica", npcAction="stand", npcBodyState={naked=true}})
		saynn("Artica puts her paw on her dreamcatcher. You slowly approach her.")

		saynn("[say=pc]How do you feel?[/say]")

		saynn("[say=artica]Better..[/say]")

		saynn("[say=pc]I'm glad.[/say]")

		saynn("[say=artica]I don't know how to.. thank you.. I thought I was g-gone..[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Don't worry about it.[/say]")

		saynn("[say=artica]You probably want to know.. about what that big cat said..[/say]")

		saynn("[say=pc]Don't push yourself.[/say]")

		saynn("Artica closes the distance herself, standing so close that you can feel her warm breath on your chest.")

		saynn("[say=artica]I was always shy.. But I had.. fantasies.. you know?..[/say]")

		saynn("Shy ones are often the most kinky ones, it's true.")

		saynn("[say=artica]I felt like I was alone like that.. in my tribe.. There was no way for me to.. act on my dreams..[/say]")

		saynn("Artica looks around, gazing upon all the metal and concrete that she is surrounded with..")

		saynn("[say=artica]But when.. the balance was disturbed.. it gave me a sense of purpose..[/say]")

		saynn("She looks down at her naked body, her paws sliding along her fur. The fluff is wiggling her rear.")

		saynn("[say=artica]I'm quiet.. But I turned my naked body into a loud message.. of protest..[/say]")

		saynn("Weaponizing your exhibitionism urges.. smart..")

		saynn("[say=artica]That guard.. might be kinda right.. I was always a slut..[/say]")

		saynn("[say=pc]Don't listen to that..[/say]")

		saynn("[say=artica]..and I loved being your slut..[/say]")

		saynn("Artica looks you in the eyes.. while hers are sparkling..")

		saynn("[say=artica]You helped uncover my kinky side.. And so I will forever be eager to spread my legs for you.."+str(" And carry your pups.." if GM.pc.hasPenis() else "")+""+str(" All while my useless cock is locked away until you need it.. or be it forever too.." if getCharacter("artica").isWearingChastityCage() else "")+"[/say]")

		addButton("Continue", "See what happens next", "artica_kneels")
	if(state == "artica_kneels"):
		playAnimation(StageScene.Beg, "beg", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Artica gets on her knees before you, her legs spread to make sure not to hide anything.")

		saynn("[say=artica]There is nothing more that I would love.. than to be your whore.. pawslut.. breeding bitch.. puppy maker.. crotch sniffer.. chastity slut.. fuck toy..[/say]")

		saynn("A shy fluffer.. who was afraid to make a single noise too loud.. is now degrading herself in front of you.. kneeling.. proudly displaying her bouncing tits"+str(", pregnant belly " if getCharacter("artica").isVisiblyPregnant() else "")+", cock and pussy..")

		saynn("[say=artica]Please.. Make me yours.. Mark me any way you want..[/say]")

		addButton("Headpats!", "Just give her some headpats", "do_headpats")
		addButton("Bodywritings", "Give Artica some headpats.. but also draw all over her body!", "do_bodywritings")
		addButton("Face to crotch", "Push her face into your crotch and mark her with your scent", "do_crotchface")
		addButtonWithChecks("Piss on", "Mark her as your property like the dogs do it", "do_piss_on", [], [[ButtonChecks.ContentEnabled, ContentType.Watersports]])
	if(state == "do_headpats"):
		playAnimation(StageScene.Beg, "pat", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Marking seems to be a bit excessive.. so you decide to just pat the heck out of that fluff. Artica chrrrrs and nuzzles into your touch, bouncing happily.")

		saynn("[say=pc]You are my slut. My headpat slut. Understand?[/say]")

		saynn("[say=artica]Yes~. I'm a total slut for headpats. Haha.[/say]")

		saynn("You smile and make sure her head is properly headpatted, until her ears go flat with her hair!")

		saynn("[say=pc]Good. Very good. You can go to your spot or stay here if you want.[/say]")

		saynn("She nods-nods.")

		saynn("[say=artica]Oki-s! Yip-yip..[/say]")

		saynn("You help her to get up. She seems to prefer her public spot.. so she heads there. She gives you one last glance, letting you see sparkling eyes and sticked out tongue.")

		saynn("(( Artica's content ends here. Thank you for playing <3 ))")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_bodywritings"):
		playAnimation(StageScene.Beg, "pat", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Marking.. you know exactly how to mark that fluff.. with a marker!")

		saynn("You grab one and begin writing all sorts of words and messages on her body, her white fur contrasts greatly with the black ink. After that you decide to just pat the heck out of that fluff. Artica chrrrrs and nuzzles into your touch, bouncing happily and proudly displaying all the bodywritings.")

		saynn("[say=pc]You are my slut. My property to mark as I wish. Understand?[/say]")

		saynn("[say=artica]Yes~. I'm a total slut for bodywritings. Haha.[/say]")

		saynn("You smile and make sure her head is properly headpatted, until her ears go flat with her hair!")

		saynn("[say=pc]Good. Very good. You can go to your spot or stay here if you want.[/say]")

		saynn("She nods-nods.")

		saynn("[say=artica]Oki-s! Yip-yip..[/say]")

		saynn("You help her to get up. She seems to prefer her public spot.. so she heads there. She gives you one last glance, letting you see sparkling eyes and sticked out tongue.")

		saynn("(( Artica's content ends here. Thank you for playing <3 ))")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_crotchface"):
		playAnimation(StageScene.ChairCrotchSniff, "grind", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Marking.. you know exactly how to mark that girl. You push her onto her bed.. before grabbing her face and shoving it into your crotch!"+str(" You make sure to grind your wet, needy pussy against that snout, forcing your scent into her fur and also making her breathe it in." if (GM.pc.hasReachableVagina() && !GM.pc.hasReachablePenis()) else "")+""+str(" You make sure to push her snout against your ballsack, forcing your scent into her fur while also making her breathe it in." if (!GM.pc.hasReachableVagina() && GM.pc.hasReachablePenis()) else "")+"")

		saynn("[say=pc]You are my slut. My personal slut. Understand?[/say]")

		saynn("Your intoxicating smell is making her lusty in seconds..")

		saynn("[say=artica]Ah.. y-yes~. I'm a total slut for your scent.. H.. h-haha. mmhh-h..[/say]")

		saynn("You smile and soon let go of her hair.")

		saynn("[say=pc]Good. Very good. You can go to your spot or stay here if you want.[/say]")

		saynn("She nods-nods, her body is swaying a bit as she struggles to maintain balance, her senses overloaded..")

		saynn("[say=artica]Oki-s! Yip-yip..[/say]")

		saynn("You help her to get up. She seems to prefer her public spot.. so she heads there. She gives you one last glance, letting you see sparkling eyes and sticked out tongue.")

		saynn("(( Artica's content ends here. Thank you for playing <3 ))")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_piss_on"):
		if (GM.pc.hasReachablePenis() || GM.pc.isWearingChastityCage()):
			playAnimation(StageScene.SexPawjob, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
			saynn("Marking.. you know exactly how to mark that fluff in a way that will make her remember it..")

			saynn("You push her onto the floor.. and whip your cock cock. You hold her there while waiting for the urge to happen.. and soon..")

		else:
			playAnimation(StageScene.ChairCrotchSniff, "sniff", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
			saynn("Marking.. you know exactly how to mark that fluff in a way that will make her remember it..")

			saynn("You grab her by the short hair.. and push her face against your "+str("pussy" if GM.pc.hasVagina() else "crotch")+". You hold her there while waiting for the urge to happen.. and soon..")

		saynn("[say=artica]Eep..[/say]")

		saynn("..a stream of your yellow smelly piss emerges from your piss hole.. A stream that begins to stream down from her snout, along the cheeks, creating little golden rivers along her white fur..")

		saynn("[say=pc]You are my slut. My personal slut. Understand?[/say]")

		saynn("Somehow, this extremely humiliating and degrading act is turning her on in seconds. Artica is moaning while huffing your gross scent, your urine flowing down her curves, dripping from her perky nips, coating her cock and pussy..")

		saynn("[say=artica]Ah.. y-yes~. I'm a total slut for your.. piss.. H.. h-haha. mmhh-h..[/say]")

		if (GM.pc.hasReachablePenis() || GM.pc.isWearingChastityCage()):
			saynn("You smile as you empty your bladder onto her.")

		else:
			saynn("You smile and soon let go of her hair.")

		saynn("[say=pc]Good. Very good. You can go to your spot or stay here if you want.[/say]")

		saynn("She nods-nods, her body is swaying a bit as she struggles to maintain balance, her senses overloaded..")

		saynn("[say=artica]Oki-s! Yip-yip..[/say]")

		saynn("You help her to get up. She seems to prefer her public spot.. so she heads there, seemingly proud of her new facials.. She gives you one last glance, letting you see sparkling eyes and sticked out tongue.")

		saynn("(( Artica's content ends here. Thank you for playing <3 ))")
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "go_to_artica"):
		processTime(5*60)

	if(_action == "artica_receives_dreamcatcher"):
		processTime(3*60)
		setFlag("ArticaModule.LQArticaGotDreamCatcher", true)
		getCharacter("artica").updateBodyparts()
		addMessage("Artica + Rahi scene unlocked")

	if(_action == "artica_pc_alone"):
		processTime(3*60)

	if(_action == "artica_kneels"):
		processTime(3*60)
		addExperienceToPlayer(500)
		addMessage("Task completed")

	if(_action == "do_headpats"):
		processTime(3*60)

	if(_action == "do_bodywritings"):
		processTime(3*60)
		for _i in range(10):
			getCharacter("artica").addBodywritingRandom()

	if(_action == "do_crotchface"):
		processTime(5*60)
		getModule("ArticaModule").makeLusty()

	if(_action == "do_piss_on"):
		processTime(5*60)
		getCharacter("artica").pissedOnBy("pc")
		getModule("ArticaModule").makeLusty()

	setState(_action)

func saveData():
	var data = .saveData()

	data["isSlave"] = isSlave
	data["isFullSlave"] = isFullSlave

	return data

func loadData(data):
	.loadData(data)

	isSlave = SAVE.loadVar(data, "isSlave", false)
	isFullSlave = SAVE.loadVar(data, "isFullSlave", false)
