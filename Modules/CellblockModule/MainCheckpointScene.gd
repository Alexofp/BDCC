extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MainCheckpointScene"

func _run():
	if(state == ""):
		addCharacter("cp_guard")

	if(state == "" && !getFlag(CellblockModule.Cellblock_CheckpointVisited, false)):
		setFlag(CellblockModule.Cellblock_CheckpointVisited, true)
		
		saynn("To get to the elevator you first need to get through the checkpoint. It looks like a short corridor that’s protected by a security camera and a guard. The guard is clearly a guy, medium build, blue uniform, light armor, a belt with a few things like a stunstick and a remote.")

		saynn("When you approach the guard he gives you a stop sign.")

		saynn("[say=cp_guard]Name[/say]")

		saynn("[say=pc]It’s {pc.name}[/say]")

		saynn("He chuckles.")

		saynn("[say=cp_guard]Don’t give a fuck about that one. Your real name, inmate[/say]")

		saynn("That’s kinda annoying, you sigh while the guy slowly eyes out your {pc.feminine} body.")

		saynn("[say=pc]Inmate number {pc.inmateNumber}. Can I go now?[/say]")

		saynn("[say=cp_guard]Have to frisk you. Stand against a wall.[/say]")

		# (if not naked)
		if(!GM.pc.isFullyNaked()):
			saynn("[say=pc]Why?[/say]")

			saynn("[say=cp_guard]To make sure you don’t have anything illegal.[/say]")

			saynn("[say=pc]And what is illegal?[/say]")

			saynn("[say=cp_guard]Any weapons, any contraband. I don’t have all day, inmate.[/say]")
		# (if naked)
		else:
			saynn("[say=pc]Can’t you see that I don’t have anything, I’m naked[/say]")

			saynn("[say=cp_guard]Oh yeah? You can’t imagine where inmates hide contraband. Don’t waste my time, slut.[/say]")

		saynn("The guard will check you every time you try to walk past here. What do you wanna do?")
	elif(state == "" && GM.main.isVeryLate()):
		saynn("The canine guard stops you at the checkpoint.")
		
		saynn("[say=cp_guard]You can't use the elevator at this time, go back to your cell, inmate.[/say]")
	elif(state == ""):
		saynn("The canine guard stops you at the checkpoint.")

		saynn("[say=cp_guard]Gonna frisk you for anything illegal. Stand against a wall.[/say]")

		saynn("What do you wanna do?")
	if(state == ""):
		addButtonUnlessLate("Get frisked", "Let him frisk you", "get_frisked")
		addButtonWithChecks("Offer handjob", "Maybe he will let you through if you let his cock out (Needs free hands, Requires 10+ sexiness? Or sex slave level 2+?)", "offer_handjob", [], [ButtonChecks.NotArmsRestrained, ButtonChecks.NotLate])
		addButton("Leave", "You don’t wanna get frisked", "leave")

	if(state == "leave"):
		saynn("[say=pc]Oh, didn’t mean to go here.[/say]")

		saynn("The guard squints at you.")

		saynn("[say=cp_guard]Fuck off then[/say]")

		addButton("Continue", "Oh well", "leaveandendthescene")

	if(state == "get_frisked"):
		saynn("You stand against a wall and wait for the guy. He stands behind you and makes you spread your feet more.")

		saynn("He then crouches and starts going from bottom to the top, his hands slide along the curves of your {pc.thick} body, searching for anything unusual. He checks any pockets too.")

		saynn("Then he pulls out some kind of scanner and uses it on you. He probably could have just done that from the start.")

		# (if has something)
		if(GM.pc.hasIllegalItems()):
			saynn("[say=cp_guard]That’s contraband. Where did you find that, inmate?[/say]")

			saynn("[say=pc]On the floor?[/say]")

			saynn("[say=cp_guard]Yeah, sure. I will be taking that away[/say]")

			saynn("Well, what can you do. You roll your eyes and walk away.")
		else:
		# (if clear)
			saynn("[say=cp_guard]Alright, you’re clear.[/say]")

			saynn("You continue on your way.")
		
		addButton("Continue", "Time to go", "friskAndEndthescene")
		

	if(state == "offer_handjob"):
		saynn("Instead of doing as told you walk up closer to the guard and boldly put a hand on his crotch, giving it a slight squeeze. The guy hums and smirks.")

		saynn("[say=pc]How about I offer you something else~[/say]")

		saynn("[say=cp_guard]I guess you can try, inmate. No funny business.[/say]")

		saynn("Your second hand tickles his chin while the first one slowly unzips the bulging pants.")

		saynn("[say=pc]Serious package calls for serious business~[/say]")

		saynn("You get on your knees before him and pull his half-erected cock out. The shape follows that of any canine, pointy tip, blood-red veiny shaft with a knot on the end. You give the head a smooch and wrap your digits around the thick meat, slightly stroking it to help him get hard. He leans his back against a wall and watches you work.")

		# (if red)
		if(GM.pc.getInmateType() == InmateType.HighSec):
			saynn("[say=cp_guard]You’re awfully slutty for a red. Don’t you dare use your claws, whore[/say]")

		# (if general)
		if(GM.pc.getInmateType() == InmateType.General):
			saynn("[say=cp_guard]Such a slut, you should be in the pink block, I wouldn’t mind fucking you every once in a while.[/say]")

		# (if pink)
		if(GM.pc.getInmateType() == InmateType.SexDeviant):
			saynn("[say=cp_guard]Glad the sextoys know their place. Keep working.[/say]")

		saynn("His member slowly reaches the maximum length of 18cm, very hefty. On its tip you see some precum beginning to gather, you catch it with your hand and spread it along the length down. Your free hand slips into his unzipped pants and gives his balls a small massage. His breathing becomes deeper while you stroke his canine cock, slowly picking up the pace.")

		saynn("It all happens in a public place but you don’t care, you look up at the guy and teasingly lick his cock once, getting some of his pre, you hand slides back and forth at a steady pace, you notice his knot inflating, his shaft throbbing.")

		saynn("[say=cp_guard]I wouldn’t mind cumming down your throat, slut[/say]")

		saynn("You chuckle softly and push him towards the peak faster, both your hands slide along the twitching length, his panting and a big knot shows that he is close.")

		addButton("Outside", "Do the required minimum and avoid getting any mess on you", "outside")
		addButton("Facial", "Let him cum on your face", "facial")
		addButton("Mouth", "Why should you waste all that jizz, open your mouth and catch it", "mouth")
		
	if(state == "outside"):
		saynn("His cock throbs more, the knot is so fat you can’t wrap your digits around it. Only a few seconds pass before the guy starts grunting while his cock shoots spurts of cum, one after another. You sit slightly to the side and avoid all of the mess, watching the guy paint the opposite wall with thick jizz.")

		saynn("[say=cp_guard]Nghr, fuck.. I should make you use that tongue to clean it.[/say]")

		saynn("You chuckle and sneakily clean your fingers using his pants. His cock slowly deflates and he hides it away.")

		saynn("[say=cp_guard]Fine, I won’t frisk you today anymore, you’re free to pass.[/say]")

		# (scene ends)

		
		addButton("Continue", "That went well", "allowFullAndendthescene")
	if(state == "facial"):
		saynn("You close your eyes and put yourself right under that cock, your hands finally manage to push him over the edge. The guy grunts while his animal cock starts shooting hot cum onto your face, many waves of it. You quickly become messy, your hair, face, ears, shoulders, get covered in the sticky stuff. You sit still like a good cum rag and just take it all, your hands not moving but aiming his dick right down at you.")

		saynn("Eventually he comes down from it, his cock slowly goes down and starts to deflate. Though he does take the liberty of wiping its tip against your clothes. You can only freely open one eye and opening the mouth would mean getting a taste of his seed.")

		saynn("[say=cp_guard]That was great, you look like a proper cum slut. You’re free to go, won’t frisk you today anymore, whore[/say]")

		# (scene ends)

		addButton("Continue", "That went well", "allowFullAndendthescene")
	if(state == "mouth"):
		saynn("You get into the position and open your mouth wide, your tongue is out, the cock that you are stroking is resting on it. Your hands swiftly work that cock while you gaze up at the guard with your eyes, hungry for cum. Eventually he starts grunting and jerking his hips back and forth, his cock exploding with wave after wave of hot semen, most of which hits directly the back of your throat with some landing on the tongue. You do it like a proper slut, giving the guy a show while also not letting a single drop of his cum go to waste, you quickly swallow and let him stuff your mouth more, your hands milking his shaft and draining his balls until there is nothing left.")

		saynn("Eventually his bliss state ends, you pull back and show him your mouth full of cum. Then you close it and raise your chin high, showing him the exact moment when you swallow that sticky mess completely. You then lick and suck on your every finger and swallow that too before showing the guard your empty mouth.")

		saynn("[say=cp_guard]Oh f-fuck, that was something else, you’re such a good whore. You’re free to pass for today but I wouldn’t mind using you more[/say]")

		# (scene ends)
		addButton("Continue", "That went well", "allowFullAndendthescene")



