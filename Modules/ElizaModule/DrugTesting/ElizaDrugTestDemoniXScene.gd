extends SceneBase

func _init():
	sceneID = "ElizaDrugTestDemoniXScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("[say=pc]Wanna try that pill yourself maybe?[/say]")

		saynn("Eliza raises a brow.")

		saynn("[say=eliza]I'm not a test subject, you know.[/say]")

		saynn("She isn't it.. so you will have to say something smart to trick her.")

		saynn("[say=pc]So you're saying.. that you're not brave enough. Or is the real reason.. that you don't actually like experimenting.. Maybe you don't like science that much?[/say]")

		saynn("Oof. That was a huge blow, Quinn's ears flick back momentarily.. but her smirk never wavers. She twirls the pill between her fingers, her sharp eyes fixed on you.")

		saynn("[say=eliza]You think you can goad me into this, patient? I don't need to be tricked.. I've been itching for a proper experiment. Just don't say I didn't warn you~.[/say]")

		saynn("Without hesitation, she pops the pill into her mouth, swallowing it dry. For a moment, nothing happens.. she raises a brow at you.")

		saynn("[say=eliza]Tastes like bad life decisions.. My favourite~.[/say]")

		saynn("[say=pc]Nothing?[/say]")

		saynn("[say=eliza]Give it a second. Transformations are slow.. make take days even. See me tomorrow.[/say]")

		saynn("Suddenly, a ripple courses through her body. Her tail stiffens, her claws dig into the nearest table.")

		saynn("[say=eliza]Oh.. oh, this is quite something.[/say]")

		addButton("Continue", "See what happens next", "eliza_switch")
	if(state == "eliza_switch"):
		playAnimation(StageScene.Duo, "stand", {npc="elizaDemon"})
		saynn("Her voice quivers briefly before dropping into a deeper, richer tone.. accompanied by a strange, resonating echo. Small horns pierce through the fur on her head, curving upward with an intimidating kind of grace.")

		saynn("You're not sure how to react.. she is clearly suffering from a huge discomfort.. but that's to be expected.")

		saynn("[say=pc]Quinn?[/say]")

		saynn("She huffs as her hind paws suddenly begin to change shape, toes losing their definition.. until they merge into two bulky hooves. A sinuous, spaded tail unfurls behind her, flicking with dangerous energy.")

		saynn("So fast.. she said that it would take days.. and yet.. here she is.")

		saynn("After all that is over, Eliza is left panting. She straightens up slowly, her top and pencil skirt stretching taut over her now more muscular and curvy frame. Her fur seems to shimmer with a faint glow, her green eyes burning brighter than before.")

		saynn("[say=eliza]Well, well..[/say]")

		saynn("Her voice is intoxicating now, the echo sending a shiver down your spine. She flexes her fingers, her claws now looking much sharper and longer. She catches her reflection in one of the polished surfaces and lets out a throaty chuckle.")

		saynn("[say=eliza]Not bad.. Not bad at all. I feel so powerful..[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "eliza_switch"):
		processTime(3*60)

	setState(_action)
