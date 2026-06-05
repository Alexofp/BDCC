extends SceneBase

var npcID = "nova"

func _init():
	sceneID = "DomM2s2"

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

		saynn("[say=ferri]Hey![/say]")

		saynn("That's an interesting voice.. You look around and see a scene unfolding.")

		saynn("[say=pc]Psst. We can whine about life later.[/say]")

		addButton("Continue", "See what happens next", "ferri_intro_guard")
	if(state == "say_stick_together"):
		saynn("[say=pc]We gotta stick together, Kait. Avy is a pair of extra hands, try to endure her. Don't be so rude.[/say]")

		saynn("[say=kait]She started it, jeez.[/say]")

		saynn("Kait throws her head back, her round ears getting squished by the wall behind her.")

		saynn("[say=kait]Goddammit, nothing in this life is easy.[/say]")

		saynn("[say=ferri]Hey![/say]")

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

		saynn("The feline hybrid keeps advancing.")

		saynn("[say=ferri]I see so many weak spots in it though, it would be a shame if someone would exploit them~.[/say]")

		saynn("[say=npc]You're asking for a buzzer now.[/say]")

		saynn("The guard certainly looks more tense now, {npc.he} starts reaching for {npc.his} shock remote.")

		saynn("[say=ferri]Aw, c'mon. I'm just playing with you. Mew.[/say]")

		saynn("Ferri raises her clawed paws.. and takes another bold step forward before doing a seductive sway with her hips, her giant dragon tail lagging behind.")

		saynn("[say=ferri]Are you really gonna shock my neck~? Make me fall to my knees and cry out from excruciating pain~?[/say]")

		saynn("[say=npc]Yes.[/say]")

		saynn("[say=ferri]What then? Gonna put a leash and a muzzle on me? Cuff all my limbs together until I can't do anything as much as move a single muscle?[/say]")

		saynn("[say=npc]Sure.[/say]")

		saynn("[say=ferri]Or better yet, shove me into the stocks and let your buddies use me? Rounds after rounds, until I'm nothing but a drooling mess.[/say]")

		saynn("[say=npc]Why not.[/say]")

		saynn("[say=ferri]Mrowr. I guess I will be swift then![/say]")

		saynn("As soon as the guard's hand begins hovering over the remote, Ferri leaps at {npc.him}, trying to sink her huge fangs into the guard's neck!")

		addButton("Continue", "See what happens next", "ferri_gets_rekt")
	if(state == "ferri_gets_rekt"):
		playAnimation(StageScene.Duo, "defeat", {pc="ferri", npc=npcID})
		saynn("The guard doesn't even flinch.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ferri_gets_rekt"):
		processTime(5*60)

	setState(_action)
