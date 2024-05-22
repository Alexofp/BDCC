extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaEventSelfsuck2Scene"

func _run():
	if(state == ""):
		addCharacter("artica")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		aimCameraAndSetLocName("yard_neargym")
		saynn("Artica seems to be way more.. determined today. You notice that her stride is way more confident.."+str(" but she is still covering herself when anyone looks at her a little too closely.." if nakedAndShy else "")+"")

		saynn("She seems to be heading to the gym area again. The fluff peeks her head and sees that the place is quite a bit more crowded today.. Her confidence quickly drops.. And yet, she decides to commit.")

		addButton("Continue", "See what happens next", "artica_yoga")
	if(state == "artica_yoga"):
		aimCameraAndSetLocName("gym_yoga")
		playAnimation(StageScene.Yoga, "catcow", {pc="artica", bodyState={hard=true}})
		saynn("Artica patiently waits until one of the yoga mats becomes free.. but then someone else occupies it..")

		saynn("Eventually, she gets a free mat and starts her routine with a series of deep breaths, trying to distance herself from the busy loud folks around. You decide not to distract her too, you already know what goal the girl is pursuing..")

		saynn("Artica gets on all fours and starts doing the simple cat-cow pose, arching her back upwards and then dipping it downwards, stretching her spine. With each arch, she couldn't help but glance down at her "+str("{artica.penis}.." if isNaked else "shorts, the fabric sitting tight against her bulging cock..")+"")

		addButton("Continue", "See what happens next", "artica_does_plow_pose")
	if(state == "artica_does_plow_pose"):
		playAnimation(StageScene.Yoga2, "plow", {pc="artica", bodyState={hard=true}})
		saynn("After several cycles of that cat-cow pose, Artica felt ready to push herself further. She slowly transitions into a plow yoga pose, lying on her back and lifting her legs over her head while using her hands to support her lower back, carefully guiding her hind paws to touch the floor behind her head..")

		saynn("[say=artica]Nh-..[/say]")

		saynn("In this position, Artica's body formed a perfect arc, her face inches away from her"+str(" clothed" if !isNaked else " ")+""+str(" locked" if isCaged else "")+" cock.. She takes a deep breath, taking in her aroused scent.. which only fuels her desire.. so much that she feels her own precum dripping onto her snout..")

		saynn("Artica licks her lips.. and keeps pushing herself further, bending her spine and reaching her legs further, her"+str(" cock" if isNaked else " crotch")+" getting closer and closer.. until..")

		saynn("[say=gymbully]I dunno. You think so, really?[/say]")

		saynn("[say=gymbully3]I'm telling you, she is trying to suck her own cock![/say]")

		addButton("Continue", "See what happens next", "artica_gets_surrounded")
	if(state == "artica_gets_surrounded"):
		playAnimation(StageScene.Duo, "stand", {pc="gymbully", npc="gymbully3"})
		addCharacter("gymbully")
		addCharacter("gymbully2")
		addCharacter("gymbully3")
		saynn("Artica's eyes open wide as she hears a girl giggling near her.. As she does that, she notices 3 gang members surrounding her.. The main guy and the crazy girl seem to be doing all the talking while the third guy is just quietly standing near..")

		saynn("[say=gymbully]Well, well well, what do we have here? I don't remember you paying for the privilege of using these yoga mats.[/say]")

		saynn("[say=gymbully3]Tell us, please! Are you trying to suck your own cock?![/say]")

		saynn("Artica tries to maintain her composure.. but her face quickly flushes with embarrassment.")

		saynn("[say=gymbully]Maybe it's just some weird yoga position?[/say]")

		saynn("[say=gymbully3]Well, why do you think she is doing it, huh?![/say]")

		saynn("Artica's mind racing, trying to find a way out. She tries to slowly get up.. but the crazy girl is quick to pin her legs to the floor, holding her hands on Artica's thighs..")

		saynn("[say=gymbully3]Nuh-uh! Either you pay the fee.. or you offer something else, equal in value![/say]")

		saynn("[say=artica].. .. ..?..[/say]")

		saynn("The crazy girl hums.")

		saynn("[say=gymbully3]No credits, really? Hmm.. Well then suck your cock then! I wanna see you do it!![/say]")

		saynn("[say=artica].. ..[/say]")

		saynn("[say=gymbully3]WHAT DO YOU MEAN YOU CAN'T? YOU'RE ALREADY SO CLOSE! JUST SUCK IT![/say]")

		saynn("The whole gym turns towards Artica, who is still stuck in the most vulnerable position..")

		saynn("[say=gymbully3]So! Either do it or we bring you into the slutwall to get us our creds![/say]")

		saynn("All three of them seem to be busy watching Artica trying to do it.. their backs turned towards you. Some chains would be enough to bring down the quiet guy.. A gag would be perfect for that crazy bitch.. and then only the main guy would remain..")

		addButton("Watch", "Just watch Artica humiliate herself further..", "artica_selfsuck_helped")
		addButton("Act", "Try to stop the bullies", "try_stop_bullies")
	if(state == "artica_selfsuck_helped"):
		GM.pc.setLocation("gym_yoga")
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.SelfSuck, "tease", {pc="artica", npc="gymbully3", bodyState={naked=true, hard=true}})
		saynn("Might as well let them help Artica train her.. flexibility. You decide to sit on one of the benches and watch the scene unfold.")

		saynn("[say=artica]..[/say]")

		if (!isNaked):
			saynn("[say=gymbully3]Nu huh, your clothes first![/say]")

			saynn("The girl quickly pulls the shorts off of Artica, exposing her"+str(" caged up member" if isCaged else "hard canine member")+"..")

			if (isCaged):
				saynn("[say=gymbully3]Oh, you're fucking locked? You're doing it anyway, bitch! Just bend more![/say]")

			else:
				saynn("[say=gymbully3]That's one juicy cock, wow! C'mon, do it! I would do it if I was you.[/say]")

		else:
			if (isCaged):
				saynn("[say=gymbully3]I don't care that you're locked. You're doing it anyway, bitch! Just bend more![/say]")

			else:
				saynn("[say=gymbully3]You got one juicy ass cock! C'mon, do it! I would do it if I was you.[/say]")

		saynn("Artica's breathing became erratic, her body trembling with a mix of shame and fear. Slowly, she begins trying to bend more, her {artica.penis} swaying in the air, always so close.. but never quite close enough..")

		saynn("[say=gymbully3]You know what? Maybe I can help you out![/say]")

		saynn("Before Artica can react, the girl places her hands on the fluff's legs again.. and starts pushing them closer to Artica's head, forcing her to bend even more..")

		saynn("[say=gymbully3]See? You just need a little encouragement![/say]")

		addButton("Continue", "See what happens next", "artica_selfsuck_help")
	if(state == "artica_selfsuck_help"):
		playAnimation(StageScene.SelfSuck, "sex", {pc="artica", npc="gymbully3", bodyState={naked=true, hard=true}})
		saynn("Artica gasps as her cock inched closer to her mouth, the "+str("tip of her chastity cage brushing her lips.." if isCaged else "tip brushing her lips..")+" Miraculously, she seems to be able to bend enough for this..")

		saynn("[say=gymbully3]There you go! Now go on, give it a good suck![/say]")

		saynn("The fluff hesitates.. but the pressure on her legs didn't go away, pushing the girl to part her lips and obey, her long canine tongue swirling around"+str(" the metal cage, before slipping through the holes and teasing the tip of her cock that's hiding in her sheath.." if isCaged else " the tip of her cock, tasting her own precum..")+"")

		saynn("The more Artica was doing it.. the more she was getting into, bobbing her head back and forth, taking in as much of her "+str("chastity" if isCaged else "shaft")+" as she could and sucking on it, little quiet moans escaping from her already..")

		saynn("[say=gymbully]Oh wow, look at her go. She is actually doing it.[/say]")

		saynn("[say=gymbully3]Yeah, just like that~. Suck it good, girl..[/say]")

		if (!isCaged):
			saynn("Artica's own member is throbbing in her mouth, her arousal building fast as she realizes what she is doing.. And she only sucks harder, her lips wrapping around the tip while her tongue is sliding along the shaft, tasting every inch.. Her cute moans were muffled by her own dick, her body trembling, her knot visibly inflating..")

		else:
			saynn("Artica's own member is throbbing in its cage, her arousal building fast as she realizes what she is doing.. And she only sucks harder, her lips wrapping around the metal cage while her tongue is sliding along the trapped shaft, tasting every inch.. Her cute moans were muffled by her own dick, her body trembling..")

		addButton("Continue", "See what happens next", "artica_cums_in_her_mouth")
	if(state == "artica_cums_in_her_mouth"):
		playAnimation(StageScene.SelfSuck, "inside", {pc="artica", npc="gymbully3", bodyState={naked=true, hard=true}})
		saynn("Finally, with a muffled cry, Artica cums hard, her"+str(" locked" if isCaged else "")+" member shooting thick ropes of cum directly into her mouth"+str(" through the cage" if isCaged else "")+" as she swallows eagerly, the taste of her own seed doesn't seem to be gross to her. The bullies just watch in fascination as Artica's body convulses with pleasure, her exposed pussy visibly clenching at the same time..")

		saynn("[say=gymbully]That was quite the show. Didn't know that one could be flexible enough to do that.[/say]")

		saynn("[say=gymbully3]Oh yeah, she is a real cock sucker![/say]")

		saynn("You can hear them chuckling..")

		addButton("Continue", "See what happens next", "artica_runs_away")
	if(state == "artica_runs_away"):
		playAnimation(StageScene.Solo, "stand", {pc="artica"})
		removeCharacter("gymbully")
		removeCharacter("gymbully2")
		removeCharacter("gymbully3")
		saynn("Satisfied with the show, the bullies walk away, leaving the fluff to pant exhausted, her body still trembling.. She slowly unfolds herself from the plow yoga pose, her face burning with a mix of shame.. and lust..")

		saynn("After that, she gets up"+str(", grabs her clothes," if !isNaked else "")+" and quickly runs away..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "artica_yoga"):
		processTime(5*60)

	if(_action == "artica_does_plow_pose"):
		processTime(5*60)

	if(_action == "artica_gets_surrounded"):
		processTime(5*60)

	if(_action == "artica_selfsuck_help"):
		processTime(3*60)

	if(_action == "artica_cums_in_her_mouth"):
		processTime(5*60)
		getModule("ArticaModule").triggerCorruption(0.07)
		getCharacter("artica").cummedInMouthBy("artica")

	if(_action == "artica_runs_away"):
		processTime(3*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isNaked"] = isNaked
	data["isCaged"] = isCaged
	data["corruption"] = corruption
	data["isSlut"] = isSlut
	data["isVerySlut"] = isVerySlut
	data["isLusty"] = isLusty
	data["nakedAndShy"] = nakedAndShy

	return data

func loadData(data):
	.loadData(data)

	isNaked = SAVE.loadVar(data, "isNaked", false)
	isCaged = SAVE.loadVar(data, "isCaged", false)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	isSlut = SAVE.loadVar(data, "isSlut", false)
	isVerySlut = SAVE.loadVar(data, "isVerySlut", false)
	isLusty = SAVE.loadVar(data, "isLusty", false)
	nakedAndShy = SAVE.loadVar(data, "nakedAndShy", false)
