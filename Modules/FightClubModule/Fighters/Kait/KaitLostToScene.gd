extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "KaitLostToScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "kneel", {npc="kait"})

	if(state == ""):
		saynn("Defeated, you cry out a painful noise and drop to your knees. Kait quickly dashes towards you and shoves her knee into your chest, making you fly back another meter before hitting the ground. Ow. She then pounces at you and pins to the floor.")

		saynn("[say=kait]And don’t move a single muscle.[/say]")

		saynn("You hiss from the pain and huge discomfort.")

		saynn("[say=pc]I can’t exactly do that..[/say]")

		addButton("A proposal", "See what happens next", "a_proposal")

	if(state == "a_proposal"):
		saynn("She is straddling you, using the weight of her body to keep you pinned. One of her arms is holding yours while another is threatening to shove claws into your neck.")

		saynn("[say=kait]Who taught you to fight?[/say]")

		saynn("You keep your chin high, just to avoid her accidently making a few extra holes in you.")

		saynn("[say=pc]Everyone has to be taught how to fight?[/say]")

		saynn("She puts more pressure on your neck, her claws are digging into your skin, causing more pain.")

		saynn("[say=kait]Without being taught you wouldn’t be able to get this far.[/say]")

		saynn("[say=pc]Well, I wasn’t taught by anyone.[/say]")

		saynn("She frowns and holds a constant eye contact with you. She then finally pulls her claws away and gets up before shoving a leg into your chest to keep you pinned.")

		saynn("[say=kait]I’m Kait. I’m building a team.[/say]")

		saynn("[say=pc]And why should I care?[/say]")

		saynn("[say=kait]A team to escape from this rathole. I need people that can help me. Loyal people.[/say]")

		saynn("Hm. Escaping, huh. That could be your chance. The crowd starts to notice the lack of actions and boos.")

		saynn("[say=pc]A lilac that wants to escape? That’s something new. How about you start with removing your leg, I can hardly breathe.[/say]")

		saynn("Kait sighs audibly and removes the pressure from your chest. She then offers you a hand.")

		saynn("[say=pc]And what if I say no?[/say]")

		saynn("[say=kait]Then I will mark you, like I said.[/say]")

		addDisabledButton("Agree", "Begin the Team Escape route (not done, sorry)")
		if(OPTIONS.isContentEnabled(ContentType.Watersports)):
			addButton("Get pissed on", "You would rather suffer the consequences", "get_pissed_on")
		else:
			addDisabledButton("Get pissed on", "(Watersports content is disabled) You would rather suffer the consequences")
		addButton("Get marked", "Get Kait’s scent on you but not in a gross way", "get_marked")
		GM.ES.triggerRun("ArenaFighterPCLost", ["kait"])

	if(state == "get_pissed_on"):
		# (piss version)
		playAnimation(StageScene.SexFeetPlay, "head", {
			pc="kait", npc="pc", 
			bodyState={exposedCrotch=true},
			npcBodyState={},
		})

		saynn("You shake your head at the offered hand and try to get up yourself.")

		saynn("[say=pc]Nah, I can’t trust a lilac.[/say]")

		saynn("Just after saying that, you feel another knee being shoved into your chest. Ow. You fall onto your back again before you get a chance to stand up.")

		saynn("[say=kait]Where you do think you’re going.[/say]")

		saynn("While you are busy squirming from pain and panting heavily, the lilac cat swiftly pulls down her shorts, exposing her cute black panties. She then stands above your head and swiftly kneels, using her powerful knees to pin your arms to the floor. You look up and see the relief of her pussy covered by a layer of thin black cloth from her panties.")

		saynn("[say=kait]I’m not done with you yet.[/say]")

		saynn("You try and struggle but can’t free a single hand, each time you try and pull one out she increases the pressure with her knee, making your arm numb.")

		saynn("[say=pc]You gonna ruin your panties.[/say]")

		saynn("[say=kait]Not your problem.[/say]")

		saynn("The snow leopard shifts her panties to the side, exposing her cute pussy and starts panting softly, trying to force something. And after a few seconds, she lets out a cute moan as a strong stream of golden piss emerges from her slit. You close your eyes and mouth as it hits your face and top part of the body. The girl chuckles at your reaction and keeps pissing all over you, she was totally saving up for this moment, a yellow puddle is getting bigger under you. You try to hold your breath but eventually you have to grab some air. Oh, and the scent is so gross.")

		saynn("[say=kait]F-fuck~[/say]")

		saynn("Bright red blush appears on your face, the crowd is cheering at this act of extreme humiliation. As Kait's piss stream is ending, she puts her panties back and steps away from you, trying to avoid getting any pee on her.")

		saynn("[say=kait]Feels so fucking good to do this to others. Yeah, enjoy being a piss toilet, slut.[/say]")

		saynn("You open one eye and keep your mouth closed. Fuck, you got marked with her scent, you smell so gross. But.. it was also kinda.. arousing.. in a very strange way.")

		saynn("Kait pulls her shorts up and leaves you alone with the crowd.")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")

	if(state == "get_marked"):
		playAnimation(StageScene.SexFeetPlay, "head", {
			pc="kait", npc="pc", 
			bodyState={exposedCrotch=true},
			npcBodyState={},
		})
		
		saynn("You shake your head at the offered hand and try to get up yourself.")

		saynn("[say=pc]Nah, I can’t trust a lilac.[/say]")

		saynn("Just after saying that, you feel another knee being shoved into your chest. Ow. You fall onto your back again before you get a chance to stand up.")

		saynn("[say=kait]Where you do think you’re going.[/say]")

		saynn("While you are busy squirming from pain and panting heavily, the lilac cat swiftly pulls down her shorts, exposing her cute black panties. She then stands above your head and swiftly kneels, using her powerful knees to pin your arms to the floor. You look up and see the relief of her pussy covered by a layer of thin black cloth from her panties.")

		saynn("[say=kait]I’m not done with you yet.[/say]")

		saynn("You try and struggle but can’t free a single hand, each time you try and pull one out she increases the pressure with her knee, making your arm numb. Kait starts idly rubbing her slit through the panties.")

		saynn("[say=pc]Gonna grind my face?[/say]")

		saynn("[say=kait]You wish.[/say]")

		saynn("She shifts her panties to the side, exposing her cute pussy folds. She then starts rubbing her clit with circular motions of her finger. All the while being out of reach for you and your mouth. You can tell she is getting wet, her feline scent is so strong.")

		saynn("Kait teases her pussy some more before spreading the folds open and sliding two fingers inside. She explores herself a bit, probably trying to find her pleasure spot. And then she starts hammering at it, finger-fucking herself at a very fast pace. So fast that a few seconds later her pussy starts making wet noises and then suddenly squirts transparent smelly juices all over your face, followed by her legs shaking and her moaning.")

		saynn("[say=kait]F-fuck~[/say]")

		saynn("Bright red blush appears on your face, the crowd is cheering at this act of humiliation. As Kait's squirt stream is ending, she puts her panties back and steps away from you, trying to avoid getting any wetness on her.")

		saynn("[say=kait]Feels so fucking good to do this to others. Yeah, enjoy carrying my scent.[/say]")

		saynn("You open one eye and keep your mouth closed. Fuck, you got marked with her fluids, so humiliating. But.. it was also kinda.. arousing.. in a very strange way.")

		saynn("Kait pulls her shorts up and leaves you alone with the crowd.")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	
	if(_action == "get_pissed_on"):
		GM.pc.pissedOnBy("kait")
		GM.pc.addLust(20)
	
	if(_action == "get_marked"):
		GM.pc.cummedOnBy("kait")
		GM.pc.addLust(40)
		GM.pc.addSkillExperience(Skill.CumLover, 30, "kait_getmarked")

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

