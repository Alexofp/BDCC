extends SceneBase

func _init():
	sceneID = "Ch6TaviCorruption0Scene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("You don't find Tavi when you enter her cell. Strangely unusual for her.")

		saynn("[say=pc]Tavi?[/say]")

		saynn("No reaction. Time to go look for her. Hopefully she didn't get herself mindbroken again.")

		addButton("Step out", "Look for Tavi in other blocks", "step_out")
	if(state == "step_out"):
		aimCameraAndSetLocName("main_stairs_n")
		GM.pc.setLocation("main_stairs_n")
		addCharacter("kait")
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {pc="tavi", npc="kait"})
		saynn("You don't find her in the cell blocks so you head up to the main hall. While you do that, you begin to hear.. cheering.. of a crowd.. near the stocks.")

		saynn("As you approach that crowd, you realize that they formed a make-shift arena for Tavi and Kait. There are a few guards, still kitted with the riot gear, watching from afar.. but they don't do anything about this.")

		saynn("[say=tavi]So this is what it's about? I think you lied to me, Kait.[/say]")

		saynn("Kait begins to slowly circle Tavi, her claws out on display. Tavi does the same, turning this into a strange dance.")

		saynn("[say=kait]You really thought I would invite you into my gang? After everything? You're more stupid than I thought, Tavi.[/say]")

		saynn("It seems like they're about to fight.")

		addButton("Intervene", "Tavi is gonna lose unless you help her", "try_intervene")
	if(state == "try_intervene"):
		playAnimation(StageScene.Duo, "dodge", {pc="tavi", npc="kait", npcAction="punch"})
		addCharacter("risha")
		saynn("You try to get through the wall of inmates around the ring but they push you back. Huh. The more you look at them, the more you realize that they are all from the same gang.. Kait's new gang.. Even if Tavi wins, they probably won't let her just walk away..")

		saynn("Kait lashes out at Tavi, swiping her claws through the air as the tall kitty dodges out of the way at the last second.")

		saynn("[say=tavi]You had all the chances in the world to prove that your strategy would work, Kait. And now you're just seeking revenge?[/say]")

		saynn("Kait attacks again, causing Tavi to get out of the way for the second time. But then one of the gang members grabs her, causing Kait to get a cheap scratch on Tavi's cheek, drawing a few drops of her green blood. Tavi grunts.")

		saynn("[say=kait]You used me! I'm not good enough of a slave, right? You will be my slave by the time I'm done with you![/say]")

		saynn("Tavi breaks free and keeps stepping back while Kait keeps advancing. More guards show up.. and don't do anything at all. Huh. One of them is Risha. She has a little smirk on her face, seeing another brawl between inmates.")

		saynn("[say=tavi]I taught you everything I know, Kait. Just let go and follow your own path. Stop trying to be with me.. Stop trying to be me.[/say]")

		saynn("Kait swipes the air again but Tavi manages to avoid that attack too. The tall kitty is already panting though..")

		saynn("[say=tavi]You still.. fight like a girl.[/say]")

		addButton("Continue", "See what happens next", "tavi_gets_kicked")
	if(state == "tavi_gets_kicked"):
		playAnimation(StageScene.Duo, "block", {pc="tavi", npc="kait", npcAction="kick"})
		saynn("Kait hears her taunting and growls before throwing a strong kick that causes Tavi to grunt, her forearms taking most of the impact.")

		saynn("[say=tavi]Ugh..[/say]")

		saynn("[say=kait]Oh yeah? I'm stronger than you, I always was![/say]")

		saynn("Kait kicks Tavi again, making her stumble back, almost collapsing already. You can't watch that happen, you try to get through the crowd but the wall of inmates just shoves you back. Tavi notices you and just offers you a subtle shake of her head.. and a little smirk?")

		saynn("[say=tavi]Brute force can only get you so far.[/say]")

		saynn("While Kait is absolutely destroying Tavi who is not putting up almost any fight, Risha's expression slowly changes. Her smile is gone, replaced with.. concerns? You never really saw her like this.")

		addButton("Continue", "See what happens next", "tavi_collapses")
	if(state == "tavi_collapses"):
		playAnimation(StageScene.Duo, "defeat", {pc="tavi", npc="kait", npcAction="kick"})
		saynn("After a few more well-placed attacks, Tavi is unable to fight anymore. The angry crowd pins her while Kait extends claws on both of her paws and begins approaching bruised Tavi.")

		saynn("[say=kait]I'm sick of you. Pathetic display.[/say]")

		saynn("[say=tavi]Gh-h.. Gonna kill me? In front of your whole gang?[/say]")

		saynn("Kait is smiling.")

		saynn("[say=kait]I will start with the clothes. You've never been in the stocks, were you?[/say]")

		saynn("Tavi is quietly awaiting her fate. Kait raises her paw, about to tear through the cloth..")

		addButton("Continue", "See what happens next", "risha_saves_tavi")
	if(state == "risha_saves_tavi"):
		playAnimation(StageScene.Duo, "stunbaton", {pc="risha", npc="kait", npcAction="defeat"})
		saynn("Suddenly Risha rams through the crowd, using her collapsible shield to push inmates out of the way. Kait takes the hit on her side, causing her light frame to be thrown back a few meters.")

		saynn("[say=risha]Everyone, fuck off! Or I will make you eat dirt from under my boots![/say]")

		saynn("She slams her shield into the floor, causing almost a shockwave-like powerful effect that sends fear into the inmates that weren't affected by her explosive entrance.")

		saynn("Risha's other paw is holding a fully charged stun baton that sends sparks as she hits it against her shield, causing more powerful impacts. Tavi is on the floor, trying to protect herself.. but Risha is here to protect her it seems.")

		saynn("[say=kait]No! Fuck you![/say]")

		saynn("Kait quickly recovers and tries to pounce on Risha but that was a huge mistake. The poor lilac receives a healthy dose of shock through her body before she gets shoved away.")

		saynn("[say=risha]Anyone else? Bring it on, you stupid sluts. I got plenty to share.[/say]")

		saynn("Kait, defeated, gets pulled away by some of her gang members. While the rest.. slowly stepping away, creating more and more holes in the improvised arena.")

		saynn("[say=kait]This isn't over! Ugh..[/say]")

		saynn("[say=risha]Yeah-yeah-yeah, bark louder, breeding bitch.[/say]")

		addButton("Continue", "See what happens next", "risha_talks_to_tavi")
	if(state == "risha_talks_to_tavi"):
		removeCharacter("kait")
		playAnimation(StageScene.SexStart, "start", {pc="risha", npc="tavi"})
		saynn("As the crowd disperses, Risha puts away her shield and her weapon before turning towards Tavi. You watch her offering Tavi a helping hand.")

		saynn("[say=tavi]Why the sudden change of mind..[/say]")

		saynn("[say=risha]How could I leave my sister in danger.[/say]")

		saynn("Huh, sister.. Tavi giggles softly.")

		saynn("[say=tavi]You weren't against the idea of breeding me not that long ago~.[/say]")

		saynn("[say=risha]C'mon, I didn't know! Well, the offer still..[/say]")

		saynn("Tavi tilts her head and sighs, rolling her eyes.")

		saynn("[say=risha]Fine-e~.[/say]")

		saynn("Tavi grabs Risha's hand and stands up with her help. You stand near.")

		addButton("Continue", "See what happens next", "more_talking_with_risha")
	if(state == "more_talking_with_risha"):
		playAnimation(StageScene.Duo, "stand", {pc="tavi", npc="risha"})
		saynn("[say=risha]You two really caused some stir. The captain was pretty mad.[/say]")

		saynn("Tavi smiles.")

		saynn("[say=tavi]We only want to get out of here. Fuck the captain.[/say]")

		saynn("Risha shrugs.")

		saynn("[say=risha]I won't stop you, sis. But I'd rather not become the enemy of the whole AlphaCorp, you know? There is so much free sex here, it's almost heaven.[/say]")

		saynn("[say=tavi]Sis, huh~?[/say]")

		saynn("[say=risha]What? I'm not allowed to call you that?[/say]")

		saynn("Tavi shrugs and smiles.")

		saynn("[say=risha]I will go find that cocky cat. She needs some more kittens I bet. See you around.[/say]")

		saynn("Tavi pats Risha on the back before she leaves you two alone.")

		addButton("Tavi", "Talk with Tavi about what happened", "talk_tavi")
	if(state == "talk_tavi"):
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("[say=pc]You're alright, Tavi?[/say]")

		saynn("She swipes dirt and dust off her uniform. Her cheek is still bleeding a bit.")

		saynn("[say=tavi]I'm alright. I think it went pretty well, all things considered.[/say]")

		saynn("[say=pc]Do you wanna go after Kait? She might need to be punished for this.[/say]")

		saynn("Tavi smiles.")

		saynn("[say=tavi]It's fine, Kait found her path I think. She and her new gang will be alright.[/say]")

		saynn("[say=pc]If you say so. What's.. now?[/say]")

		saynn("Tavi shrugs.")

		saynn("[say=tavi]Your call~. If you wanna talk, I will be in my cell. There are too many ears here.[/say]")

		saynn("Tavi heads towards her cell.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "step_out"):
		processTime(5*60)

	if(_action == "try_intervene"):
		processTime(2*60)

	if(_action == "tavi_gets_kicked"):
		processTime(3*60)

	if(_action == "tavi_collapses"):
		processTime(2*60)

	if(_action == "risha_talks_to_tavi"):
		processTime(2*60)

	setState(_action)
