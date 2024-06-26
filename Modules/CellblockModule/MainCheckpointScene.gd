extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MainCheckpointScene"

func _run():
	if(state == ""):
		addCharacter("cp_guard")
		playAnimation(StageScene.Duo, "stand", {npc="cp_guard"})

	if(state == "" && !getModuleFlag("CellblockModule", "Cellblock_CheckpointVisited", false)):
		setModuleFlag("CellblockModule", "Cellblock_CheckpointVisited", true)
		
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
		addButtonWithChecks("Offer handjob", "Maybe he will let you through if you let his cock out", "offer_handjob", [], [
			ButtonChecks.NotHandsBlocked,
			ButtonChecks.NotLate,
			[ButtonChecks.SkillCheck, Skill.SexSlave, 1],
			])
		addButton("Intimidate", "Try to scare him off. Might work if you have the right reputation", "intimidate")
		addButton("Leave", "You don’t wanna get frisked", "leave")

	if(state == "leave"):
		saynn("[say=pc]Oh, didn’t mean to go here.[/say]")

		saynn("The guard squints at you.")

		saynn("[say=cp_guard]Fuck off then[/say]")

		addButton("Continue", "Oh well", "leaveandendthescene")

	if(state == "get_frisked"):
		playAnimation(StageScene.SexStanding, "tease", {
			pc="cp_guard",npc="pc",
			bodyState={},
			npcBodyState={},
		})
		
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
		playAnimation(StageScene.SexHandjob, "sex", {
			npc="pc", pc="cp_guard", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={},
		})

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
			saynn("[say=cp_guard]Such a slut, you should be in the lilac block, I wouldn’t mind fucking you every once in a while.[/say]")

		# (if pink)
		if(GM.pc.getInmateType() == InmateType.SexDeviant):
			saynn("[say=cp_guard]Glad the sextoys know their place. Keep working.[/say]")

		saynn("His member slowly reaches the maximum length of {cp_guard.penisSizeStr}, very hefty. On its tip you see some precum beginning to gather, you catch it with your hand and spread it along the length down. Your free hand slips into his unzipped pants and gives his balls a small massage. His breathing becomes deeper while you stroke his canine cock, slowly picking up the pace.")

		saynn("It all happens in a public place but you don’t care, you look up at the guy and teasingly lick his cock once, getting some of his pre, you hand slides back and forth at a steady pace, you notice his knot inflating, his shaft throbbing.")

		saynn("[say=cp_guard]I wouldn’t mind cumming down your throat, slut[/say]")

		saynn("You chuckle softly and push him towards the peak faster, both your hands slide along the twitching length, his panting and a big knot shows that he is close.")

		addButton("Outside", "Do the required minimum and avoid getting any mess on you", "outside")
		addButton("Facial", "Let him cum on your face", "facial")
		addButtonWithChecks("Mouth", "Why should you waste all that jizz, open your mouth and catch it", "mouth", [], [ButtonChecks.NotOralBlocked])
		
	if(state == "outside"):
		playAnimation(StageScene.SexHandjob, "tease", {
			npc="pc", pc="cp_guard", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={},
		})
		
		saynn("His cock throbs more, the knot is so fat you can’t wrap your digits around it. Only a few seconds pass before the guy starts grunting while his cock shoots spurts of cum, one after another. You sit slightly to the side and avoid all of the mess, watching the guy paint the opposite wall with thick jizz.")

		saynn("[say=cp_guard]Nghr, fuck.. I should make you use that tongue to clean it.[/say]")

		saynn("You chuckle and sneakily clean your fingers using his pants. His cock slowly deflates and he hides it away.")

		saynn("[say=cp_guard]Fine, I won’t frisk you today anymore, you’re free to pass.[/say]")

		# (scene ends)

		
		addButton("Continue", "That went well", "allowFullAndendthescene")
	if(state == "facial"):
		playAnimation(StageScene.SexHandjob, "fast", {
			npc="pc", pc="cp_guard", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={},
		})
		
		saynn("You close your eyes and put yourself right under that cock, your hands finally manage to push him over the edge. The guy grunts while his animal cock starts shooting hot cum onto your face, many waves of it. You quickly become messy, your hair, face, ears, shoulders, get covered in the sticky stuff. You sit still like a good cum rag and just take it all, your hands not moving but aiming his dick right down at you.")

		saynn("Eventually he comes down from it, his cock slowly goes down and starts to deflate. Though he does take the liberty of wiping its tip against your clothes. You can only freely open one eye and opening the mouth would mean getting a taste of his seed.")

		saynn("[say=cp_guard]That was great, you look like a proper cum slut. You’re free to go, won’t frisk you today anymore, whore.[/say]")

		# (scene ends)

		addButton("Continue", "That went well", "allowFullAndendthescene")
	if(state == "mouth"):
		playAnimation(StageScene.SexOral, "fast", {
			npc="pc", pc="cp_guard", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={},
		})
		
		saynn("You get into the position and open your mouth wide, your tongue is out, the cock that you are stroking is resting on it. Your hands swiftly work that cock while you gaze up at the guard with your eyes, hungry for cum. Eventually he starts grunting and jerking his hips back and forth, his cock exploding with wave after wave of hot semen, most of which hits directly the back of your throat with some landing on the tongue. You do it like a proper slut, giving the guy a show while also not letting a single drop of his cum go to waste, you quickly swallow and let him stuff your mouth more, your hands milking his shaft and draining his balls until there is nothing left.")

		saynn("Eventually his bliss state ends, you pull back and show him your mouth full of cum. Then you close it and raise your chin high, showing him the exact moment when you swallow that sticky mess completely. You then lick and suck on your every finger and swallow that too before showing the guard your empty mouth.")

		saynn("[say=cp_guard]Oh f-fuck, that was something else, you’re such a good whore. You’re free to pass for today but I wouldn’t mind using you more.[/say]")

		# (scene ends)
		addButton("Continue", "That went well", "allowFullAndendthescene")

		
	if(state == "intimidate"):
		saynn("[say=pc]How about you let me through peacefully.[/say]")

		saynn("The guard straightens his posture and grabs his weapon.")

		# (if red)
		if(GM.pc.getInmateType() == InmateType.HighSec):
			saynn("[say=cp_guard]Don’t think so, red. I’m not afraid of you.[/say]")

		# (if general)
		if(GM.pc.getInmateType() == InmateType.General):
			saynn("[say=cp_guard]Disobeying inmate, huh. Time to teach you a lesson[/say]")

		# (if pink)
		if(GM.pc.getInmateType() == InmateType.SexDeviant):
			saynn("[say=cp_guard]This slut has teeth? I will have so much fun with you[/say]")

		saynn("Seems like it’s a fight.")
		
		addButton("Fight", "Start the fight", "fight")

	if(state == "lost_fight"):
		saynn("[say=cp_guard]You better start behaving now, inmate[/say]")

		saynn("He pins you to the ground, you can’t really resist much.")

		# (scene ends)
		addButton("Continue", "Oh well", "leaveandendthescene")

	if(state == "won_fight"):
		saynn("The defeated guard sits on the floor, unable to continue fighting.")

		saynn("[say=cp_guard]You got lucky today, inmate. But don’t think other guards won’t stop you.[/say]")

		# (if pink)
		if(GM.pc.getInmateType() == InmateType.SexDeviant):
			saynn("[say=cp_guard]Defeated by some sextoy, fuck me[/say]")
		
		addWonButton()
		
	if(state == "catch_anal"):
		playAnimation(StageScene.SexCowgirl, "sex", {
			pc="cp_guard", npc="pc", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		saynn("You straddle the guy and unzip his pants, he seems more intrigued than scared, watching you. You of course made sure he can’t reach his weapons or the shock remote, rendering him helpless.")

		saynn("[say=cp_guard]You could have asked, you know[/say]")

		saynn("[say=pc]I like getting things the hard way[/say]")

		saynn("[say=cp_guard]Oh yeah? I like the sound of that[/say]")

		saynn("Your hand pulls out his cock and keeps stroking it until he becomes hard. His member has a pointy canine shape with a fat knot at the end and is pretty long, about {cp_guard.penisSizeStr}. The guy smirks and tries to get a hold of your {pc.breasts} but you smack his hand away.")

		# (if canUndress)
		if(GM.pc.canUndress()):
			saynn("You then {pc.undressMessage}. You leave your clothes nearby.")

		saynn("You catch some of his precum with a few digits, then move them to your butt and rub it into your backdoor. Then you grab his cock and guide it towards your rear while slowly lowering yourself onto him. His cock slowly starts to prod and stretch your ring open. A few more attempts and you manage to do it, the tip of his cock is inside you.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your own {pc.cock} tries to get hard too without you even touching it but your chastity cage prevents a full blown erection. A lonely drop of pre can be seen shining on on the tip of the cage.")
		elif(GM.pc.hasPenis()):
			saynn("Your own {pc.cock} gets hard too without you even touching it, a lonely drop of pre can be seen shining on its end.")

		# (if has vagina)
		if(GM.pc.hasVagina()):
			saynn("Your slit doesn’t get any attention but it becomes wet just from you feeling so aroused.")

		saynn("[say=cp_guard]Don’t stop now, slut[/say]")

		saynn("He puts his hands on your {pc.feminine} hips and pushes you down, helping his cock to slide deeper into you. You let out a cute noise and bite your lips as your ring gets stretched enough to fit about half of his length.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("You can feel how it rubs against something very sensitive inside you, any motion causes your cock to leak with some transparent fluid.")

		# (if has vagina)
		if(GM.pc.hasVagina()):
			saynn("The cock is so filling that you feel it pushing on your g-spot through the wall that divides your pussy and anus.")

		saynn("You don’t stop, you slowly start riding him, moving your {pc.thick} {pc.feminine} body up down his cock, each time trying to stretch yourself out more, his precum works as a lube and makes riding the guard easier. It feels very pleasurable, you open your mouth and start moaning, your hands land on your chest and start playing with your sensitive nips.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your own caged up {pc.cockDesc} cock bobs up and down, your little prostate is being massaged so much, you can’t stop leaking.")
		elif(GM.pc.hasPenis()):
			saynn("Your own {pc.cockDesc} cock bobs up and down, your little prostate is being massaged so much, you can’t stop leaking.")

		# (if has vagina)
		if(GM.pc.hasVagina()):
			saynn("Your pussy drips with female juices, it’s not being directly stimulated but it feels so good anyways.")

		saynn("You push yourself further, getting almost his full size! Your ring got stretched enough and all the precum that he has been pumping into you allows you to start bouncing on his cock faster. You drool and pant, your digits pinch your sensitive nips while you ride him completely hands-free, it feels so great. The guy pants too, his hands pull you up and down, making your motions stronger.")

		saynn("[say=pc]Fuck me, you’re a good fill[/say]")

		saynn("[say=cp_guard]And you’re not getting off without me stuffing you[/say]")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your {pc.cockSize} toy throbs and becomes rock-hard, putting a serious amount of pressure on your cage. The guard’s cock has been pounding on your prostate so much that you feel like you’re about to go over the edge at any moment.")
		elif(GM.pc.hasPenis()):
			saynn("Your {pc.cockSize} toy throbs and becomes rock-hard, the guard’s cock has been pounding on your prostate so much that you feel like you’re about to go over the edge at any moment.")

		saynn("You’re close. And so is he. You feel his canine member becoming bigger inside your rectum, his knot inflates with blood and stretches you out even more but doesn’t quite fit. Your moans and pants don’t stop coming out, you press your hands into the guard’s chest and start bringing yourself down onto his cock with extra strength, your anal ring letting more and more of his knot in each time. With one last push you manage to finally squeeze it in, the full size of his fat orb slides inside you, locking you two together. That is what pushes you both over the edge, the guy grunts as his cock starts shooting hot sticky cum inside you, stuffing you. You moan and shiver, your legs shake, your hands hold tightly onto him.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Your little p-spot is smashed, the pressure is enough to make your {pc.cockDesc} cock pulsate and shoot cum too. Not as much but it’s almost a constant stream. You’re riding your own hands-free orgasm and it feels great.")

		# (if has vagina)
		if(GM.pc.hasVagina()):
			saynn("Your g-spot was rubbed so much through the flesh wall that your pussy starts squirting from over-stimulation. Wow, you managed to get a vaginal orgasm from anal.")

		saynn("You both pant heavily as you come down from your peaks. You look down at your belly and see a bulge on your belly. You try to stand up but realize that you can’t.")

		saynn("[say=cp_guard]Wow, you’re such a buttslut. And now you’re stuck on my cock. Works better than any handcuffs[/say]")

		saynn("[say=pc]Oh yeah? I can keep going until you give up then.[/say]")

		saynn("[say=cp_guard]You lucky slut[/say]")

		saynn("You’re stuck together for about 30 minutes. In public. You do get many eyes from other inmates but for them it's almost a normal sight. Eventually the knot deflates enough to let you get up, your used butthole looks stretched and is leaking cum. Time to run before someone makes you clean the mess you made.")
		
		addButton("Walk away", "Yay", "allowFullAndendthescene")

func addWonButton():
	addButton("Walk away", "You got your pass, you can just go", "allowFullAndendthescene")
	addButtonWithChecks("Catch anal", "Use the guy’s dick for your pleasure", "catch_anal", [], [ButtonChecks.NotHandsBlocked])
	addButtonWithChecks("Sex!", "Time to fuck them!", "startsexasdom", [], [ButtonChecks.CanStartSex])
	addButton("Submit to", "Let them have it their way with you", "startsexsubby")
	addButton("Inventory", "Look at your inventory", "openinventory")
	if(GM.pc.getInventory().hasRemovableRestraints()):
		addButton("Struggle", "Struggle out of your restraints", "strugglemenu")

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
		GM.pc.cummedOnBy("cp_guard", FluidSource.Penis)
		GM.pc.addSkillExperience(Skill.SexSlave, 20, "cpguard_suckcock")

	if(_action == "mouth"):
		GM.pc.cummedInMouthBy("cp_guard")
		GM.pc.addSkillExperience(Skill.SexSlave, 20, "cpguard_suckcock")

	if(_action == "allowFullAndendthescene"):
		setModuleFlag("CellblockModule", "Cellblock_FreeToPassCheckpoint", true)
		endScene()
		return

	if(_action == "leaveandendthescene"):
		GM.pc.setLocation("hall_mainentrance")
		endScene()
		return

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "fight"):
		runScene("FightScene", ["cp_guard"], "cpguardfight")
	
	if(_action == "catch_anal"):
		processTime(30 * 60)
		
		GM.pc.gotAnusFuckedBy("cp_guard")
		GM.pc.cummedInAnusBy("cp_guard")
		GM.pc.orgasmFrom("cp_guard")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "cpguard_catchanal")
	
	if(_action == "startsexsubby"):
		getCharacter("cp_guard").prepareForSexAsDom()
		GlobalRegistry.getCharacter("cp_guard").addPain(-50)
		runScene("GenericSexScene", ["cp_guard", "pc"], "subbysex")
	
	if(_action == "startsexasdom"):
		runScene("GenericSexScene", ["pc", "cp_guard"], "domsex")
	
	if(_action == "openinventory"):
		runScene("InventoryScene")
		return
	
	if(_action == "strugglemenu"):
		runScene("StrugglingScene")
		return
	
	setState(_action)


func _react_scene_end(_tag, _result):
	if(_tag in ["subbysex", "domsex"]):
		setModuleFlag("CellblockModule", "Cellblock_FreeToPassCheckpoint", true)
		endScene()
	
	if(_tag == "cpguardfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("won_fight")
			addExperienceToPlayer(30)
		else:
			setState("lost_fight")
			addExperienceToPlayer(5)
			
			
			for item in GM.pc.getInventory().forceRestraintsWithTag(ItemTag.CanBeForcedByGuards, RNG.randi_range(1, 2)):
				addMessage(item.getForcedOnMessage())

func getDevCommentary():
	return "This checkpoint.. I dunno if its even needed x3. It's more a sandbox element. A boring one that gets in the way. That's why I made it so the scene doesn't even run unless you have something illegal (the guard would always stop you before).\n\nIs it possible to make it fun? I dunno.. Maybe the checkpoint guard should be more fleshed out into an actual character that you can dominate to make him let you pass every time. Dunno."

func hasDevCommentary():
	return true
