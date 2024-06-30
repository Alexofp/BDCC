extends SceneBase

var bornString = ""
var bornChildAmount = 0

func _init():
	sceneID = "rahiGivingBirthFirstTimeScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		var isSlavery = getModule("RahiModule").isInSlavery()
		saynn("You notice Rahi and she notices you, her eyes seem to be very nervous. Your gaze is immediately drawn to her pregnant belly that's round and very prominent. Rahi holds onto it, her paws and legs are shaky.")

		if (isSlavery):
			saynn("[say=rahi]S-she.. she thinks.. It's time.. She is scared, {rahiMaster}..[/say]")

		else:
			saynn("[say=rahi]S-she.. she thinks.. It's time.. She is scared..[/say]")

		saynn("Oh wow, you quickly rush to her and wrap your arms around her waist, to support.")

		saynn("[say=pc]It's okay, kitty. We will get you to the medical wing, don't worry.[/say]")

		if (getFlag("RahiModule.Rahi_GaveBirthTimes", 0) <= 0):
			saynn("[say=rahi]Y-yeah.. please.. It's her first time..[/say]")

		else:
			saynn("[say=rahi]Y-yeah.. please.. She is afraid she won't make it there this time..[/say]")

		addButton("Help her", "Help kitty get to the medical wing", "help_kitty")
	if(state == "help_kitty"):
		aimCameraAndSetLocName("medical_nursery")
		GM.pc.setLocation("medical_nursery")
		addCharacter("nurse")
		playAnimation(StageScene.Duo, "sit", {pc = "nurse", npc="rahi", npcAction="stand"})
		saynn("Together, you make your way through the dimly lit corridors of the prison, Rahi occasionally pausing to steady herself against the walls. At least it seems that your presence brings a sense of comforting reassurance to her, your touch helping her walk.")

		saynn("Upon reaching the medical wing, one of the nurses sees you. Rahi tries to say something but instead lets out a painful cry while almost collapsing, trying to keep her legs closed. Luckily you've been there to keep her stable.")

		saynn("[say=nurse]Oh. I see. We have a situation here.[/say]")

		saynn("The nurse quickly taps some buttons on her datapad and then leads you somewhere..")

		saynn("[say=nurse]C'mon, quick.[/say]")

		saynn("[say=rahi]Me-eow.. She feels.. something.. the contractions..[/say]")

		saynn("You try to keep her calm.")

		addButton("Continue", "See what happens next", "rahi_prepares")
	if(state == "rahi_prepares"):
		playAnimation(StageScene.GivingBirth, "birth", {pc="rahi", bodyState={naked=true}})
		addCharacter("rahi", ["naked"])
		saynn("You and Rahi are led into a private room with a soft and warm environment that already seems to be prepared for her labor. The nurse quickly undresses Rahi and positions her on a special hospital bed.")

		saynn("You stand by her side and hold her paw while more doctors and nurses walk in.")

		saynn("[say=pc]Everything is gonna be okay, kitty. Just listen to them.[/say]")

		saynn("[say=rahi]She.. she can do that..[/say]")

		saynn("As the contractions suddenly intensify, Rahi grips your hand tightly and produces a loud cry, her body trembling with both anticipation and pain. While the doctors are focused on her lower part of the body, you lean in closer and whisper her soothing words, sometimes swiping away loose hair strands of her ponytail.")

		saynn("Time seems to blur as Rahi's labor progresses, each wave of pain met with another loud cry. The room's air is heavy with the sounds of her labored breathing. At some point her voice becomes all raspy from screaming..")

		saynn("Finally, with one final push, a different-sounding cry fills the room, announcing the arrival of a new life..")

		addButton("Continue", "See what happens next", "rahi_gives_birth")
	if(state == "rahi_gives_birth"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="rahi", bodyState={naked=true}})
		
		if (bornChildAmount == 1):
			saynn("Rahi gave birth to "+str(bornChildAmount)+" kid!")

		else:
			saynn("Rahi gave birth to "+str(bornChildAmount)+" kids!")

		saynn(""+str(bornString)+"")

		addButton("Continue", "See what happens next", "after_birth")
	if(state == "after_birth"):
		playAnimation(StageScene.SexStart, "start", {pc = "pc", npc="rahi", npcBodyState={naked=true}})
		if (bornChildAmount  <= 1):
			saynn("Your eyes widen with awe as you catch your first glimpse of Rahi's child, your heart overflowing with love. Rahi is incredibly exhausted though, just smiling as she cradles her newborn in her paws.")

			saynn("[say=rahi]So.. precious..[/say]")

		else:
			saynn("Your eyes widen with awe as you catch your first glimpse of Rahi's kids, your heart overflowing with love. Rahi is incredibly exhausted though, just smiling as she cradles her newborns in her paws, all "+str(bornChildAmount)+" of them.")

			saynn("[say=rahi]So.. precious..[/say]")

		saynn("[say=nurse]Let her rest, inmate.[/say]")

		saynn("The nurse tries to get you out of the room now. Rahi looks up at you and blushes. A little concern clouds your mind, you direct a question towards the doctors that stand around Rahi, they seem to be already reaching their hands out to her.")

		saynn("[say=pc]What are you gonna do now?[/say]")

		saynn("[say=nurse]You know how it works, inmates aren't allowed to keep their kids in the prison.[/say]")

		saynn("That's.. that's so.. unfair.")

		saynn("[say=pc]Let her be a mother. For some time at least.[/say]")

		if (bornChildAmount == 1):
			saynn("Rahi protects her child from the doctor's hands, her eyes getting watery. The nurse sees that and sighs.")

			saynn("[say=nurse]Alright.. Alright, fine. Let us at least do some basic procedures with the child and then she can spend some time together.[/say]")

			saynn("Rahi reluctantly hands the doctors her baby..")

		else:
			saynn("Rahi protects her children from the doctor's hands, her eyes getting watery. The nurse sees that and sighs.")

			saynn("[say=nurse]Alright.. Alright, fine. Let us at least do some basic procedures with the children and then she can spend some time together.[/say]")

			saynn("Rahi reluctantly hands the doctors her babies..")

		addButton("Continue", "See what happens next", "near_kindergarden")
	if(state == "near_kindergarden"):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcAction="kneel"})
		saynn("A few hours pass.")

		saynn("You are sitting in the lobby on one of the benches of the nursery.. just.. idling.")

		saynn("On the opposite wall is a heavily reinforced window that leads into some other room..")

		if (bornChildAmount == 1):
			saynn("Suddenly you see Rahi walk into that room while carefully carrying her child. Your full attention is directed towards her.. but she doesn't seem to see you through the window.")

		else:
			saynn("Suddenly you see Rahi walk into that room while carefully carrying one of her children. Your full attention is directed towards her.. but she doesn't seem to see you through the window.")

		saynn("She looks around and then just kneels on the soft carpet that is placed in the middle of the room. Rahi just cradles her newborn in her arms and probably hums something, it's impossible to hear through the thick glass..")

		saynn("Rahi is a mother.. That's cute.. wholesome even. Too bad you aren't there.")

		addButton("Ask to join", "See if you can join Rahi", "check_join")
		addButton("Leave", "Let Rahi enjoy the moment alone", "just_leave")
	if(state == "just_leave"):
		saynn("You stare at Rahi through the window for a little longer, the sight makes you feel.. hope. Hope that your lives won't be meaningless. Or at least that Rahi's life won't be.")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "check_join"):
		playAnimation(StageScene.Duo, "sit", {pc="nurse", npc="pc", npcAction="stand"})
		saynn("You approach the nurse that sits behind the counter. She seems to be quite bored, just staring at her computer screen while supporting her head with her arm.")

		saynn("[say=nurse]Need something, inmate?[/say]")

		saynn("[say=pc]Yeah, see the feline behind the glass? I wanna join her.[/say]")

		if (!GM.pc.isTooLewd()):
			saynn("The nurse lazily turns her head, looking at Rahi. Then she looks back at you and quickly scans you with her eyes, probably looking for anything.. inappropriate.")

			saynn("[say=nurse]Why?[/say]")

			saynn("[say=pc]Why not? I brought her here, I was helping her give birth, I..[/say]")

			saynn("The nurse cuts you off.")

			saynn("[say=nurse]Fiiine, you have ten minutes.[/say]")

			saynn("She presses a button on her computer that opens one of the locked doors.")

			addButton("Continue", "Join Rahi", "join_rahi_wholesome")
		else:
			saynn("The nurse lazily turns her head, looking at Rahi. Then she looks back at you.")

			saynn("[say=nurse]Nope.[/say]")

			saynn("[say=pc]Why not? I brought her here, I was helping her give birth, I..[/say]")

			saynn("The nurse cuts you off.")

			saynn("[say=nurse]Look at yourself, inmate. We can't allow inmates that look so.. exposed.. anywhere near kids. Understand what I mean?[/say]")

			saynn("Aw, she has a point.")

			addButton("Leave", "Let Rahi enjoy the moment alone", "just_leave")
			addButton("Inventory", "Look at your inventory", "open_inv")
	if(state == "open_inv"):
		saynn("[say=pc]What about now?[/say]")

		saynn("The nurse lazily scans you with her eyes again.")

		if (!GM.pc.isTooLewd()):
			saynn("[say=nurse]Sure, that's better. You have ten minutes.[/say]")

			saynn("She presses a button on her computer that opens one of the locked doors.")

			addButton("Continue", "Join Rahi", "join_rahi_wholesome")
		else:
			saynn("[say=nurse]Nope.[/say]")

			saynn("It seems you can't visit her there today.. Maybe some other time when Rahi is gonna give another birth..")

			addButton("Leave", "Let Rahi enjoy the moment alone", "just_leave")
			addButton("Inventory", "Look at your inventory", "open_inv")
	if(state == "join_rahi_wholesome"):
		playAnimation(StageScene.Duo, "kneel", {npc="rahi", npcAction="kneel"})
		removeCharacter("nurse")
		saynn("You enter a clean white room with some colorful furniture and a big soft carpet in the middle. There are plenty of cameras around, making you feel a bit uneasy.")

		saynn("Rahi sits on the carpet, cradling her newborn baby in her arms. The soft sounds of cooing fill the air as the baby nuzzles against her chest. The kitty smiles as you sit nearby.")

		saynn("[say=rahi]Thank you.. for helping.. means the world..[/say]")

		saynn("[say=pc]Yeah, of course.[/say]")

		saynn("The baby seems to be already hungry, seeking nourishment. So Rahi undoes a few buttons of her inmate shirt and spreads it open slightly, enough to uncover one of her nips. Rahi brings her child to her exposed breast and just proceeds to breastfeed..")

		saynn("[say=pc]You're a great mother, kitty.[/say]")

		saynn("She looks down at her baby.. and sees the tiny fingers curling around her breast.. a soft sigh of contentment escapes Rahi's lips.")

		saynn("[say=rahi]Is she?.. She doesn't really know how to.. be.. a good mother..[/say]")

		addButton("Instincts", "Tell Rahi that she just gotta follow her instincts", "say_instincts")
		addButton("Experience", "Tell Rahi that she will get better at it with experience", "say_experience")
	if(state == "say_instincts"):
		saynn("[say=pc]Just follow your instincts, kitty.[/say]")

		saynn("Rahi sighs while the baby keeps suckling on her breast.")

		saynn("[say=rahi]Her current instinct is to.. Steal her baby and never give it back.. ever..[/say]")

		saynn("You can't help but to get a little closer to Rahi and carefully put your hand on her shoulder, all eyes directed towards the curious baby that seems to be fully content while suckling on mother's dark nipple.")

		saynn("[say=pc]Yeah..[/say]")

		saynn("You two stay silent for a bit, the room quiet, you can only hear the noises that the baby makes.")

		saynn("[say=rahi]But.. her head tells her that there is no worse place for a baby to be than prison..[/say]")

		saynn("The unfortunate truth.")

		addButton("Continue", "See what happens next", "time_say_goodbye")
	if(state == "say_experience"):
		saynn("You shift closer to Rahi and wrap your arms around her, gently hugging.")

		saynn("[say=pc]You will get more experienced, kitty.[/say]")

		saynn("Rahi turns her head and looks at you, her eyes a little sad.")

		saynn("[say=rahi]How is she gonna get enough experience though..[/say]")

		saynn("You lean in even closer and land a little kiss on Rahi's lips before whispering something into her ear.")

		saynn("[say=pc]Ten.. minutes.. at a time..[/say]")

		saynn("A little blush appears on Rahi's cheeks.")

		saynn("[say=rahi]That's one way..[/say]")

		saynn("All eyes directed towards the curious baby that seems to be fully content while suckling on mother's dark nipple.")

		saynn("You two stay silent for a bit, the room quiet, you can only hear the noises that the baby makes.")

		saynn("[say=rahi]Maybe that is her true purpose in life..[/say]")

		saynn("You hug her tighter.")

		addButton("Continue", "See what happens next", "time_say_goodbye")
	if(state == "time_say_goodbye"):
		playAnimation(StageScene.Hug, "hug", {npc="rahi", npcAction="stand"})
		saynn("Together, Rahi and you, try to enjoy this precious moment of parenthood..")

		saynn("Until the nurses walk in and tell you that it's time.")

		saynn("Tears stream down Rahi's cheeks. She brings her baby closer to her face and takes a good last look before leaving a little kiss on her child's forehead.")

		saynn("[say=rahi]Grow up big and strong.. And don't make your mother's mistakes..[/say]")

		saynn("Rahi reluctantly hands her child to the nurses and slowly gets up. She waves to her baby as the doctors take it away.")

		saynn("[say=rahi]Sorry..[/say]")

		saynn("You get up too and give Rahi a tight hug. She presses her face into your shoulder.")

		saynn("[say=pc]Time to go, kitty.[/say]")

		saynn("[say=rahi]Yeah.. she needs some.. rest..[/say]")

		saynn("You are guided back into the lobby. The door closes behind you. Rahi lowers her head and heads back to her spot.")

		addButton("Continue", "That was something", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "help_kitty"):
		processTime(20*60)

	if(_action == "rahi_prepares"):
		processTime(35*60)

	if(_action == "rahi_gives_birth"):
		processTime(5*60)
		var bornChilds = getCharacter("rahi").giveBirth()
		bornChildAmount = bornChilds.size()
		bornString = GM.CS.getChildBirthInfoString(bornChilds)

	if(_action == "near_kindergarden"):
		processTime(3*60*60)

	if(_action == "open_inv"):
		runScene("InventoryScene")

	if(_action == "say_instincts"):
		processTime(10*60)

	if(_action == "say_experience"):
		processTime(10*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["bornString"] = bornString
	data["bornChildAmount"] = bornChildAmount

	return data

func loadData(data):
	.loadData(data)

	bornString = SAVE.loadVar(data, "bornString", "")
	bornChildAmount = SAVE.loadVar(data, "bornChildAmount", 0)

func getDevCommentary():
	return "I'm more of a 'pls breed - no preg' kind of person x3. For some reason the nature has decided that giving birth for us humans needed to be super painful. But oh well, what can you do. That's why I yada-yada most of this stuff. But some people are really into it so might as well keep some fun parts like cradling your kids.."

func hasDevCommentary():
	return true
