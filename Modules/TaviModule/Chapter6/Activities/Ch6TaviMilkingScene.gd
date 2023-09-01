extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var hasMark = false
var hasMilk = false
var isEfficient = false
var beganLactating = false

func _init():
	sceneID = "Ch6TaviMilkingScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		hasMark = getModule("TaviModule").hasWombMark()
		hasMilk = getCharacter("tavi").canBeMilked()
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		if (hasMilk):
			saynn("Tavi's breasts seem to be lactating and so you are thinking about milking your pet.")

			saynn("Question is how do you wanna do that?")

			saynn("The feline catches your gaze on her chest and crosses her arms, emphasizing her {tavi.breasts} while biting her lip.")

			saynn("[say=tavi]"+str(taviSpeak("Like 'em?.. You made them like that.", "They keep itching when full.. Wanna change that?", "I think I know why you are staring.."))+"[/say]")

		else:
			saynn("Tavi doesn't seem to be lactating so you can't really milk her.")

			saynn("But you can still try, right? Maybe something fun will happen if you keep at it..")

			saynn("The feline catches your gaze on her chest and tilts her head slightly.")

			saynn("[say=tavi]"+str(taviSpeak("Something is wrong? Want me to undress?..", "Your stare makes me wet alone, what's up with that?", "You like staring at me.."))+"[/say]")

			var lastGrope = getFlag("TaviModule.Ch6TaviLastGropeHow", "")
			if (lastGrope == "grope"):
				saynn("You remember that you groped Tavi's breasts last time to try to make her lactate. You're pretty sure that trying something else now will be more efficient.")

			elif (lastGrope == "suck"):
				saynn("You remember that you sucked on Tavi's breasts last time to try to make her lactate. You're pretty sure that trying something else now will be more efficient.")

			elif (lastGrope == "pump"):
				saynn("You remember that you used a breast pump on Tavi's breasts last time to try to make her lactate. You're pretty sure that trying something else now will be more efficient.")

			addButton("Grope Tavi", "Grope Tavi's breasts to make her lactate", "nolact_grope")
			if (getCharacter("tavi").hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				addDisabledButton("Suck nipples", "Give Tavi some rest, her nipples are still sore")
				addDisabledButton("Breast pump", "Give Tavi some rest, her nipples are still sore")
			else:
				addButton("Suck nipples", "Give some extra attention to Tavi's nipples", "nolact_suck")
				if (GM.pc.getInventory().getItemsWithTag(ItemTag.BreastPump).size() > 0):
					addButton("Breast pump", "Use one of your breast pumps on Tavi's chest", "nolact_pump_pick")
				else:
					addDisabledButton("Breast pump", "You don't have any breast pumps")
		addButton("Cancel", "You changed your mind", "cancel_activity")
	if(state == "nolact_grope"):
		playAnimation(StageScene.BreastGroping, "tease", {npc="tavi", npcBodyState={naked=true}})
		saynn("You can just walk up to her and start touching her.. but might as well make it a little more intimate than that.")

		saynn("Tavi purrs when you pull her in for some cuddling. Soft hum of the busy space station seems to fade as you embrace your pet.")

		saynn("[say=tavi]Feels nice..[/say]")

		saynn("[say=pc]I could make it even better.[/say]")

		saynn("As you cuddle, your hands reach out for Tavi's shirt and gently unbutton it, one button at a time.. Until Tavi's chest is exposed. She seems to trust you somewhat but her digits still cover up her green perky nips, protecting.")

		saynn("[say=tavi]What are you gonna do?..[/say]")

		saynn("Your lips leave a little smooch on Tavi's neck. And then another. Your pet tilts her head to the side and gives you better access to her neck. A soft purr escapes from her throat.")

		saynn("[say=pc]Just making you feel good.[/say]")

		saynn("Feeling your signs of affection, Tavi lowers her guard and allows your hands to begin exploring her curves, tracing gentle patterns along her fancy purple fur.")

		addButton("Continue", "See what happens next", "nolact_grope_act")
	if(state == "nolact_grope_act"):
		playAnimation(StageScene.BreastGroping, "grope", {npc="tavi", npcBodyState={naked=true}})
		saynn("Tavi produces a sigh of content. Time to give her a little massage.")

		saynn("Driven by curiosity, your fingers make their ways to Tavi's {tavi.breasts} and cup them, feeling the weight while your thumbs gently brush over the nipples.")

		saynn("[say=tavi]A-..h..[/say]")

		saynn("Tavi's breath hitches for a second as your actions ignite a spark of arousal inside her. Her nipples harden in response to your touch and she arches her back slightly, puffing her chest out more.")

		saynn("[say=pc]Feels nice, doesn't it?[/say]")

		saynn("Without waiting for an answer, the palms of your hands begin to knead and gently massage her breasts, paying close attention to her nips. Your touch is soft and delicate.. but still firm enough to try to encourage Tavi's mammary glands to start producing milk..")

		saynn("Little moans fill the cell as Tavi's body responds to your groping her breasts. The sensations ripple through her, causing her hips to shift instinctively, her body pressing against yours in search for more contact.")

		if (!beganLactating):
			saynn("Despite the efforts, Tavi's nips don't produce a single drop of milk. Still, you made some progress at least. And her breasts seem to be more sensitive.")

		else:
			saynn("A small, surprised gasp escapes Tavi's lips as something strange happens. Little beads of warm milk begin to dribble from her nips, leaving white trails behind.")

			saynn("[say=tavi]Ah.. What is..[/say]")

			saynn("[say=pc]You're lactating, Tavi.[/say]")

			saynn("Seems like your efforts have paid off. [b]Tavi's nipples were stimulated enough to start producing milk![/b]")

		saynn("After all that, you just cuddle with Tavi for a little more, helping her recover.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "nolact_suck"):
		playAnimation(StageScene.BreastFeeding, "tease", {pc="tavi", npc="pc", bodyState={naked=true}})
		saynn("You help Tavi to lay on her back, her expression a mixture of curiosity and anticipation.")

		saynn("Gently, you position yourself above her, your hand unbuttoning her shirt one button at a time. Tavi watches with intrigue, your bold actions making her blush a little.")

		saynn("[say=pc]I will be gentle.[/say]")

		saynn("[say=tavi]As gentle as you want..[/say]")

		saynn("Finally, you uncover Tavi's rich chest. She bites her lip and looks slightly away, unable to withstand your possessive gaze. At first she crosses her arms under her breasts again.. but that only makes me perk out more. You can't wait to start.")

		addButton("Latch on", "Starts licking Tavi's nips", "nolact_suck_do")
	if(state == "nolact_suck_do"):
		playAnimation(StageScene.BreastFeeding, "feed", {pc="tavi", npc="pc", bodyState={naked=true}})
		saynn("Time for the main event. You lean closer to her breasts and open your mouth slightly. Your lips meet her left nipple before your tongue starts to lick the sensitive spot with a sensual, rhythmic motion. That causes Tavi to inhale sharply, her nips harden and her body responds with a little shiver.")

		saynn("[say=tavi]Mm-m..[/say]")

		saynn("After that, your lips close around the nipple. And so you begin to suckle on it instead of just licking. Tavi's fingers find their way into your hair, stroking and gently urging you to continue. Little soft moans escape her as you imitate a hungry little kitten that wants some milk.")

		saynn("Your exploration continues on her right nipple. This time, you introduce Tavi with gentle nibbles. When your teeth find that little hard nipple and gently squeeze, sparks of pleasure rush through Tavi, causing her to arch her back and pant louder.")

		saynn("[say=tavi]Ah!..[/say]")

		if (!beganLactating):
			saynn("You keep sucking and nibbling on Tavi's nips, bringing her more and more of these pleasurable waves. But despite the efforts, her breasts don't produce a single drop of milk. Still, you made some progress at least. And her breasts seem to be more sensitive.")

		else:
			saynn("A small, surprised gasp escapes Tavi's lips as something strange happens. Little beads of warm milk begin to dribble from her nips, leaving white trails behind.")

			saynn("[say=tavi]Ah.. What is..[/say]")

			saynn("[say=pc]You're lactating, Tavi.[/say]")

			saynn("Seems like your efforts have paid off. [b]Tavi's nipples were stimulated enough to start producing milk![/b] And so obviously, you lean close to her nips again and taste her milk. It's warm and has a sweet aftertaste.. but you can only catch so much right now. Better let her glands produce more first.")

		saynn("After all that, you just cuddle with Tavi for a little more, helping her recover.")

		addButton("Continue", "See what happens next", "endthescene")
func taviSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "nolact_grope"):
		processTime(3*60)
		if(getFlag("TaviModule.Ch6TaviLastGropeHow", "") != "grope"):
			isEfficient = true
		setFlag("TaviModule.Ch6TaviLastGropeHow", "grope")

	if(_action == "nolact_suck"):
		processTime(3*60)
		if(getFlag("TaviModule.Ch6TaviLastGropeHow", "") != "suck"):
			isEfficient = true
		setFlag("TaviModule.Ch6TaviLastGropeHow", "suck")

	if(_action == "nolact_pump_pick"):
		if(getFlag("TaviModule.Ch6TaviLastGropeHow", "") != "pump"):
			isEfficient = true
		setFlag("TaviModule.Ch6TaviLastGropeHow", "pump")

	if(_action == "cancel_activity"):
		increaseFlag("TaviModule.Ch6Tiredness", -1)
		endScene()
		return

	if(_action == "nolact_grope_act"):
		processTime(18*60)
		var progress = getFlag("TaviModule.Ch6TaviLactationProgress", 0)
		if(isEfficient):
			progress += RNG.randi_range(20, 30)
		else:
			progress += RNG.randi_range(3, 10)
		setFlag("TaviModule.Ch6TaviLactationProgress", progress)
		if(progress >= 100 && RNG.chance(progress / 2)):
			beganLactating = true
			getCharacter("tavi").induceLactation()
			setFlag("TaviModule.Ch6TaviLactationProgress", 0)
		processTime(2*60)

	if(_action == "nolact_suck_do"):
		processTime(18*60)
		var progress = getFlag("TaviModule.Ch6TaviLactationProgress", 0)
		if(isEfficient):
			progress += RNG.randi_range(20, 40)
		else:
			progress += RNG.randi_range(3, 10)
		setFlag("TaviModule.Ch6TaviLactationProgress", progress)
		if(progress >= 100 && RNG.chance(progress / 2)):
			beganLactating = true
			getCharacter("tavi").induceLactation()
			setFlag("TaviModule.Ch6TaviLactationProgress", 0)
		processTime(2*60)
		getCharacter("tavi").addEffect(StatusEffect.SoreNipplesAfterMilking)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["hasMark"] = hasMark
	data["hasMilk"] = hasMilk
	data["isEfficient"] = isEfficient
	data["beganLactating"] = beganLactating

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	hasMark = SAVE.loadVar(data, "hasMark", false)
	hasMilk = SAVE.loadVar(data, "hasMilk", false)
	isEfficient = SAVE.loadVar(data, "isEfficient", false)
	beganLactating = SAVE.loadVar(data, "beganLactating", false)
