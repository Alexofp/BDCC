extends SceneBase

func _init():
	sceneID = "DomM4s3SaveKait"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("medical_near_pccell")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("You approach the row of locked padded rooms.")

		saynn("[say=avy]Might be it.[/say]")

		saynn("You take your time and look into the small window slit of each one..")

		addButton("Continue", "See what happens next", "kait_reveal")
	if(state == "kait_reveal"):
		addCharacter("kait")
		aimCameraAndSetLocName("medical_paddedcell_player")
		playAnimation(StageScene.SexStart, "start", {pc="pc", npc="kait"})
		saynn("There she is! There is Kait.")

		saynn("The giant metal door is locked.. but you just press the nurse's badge against the access panel.")

		saynn("The door begins to unlock, enough to step inside. And so you do.")

		saynn("Inside.. a tiny room.. barely enough for a single person. All walls are padded with soft material. Kait is sitting in the center of it. She is wearing a straitjacket.. made out of latex.. Around her waist is a bulky chastity belt.")

		saynn("When she notices you, her eyes lazily look up at you.")

		saynn("[say=kait]..meow.. meow-w~..[/say]")

		saynn("Avy growls.")

		saynn("[say=avy]Fucking hell, what did that bitch do to you.[/say]")

		saynn("[say=kait]Meow-w-w~. You're pretty-y.[/say]")

		saynn("Her eyes are half-closed, pupils wide and unfocused. She blinks slowly, a cute little smile spreading across her muzzle.")

		saynn("[say=pc]She sedated her. We gotta get her out of here.[/say]")

		saynn("[say=avy]Well.. fucking grab the cat then. We can deal with that fucking nerd bitch some other time.[/say]")

		saynn("You reach down and begin lifting Kait up. She nuzzles you and purrs as you do that.")

		saynn("[say=kait]Warm~.[/say]")

		saynn("The moment you lift the snow leopard.. the heavy metal door closes shut! The loud clang echoes through the corridors.")

		saynn("You're trapped inside! Only Avy is left outside. You can see her through the slit.")

		saynn("[say=avy]What the..[/say]")

		saynn("[say=pc]The badge?[/say]")

		saynn("Avy tries.. but the panel flashes red.")

		saynn("[say=avy]It's not fucking working.[/say]")

		saynn("[say=kait]Meow meow.. stuck.. hehe..[/say]")

		saynn("This is not good.")

		saynn("[say=eliza]Not opening, huh~?[/say]")

		saynn("It's her voice..")

		addButton("Continue", "See what happens next", "avy_eliza_intro")
	if(state == "avy_eliza_intro"):
		addCharacter("eliza")
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance()})
		aimCameraAndSetLocName("medical_near_pccell")
		saynn("You can only watch through the small slit of the door.. but you see enough.")

		saynn("Eliza Quinn, in the flesh, standing near the entrance of the mental ward wing.")

		saynn("Avy stops trying to press the badge against the panel.. and faces her.")

		saynn("[say=avy]You. Absolute. Bitch.[/say]")

		saynn("[say=eliza]Gonna be honest, I was hoping to trap both of you. But that's okay, I can deal with one.[/say]")

		saynn("Avy raises her fists, her hind paws are placed at her shoulder width.")

		saynn("[say=avy]You think you're so smart, huh? Your stupid plan didn't work. Hope you like pain, you're about to experience all of it.[/say]")

		saynn("Eliza is holding some kind of syringe.")

		saynn("[say=eliza]Maybe I do like pain~.[/say]")

		saynn("They're about to fight. And all you can do is watch.")

		saynn("[say=kait]Avy is cute-e~..[/say]")

		addButton("Watch", "See what Avy will do next", "watch_start")
	if(state == "watch_start"):
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["punch", 0, 0, CombatAnimPlayer.ST_DODGING, ""]})
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["kick", 0, 0, CombatAnimPlayer.ST_KNOCKEDDOWN, ""]})
		saynn("The foxy does the first move. She lunges forward, going for a superman punch, her fist swinging towards Eliza's head. The feline manages to pull away in time, the punch grazing her shoulder instead of shattering her jaw.")

		saynn("[say=eliza]Nice try.[/say]")

		saynn("[say=avy]You better start begging, bitch.[/say]")

		saynn("Avy doesn't stop, she commits to a follow up, a heavy hook that Eliza avoids.. but then the last kick catches her.")

		saynn("Eliza gasps and collapses, her ribs certainly didn't like any of it.")

		saynn("[say=avy]Not so smug now, are you?[/say]")

		saynn("The feline coughs, clutching her side. But then she looks up at Avy and smiles.")

		saynn("[say=eliza]Gh.. You hit hard, I will give you that.[/say]")

		saynn("Seeing the smug expression, Avy charges again, trying to deliver another kick..")

		addButton("Continue", "See what happens next", "eliza_throws_something")
	if(state == "eliza_throws_something"):
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["throw", 1, CombatAnimPlayer.ST_KNOCKEDDOWN, 0, ""]})
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), statusUpdate=[0, 0]})
		saynn("But before Avy has a chance to attack Eliza, the doctor throws a vial at her feet. The vial shatters.. releasing a cloud of pink mist. Avy barrels through it, coughing.")

		saynn("[say=avy]Ugh.. again with this shit..[/say]")

		saynn("Avy's stops, her shorts are visibly bulging now.. more than usual. While the foxy is busy flailing the smoke away, the feline has a chance to get up.")

		saynn("[say=avy]You're only making it worse for yourself later, whore.[/say]")

		saynn("[say=eliza]I know exactly what I'm doing~.[/say]")

		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["shove",0,0,0, ""]})
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["WeaponSyringe",0,0,0, ""]})
		saynn("Avy lurches forward and manages to catch the feline before slamming her back against the wall, pinning to it. Eliza winces while Avy already starts trying to undress the doctor, to get rid of her skirt and labcoat.")

		saynn("That's when Eliza jabs a syringe into Avy's thigh.")

		saynn("[say=avy]Agh.. you bitch![/say]")

		saynn("Avy throws Eliza across the room.. but she manages to land it, her feline agility helping her stay on her hind paws.")

		saynn("Avy's hind paws though.. are under a bit more stress now. Whatever that drug was, it made Avy slower and weaker.")

		saynn("[say=eliza]You look tired, patient. I have just the room for you~.[/say]")

		saynn("[say=avy]SHUT UP![/say]")

		saynn("Avy charges again.. but this time Eliza is prepared. She sidesteps the slow attack and jabs another syringe into Avy's shoulder. Then another into her arm.. she certainly came prepared.")

		saynn("[say=avy]FUCK![/say]")

		saynn("[say=kait]..fuck~..[/say]")

		saynn("Avy growls hard, swatting Eliza away.. but the damage seems to be done.")

		addButton("Continue", "See what happens next", "avy_got_rekt")
	if(state == "avy_got_rekt"):
		playAnimation(StageScene.Duo, "defeat", {npc="eliza", pc="avy", bodyState={leashedBy="eliza"}})
		saynn("Unable to continue fighting, Avy hits the floor.")

		saynn("[say=avy]I hate YOU.[/say]")

		saynn("Eliza chuckles. She puts all her syringes away.. and then approaches the foxy.. before clicking a leash to her collar, finding little resistance.")

		saynn("[say=avy]Can't.. move..[/say]")

		saynn("[say=eliza]You earned yourself a good timeout in the soft room, patient~.[/say]")

		saynn("She looks at you through the window slit.")

		saynn("[say=eliza]A different room I guess. Come here~.[/say]")

		saynn("Eliza invites Avy to follow.. but the foxy refuses to get up.. or move.. anything.")

		saynn("[say=eliza]Really? Do you need a bigger incentive?[/say]")

		saynn("She produces another syringe with her free paw, holding it dangerously close to Avy's neck.")

		saynn("[say=avy]I'm not moving an inch.. fuck you..[/say]")

		saynn("[say=eliza]Ugh. Fine.[/say]")

		saynn("Eliza puts the syringe away and just starts pulling on the leash hard, literally dragging the poor foxy across the floor, choking her a bit in the process.")

		saynn("[say=eliza]You've beaten up all of my nurses.. ugh.. heavy girl.. so now I have to do everything myself, grr.[/say]")

		saynn("And so they get out of your.. extremely limited.. vision cone. Eliza is probably shoving Avy into the other padded room, about to close it.")

		saynn("[say=kait]Avy.. gonna take a nap~..[/say]")

		saynn("Eliza with her tricks.. she just about managed to come out as winner after everything.. she even managed to avoid having to fight you completely too.")

		saynn("What a bitch.")

		saynn("It seems.. there is not much you can do.")

		saynn("You're locked in a padded room. Avy is sharing your faith. And Kait is still acting silly in your hands. Ans.. isn't even aware of all of this.")

		addButton("Continue", "See what happens next", "sudden_ferri")
	if(state == "sudden_ferri"):
		addCharacter("ferri")
		playAnimation(StageScene.Solo, "stand", {pc="ferri"})
		saynn("[say=ferri]Psst![/say]")

		saynn("What?")

		saynn("You look through the cell of the door.. and see the tips of someone's horns and tassels of their ears.")

		saynn("It's Ferri! She is crouching near the door, whispering to you.")

		saynn("[say=ferri]..are you in there?..[/say]")

		saynn("[say=kait]Horny-y-y~.[/say]")

		saynn("You cover Kait's mouth.. she licks your fingers.")

		saynn("[say=pc]Tshh-.. yeah.. Eliza in the next one.. we need to get out somehow.[/say]")

		saynn("[say=ferri]..I brought something.. step away from the door.. as far as you can. And.. cover your ears.[/say]")

		saynn("Ferri then closes the door slit..")

		saynn("What's her plan? Hard to tell.. but you listen to her.")

		saynn("You move Kait into the corner of the padded room and cover her ears, bracing while also embracing.")

		addButton("Continue", "See what happens next", "boom_happens")
	if(state == "boom_happens"):
		aimCameraAndSetLocName("medical_paddedcell_player")
		playAnimation(StageScene.GivingBirth, "idle")
		saynn("Not even a minute passes before.. BOOM!")

		saynn("An explosion rocks the whole corridor.")

		saynn("The door.. shakes in its frame, metal groaning, hinges snapping. Dust and debris blast through the seams, filling the padded room with smoke.")

		saynn("Your ears ring.. a high, shape noise that drowns out anything else. Kait lets out a muffled squeak. You hold her tight, pressing both of you into the corner.")

		saynn("The padded walls absorb some of the shockwave.. but the whole room still shakes. A light above you dies almost instantly.")

		saynn("Then comes silence.. except for the ringing.")

		saynn("You cough and wave your hands to try to get the dust out of the way. Through the smoke, you see the door. It's still standing.. but barely.")

		addButton("Kick it!", "Kick the door", "kick_the_door")
	if(state == "kick_the_door"):
		playAnimation(StageScene.Solo, "kick")
		saynn("One good kick.. and the door crashes down, causing more dust to float up.")

		saynn("At least the air filtering outside seems to be still working..")

		saynn("You grab Kait and start bringing her out into the corridor.")

		addButton("Step out", "See what's happening outside", "ferri_gets_bullied")
	if(state == "ferri_gets_bullied"):
		aimCameraAndSetLocName("medical_near_pccell")
		GM.pc.setLocation("medical_near_pccell")
		playAnimation(StageScene.SexCowgirlChoke, "tease", {pc="ferri", npc="eliza"})
		saynn("You set Kait on the floor, away from the blown door. There are little shards of glass everywhere.. probably what used to be beakers.")

		saynn("[say=eliza]Do you realize what you DID, you silly thing?! Do you know what I'm gonna do to YOU for this?![/say]")

		saynn("Eliza Quinn.. is straddling Ferri.. and choking her. Both of them are dirty from the dust.")

		saynn("[say=ferri]S-sorry-y-y-.. hkhh..[/say]")

		saynn("[say=eliza]No-no-no, you can't 'sorry' yourself out of this. YOU are gonna experience a world of PAIN. I'm gonna fucking TORTURE YOU.[/say]")

		saynn("What a crazy bitch. Might as well interfere now.")

		saynn("[say=pc]Day is not going well, doctor? Where are your manners?[/say]")

		saynn("The feline stops choking the poor dracat.. and slowly rises up.")

		addButton("Continue", "See what happens next", "about_to_fight_eliza")
	if(state == "about_to_fight_eliza"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("Eliza faces you, offering a very mean expression.")

		saynn("[say=eliza]My day, huh.. My day was going perfectly fine. Until you came in and destroyed my medical wing.[/say]")

		saynn("[say=pc]You didn't have to do this to Kait.[/say]")

		saynn("The doctor rolls her eyes.")

		saynn("[say=eliza]She deserved it.[/say]")

		saynn("[say=pc]Sure. And so do you.[/say]")

		saynn("Eliza tilts her head slightly, her tail wagging behind her in short bursts.")

		saynn("[say=eliza]Huh.. So this is it then. You versus me.[/say]")

		saynn("[say=pc]It seems so.[/say]")

		saynn("She reaches into her pockets and pouches, producing some syringes and vials. Her eyes light up.")

		saynn("[say=eliza]Fine. Let's do it then~.[/say]")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "eliza_fight_lost"):
		playAnimation(StageScene.GivingBirth, "idle")
		aimCameraAndSetLocName("medical_paddedcell_player")
		saynn("You've lost the fight!")

		saynn("Elize injects you with one of the drugs that she has.. and now nothing matters anymore. You feel nice and calm.")

		saynn("You join Kait, Avy and Ferri in the non-destroyed padded room..")

		saynn("And now you can just enjoy your time together.")

		saynn("You failed to recruit Eliza Quinn. Looks like you will have to try it again some other time.")

		saynn("Mission failed!")

		addButton("Continue", "Stop the mission", "stopthemission")
		addButton("Restart", "Try the mission again", "trymissionagain")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "kait_reveal"):
		getCharacter("kait").getInventory().clearSlot(InventorySlot.Body)
		putOn("kait", "LatexStraitjacket")

	if(_action == "watch_start"):
		processTime(3*60)

	if(_action == "boom_happens"):
		processTime(2*60)

	if(_action == "start_fight"):
		runScene("FightScene", ["eliza"], "elizaFight")
		return

	if(_action == "stopthemission"):
		processTime(60*60*3)
		endScene()
		GM.pc.setLocation(GM.pc.getCellLocation())
		GM.main.MS.failCurrentMission()

	if(_action == "trymissionagain"):
		endScene()
		GM.main.MS.restartCurrentMission()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "elizaFight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("eliza_fight_won")
			addExperienceToPlayer(50)
		else:
			setState("eliza_fight_lost")
			addExperienceToPlayer(5)
