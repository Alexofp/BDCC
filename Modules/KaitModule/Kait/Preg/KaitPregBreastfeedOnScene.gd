extends SceneBase

func _init():
	sceneID = "KaitPregBreastfeedOnScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Grope, "tease", {pc="kait", npc="pc"})
		saynn("Kait is hugging her own belly. You notice two dark, wet spots on the fabric.. right where her chest is.")

		saynn("She notices your stare.")

		saynn("[say=kait]They're full and itchy~.[/say]")

		saynn("She bites her lower lip.")

		saynn("[say=kait]Maybe you could help a pregnant mother~?[/say]")

		saynn("Of course you can.")

		addButton("Continue", "See what happens next", "on_the_floor")
	if(state == "on_the_floor"):
		playAnimation(StageScene.BreastFeeding, "teasealt", {pc="kait", npc="pc"})
		saynn("Next moment, you're sitting on the floor, watching Kait carefully kneeling into your lap, her knees landing on both sides of your hips.")

		saynn("[say=kait]Here we go..[/say]")

		saynn("She looks at you, smiling, holding her posture as straight as her pregnant belly allows.")

		saynn("Your hands reach towards the buttons of her uniform shirt. They're a little tight.. for obvious reasons.. but you're managing, popping them open one by one. Kait's gaze flicks between your eyes and your hands as you do that, the tip of her feline tongue sliding across her lip.")

		addButton("Continue", "See what what happens next", "shirt_opened")
	if(state == "shirt_opened"):
		saynn("You open the shirt, revealing Kait's beautiful breasts, swollen and heavy with milk. The nips are dark and perky, areolas enlarged. You can see tiny, shiny drops of milk pooling a bit already.")

		saynn("Kait lets out a content sigh, now that her belly and chest aren't constrained by the fabric anymore.")

		saynn("[say=kait]Like 'em?..[/say]")

		saynn("She leans forward a little, offering herself to you, her paws resting on her sides.")

		saynn("Gently, you cup her breasts, getting a feel for them. They're heavy and jiggly, the sight making her mouth water up.")

		saynn("[say=pc]Yes.[/say]")

		addButton("Lean in", "Start sucking!", "do_start_sucking")
	if(state == "do_start_sucking"):
		playAnimation(StageScene.BreastFeeding, "feedalt", {pc="kait", npc="pc"})
		saynn("And so you lean in, your mouth finding her right nipple. The first touch makes her do a quick inhale.")

		saynn("[say=kait]Hah..[/say]")

		saynn("You trap the perky nipple between your lips.. and begin to suckle gently. It doesn't take long before you feel that taste.. warm and sweet.. flooding your mouth. Kait's whole body tenses, she bites her lip again.")

		saynn("[say=kait]Yeah.. that's.. that's the spot..[/say]")

		saynn("Her voice is a breathy whisper, her eyes half-shut, watching you. You can feel that hard little nub of her nipple against your tongue. You roll it gently between your teeth, applying a bit of pressure.. A low moan escapes Kait's chest.. turning into a purr.")

		saynn("[say=kait]Mmmh.. fuck. Just like that..[/say]")

		saynn("You put a little more effort in, suckling harder.. catching more of that nice taste on your tongue. You bring your hands up and knead that breast, pressing on it from the sides. And that causes her nipple to suddenly squirt a bunch of that good stuff into your mouth, a cute noise escaping her in the process.")

		saynn("[say=kait]Ah~..[/say]")

		saynn("You keep doing that, squeezing and massaging that breast, increasing the flow.. just so you can lap it all up. One of Kait's paws lands on your hand and gently strokes your hair.")

		saynn("[say=kait]You're good at this..[/say]")

		saynn("You give that breast a little kiss.. and then switch to her other one. Kait inhales deeply as you latch onto the other nipple. A little gentle bite makes her cry out a high sound.")

		saynn("[say=kait]Oh! Sensitive..[/say]")

		saynn("You start kneading that one too, causing it to squirt that sweet milk directly onto your tongue. You drink it up and continue suckling on her, slowly losing track of time.")

		saynn("Kait is shivering slightly in your lap, little moans keep escaping her. She has both her paws on the back of your head, gently scritching.")

		saynn("[say=kait]Mmhh.. ah.. feels so good.. drink it all up.. such a good.. good..[/say]")

		saynn("She can't even finish her sentence while you keep feeding on her. You feel the pressure in her breasts decreasing gradually. They're becoming softer now too to the touch. When the flow slows up enough, you switch again and suckle on the other nipple a bit more.")

		saynn("Your belly is full!")

		addButton("Continue", "See what happens next", "do_actually_suckle")
	if(state == "do_actually_suckle"):
		playAnimation(StageScene.BreastFeeding, "teasealt", {pc="kait", npc="pc"})
		saynn("When the flow fades again, you stop. You give each nipple one last, gentle kiss.. before pulling away.")

		saynn("Kait lets out a long, deep, satisfied sound. Her body slumps slightly. She looks down at her breasts, her nips shining with your saliva. She gives her chest a gentle squeeze herself.")

		saynn("[say=kait]Myah~.. I feel so much better now.[/say]")

		saynn("She looks up at you, her eyes soft. She leaves a little smooch on your forehead.")

		saynn("[say=kait]Thank you~.[/say]")

		saynn("You help her to get up and button up her shirt again. She is purring loudly while you do that.")

		saynn("[say=pc]You're welcome.[/say]")

		addButton("Continue", "See what happens next", "endthescene_fixclothes")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "shirt_opened"):
		openShirt("kait")

	if(_action == "do_start_sucking"):
		processTime(15*60)

	if(_action == "do_actually_suckle"):
		GM.pc.breastFedBy("kait")
		GM.pc.addPain(-100)
		GM.pc.addStamina(100)
		GM.pc.addSkillExperience(Skill.Milking, 20)

	if(_action == "endthescene_fixclothes"):
		fixUniform("kait")
		endScene()
		return

	setState(_action)