func _react(_action: String, _args):
	if(_action == "get_frisked"):
		for item in GM.pc.getInventory().getItemsWithTag(ItemTag.Illegal):
			addMessage(item.getStackName()+" was taken away")
		for item in GM.pc.getInventory().getEquippedItemsWithTag(ItemTag.Illegal):
			addMessage(item.getStackName()+" was taken away")
	
	if(_action == "friskAndEndthescene"):
		GM.pc.getInventory().removeItemsList(GM.pc.getInventory().getItemsWithTag(ItemTag.Illegal))
		GM.pc.getInventory().removeEquippedItemsList(GM.pc.getInventory().getEquippedItemsWithTag(ItemTag.Illegal))
		
		endScene()
		return
	
	if(_action == "outside"):
		GM.pc.addSkillExperience(Skill.SexSlave, 20, "cpguard_suckcock")

	if(_action == "facial"):
		GM.pc.cummedOnBy("cp_guard", BodilyFluids.FluidSource.Penis)
		GM.pc.addSkillExperience(Skill.SexSlave, 20, "cpguard_suckcock")
		GM.pc.addSkillExperience(Skill.CumLover, 20, "cpguard_suckcock")
		GM.pc.updateNonBattleEffects()

	if(_action == "mouth"):
		GM.pc.cummedInMouthBy("cp_guard")
		GM.pc.addSkillExperience(Skill.SexSlave, 20, "cpguard_suckcock")
		GM.pc.addSkillExperience(Skill.CumLover, 25, "cpguard_suckcock")
		GM.pc.updateNonBattleEffects()

	if(_action == "allowFullAndendthescene"):
		setFlag(CellblockModule.Cellblock_FreeToPassCheckpoint, true)
		endScene()
		return

	if(_action == "leaveandendthescene"):
		GM.pc.setLocation("hall_mainentrance")
		endScene()
		return

	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)

