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

			if (getCharacter("tavi").hasEffect(StatusEffect.SoreNipplesAfterMilking)):
				addDisabledButton("Hand-Milking", "Give Tavi some rest. Her nipples are still sore")
				addDisabledButton("Breastfeeding", "Give Tavi some rest. Her nipples are still sore")
				addDisabledButton("Breast pump", "Give Tavi some rest. Her nipples are still sore")
			else:
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
		playAnimation(StageScene.Cuddling, "squirm", {npc="tavi", npcBodyState={naked=true}})
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

		saynn("[say=tavi]I'm such a slut.."+str(" Pregnant and being milked.." if getCharacter("tavi").isVisiblyPregnant() else "")+"[/say]")

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
	if(state == "lact_breastfeeding"):
		playAnimation(StageScene.BreastFeeding, "tease", {pc="tavi", npc="pc", bodyState={naked=true}})
		saynn("For some reason you're getting quite.. hungry.. just from looking at Tavi's chest. Her breasts probably produced quite a lot of milk by now.. So much that her nips are itching. So why not solve both of those problems?")

		saynn("You invite your pet to lay on the bed while you sit nearby, your hands reaching for her shirt, slowly unbuttoning it.")

		saynn("[say=tavi]What are you gonna..[/say]")

		saynn("[say=pc]Trust me.[/say]")

		saynn("As you uncover her {tavi.breasts}, she blushes and tries to cover herself and her swollen nipples that have a darker green shade to them than usual. The expression on her face is a mix of anticipation and desire. So she doesn't resist when you carefully pull her paws away from her chest.")

		saynn("Your mouth already gets more moist just by watching lonely drops of her milk trailing down from her nips. Your hands gently cupping her aching breasts. It's time..")

		addButton("Suckle", "Suckle on Tavi's nips", "lact_breastfeeding_do")
	if(state == "lact_breastfeeding_do"):
		playAnimation(StageScene.BreastFeeding, "feed", {pc="tavi", npc="pc", bodyState={naked=true}})
		saynn("Tavi gets surprised when you lean close to her chest. But then a shiver of pleasure courses through her when your lips meet one of her nipples and close around it. You begin to suckle on it, trying to pull out the sweet nectar.. and soon enough, you begin to taste her creamy milk on your tongue.")

		saynn("[say=tavi]Ah.. w-wow..[/say]")

		saynn("You lap her milk with an intoxicating eagerness while Tavi is arching her back, giving you full access to her breasts while her paw lands on your head and strokes your hair.")

		saynn("Just suckling isn't enough though, one of your hands roams Tavi's fluffy body before reaching the breast that you're feeding on and kneading it.. kinda like how kittens do with their mother. Tavi's breath gets deep from that as more of her milk reaches your tongue.")

		saynn("[say=tavi]Good.. kitten..[/say]")

		saynn("Did she just call you that? Sure. You switch to her other nipple and begin suckling on it too, occasionally squeezing it between your teeth, causing little squirts of milk.")

		saynn("Tavi can't stay still anymore, she is squirming under your touch, lost in the euphoria. She is moaning softly while her hand strokes your hair more.")

		saynn("After some time, you decide to stop, letting go of the nipple and licking your lips. The aftertaste is great, Tavi's milk is a real treat.")

		saynn("[say=tavi]Did you.. like it?[/say]")

		saynn("[say=pc]Obviously.[/say]")

		saynn("[say=tavi]Then.. Why stop there?..[/say]")

		saynn("Tavi squeezes one of her breasts, causing more little squirts of milk to spawn all around her areolas and nipples.")

		saynn("The way she looks at you.. it's like she wants to care for you.. to nurture you.")

		addButton("Enough", "You'd rather not bring Tavi pain", "lact_breastfeeding_enough")
		addButton("More", "Why not let her breastfeed you more", "lact_breastfeeding_more")
	if(state == "lact_breastfeeding_enough"):
		playAnimation(StageScene.BreastFeeding, "tease", {pc="tavi", npc="pc", bodyState={naked=true}})
		saynn("[say=pc]I'd rather not push you too far.[/say]")

		saynn("Tavi produces a soft sigh and nods understanding.")

		saynn("[say=tavi]You're probably right.[/say]")

		saynn("You can always drain her breasts some other time.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "lact_breastfeeding_more"):
		playAnimation(StageScene.BreastFeeding, "teasealt", {pc="tavi", npc="pc", bodyState={naked=true}})
		saynn("Well, might as well, since Tavi is offering. But when you begin to lean close to her nipples again, she suddenly stops you.")

		saynn("[say=tavi]Can I.. Can I be your mommy?.. Just for now..[/say]")

		saynn("That's.. an interesting proposition. Seems like Tavi is enjoying it way too much.")

		saynn("Why not? It can't hurt. As soon as you nod, Tavi suddenly takes control and pushes you to lay on the bed instead while she sits in your lap, her soft gaze shining with affection.")

		saynn("[say=tavi]Don't be afraid..[/say]")

		saynn("Her breasts are now at your eye level, fully exposed and glistening with lonely drops sliding down her teats.")

		saynn("[say=tavi]Just let me take care of you..[/say]")

		saynn("With a gentle touch, Tavi cradles your head in her arms, slowly drawing you closer to her dark green nips.")

		addButton("Suckle", "Let Tavi breastfeed you", "lact_breastfeeding_mommy")
	if(state == "lact_breastfeeding_mommy"):
		playAnimation(StageScene.BreastFeeding, "feedalt", {pc="tavi", npc="pc", bodyState={naked=true}})
		saynn("You need no further invitation, your lips seek out one of her juicy nips, your tongue dancing against the sensitive flesh. You suckle on her nipple and soon enough you begin to taste her sweet milk again.")

		saynn("[say=tavi]Good.. keep going..[/say]")

		saynn("Her voice is tender and loving as she gently strokes you and purrs into your ear. Your palms cup her breasts from below and knead them, accelerating the flow.")

		saynn("[say=tavi]Such a cutie..[/say]")

		saynn("She stops purring and instead just hums a little soothing tune. You can't deny, it feels.. good.. to have someone looking after you. Tavi feels it too.. wait.. Is she.. crying?.. There are a few little tears sliding down her cheeks while she nurtures you. Looks like she got quite emotional about this.")

		saynn("You keep suckling on her breasts, sometimes switching from one nipple to another. And after a few minutes, the flow finally begins to slow down. She quickly wipes her tears away when you pull away from her chest.")

		saynn("[say=tavi]Aw. Did you enjoy it?[/say]")

		saynn("You nod softly and receive a little smooch on your forehead from Tavi.")

		saynn("[say=tavi]I did too.. Probably way too much..[/say]")

		saynn("That was.. wholesome.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "lact_pump_pick"):
		saynn("Pick which breast pump you wanna use on Tavi.")

		addPumpButtons("lact_pump")
		if (false):
			addButton("Nope", "You shouldn't see this", "lact_pump")
	if(state == "lact_pump"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("You can notice Tavi's impressive teats even under her shirt. They're probably heavy from milk right now so you decide to help Tavi eliminate that burden in the most efficient way possible.")

		saynn("But when you produce a set of breast pumps, she blushes deeply.")

		saynn("[say=tavi]I'm not a..[/say]")

		saynn("[say=pc]Not a cow? But it's gonna be fun. Trust me.[/say]")

		saynn("Tavi avoids eye contact for a bit, probably thinking about something. But the weight and itchiness of her chest pushes her to side with you. Tavi begins to unbutton her shirt, putting her {tavi.breasts} out on display.")

		saynn("And so you carefully position each pump over her lactating dark nips, the suction cups easily latching on by pushing some air out, creating negative air pressure.")

		saynn("Tavi looks at them with her cute eyes, unsure how to react about getting used like that.")

		saynn("Time to turn them on.")

		addButton("Pumps", "Turn the breast pumps on", "lact_pump_on")
	if(state == "lact_pump_on"):
		playAnimation(StageScene.Cuddling, "squirm", {npc="tavi", npcBodyState={naked=true}})
		saynn("And so you flick the switches on the pumps, making them kick into action with a quiet hum. Tavi's breath hitches when she begins to feel the rhythmic suctions. There is no milk yet but you can easily tell how much pressure the pumps put by seeing Tavi's nips get tugged on.")

		saynn("She is barely standing so you pull her in for some cuddles, trying to distract her from her thoughts.")

		saynn("[say=pc]See? It's not that bad.[/say]")

		saynn("[say=tavi]Mhm-m-m.. m-m.. h-ah..[/say]")

		saynn("Tavi moans softly in your embrace as her dark green nips begin to leak milk. Little white dots appear all throughout her areolas before flowing down her sensitive flesh and getting collected into a neat little bottle.")

		saynn("[say=pc]Good.. The less you worry, the better your milk is gonna be.. So try not to worry..[/say]")

		saynn("You rest your head on Tavi's shoulder and look down at how the pumps slowly draw out the milk from her round breasts. All the while your hands land on her"+str(" pregnant" if getCharacter("tavi").isVisiblyPregnant() else "")+" belly and gently caress it.")

		saynn("[say=tavi]Ah-h.. h-h..[/say]")

		saynn("[say=pc]You don't have to think much in fact.. Just sit there.. And enjoy being a good cow.. Feels good, right?[/say]")

		saynn("As the breasts continue to milk Tavi, her moans become more and more cute. She is rubbing her thighs against each other, clearly aroused. Her body is writhing a lot, rubbing against you. Since she didn't answer your question, you move your lips closer to her ear and whisper while your hands threaten to turn off the pumps.")

		saynn("[say=pc]Feels good, cow?[/say]")

		saynn("[say=tavi]N-ny-yes.. h.h.. P-please..[/say]")

		saynn("Seems like she is getting close. Do you wanna push her further or stop there and deny her?")

		addButton("Enough", "That was enough milking for one time", "lact_pump_enough")
		addButton("Milk more", "Let the pumps milk Tavi fully", "lact_pump_more")
	if(state == "lact_pump_enough"):
		saynn("You decide to stop there and turn off the pumps anyway.")

		saynn("[say=tavi]Huff-f..[/say]")

		saynn("[say=pc]Sorry, Tavi. Your nips are already sore.[/say]")

		saynn("She is squirming in your embrace. But she doesn't fight it. The sensitivity probably slowly returns to her. When you carefully remove the pumps from her breasts, she arches her back from the sudden pressure change.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("[say=pc]Good kitty.[/say]")

		saynn("You give the feline some well-earned rest.")

		addButton("Continue", "See what happens next", "removepumpandend")
	if(state == "lact_pump_more"):
		saynn("And so you switch the pumps to the maximum setting, allowing them to go ham. Immediately, the quiet hum that they were producing, turns into audible suction noises. Tavi's passionate moans escape her.. while the milk flow increases substantially.")

		saynn("[say=tavi]Ah!..[/say]")

		saynn("[say=pc]Let go, little cow. Don't hold back.. Being milked is so-so nice.. So nice that you would moo for me, right?[/say]")

		saynn("With a blissful expression, she begins to emit soft, low moos, her cute voice and the mechanical noises filling the room.")

		saynn("[say=tavi]Moo-o..[/say]")

		saynn("No resistance, Tavi is just resting in your hands.. while the pumps pull all of the milk out of her breasts. Her mooing gets combined with her moans, she is quickly reaching her peak..")

		saynn("[say=pc]Cum like a good cow.. Just from being milked..[/say]")

		saynn("And so she throws her head back and parts her lips wide, producing loud long moos while her nips suddenly start squirting milk almost non-stop. Tavi's body is squirming hard while her pussy creates a big wet spot on the bedsheets, made entirely out of her juices.")

		saynn("Even after her orgasm, the breast pumps continue their work, drawing out every last drop of Tavi's sweet milk until her udders are fully drained.")

		saynn("[say=tavi]..moo..[/say]")

		saynn("With a final, satisfied moo, you turn off the pumps and let Tavi relax. She seems to be completely spaced out after that session. So you just cuddle her and whisper good things into her ears.")

		saynn("[say=pc]Good kitty.. very good..[/say]")

		saynn("[say=tavi]Mya..[/say]")

		saynn("Eventually she snaps out of it.")

		addButton("Continue", "See what happens next", "removepumpandend")
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

	if(_action == "lact_breastfeeding"):
		processTime(3*60)

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
		getModule("TaviModule").addCorruption(-2)

	if(_action == "lact_handmilking_more"):
		processTime(10*60)
		var milkAmount = getCharacter("tavi").milk()
		GM.pc.addSkillExperience(Skill.Milking, 10)
		
		addMessage("You milked Tavi for "+str(Util.roundF(milkAmount, 1))+" ml of milk")
		getModule("TaviModule").addCorruption(2)

	if(_action == "lact_breastfeeding_do"):
		processTime(10*60)
		GM.pc.breastFedBy("tavi", 0.4)
		GM.pc.addPain(-100)
		GM.pc.addStamina(100)
		GM.pc.addSkillExperience(Skill.Milking, 10)

	if(_action == "lact_breastfeeding_enough"):
		processTime(2*60)
		getModule("TaviModule").addCorruption(-2)

	if(_action == "lact_breastfeeding_more"):
		processTime(2*60)

	if(_action == "lact_breastfeeding_mommy"):
		processTime(10*60)
		getModule("TaviModule").addCorruption(2)
		GM.pc.breastFedBy("tavi")
		GM.pc.addPain(-100)
		GM.pc.addStamina(100)
		GM.pc.addSkillExperience(Skill.Milking, 10)

	if(_action == "lact_pump"):
		var pump = _args[0]
		breastPumpID = pump.getUniqueID()
		GM.pc.getInventory().removeItem(pump)
		getCharacter("tavi").getInventory().forceEquipStoreOther(pump)

	if(_action == "lact_pump_on"):
		processTime(6*60)
		var pump = getCharacter("tavi").getInventory().getItemByUniqueID(breastPumpID)
		getCharacter("tavi").stimulateLactation()
		var howMuchTransferred = getCharacter("tavi").getBodypart(BodypartSlot.Breasts).getFluids().transferTo(pump, 0.6)
		addMessage("The pump managed to milk Tavi's breasts for "+str(Util.roundF(howMuchTransferred))+" ml")
		GM.pc.addSkillExperience(Skill.Milking, 30)
		getCharacter("tavi").addEffect(StatusEffect.SoreNipplesAfterMilking)
		getCharacter("tavi").updateAppearance()

	if(_action == "lact_pump_enough"):
		processTime(2*60)
		getModule("TaviModule").addCorruption(-2)

	if(_action == "lact_pump_more"):
		processTime(6*60)
		var pump = getCharacter("tavi").getInventory().getItemByUniqueID(breastPumpID)
		getCharacter("tavi").stimulateLactation()
		var howMuchTransferred = getCharacter("tavi").getBodypart(BodypartSlot.Breasts).getFluids().transferTo(pump, 1.0)
		addMessage("The pump managed to milk Tavi's breasts for "+str(Util.roundF(howMuchTransferred))+" ml")
		GM.pc.addSkillExperience(Skill.Milking, 10)
		getCharacter("tavi").addEffect(StatusEffect.SoreNipplesAfterMilking)
		getCharacter("tavi").updateAppearance()
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
