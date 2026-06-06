extends SceneBase

var npcID = ""

func _init():
	sceneID = "DomM2s2"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		addCharacter("kait")
		saynn("You find Kait already in the cellblock.")

		saynn("[say=kait]Hey.[/say]")

		saynn("[say=pc]Hey.[/say]")

		saynn("Kait looks around.")

		saynn("[say=kait]Where is that stupid fox, is she being late.[/say]")

		saynn("You shrug. Indeed, the dark foxy seems to be missing.")

		saynn("[say=pc]Any signs of Ferri?[/say]")

		saynn("[say=kait]Nope.[/say]")

		saynn("Welp. There is not much to do then.")

		saynn("Both of you find a wall to lean against and just wait.")

		saynn("[say=kait]Inviting Avy in might have been a mistake.[/say]")

		saynn("[say=pc]She helped with the lists.[/say]")

		saynn("[say=kait]We would have figured it out eventually.[/say]")

		saynn("[say=pc]Eventually. She did it in less than a minute.[/say]")

		saynn("[say=kait]And now we don't need her.[/say]")

		addButton("Perhaps", "Maybe Kait is right", "say_maybe_right")
		addButton("Stick together", "We gotta stick together if we wanna pull this off", "say_stick_together")
	if(state == "say_maybe_right"):
		saynn("[say=pc]Perhaps you're right. Ans wouldn't be happy about it though.[/say]")

		saynn("[say=kait]True.[/say]")

		saynn("Kait throws her head back, her round ears getting squished by the wall behind her.")

		saynn("[say=kait]Goddammit, nothing in this life is easy.[/say]")

		saynn("[say=ferri]You![/say]")

		saynn("That's an interesting voice.. You look around and see a scene unfolding.")

		saynn("[say=pc]Psst. We can whine about life later.[/say]")

		addButton("Continue", "See what happens next", "ferri_intro_guard")
	if(state == "say_stick_together"):
		saynn("[say=pc]We gotta stick together, Kait. Avy is a pair of extra hands, try to endure her. Don't be so rude.[/say]")

		saynn("[say=kait]She started it, jeez.[/say]")

		saynn("Kait throws her head back, her round ears getting squished by the wall behind her.")

		saynn("[say=kait]Goddammit, nothing in this life is easy.[/say]")

		saynn("[say=ferri]You![/say]")

		saynn("That's an interesting voice.. You look around and see a scene unfolding.")

		saynn("[say=pc]Psst. We can whine about life later.[/say]")

		addButton("Continue", "See what happens next", "ferri_intro_guard")
	if(state == "ferri_intro_guard"):
		addCharacter("ferri")
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {pc="ferri", npc=npcID})
		saynn("You see what you can only describe as a dragon-cat.. so the description checks out. Near her is a guard who turns to face the inmate, spotting a stun baton in {npc.his} hand already.")

		saynn("[say=npc]What do you want?[/say]")

		saynn("Ferri licks her fangs. She is a few meters away so she closes some of the distance.")

		saynn("[say=ferri]You have nice armor, officer![/say]")

		saynn("[say=npc]That's it? Sure. Piss off before I smack you.[/say]")

		saynn("The feline hybrid keeps advancing with a cheeky smile on her face.")

		saynn("[say=ferri]I see so many weak spots in it though, it would be a shame if someone would exploit them~.[/say]")

		saynn("[say=npc]Asking for a buzzer now.[/say]")

		saynn("The guard certainly looks more tense now, {npc.he} starts reaching for {npc.his} shock remote.")

		saynn("[say=ferri]Aw, c'mon. I'm just playing with you. Mew.[/say]")

		saynn("Ferri raises her clawed paws.. and takes another bold step forward before doing a seductive sway with her hips, her giant dragon tail lagging behind.")

		saynn("[say=ferri]Are you really gonna shock my neck~? Make me fall to my knees and cry out from excruciating pain~?[/say]")

		saynn("[say=npc]Yes.[/say]")

		saynn("[say=ferri]What then? Gonna put a leash and a muzzle on me? Cuff all my limbs together until I can't do anything as much as move a single muscle?[/say]")

		saynn("[say=npc]Sure.[/say]")

		saynn("[say=ferri]Or better yet, shove me into the stocks and let your buddies use me? Rounds after rounds, until I'm nothing but a drooling mess.[/say]")

		saynn("[say=npc]Why not.[/say]")

		saynn("Ferri takes a short pause.. but then smiles again.")

		saynn("[say=ferri]Mrowr. I guess I will be swift then![/say]")

		saynn("As soon as the guard's hand begins hovering over the remote, Ferri leaps at {npc.him}, trying to sink her huge fangs into the guard's neck!")

		addButton("Continue", "See what happens next", "ferri_bites_guard")
	if(state == "ferri_bites_guard"):
		playAnimation(StageScene.Duo, "bite", {pc="ferri", npc=npcID, npcAction="hurt"})
		saynn("The shock remote flies out of the guard's hand as Ferri leaps at {npc.him} and tries to sink her sharp fangs into any exposed skin.")

		saynn("The guard manages to hold her back for now, {npc.his} armored forearms saving {npc.him}.")

		saynn("[say=ferri]C'mon, you're so biteable![/say]")

		saynn("[say=npc]You're making it worse for yourself, inmate.[/say]")

		saynn("[say=ferri]Good![/say]")

		saynn("Ferri thrashes in the guard's grip, her fangs snapping at empty air, her claws scratching against the armor, sending off sparks.")

		saynn("Suddenly, the guard manages to get a grip on Ferri's horns.")

		saynn("[say=ferri]H-hey-![/say]")

		saynn("A shiver runs down Ferri's spine, her eyes go wide. She tries to break free but the guard just pulls her back, one of {npc.his} hands now reaching for the weapon.")

		saynn("[say=ferri]Easy with the horns..[/say]")

		addButton("Continue", "See what happens next", "ferri_gets_rekt")
	if(state == "ferri_gets_rekt"):
		playAnimation(StageScene.Duo, "defeat", {pc="ferri", npc=npcID, npcAction="stunbaton"})
		saynn("Now that the guard has a good grip on Ferri, {npc.he} just smacks her with a stun baton once..")

		saynn("[say=ferri]Aagh![/say]")

		saynn("Ferri's legs give out instantly, dropping the dragon cat to her knees, her tail slamming against the floor. Her whole body shakes, teeth clenched.")

		saynn("Ferri tries to say something cheeky. Only a strangled whimper comes out.")

		saynn("You nudge Kait's side and whisper to her.")

		saynn("[say=pc]And that's our chemist?[/say]")

		saynn("[say=kait]Yep.[/say]")

		saynn("The guard reaches into {npc.his} pouches and pulls out a muzzle. Ferri tries to pull away but her body is still busy twitching from the shock, allowing the guard to put the muzzle over her snout and get the leather straps nice and tight.")

		saynn("[say=ferri]M-Mew..[/say]")

		saynn("Then the guard yanks her arms behind her back. Cuffs click around her wrists, locking them together.")

		saynn("[say=ferri]Eep..[/say]")

		saynn("The final touch.. a leash gets clipped to her collar.")

		saynn("[say=npc]There. I know you wanted stocks but you will have to settle for a week of solitary.[/say]")

		saynn("[say=ferri]Wait! That's so mean![/say]")

		saynn("[say=npc]Want two weeks?[/say]")

		saynn("[say=ferri]Nyo.. mow-w..[/say]")

		saynn("Looks like she crossed the wrong guard. {npc.He} {npc.verb('pull')} on the leash, inviting the hybrid to get up.")

		saynn("Kait nudges you this time.")

		saynn("[say=kait]We gotta do something. If we don't act now, we won't see her for a while.[/say]")

		saynn("It seems so.")

		saynn("[say=kait]And the stupid Avy isn't here still. GRRrr.. Whatever, I'm going for it.[/say]")

		saynn("[say=pc]It's two versus one still, we can do it.[/say]")

		addButton("Continue", "See what happens next", "kait_shoves_guard")
	if(state == "kait_shoves_guard"):
		playAnimation(StageScene.Duo, "kick", {pc="kait", npc=npcID, npcAction="hurt"})
		saynn("Kait quickly walks up to the guard and introduces herself with a kick!")

		saynn("[say=npc]Ugh.. What the..[/say]")

		saynn("The guard stumbles and loses the leash in the process.")

		saynn("[say=kait]You better just fuck off, guard. There is more where that came from.[/say]")

		saynn("[say=npc]Really? I guess you're joining her then.[/say]")

		saynn("{npc.He} {npc.verb('try', 'tries')} to feel {npc.his} shock remote but it's still on the floor somewhere. The stun baton is still there though.")

		saynn("Ferri notices the opportunity.. and takes off running!")

		saynn("[say=kait]Fuck, where the fuck are you going. Stop![/say]")

		saynn("It's all going.. not the best. Kait quickly turns her head to you.")

		saynn("[say=kait]I go after Ferri, you handle the guard![/say]")

		saynn("And just like that, Kait takes off too, doing a swift half-circle around the angry guard and dashing after the dragon cat.")

		saynn("[say=kait]Come here, you brat![/say]")

		saynn("Looks like you will have to fight..")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "guard_fight_lost"):
		playAnimation(StageScene.Solo, "kneel")
		GM.pc.setLocation(GM.pc.getCellLocation())
		aimCameraAndSetLocName("solitary_cell")
		setCharacters([npcID])
		saynn("You've lost the fight. Looks like you will be the one to spend time in solitary..")

		saynn("Ferri is long gone. Looks like you will have to try to catch her some other time.")

		saynn("Mission failed!")

		addButton("Continue", "Stop the mission", "stopthemission")
		addButton("Restart", "Try the mission again", "trymissionagain")
	if(state == "guard_fight_won"):
		setCharacters([npcID])
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcAction="defeat"})
		saynn("The guard hits the floor, unable to continue fighting.")

		saynn("[say=npc]Ugh..[/say]")

		saynn("[say=pc]Sorry, no time to chat, gotta run.[/say]")

		saynn("You see {npc.him} reaching towards the shock remote that's on the floor. You swiftly approach the item and stomp on it a few times, crushing into bits and sparks.")

		saynn("[say=pc]Nope.[/say]")

		saynn("[say=npc]Fuck you.[/say]")

		saynn("You nod and run into the same direction that Kait did before.")

		addButton("Continue", "See what happens next", "run_after_kait")
	if(state == "run_after_kait"):
		setCharacters([])
		aimCameraAndSetLocName("main_bench2")
		saynn("You dash out of the high-sec cellblock and climb the stairs that lead into the main hall.")

		saynn("No signs of Ferri or Kait anywhere around you. You climb the main platform too to make sure.")

		saynn("[say=pc]Shit, where are they.[/say]")

		saynn("You hear a very familiar noise coming from the bench nearby.")

		saynn("[say=rahi]How is the.. thing going?[/say]")

		addButton("Rahi!", "Ask the cat", "ask_the_cat")
	if(state == "ask_the_cat"):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("You turn your head and see Rahi sitting on the bench, legs tucked, tail resting in her lap, getting stroked by her paws.")

		saynn("[say=pc]Rahi! Did you see someone run past you just now?[/say]")

		saynn("[say=rahi]Oh.. yeah.. They were heading towards the bathroom..[/say]")

		saynn("You give the kitty a quick pat on the head.")

		saynn("[say=pc]Thank you. Gotta run.[/say]")

		saynn("[say=rahi]Meow..[/say]")

		saynn("After that, you switch to running again.")

		addButton("Bathroom", "Go check it out!", "go_bathroom")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ferri_intro_guard"):
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Guards, [], GuardGenerator.new(), {})

	if(_action == "ferri_bites_guard"):
		processTime(5*60)

	if(_action == "ferri_gets_rekt"):
		processTime(5*60)
		putOn("ferri", "basketmuzzle")
		putOn("ferri", "inmatewristcuffs")

	if(_action == "start_fight"):
		runScene("FightScene", [npcID], "guardFight")
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

	if(_action == "run_after_kait"):
		processTime(3*60)

	if(_action == "go_bathroom"):
		processTime(2*60)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "guardFight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("guard_fight_won")
			addExperienceToPlayer(50)
		else:
			setState("guard_fight_lost")
			addExperienceToPlayer(5)

func saveData():
	var data = .saveData()

	data["npcID"] = npcID

	return data

func loadData(data):
	.loadData(data)

	npcID = SAVE.loadVar(data, "npcID", "")
