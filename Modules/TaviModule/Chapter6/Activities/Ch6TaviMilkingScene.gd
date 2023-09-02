extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var hasMark = false
var hasMilk = false
var isEfficient = false
var beganLactating = false
var breastPumpID = ""

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

			addButton("Hand-Milking", "Milk Tavi breasts with your hands", "lact_handmilking")
			addButton("Breastfeeding", "Feed on Tavi's breasts with your mouth", "lact_breastfeeding")
			if (GM.pc.getInventory().getItemsWithTag(ItemTag.BreastPump).size() > 0):
				addButton("Breast pump", "Use one of your breast pumps on Tavi's chest", "lact_pump_pick")
			else:
				addDisabledButton("Breast pump", "You don't have any breast pumps")
		else:
			saynn("Tavi doesn't seem to be lactating so you can't really milk her.")

			saynn("But you can still try, right? Maybe something fun will happen if you keep at it..")

			saynn("The feline catches your gaze on her chest and tilts her head slightly.")

			saynn("[say=tavi]"+str(taviSpeak("Something is wrong? Want me to undress?..", "Your stare makes me wet alone, what's up with that?", "You like staring at me.."))+"[/say]")

			var lastGrope = getFlag("TaviModule.Ch6TaviLastGropeHow", "")
			if (lastGrope == "grope"):
				saynn("You remember that you groped Tavi's breasts last time to try to make her lactate. [b]You're pretty sure that trying something else now will be more efficient.[/b]")

			elif (lastGrope == "suck"):
				saynn("You remember that you sucked on Tavi's breasts last time to try to make her lactate. [b]You're pretty sure that trying something else now will be more efficient.[/b]")

			elif (lastGrope == "pump"):
				saynn("You remember that you used a breast pump on Tavi's breasts last time to try to make her lactate. [b]You're pretty sure that trying something else now will be more efficient.[/b]")

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
	if(state == "nolact_pump_pick"):
		saynn("Pick which breast pump you wanna use on Tavi.")

		addPumpButtons("nolact_pump")
		if (false):
			addButton("Nope", "You shouldn't see this", "nolact_pump")
	if(state == "nolact_pump"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("Tavi's cheeks blush when she sees you holding a set of breast pumps.")

		saynn("[say=tavi]But I'm not..[/say]")

		saynn("[say=pc]That's okay, I'm not doing this to actually get milk from you, Tavi.[/say]")

		saynn("Tavi nods softly and unbuttons her shirt for you, putting her {tavi.breasts} out on display. You take a moment to admire the forms before carefully positioning the pumps on her delicate green nipples, making sure they fit snugly.")

		saynn("Time to turn them on..")

		addButton("Pumps", "Switch them on", "nolact_pump_do")
	if(state == "nolact_pump_do"):
		playAnimation(StageScene.Cuddling, "idle", {npc="tavi", npcBodyState={naked=true}})
		saynn("You switch each of the pumps on to their weak setting and just watch.")

		saynn("The feline inhales deeply as the devices on her breasts begin their gentle suction, her nipples hardening immediately from the stimulation.")

		saynn("[say=tavi]They pull.. so nice.[/say]")

		saynn("As the pumps continue their rhythmic motions, you settle on Tavi's bed and then pull Tavi close for some cuddling. You rest your chin on her shoulder and look down at Tavi's hard nips getting tugged on fruitlessly.. But it's still quite hot to see them glow and swell under the relentless stimulation.")

		saynn("[say=tavi]Ngh-h..[/say]")

		if (!beganLactating):
			saynn("Although Tavi doesn't begin lactating from this, you can feel that you made quite some progress. Her body is responding to the training, her breasts becoming more sensitive.. her pussy more slick.")

			saynn("After some time, you turn off the pumps and carefully remove them from Tavi's breasts, taking extra care to soothe her nips with some gentle rubs and caresses.")

		else:
			saynn("It seems that after some time, Tavi's body finally yields to the persistent stimulation. A warm sudden sensation washes over her. She gasps softly, her eyes widening in surprise.")

			saynn("[say=tavi]I think I'm..[/say]")

			saynn("You quickly realize what's happening and turn off the pumps. The plastic cups that were empty before, now have a few precious drops of milk, a sign that [b]Tavi has begun lactating[/b].")

			saynn("[say=pc]You're making milk. Such a good girl.[/say]")

			saynn("Tavi purrs and rubs against your body. You decide not to push more strain on her mammary glands and carefully take off the pumps instead. It's best to let her breasts produce more milk before milking.")

		addButton("Continue", "See what happens next", "removepumpandend")
	if(state == "lact_handmilking"):
		playAnimation(StageScene.BreastGroping, "tease", {npc="tavi", npcBodyState={naked=true}})
		saynn("Tavi's breasts are full of sweet milk, so much that she finds her breasts itching slightly. So why not help her?")

		saynn("You get comfy on Tavi's bed and then pull her in close, your hands landing on her shirt and unbuttoning it.")

		saynn("[say=tavi]What are you..[/say]")

		saynn("[say=pc]You will see. It will feel good, trust me.[/say]")

		saynn("You rest your chin on her shoulder and look down, seeing her {tavi.breasts} out on full display, her nips looking swollen and possessing a darker shade of green than usual. Tavi's breath hitches with anticipation as your palms land on her chest, your digits sending shivers through her spine.")

		saynn("Time to do this..")

		addButton("Milk Tavi", "Grope her breasts", "lact_handmilking_do")
	if(state == "lact_handmilking_do"):
		playAnimation(StageScene.BreastGroping, "grope", {npc="tavi", npcBodyState={naked=true}})
		saynn("And so you begin to carefully knead Tavi's breasts, your fingers putting some amount of pressure in different spots. Tavi's eyes close as the sensations begin washing over her.")

		saynn("You follow her reactions closely as your fingers make their way to her dark areolas before squeezing them slightly, eliciting a cute moan from the feline in the process.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("Finally, you begin to feel her warm milk trailing down your digits. Little spurts of milk escape from her nips as you continue kneading and groping her breasts. Tavi seems to be getting wet between her legs, she keeps rubbing her thighs against each other.")

		saynn("[say=tavi]I'm making milk..[/say]")

		saynn("You catch some of it and lick your digits. So sweet, you can't get enough.")

		saynn("[say=pc]Yes, you are.[/say]")

		saynn("Her breath quickens as your touches become more bold. You alternate between gentle caressing and firm squeezes, drawing out more and more of her sweet nectar.. that she seems to have a lot of.")

		saynn("You gotta stop somewhere though. After a few minutes of milking Tavi, you begin to slow down.")

		saynn("[say=tavi]You're stopping?..[/say]")

		saynn("[say=pc]Yeah, I don't want to push you too far.[/say]")

		saynn("[say=tavi]..why not?[/say]")

		saynn("Hmm..")

		addButton("Enough", "Enough milking", "lact_handmilking_enough")
		addButton("Milk more", "Milk Tavi for all her milk", "lact_handmilking_more")
	if(state == "lact_handmilking_enough"):
		playAnimation(StageScene.BreastGroping, "tease", {npc="tavi", npcBodyState={naked=true}})
		saynn("You kiss Tavi's neck and let her taste her own breast milk.")

		saynn("[say=pc]Because it will make you sore.[/say]")

		saynn("The feline licks her milk and purrs like a happy kitten.")

		saynn("[say=tavi]That's fair.[/say]")

		saynn("And so you spend some time just cuddling like that, Tavi's breasts looking a little less heavy than before.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "lact_handmilking_more"):
		saynn("Indeed, why not. If Tavi is asking for more, she will get more. But only if she obeys.")

		saynn("[say=pc]Try asking better.[/say]")

		saynn("Tavi tilts her head at first. But seeing your hands not moving, she huffs.")

		saynn("[say=tavi]Don't stop, please?..[/say]")

		saynn("That's something..")

		saynn("[say=tavi]Milk my tits completely.. Drain them of all their milk..[/say]")

		saynn("Oh wow. You waste no time. Your hands return to Tavi's swollen breasts, kneading and squeezing them harder than before, somehow finding that there is more milk in them. The feline moans and writhes under your firm touch, her body quivering from this strange type of pleasure.")

		saynn("[say=tavi]I'm such a slut.."+str(" Pregnant and being milked.." if getCharacter("tavi").isVisiblePregnant() else "")+"[/say]")

		saynn("And so her milk flows more freely, filling the room with the sweet scent that's mixing with the scent of her arousal. It seems that being milked and humiliated is pushing her closer and closer to the edge with every passing second.")

		saynn("[say=pc]A slut with big lactating udders.[/say]")

		saynn("You watch carefully as Tavi's climax approaches. Her moans become extremely passionate when you pinch both of her swollen nipples, causing little fountains of milk.. and then it happens.")

		saynn("[say=tavi]F-fuck.. y-yes..[/say]")

		saynn("A powerful orgasm rushes through Tavi, her body squirming hard under your touch while her pussy is squirting transparent juices all over the bed. So much pressure has built up in her.. Tavi's tits release all of its produced milk.. until there is nothing left.. for now.")

		saynn("The feline is left trembling and breathless, her bedsheets looking wet from both, her breast milk and girlcum.")

		saynn("[say=tavi]That felt so fucking good..[/say]")

		saynn("[say=pc]Soon you will want more.[/say]")

		saynn("[say=tavi]Probably..[/say]")

		saynn("Tavi rests in your embrace, her sore nips glowing a lot.")

		addButton("Continue", "See what happens next", "endthescene")
func taviSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak

func addPumpButtons(go_id):
	var pumps = GM.pc.getInventory().getItemsWithTag(ItemTag.BreastPump)
	for pump in pumps:
		addButton(pump.getVisibleName(), pump.getVisibleDescription(), go_id, [pump])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "lact_handmilking"):
		processTime(2*60)

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
		GM.pc.addSkillExperience(Skill.Milking, 10)

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
		GM.pc.addSkillExperience(Skill.Milking, 20)

	if(_action == "nolact_pump"):
		var pump = _args[0]
		breastPumpID = pump.getUniqueID()
		GM.pc.getInventory().removeItem(pump)
		getCharacter("tavi").getInventory().forceEquipStoreOther(pump)

	if(_action == "nolact_pump_do"):
		processTime(18*60)
		var progress = getFlag("TaviModule.Ch6TaviLactationProgress", 0)
		if(isEfficient):
			progress += RNG.randi_range(50, 60)
		else:
			progress += RNG.randi_range(20, 30)
		setFlag("TaviModule.Ch6TaviLactationProgress", progress)
		if(progress >= 100 && RNG.chance(progress / 2)):
			beganLactating = true
			getCharacter("tavi").induceLactation()
			setFlag("TaviModule.Ch6TaviLactationProgress", 0)
		processTime(2*60)
		getCharacter("tavi").addEffect(StatusEffect.SoreNipplesAfterMilking)
		GM.pc.addSkillExperience(Skill.Milking, 20)

	if(_action == "removepumpandend"):
		var pump = getCharacter("tavi").getInventory().getItemByUniqueID(breastPumpID)
		if(pump != null):
			getCharacter("tavi").getInventory().removeEquippedItem(pump)
			GM.pc.getInventory().addItem(pump)
		endScene()
		return

	if(_action == "lact_handmilking_do"):
		processTime(10*60)
		var milkAmount = getCharacter("tavi").milk(RNG.randf_range(0.2,0.3))
		GM.pc.addSkillExperience(Skill.Milking, 20)
		
		addMessage("You milked Tavi for "+str(Util.roundF(milkAmount, 1))+" ml of milk")

	if(_action == "lact_handmilking_enough"):
		processTime(2*60)

	if(_action == "lact_handmilking_more"):
		processTime(10*60)
		var milkAmount = getCharacter("tavi").milk()
		GM.pc.addSkillExperience(Skill.Milking, 10)
		
		addMessage("You milked Tavi for "+str(Util.roundF(milkAmount, 1))+" ml of milk")
		getModule("TaviModule").addCorruption(2)

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
	data["breastPumpID"] = breastPumpID

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
	breastPumpID = SAVE.loadVar(data, "breastPumpID", "")
