extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaEventSelfsuck1Scene"

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
		saynn("This time Artica is heading to the yard area. Is she eager to breathe some fresh air?")

		saynn("Doesn't look like.. After putting her hind paws on the stone tiles, she actually makes her way to the gym instead.. and then just peeks her head inside"+str(", obviously quite aware of her lack of clothes" if nakedAndShy else "")+".")

		saynn("And luckily for her, the gym was mostly empty. The fluff takes a deep breath.. and walks in, quickly picking one of the yoga mats and sitting on it..")

		saynn("She doesn't seem to be doing anything interesting.. so you might as well join her.")

		addButton("Continue", "See what happens next", "pc_joins")
	if(state == "pc_joins"):
		playAnimation(StageScene.Yoga, "cobra", {pc="artica", bodyState={hard=true}})
		saynn("Artica begins to do simple stretches, laying flat on the yoga mat before arching her back as much as her spine allows.. which doesn't seem to be that much.. but she is clearly trying.")

		saynn("You take an empty yoga mat nearby and start doing some simple yoga exercises as well.")

		saynn("[say=pc]Hey.[/say]")

		saynn("The"+str(" naked" if isNaked else "")+" fluff jumps and gasps when she hears your voice.")

		saynn("[say=artica]Eek.. oh.. h-heya..[/say]")

		saynn("[say=pc]Yoga is cool, doing it for the mind?[/say]")

		saynn("Artica tilts her head at you.")

		saynn("[say=artica]I'm just.. trying to get more agile.. and flexible, I guess..[/say]")

		saynn("She blushes softly as she continues her exercises. And so you continue yours..")

		addButton("Continue", "See what happens next", "second_exercise")
	if(state == "second_exercise"):
		playAnimation(StageScene.Yoga, "catcow", {pc="artica", bodyState={hard=true}})
		saynn("Artica gets up on all fours.. and begins doing the cat-cow exercises, arching her body down and up, huffing softly already.."+str(" You notice her {artica.penis} swaying between her legs.. She obviously sees it too each time she bends her spine.." if isNaked else " You notice her shorts bulging in the crotch region..")+"")

		saynn("[say=pc]You wanna be more agile, huh?[/say]")

		saynn("She nods nervously.")

		saynn("[say=artica]Y-yeah.. I just want to be better.. at c-certain things..[/say]")

		saynn("Interesting.")

		saynn("[say=pc]I'm curious. What things?[/say]")

		saynn("[say=artica]Uh.. just taking care of myself and my body.. I've been avoiding e-exercises for a long time..[/say]")

		saynn("Exercising is not the worst idea in this prison.")

		saynn("[say=pc]Hope you reach your goals then.[/say]")

		saynn("Her cheeks blush slightly more, the girl is panting a lot by now, each simple bend is becoming harder and harder for her to do.")

		saynn("[say=artica]T-t.. t-thanks.. ah..[/say]")

		saynn("It's only been a few minutes though..")

		saynn("[say=artica]W-why is it so hard..[/say]")

		saynn("[say=pc]It gets easier the more you do it.[/say]")

		saynn("[say=artica]Oh.. yeah.. y-yeah, it does.. hah.. ah..[/say]")

		addButton("Continue", "See what happens next", "situps_artica")
	if(state == "situps_artica"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="artica", bodyState={hard=true}})
		saynn("The fluff eventually gives up on that exercise. She flops onto the mat and starts panting heavily.")

		saynn("[say=pc]Take a rest.[/say]")

		saynn("[say=artica]Yeah.. uh.. s-soon..[/say]")

		saynn("The girl starts doing simple crunches, bending forward and trying to reach her knees with her elbows.")

		saynn("Artica might not be the most agile girl in the world.. but she is motivated, you will give her that.")

		saynn("Eventually, though, her body gives up. The fluff hits the mat and stops pushing herself, instead just focussing on her breathing.")

		saynn("[say=artica]G-gonna go now.. I will s-see you later..[/say]")

		saynn("[say=pc]Sure.[/say]")

		saynn("Not even a few minutes later, Artica gets up.. and starts heading somewhere.")

		saynn("She doesn't seem to be going towards the bathroom.. which is quite curious.")

		addButton("Follow", "See where Artica is heading", "artica_needy_in_cell")
	if(state == "artica_needy_in_cell"):
		addCharacter("artica", ["naked"])
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		GM.pc.setLocation("cellblock_lilac_nearcell")
		playAnimation(StageScene.Solo, "stand", {pc="artica", bodyState={naked=true,hard=true}})
		saynn("You follow her, curious if she is heading back to her spot.. but she is not. Artica is going down to the lilac cell block and heads straight for her cell.")

		if (!isNaked):
			saynn("In there, she slowly begins to undress, dropping her shirt and exposing her {artica.breasts}, her nipples already hard from the cool air. Her paws tremble slightly as she pulls down her shorts too, exposing her "+str("locked drippy member" if isCaged else "hard drippy member")+" and the moist source of heat that's hiding behind her balls..")

		else:
			saynn("In there, she slowly begins to admire herself, staring down at her exposed {artica.breasts}, seeing her nipples getting hard from the cool air. Her paws tremble slightly as she caresses the inner sides of her thighs, outlining her "+str("locked drippy member" if isCaged else "hard drippy member")+" and the moist source of heat that's hiding behind her balls..")

		saynn("[say=artica]W-why so hard..[/say]")

		saynn("You peek your head inside and just watch what she is gonna do next. Because she certainly will..")

		addButton("Continue", "See what happens next", "artica_tries_selfsuck")
	if(state == "artica_tries_selfsuck"):
		playAnimation(StageScene.SelfSuck, "tease", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("Naked Artica gets up onto her bed and puts her hands onto her back, trying to support herself in this awkward balancing position where her ass is above her chest, her head resting on a pillow.")

		if (isCaged):
			saynn("In this position, her chastity cage is not that far away.. from her lips. And so she is trying, trying to bend herself a little more.. trying to reach her locked cock with her lips.")

			saynn("[say=artica]Nhh-hhh..[/say]")

			saynn("But even when sticking her long canine tongue, she can barely just lick the metal tip of the cage.. licking off the salty pre that has collected there..")

		else:
			saynn("In this position, her canine cock is not that far away.. from her lips. And so she is trying, trying to bend herself a little more.. trying to reach her cyan pulsing shaft with her lips.")

			saynn("[say=artica]Nhh-hhh..[/say]")

			saynn("But even when sticking her long canine tongue, she can barely just lick the tip of the member.. licking off the salty pre that has collected there..")

		saynn("Her breath hitches as she strains her body.. her untrained muscles and bones protesting against the unfamiliar movement. She manages to get close, licking more of her pre.. but she can't quite reach far enough.")

		saynn("[say=artica]Hh.. P-please.. I n-need it..[/say]")

		saynn("Frustration begins to build as she tries different angles, each attempt leaving her just shy of her goal. Her muscles are tensing up painful, making the girl whimper desperately..")

		saynn("With a defeated sigh, Artica lays back on the bed, her "+str("cock still hard and dripping" if !isCaged else "cock still dripping in its small cage")+", her mind corrupted with desire..")

		addButton("Continue", "See what happens next", "artica_gives_up_cums")
	if(state == "artica_gives_up_cums"):
		saynn("She couldn't achieve her goal.. but her need for a release didn't go anywhere.")

		saynn("[say=artica]I c-can't.. anymore..[/say]")

		if (isCaged):
			playAnimation(StageScene.Zonked, "rubcum", {pc="artica", bodyState={naked=true, hard=true}})
			saynn("She gives in to the urge.. her cock is locked so she reaches digits to her dripping needy pussy before proceeding to rub her clit.")

			saynn("The sensation sends shivers through her body, Artica closes her eyes and keeps pleasuring herself while licking her lips, probably imagining what it would feel like to have her mouth around her cock, to be able to taste it herself..")

			saynn("[say=artica]Mmm.. hh..[/say]")

			saynn("Her digits part her pussy lips and delve in to finger the entrance, her breathing becoming deep and fast, her toes curling up as she was getting closer.. The cock trapped inside her sheath and pulsing hard..")

			saynn("[say=artica]Ah![/say]")

			saynn("And, soon enough, she cums, her locked cock shooting thick ropes of cum out with some of them landing on her tits.. but the rest was quickly aimed towards her mouth, her tongue darting out to catch every drop possible, the fluff eagerly swallowing her own seed..")

			saynn("Her orgasm was quick but intense, her body shaking as wave after wave of pleasure washed over her.")

		else:
			playAnimation(StageScene.Zonked, "strokecum", {pc="artica", bodyState={naked=true, hard=true}})
			saynn("She gives in to the urge, wrapping her digits around her hard, dripping canine cock, spreading her pre along the length before proceeding to stroke it.")

			saynn("The sensation sends shivers through her body, Artica closes her eyes and keeps stroking herself while licking her lips, probably imagining what it would feel like to have her mouth around her cock, to be able to taste it herself..")

			saynn("[say=artica]Mmm.. hh..[/say]")

			saynn("Her strokes became faster, more urgent, her breathing deep and fast, her toes curling up as she was getting closer.. The knot at the base of her member inflating into a fat pulsing orb..")

			saynn("[say=artica]Ah![/say]")

			saynn("And, soon enough, she cums, her cock shooting thick ropes of cum out with some of them landing on her tits.. but the rest was quickly aimed towards her mouth, her tongue darting out to catch every drop possible, the fluff eagerly swallowing her own seed..")

			saynn("Her orgasm was quick but intense, her body shaking as wave after wave of pleasure washed over her.")

		addButton("Continue", "See what happens next", "artica_aftermatch")
	if(state == "artica_aftermatch"):
		playAnimation(StageScene.Zonked, "tease", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("When it was finally over, Artica just laid on her bed, her chest rising and falling as she was panting. Her body was still tingling from the afterglow, her sore, tired muscles adding in some pain to the mix..")

		saynn("[say=artica]One day..[/say]")

		saynn("You chuckle softly and then quickly leave after seeing her ears perk in your direction..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "pc_joins"):
		processTime(3*60)

	if(_action == "second_exercise"):
		processTime(5*60)

	if(_action == "situps_artica"):
		processTime(5*60)

	if(_action == "artica_needy_in_cell"):
		processTime(5*60)

	if(_action == "artica_tries_selfsuck"):
		processTime(5*60)

	if(_action == "artica_gives_up_cums"):
		processTime(3*60)
		getModule("ArticaModule").triggerCorruption(0.05)
		getCharacter("artica").cummedInMouthBy("artica")

	if(_action == "artica_aftermatch"):
		processTime(5*60)

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
