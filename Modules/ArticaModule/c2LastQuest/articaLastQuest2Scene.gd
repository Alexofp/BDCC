extends SceneBase

var isSlave = false
var isFullSlave = false

func _init():
	sceneID = "articaLastQuest2Scene"

func _run():
	if(state == ""):
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

		saynn("[say=rahi]Here.. That's a good girl, took it like a champ..[/say]")

		saynn("Artica blushes and blinks at the feline, the sudden praise catching her off-guard.")

		if (isFullSlave):
			saynn("[say=rahi]Name is Rahi.[/say]")

		else:
			saynn("[say=rahi]Name is.. kitty. Just call her kitty..[/say]")

		saynn("[say=artica].. ..I'm Artica.[/say]")


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
