extends SceneBase

var isStrapon = false
var straponHasCum = false

func _init():
	sceneID = "KidlatTalkScene"

func _run():
	if(state == ""):
		addCharacter("kidlat")
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("You stand in Kidlat's cell. Despite its overall blandness, it's still nice and cozy here.")

		var customGreet = getModule("DrugDenModule").getKidlatCustomTalkGreeting()
		if (customGreet == ""):
			saynn("[say=kidlat]Hey, luv![/say]")

		else:
			saynn("[say=kidlat]"+str(customGreet)+"[/say]")

		addButton("Chat", "Ask her a few things", "chat_menu")
		addButton("Sex", "See what lewd things you could do together", "sex_menu")
		addButton("Leave", "Time to go", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["kidlat"])
	if(state == "chat_menu"):
		saynn("What do you wanna chat about with Kidlat?")

		addButton("Alcohol", "Ask if she is still drinking", "ask_alcohol")
		addButton("Back", "Enough chatting", "")
	if(state == "ask_alcohol"):
		saynn("[say=pc]How are your dark thoughts, Kidlat? Still having to drown them out?[/say]")

		saynn("She shrugs.")

		saynn("[say=kidlat]Ehh. Some days are better than others. Sometimes I just can't help it.. you know?[/say]")

		saynn("Not everything is under our control.")

		saynn("[say=pc]I do. Just try not to make it into a habit.[/say]")

		saynn("[say=kidlat]Or what~?[/say]")

		saynn("You can just feel the bratty energy coming off of her.")

		saynn("[say=pc]Well.. it's hard to drink when your hands are cuffed behind your back.[/say]")

		saynn("You wink at her.")

		saynn("Kidlat chuckles and quickly pulls some cuffs and a half-done bottle.")

		saynn("[say=kidlat]Pff, try me![/say]")

		saynn("She hands you the cuffs and willingly brings her paws behind her back, waiting for you.")

		saynn("[say=pc]Why do you have these?[/say]")

		saynn("[say=kidlat]Uh.. Practice?[/say]")

		saynn("Sure.")

		addButton("Lock her paws", "See what she will be able to do with locked paws", "ask_alcohol_lock")
	if(state == "ask_alcohol_lock"):
		playAnimation(StageScene.SelfSuck, "tease", {pc="kidlat"})
		saynn("The cuffs make a satisfying click as you lock them around Kidlat's wrists, forcing her paws to stay behind her back. Then you just hand her a bottle and watch what she will do with it.")

		saynn("Determination and bratiness shines in her eyes as she lies down on the cold floor, near her bed, making sure to keep the bottle the right way up all the time.")

		saynn("With a theatrical roll, she arches her back and lifts her hips high, making her shirt slip up, exposing her fluffy belly.")

		saynn("You can see her muscles tensing up as she starts reaching her cuffed paws up high, bringing them both to the right side of her body and stretching them as far as they can reach.")

		saynn("At the same time, she reaches with her head too, trying to position it so the bottle's bottom is above her mouth.")

		saynn("Only now you realize how.. compromising.. of a position she decides to take. Her butt is high up, presented to you. She is wiggling it too, trying to win some extra precious inches.")

		addButton("Watch", "See what happens next", "ask_alcohol_drink")
	if(state == "ask_alcohol_drink"):
		playAnimation(StageScene.SelfSuck, "inside", {pc="kidlat"})
		saynn("After some time.. you begin to see her vision. She can't reach the bottle with her mouth.. but she can try to position her mouth under it.. and let gravity help with the rest.")

		saynn("Still, even with her natural feline agility, she can't quite reach it.. but then she parts her lips.")

		saynn("She eagerly darts her blue tongue as far as possible.. And wow.. yeah.. it's enough now.")

		saynn("Kidlat begins to carefully tilt the bottle.. and soon.. droplets of alcohol begin to land on her tongue. The sight is undeniably lewd.. her exposed butt, the subtle jiggle of her curves.. and that teasing expression on her face with her lips parted and her tongue out..")

		saynn("A quiet chuckle escapes her as she wiggles her shoulders, trying to maintain balance despite the awkward positioning. For a minute or so, she holds the pose.. cuffed paws raised, head and tongue reaching out.. allowing the cool liquid to drip onto her tongue.. more and more.")

		saynn("She did it, for sure.")

		saynn("[say=pc]Not bad. I believe you.[/say]")

		saynn("Just as slow and smooth as before, she begins to straighten her posture.. and lower her paws.")

		saynn("[say=kidlat]This flexible kitty can do many things~.[/say]")

		saynn("One thought is bugging your mind.. You just have to ask it.")

		saynn("[say=pc]..But can't you just place it somewhere and grab it with your mouth?[/say]")

		saynn("Kidlat blinks.. then blinks again..")

		saynn("[say=kidlat]What do you mea-.. Oh.. That makes a lot of sense actually. Derp.[/say]")

		saynn("She places the bottle on the edge of her bed.. then kneels in front of it and wraps her lips around the bottle's neck.. raising it with ease.")

		saynn("[say=kidlat]Bloody hell.. hic..[/say]")

		saynn("[say=pc]It's okay, there are many more ways to use that flexibility of yours.[/say]")

		saynn("She giggles, her cheeks blushing blue.")

		saynn("[say=kidlat]Haha, true~.[/say]")

		addButton("Uncuff", "Enough tricks", "ask_alcohol_uncuff")
	if(state == "ask_alcohol_uncuff"):
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("You help her to get up and then unlock her cuffs.")

		saynn("[say=kidlat]So yeah.. Some days just suck. You just fall and fall.. fail and fail.[/say]")

		saynn("She rubs her freed wrists and looks at you.")

		saynn("[say=kidlat]But each day when I get to see you instantly becomes better~.[/say]")

		saynn("[say=pc]I'm glad.[/say]")

		saynn("She nods.")

		setFlag("DrugDenModule.KidlatCustomTalkGreet", "Wanna see me bend again~?")
		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "sex_menu"):
		saynn("How do you want to have fun with the kitty?")

		if (GM.pc.hasReachablePenis()):
			addButtonWithChecks("Vaginal", "Fuck Kidlat's pussy", "sex_vag", [], [[ButtonChecks.HasReachablePenis]])
		else:
			addButtonWithChecks("Vaginal", "Fuck Kidlat's pussy with your picked strapon", "sex_vag_pick_strapon", [], [[ButtonChecks.HasStraponAndCanWear]])
		if (GM.pc.hasReachablePenis()):
			addButtonWithChecks("Cowgirl", "Kidlat will ride you with her pussy", "sex_cowgirl", [], [[ButtonChecks.HasReachablePenis]])
		else:
			addButtonWithChecks("Cowgirl", "Kidlat will ride your picked strapon with her pussy", "sex_cowgirl_pick_strapon", [], [[ButtonChecks.HasStraponAndCanWear]])
		if (getFlag("DrugDenModule.KidlatWearsPortalPanties")):
			addButton("Portal panties", "Ask her to take off the portal panties", "sex_takeoff_portal_panties")
		else:
			if (GM.pc.getInventory().hasItemID("PortalPanties")):
				addButton("Portal panties", "Ask Kidlat if she would want to wear portal panties", "sex_puton_portal_panties")
			else:
				addDisabledButton("Portal panties", "You don't have any..")
		if (GM.pc.getInventory().hasKnownTFPillWithEffect("GrowPenisTF")):
			addButton("Grow cock", "Give Kidlat one of your DiRecto pills and see if she will grow a cock.. Be ready to service her", "sex_cock")
		else:
			addDisabledButton("Grow cock", "You need a DiRecto pill in your inventory in order to temporary give Kidlat a cock")
		addButton("Back", "Never mind", "")
	if(state == "sex_puton_portal_panties"):
		playAnimation(StageScene.TFLook, "crotch", {pc="kidlat", bodyState={underwear=true}})
		saynn("You pull some unique-looking panties and present them to Kidlat.")

		saynn("[say=pc]Hey. Have you ever..[/say]")

		saynn("Her paws snatch the underwear piece from your hands.")

		saynn("[say=kidlat]Are these.. the portal panties?![/say]")

		saynn("Looks like she is aware of the concept..")

		saynn("[say=pc]How did you..[/say]")

		saynn("[say=kidlat]Can I maybe wear them?! Luv??[/say]")

		saynn("[say=pc]You're aware of things that can happen?[/say]")

		saynn("[say=kidlat]Yes.[/say]")

		saynn("Maybe she is counting on them happening.")

		saynn("[say=pc]Sure, they're yours.[/say]")

		saynn("[say=kidlat]Thank you, luv! Yay![/say]")

		saynn("Kidlat eagerly pulls her shorts off, boldly showing her aroused-looking pussy.. that she quickly covers up with your purple panties.")

		saynn("[say=kidlat]Ohh.. a bit cold.[/say]")

		saynn("[say=pc]And now you just wait.[/say]")

		saynn("[say=kidlat]Oki, hun![/say]")

		saynn("That was easy.")

		addButton("Continue", "See what happens next", "")
	if(state == "sex_takeoff_portal_panties"):
		saynn("[say=pc]Hey.. uh.. can I maybe have those panties back? I kinda need them.[/say]")

		saynn("Kidlat nods and pulls her shorts down, exposing the cute purple panties that follow soon after.")

		saynn("She then hands the high-tech underwear item to you.. while standing bare bottom..")

		saynn("[say=kidlat]There you go, hun! Thank you for letting me try them~. Such a unique experience, haha.[/say]")

		addButton("Continue", "See what happens next", "")
	if(state == "sex_vag_pick_strapon"):
		saynn("Pick which strapon you want to wear.")

		addStraponButtons("sex_vag_strapon_pick_pick")
		if (false):
			addButton("Nope", "You shouldn't see this", "sex_vag_strapon_pick_pick")
	if(state == "sex_cowgirl_pick_strapon"):
		saynn("Pick which strapon you want to wear.")

		addStraponButtons("sex_cowgirl_strapon_pick_pick")
		if (false):
			addButton("Nope", "You shouldn't see this", "sex_cowgirl_strapon_pick_pick")
	if(state == "sex_cowgirl"):
		playAnimation(StageScene.Duo, "stand", {npc="kidlat", npcBodyState={naked=true}, bodyState={hard=true, naked=true}})
		addCharacter("kidlat", ["naked"])
		if (!isStrapon):
			saynn("You lean casually against one of the walls and make Kidlat an offer while spotting a quiet, suggestive smile.")

		else:
			saynn("You pull out one of your strapon harnesses and casually lean against one of the walls.")

		saynn("[say=pc]How about a bit of a sexy time?[/say]")

		saynn("For a moment, Kidlat just stares.. But then, a playful grind spreads over her face as she walks up to you.")

		saynn("[say=kidlat]I'm always up for some sexy time~. Let me take the lead, luv..[/say]")

		saynn("She walks up to her personal bed while her paws work on unbuttoning and taking off her inmate shirt. The shorts come next, her clawed digits pull them down by the edges before making them land on a chair nearby. Now there is a fully naked Kidlat standing in front of you..")

		saynn("Her curvy breasts, complete with that cute heart-shaped dark spot, rise and fall with anticipation.. her hips shift invitingly. Just seeing that kitty like this already arouses you quite a bit.."+str(" Your hands secure a harness over your crotch, giving you a temporary cock.. perfect." if isStrapon else "")+"")

		addButton("Bed", "Time to get comfy", "sex_cowgirl_bed")
	if(state == "sex_cowgirl_bed"):
		playAnimation(StageScene.SexCowgirlAmazon, "tease", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You step forward and, without wasting another second, lie down onto the bed, getting comfy while Kidlat gets on top. There isn't much space above so she has to keep herself somewhat low.. but her feline agility helps her.")

		saynn("She leans forward more and offers you a great view of her breasts while her paws trail slowly over your {pc.masc} torso, teasing and exploring. Then, with an almost mischievous glint in her eyes, she adjusts her position until her wet, needy slit aligns perfectly with your "+str("hard length.. The tip of your cock kissing her sensitive lips, drawing little noises of affection from the feline." if !isStrapon else "new rubber length.. the tip is kissing her sensitive lips, drawing little noises of affection from the feline.")+"")

		saynn("[say=kidlat]Mmhh..[/say]")

		saynn("She seems to be quite eager.")

		addButton("Continue", "See what happens next", "sex_cowgirl_bed_sex")
	if(state == "sex_cowgirl_bed_sex"):
		playAnimation(StageScene.SexCowgirlAmazon, "sex", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("She uses two of her digits to hold the "+str("shaft of your {pc.penis}" if !isStrapon else "rubber shaft")+" still as she slowly lowers her body.. putting more and more pressure on her slit with your dick.. until the tip slides in.")

		saynn("[say=kidlat]Ah~.. There you go, luv..[/say]")

		saynn("She gradually lowers herself more.. letting her tight inner walls to wrap around "+str("you, sending waves of electric pleasure pulsing through your body" if !isStrapon else "your strapon, sending subtle waves of pleasure pulsing through your body")+". You feel her soft, wet heat gripping "+str("you" if !isStrapon else "your rubber cock")+" as she leans a bit forward, her eyes locked onto yours with unmistakable lust.")

		saynn("[say=kidlat]"+str("Just enjoy it.." if !isStrapon else "I will enjoy this..")+"[/say]")

		saynn("Her hips begin a slow, deliberate rhythm.. up and down.. flowing motions that gradually build up to a steady pace. With every rise and fall, her {kidlat.breasts} begin to bounce more, her nips looking stiff and hard.")

		saynn("[say=kidlat]Mmm~..[/say]")

		saynn("The hungry kitty can't get enough, riding your "+str("hard" if !isStrapon else "rubber")+" cock, trying to engulf more and more of its length.. Her movements are more like a wild dance of passion by now, her moans echoing around the lilac cell.")

		addButton("Continue", "See what happens next", "sex_cowgirl_bed_fast")
	if(state == "sex_cowgirl_bed_fast"):
		playAnimation(StageScene.SexCowgirlAmazon, "fast", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("As she rides you faster, the rhythm intensifies.. her pussy squeezing around your length with every thrust. Your "+str("cock" if !isStrapon else "toy")+" kneads her pleasure spot so well.. while the tip is smashing into her natural barricade, creating a little temporary bump on her belly.")

		saynn("She holds onto your legs for support, bringing herself down nice and hard.. All the while you're just admiring the great view and enjoying her wet tightness. "+str("Your cock throbs subtly with each of her motions.. your breathing is getting deeper." if !isStrapon else "Your strapon is obviously not sensitive.. but you still feel the pressure that the harness puts on your crotch as she rides you.. your breathing is getting deeper.")+"")

		saynn("[say=kidlat]..hah.. I'm close.. meow..[/say]")

		saynn("Her murmur fans the flames of your desire.. making you want to meet her motions with the thrusts of your own hips, driving that"+str(" rubber" if isStrapon else "")+" cock deeper inside.."+str(" a cock that's throbbing more and more." if !isStrapon else "")+"")

		if (!isStrapon):
			saynn("[say=kidlat]You can cum inside me if you want, luv.. ah.."+str(" I'm pregnant anyway already.." if getCharacter("kidlat").isVisiblyPregnant() else "")+"[/say]")

			saynn("That's an invitation you have no right to pass up.")

			addButton("Orgasm", "Stuff that pussy full", "sex_cowgirl_cum")
		else:
			addButton("Orgasm", "Stuff that pussy full", "sex_cowgirl_cum")
	if(state == "sex_cowgirl_cum"):
		playAnimation(StageScene.SexCowgirlAmazon, "inside", {pc="pc", npc="kidlat", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You put your hands on her hips.. and then.. with one final motion, bring her fully down onto your length.")

		saynn("[say=kidlat]Ah, b-bloody!..[/say]")

		if (!isStrapon):
			saynn("Her slick pussy clenches hard around you.. pulsing at a rate of her heartbeat.. while your body can't hold back any longer. During a forceful, primal release, your {pc.penis} starts throbbing, pumping her inviting womb with wave after wave of your seed.")

			saynn("At the same time, she throws her head back and lets out a passionate noise of love, her body shaking with immense pleasure, orgasmic sensations overwhelming her mind.")

			saynn("Time seems to slow down as both of you are riding your orgasms to your ends.. while cramped in this tight space that can barely contain you two. Even after Kidlat's squirming subsides, she still sits on you, your full length inside her, trapping most of the {pc.cum} inside..")

		else:
			saynn("Her slick pussy clenches hard around your rubber cock.. pulsing at a rate of her heartbeat.. while you're grunting from pressure.. pleasurable pressure.")

			saynn("Kidlat throws her head back and lets out a passionate noise of love, her body shaking with immense pleasure, pussy squirting juices all over your crotch, orgasmic sensations overwhelming her mind.")

			saynn("Time seems to slow down as she rides her orgasm to her end.. while cramped in this tight space that can barely contain you two. Even after Kidlat's squirming subsides, she still sits on you, the full length of your strapon inside her..")

		saynn("[say=kidlat]Hah.. that feels good, luv..[/say]")

		saynn("You remain still like this for a while longer, basking in the lingering electric sensations.. both panting..")

		addButton("Continue", "See what happens next", "sex_cowgirl_after")
	if(state == "sex_cowgirl_after"):
		playAnimation(StageScene.Sleeping, "sleep", {pc="pc", npc="kidlat", bodyState={naked=true}, npcBodyState={naked=true}})
		if (!isStrapon):
			saynn("Slowly, Kidlat raises herself up off of your cock. Your seed quickly begins to drip out of her stuffed slit.")

			saynn("[say=kidlat]So much.. hah.[/say]")

		else:
			saynn("Slowly, Kidlat raises herself up off of your strapon.. and helps you to take it off.. her cyan pussy still pulsing faintly.")

			saynn("[say=kidlat]Hah.. so wet..[/say]")

		saynn("Kidlat flops onto you, exhausted.. but seemingly satisfied.")

		saynn("[say=kidlat]Nyaa..[/say]")

		saynn("You wrap your arms around her and hold her close.")

		saynn("You spend more time like this, recovering.. until it was time to get up.")

		setFlag("DrugDenModule.KidlatCustomTalkGreet", "Hey, luv. That was fun, what we did last time~.")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "sex_vag"):
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("It suddenly becomes quiet in Kidlat's cell.. but silence has its purpose.. it creates tension.. electric tension that the kitty quickly notices.")

		saynn("Your eyes fixate on her.. and her cute feline maw.. beautiful fluffy curves. You're blatantly staring at her covered up breasts and shorts.")

		saynn("As your stares collide, a deep cyan blush spreads across her cheeks. She offers you a friendly smile.")

		saynn("[say=kidlat]Hey, luv..[/say]")

		saynn("You don't respond, just eyeing her over constantly, your eyes showing.. hunger.")

		saynn("For a short, eternal moment, you two remain still. Kidlat loses first, her body trembling ever so slightly.")

		addButton("Grab her", "Show her who is the boss here", "sex_vag_grab")
	if(state == "sex_vag_grab"):
		addCharacter("kidlat", ["naked"])
		playAnimation(StageScene.SexAgainstWall, "tease", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Then, in a sudden, decisive moment, your hand darts to grab her by the collar.. You only see the flashes of her blue and purple eyes.. before your primal desire takes over.")

		saynn("The next moment you know it, Kidlat is under you, pinned into the floor by your body and hands. Her legs are raised high, trapped between you and her by your shoulders, giving you full exclusive to every inch of her slick cyan slit.")

		if (!isStrapon):
			saynn("Your {pc.penis} is already out, twitching over her sex, the tip spotting a little shiny drop of pre. You already align it with her entrance, one moment from penetrating..")

		else:
			saynn("Your strapon is already out and ready, the harness secured around your waist, the rubber tip aligned with her entrance, one moment from penetrating.")

		saynn("[say=kidlat]Eek.. ah.. that was so qui-..[/say]")

		addButton("Thrust inside", "Be fast", "sex_vag_sex")
	if(state == "sex_vag_sex"):
		playAnimation(StageScene.SexAgainstWall, "sex", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Without letting her finish her sentence, you do a quick, force thrust of your hips, your"+str(" rubber" if isStrapon else "")+" cock plunging deep into her exposed pussy, spreading the wet folds wide. Kidlat gasps sharply as the sudden sensation swipes through her, igniting every nerve in her body.")

		saynn("[say=kidlat]Ah![/say]")

		saynn("Her body reacts immediately.. Tight, sensitive walls of her pussy contract eagerly around your"+str(" new" if isStrapon else "")+" length, coating it with her wetness.")

		saynn("[say=kidlat]You're such a brute.. hah..[/say]")

		saynn("That's the only bratty thing she manages to say between her gasps. But even that is quickly lost as you begin a relentless, rough rhythm, pretty much fully pulling your "+str("cock" if !isStrapon else "strapon")+" out.. before ramming it back inside.")

		saynn("Each forceful thrust sends waves of intense pleasure crashing over Kidlat, her inner walls clench powerfully, drawing you deeper. Her paws hold onto your {pc.masc} chest, brushing along the curves of your {pc.breasts}. The sounds of her moans, panting as well as the sharp plaps fill the tiny cell, echoing off the walls.")

		addButton("Faster", "Make that kitty squirm", "sex_vag_sex_fast")
	if(state == "sex_vag_sex_fast"):
		playAnimation(StageScene.SexAgainstWall, "fast", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		var hasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		saynn("Your trusts become faster, each one full of your primal energy. Your low grunts vibrate inside Kidlat's ears, sending extra shivers of submission through her.")

		saynn("[say=kidlat]U-use me.. ah..[/say]")

		saynn("Her moans carry more passion with them, her body is trying to squirm under your onslaught.. but you're holding her pinned still, primed for what will happen soon.")

		saynn("[say=kidlat]..use me like the slut that I am.. ah f-fuck..[/say]")

		saynn("Her pussy spawns a sudden torrent of juices.. inner walls clenching hard, gripping your "+str("cock" if !isStrapon else "rubber shaft")+".. while you're pushing through the resistance, pounding her squirting cunt.")

		saynn("[say=kidlat]Breed me!.."+str(" B-breed me more!" if getCharacter("kidlat").isVisiblyPregnant() else " Please!")+"[/say]")

		if (isStrapon):
			saynn("Looks like the fucking has made her mind go silly already.")

		elif (hasKnot):
			saynn("The knot as the base of your cock inflates with blood.. making it impossible to fit it in..")

		else:
			saynn("You're close.. you can feel it.. Her begging wouldn't change a thing.")

		addButton("Inside", "Breed that mew", "sex_vag_sex_cum")
	if(state == "sex_vag_sex_cum"):
		playAnimation(StageScene.SexAgainstWall, "fast", {pc="pc", npc="kidlat", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		var hasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		if (isStrapon):
			saynn("In one final burst of primal energy, you shove your whole strapon inside, stretching Kidlat's folds wide as the rubber tip breaks inside her womb.")

		elif (hasKnot):
			saynn("In one final burst of primal energy, you shove your full length inside, the knot stretching Kidlat's folds wide enough to suddenly slip in, locking you and her together!")

		else:
			saynn("In one final burst of primal energy, you shove your full length inside, stretching Kidlat's folds wide as the tip of your cock breaks inside her womb.")

		saynn("[say=kidlat]Hhhah..h-..[/say]")

		if (!isStrapon):
			saynn("Your rough motion sends her into another climactic frenzy, her inner walls clenching around your throbbing cock.. until a storm of your seed unleashes from it, flooding Kidlat's insides with slow pulsing motions. You growl into Kidlat's ear while she is squirming from intense stretching and stuffing, her tongue is out and drooling while lots of little moans and pants leave her mouth.")

		else:
			saynn("Your rough motion sends her into another climactic frenzy, her inner walls clenching around your rubber cock.."+str(" until a storm of your seed unleashes from it, flooding Kidlat's insides with slow pulsing motions." if straponHasCum else "")+" You growl into Kidlat's ear while she is squirming from intense stretching and stuffing, her tongue is out and drooling while lots of little moans and pants leave her mouth.")

		saynn("[say=kidlat]F-fu.. ah.. sh.. hh.. y-yes.. hh.. nya-a-a..[/say]")

		saynn("Even after her cunt has stopped"+str(" milking your balls dry.. you remain inside her, enjoying the tightness" if !isStrapon else " trying to milk your cock dry.. you remain inside her, enjoying the friction")+". Clarity returns to your mind.. Your hearts are beating like crazy.")

		saynn("[say=kidlat]Bloody.. ah.. 'ell.. hun..[/say]")

		addButton("Pull out", "Enough breeding", "sex_vag_sex_cum_pullout")
	if(state == "sex_vag_sex_cum_pullout"):
		playAnimation(StageScene.SexAgainstWall, "tease", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		var hasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		if (isStrapon):
			saynn("After using the kitty as your cockwarmer for some time, you finally pull out.. causing another torrent of fluids from Kidlat's used pussy.. Your strapon is fully covered in her juices.")

		elif (hasKnot):
			saynn("It takes some trying.. but eventually you manage to yank your fat knot out.. causing another torrent of fluids from Kidlat's stuffed pussy.. this time a mix of her juices and your {pc.cum}.")

		else:
			saynn("After using the kitty as your cockwarmer for some time, you finally pull out.. causing another torrent of fluids from Kidlat's stuffed pussy.. this time a mix of her juices and your {pc.cum}.")

		saynn("Her eyes keep wanting to roll up, her tongue still out, her tail wraps around your leg.")

		saynn("[say=kidlat]Ahh.. nyaa.. my pussy.. used so thoroughly..[/say]")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("[say=kidlat]ha.. ha.. I will bap..[/say]")

		saynn("You smile and tickle her under the chin.")

		saynn("It was time to wrap up though.. You help the feline to get up. Her legs are quite shaky.")

		setFlag("DrugDenModule.KidlatCustomTalkGreet", "My pussy still aching, luv.. hai..")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "sex_cock"):
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("A curious idea crosses your mind. You have some of those weird pills.. Why not try one of those on Kidlat.. a safe one that you know for sure works.")

		saynn("[say=pc]Kidlat, I've got something..[/say]")

		saynn("[say=kidlat]Luv?[/say]")

		saynn("Your hand produces a pill.. one that is missing any kind of labels or instructions. You hold it on your open palm, presenting.")

		saynn("[say=kidlat]Oh, I might have spent most of my time in the drug den.. But I'm not a junkie, hun![/say]")

		saynn("[say=pc]It's safe, these are not the addictive kind. But this one does have an interesting effect.[/say]")

		saynn("Kidlat raises a brow, her stare skeptical.")

		saynn("[say=kidlat]What effect?[/say]")

		saynn("[say=pc]I guess you will have to try it to find out.[/say]")

		saynn("Avoiding the question made the kitty pout and cross her arms. She squints at you, trying to look mean and intimidating. Her tail is wagging actively behind her back, lips are trembling.. subtle growling vibrates the cell.. It feels like she is about to bite you really hard..")

		saynn("[say=pc]So?[/say]")

		saynn("[say=kidlat]Fine![/say]")

		saynn("She swipes the pill from your hand and tosses it into her mouth..")

		saynn("That was easy.")

		saynn("Let's see what curiosity will do with this cat.")

		addButton("Continue", "See what happens next", "sex_cock_tf")
	if(state == "sex_cock_tf"):
		playAnimation(StageScene.TFLook, "crotch", {pc="kidlat"})
		saynn("[say=kidlat]What now, luv?.. Oh..[/say]")

		saynn("It doesn't take long for her to feel something. Her paws dart towards her shorts.. clearly towards the source of some kind of new sensation..")

		saynn("[say=kidlat]It.. tingles.. hah.. Is that bad?[/say]")

		saynn("[say=pc]Just wait, Kidlat. This is expected.[/say]")

		saynn("Well, you weren't exactly sure about it.. but you gotta look confident.")

		saynn("Kidlat's new tingling feeling seems to be growing like a wildfire. She closes her legs and grabs onto her crotch, panting deeply. Her cheeks are blushing. Something is certainly changing about her.. awakening.")

		saynn("Before her eyes, her familiar contours begin to change. The delicate softness between her legs tightens and morphs.. at this point even you can notice something new putting pressure on the cloth of her shorts.. bulging them out in the crotch region.")

		saynn("[say=kidlat]What is.. this.. ah..[/say]")

		saynn("As she touches herself down there, a moan leaves her lips, a little wet spot appears on the cloth.")

		saynn("[say=pc]I think there is only one way to find out.[/say]")

		addButton("Continue", "See what happens next", "sex_cock_reveal")
	if(state == "sex_cock_reveal"):
		playAnimation(StageScene.TFLook, "crotch", {pc="kidlat", bodyState={naked=true, hard=true}})
		addCharacter("kidlat", ["naked"])
		saynn("As she swiftly pulls her shorts down.. a breathtaking sight takes place.")

		saynn("Kidlat stares at a thick, canine cock that's now hanging between her legs, complete with pulsing veins, two fluffy orbs, a pointy tip and a fat orb at the base of the shaft.")

		saynn("[say=kidlat]Woah.. bloody..[/say]")

		saynn("There sure is blood rushing to it, her new.. cock.. is hard as a rock, twitching and leaking pre. Kidlat stares at it with her big feline eyes, her lips parted.")

		saynn("Hard to tell what she is thinking.. but her body tells you a few curious things. Her blue nips are stiff, her pussy that is still seemingly there behind her new package.. is dripping with juices onto the floor.")

		saynn("[say=kidlat]I have.. a fuckin' dick.. a huge throbbing cock..[/say]")

		saynn("Her paw reaches out and gently grasps her new length.. which sends a shiver rippling through her, legs shivering a little, cock pulsing. Her blush deepens greatly, her eyes admiring that length while her tongue drools a little..")

		saynn("One stroke of her paw.. makes her arch her back.")

		saynn("[say=kidlat]Ah~.. that feels.. so bloody good..[/say]")

		addButton("Just watch", "Watch Kidlat play with her new cock", "sex_cock_watch")
		if (getCharacter("kidlat").isWearingPortalPanties() && GM.pc.getInventory().hasItemID("PortalPantiesFleshlight")):
			addButton("Portal panties", "Kidlat has portal panties.. why not give her the portal fleshlight as well and see what she will do with it?", "sex_cock_portal_panties")
		else:
			addDisabledButton("Portal panties", "Either Kidlat is not wearing portal panties or you don't have a portal fleshlight to offer to her")
	if(state == "sex_cock_watch"):
		playAnimation(StageScene.Grope, "watchstroke", {pc="kidlat", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You decide to just watch.. and see what she will do with her new.. toy. Kidlat is too preoccupied with it anyway to pay any attention to you.")

		saynn("With a trembling paw, she begins to stroke her new.. impressive.. cock more. At first, her touches are soft and careful, exploring every new contour.. the digits brushing along the veiny texture.. rubbing along the many sensitive creases. She bites her lip, her eyes horny..")

		saynn("[say=kidlat]Mhh.. I h-have to know..[/say]")

		saynn("As the urge increases, her strokes become more confident.. more urgent. Her paw is sliding along the new length while her soft, feminine moans fill the small cell, blending with the wet, rhythmic sound of flesh.. Each caress sends shivers through her body, her nipples hardening further as pleasure ignites every nerve ending. Her second paw reaches to her breasts and begins playing with them, adding to the sensations..")

		saynn("[say=kidlat]I have to know how it feels.. ah..[/say]")

		saynn("Her initial exploration is now a display of desire. Kidlat leans against a wall and raises unsteadily to her toes and keeps stroking her length, her body squirming hard. There are ropes after ropes of thick pre spawning at the tip of that cock.. Some of them get caught by Kidlat and spread along the shaft.. while the rest just keep hanging or drop onto the floor.")

		saynn("Her hips can't stay still, helping her paw by meeting the stroking motions with her thrusts.. humping her hand. Her movements are growing faster and more insistent with every passing moment, her moans illuminating the whole room. As she nears the peak, the thick knot at the base begins to inflate, engorging with blood.")

		saynn("[say=kidlat]Feels to.. ah.. to.. ah..[/say]")

		addButton("Continue", "See what happens next", "sex_cock_stroke_cum")
	if(state == "sex_cock_stroke_cum"):
		playAnimation(StageScene.Grope, "watchstroke", {pc="kidlat", npc="pc", pcCum=true, bodyState={naked=true, hard=true}})
		saynn("Then, in one shattering moment of pure ecstasy, Kidlat's body succumbs.")

		saynn("[say=kidlat]..Cum-m-m~.. Ah-h..[/say]")

		saynn("With a passionate moan and a final, powerful motion, she cums hard. Her canine cock starts throbbing hard.. her balls tensing up.. as thick strings of seed arc from the tip, spattering the cold, hard floor beneath her. She just keeps moaning and squirming as her balls tense up more, her shaft still shooting seed for a while longer, leaving her gasping and panting, her entire body trembling from the force of the orgasm.")

		saynn("For a few long, breathless seconds, she remains standing there.. still barely believing her eyes.. seemingly spent..")

		saynn("[say=pc]You sure look like you enjoyed it. If you want it undone..[/say]")

		saynn("Kidlat's eyes still have that spark in them.. spark of craziness..")

		addButton("Continue", "See what happens next", "sex_cock_stroke_more")
	if(state == "sex_cock_stroke_more"):
		playAnimation(StageScene.Zonked, "strokecum", {pc="kidlat", npc="pc", pcCum=true, bodyState={naked=true, hard=true}})
		saynn("Kidlat isn't finished yet.. Even as exhaustion tugs at every muscle of her body, she slides gracefully to the cold floor, her muscles unable to hold her weight anymore.. and yet.. every fiber of her being is shining with raw desire.")

		saynn("Her new canine cock begins to get hard again under the slick, eager touch of her paws.. both paws this time. With a desperate hunger, she resumes stroking herself, her digits tightly wrapping around her veiny shaft.")

		saynn("[say=kidlat]P-please..[/say]")

		saynn("Wet noises spread throughout the whole cell, coupled together with her cute moans. She just can't get enough of this feeling, huh..")

		saynn("She raises her legs high, offering you a view of her pussy that's still hiding behind the new fluffy orbs. Her neglected slit is pulsing.. dripping with arousal..")

		saynn("[say=kidlat]Ah.. hah.. ah-..[/say]")

		saynn("Driven by an insatiable need, Kidlat's strokes grow faster, her body arching and writhing like a wild, untamed creature. The heat within her rises rapidly, her cock's fat knot inflating with blood yet again.. a knot that her paws aren't afraid to squeeze..")

		saynn("[say=kidlat]Fuck-k-k..[/say]")

		saynn("Then, when the heat becomes too strong, it happens.. Kidlat arches her back hard.. her body convulsing in an overwhelming second orgasm as her cock spasms and shoots thick, shiny strings of seed that splatter onto her own belly.")

		saynn("[say=kidlat]Nya-a-a-a~..[/say]")

		saynn("Her eyes roll up, drooly tongue fully out.. she can barely comprehend it.. cumming her thoughts away. Her body just keeps shaking and shivering, her mouth producing moans and pants at an alarming rate.. her balls getting milked dry.. probably fully dry this time.")

		addButton("Continue", "See what happens next", "sex_cock_stroke_after")
	if(state == "sex_cock_stroke_after"):
		playAnimation(StageScene.Zonked, "cum", {pc="kidlat", npc="pc", bodyState={naked=true, hard=true}})
		saynn("When her dick finally stops leaving a mess everywhere, Kidlat just.. slumps.. her muscles still twitching.. but not responding.. not anymore. You only have one thing to say.")

		saynn("[say=pc]Wow. You are one needy cat.[/say]")

		saynn("She chuckles.. and moans again as her belly tenses up from giggling.")

		saynn("[say=kidlat]That felt.. fucking brilliant.. I want more..[/say]")

		saynn("[say=pc]I think you had enough, Kidlat.[/say]")

		saynn("Her paw reaches out to her cock.. but gives up and just gathers a bit of her own seed, drawing it to her lips. She licks her fingers eagerly, the taste brings a look of fierce satisfaction to her eyes.")

		saynn("[say=kidlat]Meow..[/say]")

		saynn("[say=pc]Don't tell me you wanna keep it.[/say]")

		saynn("[say=kidlat]Hah.. I think it's best if I don't..[/say]")

		saynn("She looks at you with her exhausted eyes.")

		saynn("[say=kidlat]It's not permanent, right?..[/say]")

		saynn("[say=pc]Not unless you eat another pill. I suggest you go see a doctor.[/say]")

		saynn("[say=kidlat]Okay-y-y..[/say]")

		saynn("You help her to get up.. and pull the shorts up. Her legs are still swaying like crazy.")

		saynn("[say=kidlat]I know where it is, luv..[/say]")

		setFlag("DrugDenModule.KidlatCustomTalkGreet", "That was.. crazy.. last time.. do you have another pill, luv?..")
		addButton("Continue", "See what happens next", "sex_cock_tf_back")
	if(state == "sex_cock_tf_back"):
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("Kidlat returns after some time.. her shorts don't have that obvious bulge on them any more.")

		saynn("That was fun.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "sex_cock_portal_panties"):
		playAnimation(StageScene.SexPortalOral, "tease", {pc="kidlat", bodyState={underwear=true, hard=true}, onlyRight=true})
		saynn("You decide to get her attention.. to guide her a little bit.")

		saynn("[say=pc]You still have the panties I gave you?[/say]")

		saynn("Kidlat pulls her attention from her cock.. and looks at you.")

		saynn("[say=kidlat]Oh? Yeah, I have them, luv.. why?[/say]")

		saynn("[say=pc]Pull them up.. just not fully.[/say]")

		saynn("She tilts her head a bit.")

		saynn("[say=kidlat]Is there some..[/say]")

		saynn("[say=pc]You will see.[/say]")

		saynn("The curiosity wins over yet again. Kidlat pulls her panties back on, covering up some of her privates.. her pussy and tailhole specifically.. letting her new hard cock to hang free, her testicles twitching a bit in anticipation for something.")

		saynn("[say=kidlat]There you go, luv..[/say]")

		saynn("While she was doing that, you were preparing a different device.. your hands are calibrating a fleshlight, a special one. You adjust the frequency to match that of the portal that is neatly pressed against Kidlat's most sensitive opening..")

		saynn("After doing it, you turn the fleshlight on, making it light up and open a little portal on one of its ends. Kidlat is still busy staring at her new cock.. but your action has pulled a soft gasp out of her.")

		saynn("[say=kidlat]Ah.. It's windy here..[/say]")

		saynn("You chuckle and just hand her the fleshlight.")

		saynn("[say=kidlat]Oh? What in the..[/say]")

		saynn("She grabs the device and looks into the glowing portal.. inside it.. is seemingly an exact replica of her dripping, cyan pussy.. each fold, each detail captured with unnerving precision..")

		saynn("Kidlat's eyes widen in startled surprise as she holds the fleshlight closer to her face. Her gaze wanders along the curves of her own exposed cyan pussy that's displayed on the futuristic toy.")

		saynn("[say=kidlat]Is that my..[/say]")

		saynn("From this point on, you just watch.. curious about what she will do with her new toys.")

		addButton("Continue", "See what happens next", "sex_cock_portal_panties_lick")
	if(state == "sex_cock_portal_panties_lick"):
		playAnimation(StageScene.SexPortalOral, "lick", {pc="kidlat", bodyState={underwear=true, hard=true}, onlyRight=true})
		saynn("Unable to resist, Kidlat brings the toy up to her mouth and lets her tongue flick out, tasting the wet sensitive flesh. Within moments, a soft moan escapes her lips as she realizes.. this isn't a replica..")

		saynn("[say=kidlat]Ah..[/say]")

		saynn("She keeps lapping along her folds, barely believing what she is feeling. You watch in great detail as her rough feline tongue does little circles, following the contours of her slit.. of her clit.")

		saynn("Her neglected cock is pulsing hard by now, the overwhelming stimulation is making her legs go weak.")

		saynn("She looks down at her cock.. and then at the toy in her paws.. and puts the two and two together.")

		saynn("[say=kidlat]I.. I must..[/say]")

		addButton("Continue", "See what happens next", "sex_cock_portal_panties_sit")
	if(state == "sex_cock_portal_panties_sit"):
		playAnimation(StageScene.FleshlightSit, "tease", {pc="kidlat", bodyState={underwear=true, hard=true}})
		saynn("Kidlat sits on a chair.. and begins experimenting.")

		saynn("She moves the fleshlight towards the tip of her cock, pointy fleshy head pressing gently against the rim of her slick pussy. As her cock makes contact, the soft folds of her slit spread invitingly, parting under prodding. Every subtle movement seems to send ripples of pleasure through her body..")

		saynn("[say=kidlat]Bloody hell.. Why did you give it to me..[/say]")

		saynn("[say=pc]Have fun, luv.[/say]")

		saynn("Her cheeks are blushing hard.. while you offer her a cheeky smile.")

		addButton("Continue", "See what happens next", "sex_cock_portal_panties_slide")
	if(state == "sex_cock_portal_panties_slide"):
		playAnimation(StageScene.FleshlightSit, "sex", {pc="kidlat", bodyState={underwear=true, hard=true}})
		saynn("Unable to stop anymore, Kidlat teases herself further. She slowly starts to slide her new cock inside her own wet depths, the tip disappearing into the velvety softness, her folds hugging the veiny shaft quite nicely.")

		saynn("[say=kidlat]F-fuck.. me..[/say]")

		saynn("After getting most of it inside, she starts moving the fleshlight back and forth along the length of her cock, still at a slow pace.. but even that is enough to make her start producing passionate moans, her back arching a bit on that chair while her toes keep wanting to curl up or spread wide.")

		addButton("Continue", "See what happens next", "sex_cock_portal_panties_slide_fast")
	if(state == "sex_cock_portal_panties_slide_fast"):
		playAnimation(StageScene.FleshlightSit, "fast", {pc="kidlat", bodyState={underwear=true, hard=true}})
		saynn("Each inch of her cock that enters her own pussy is met with a tender yet insistent squeeze from her slick inner walls, which contract around her length, coating it with a layer of her wetness.")

		saynn("[say=kidlat]Ah.. hah.. I can't stop.. hun..[/say]")

		saynn("[say=pc]You don't have to, hun.[/say]")

		saynn("[say=kidlat]I will bap you so hard.. ah..[/say]")

		saynn("Her current activity has a much bigger priority than bapping anyone and you know it.")

		saynn("As the pleasure begins to build, the knot at the best of her cock starts to respond.. swelling into a fat meaty orb that is impossible to ignore. More and more blood rushes into it, inflating it until it starts to strain against her sensitive pussy folds, unable to get past them.")

		saynn("[say=kidlat]My pussy is so bloody tight.. I have to..[/say]")

		saynn("Even to your eyes it looks a bit too big to fit inside that cute little pussy.. but Kidlat keeps trying, putting more and more pressure, pounding her own cunt with her own canine cock.. getting quite desperate.")

		addButton("Continue", "See what happens next", "sex_cock_portal_panties_slide_cum")
	if(state == "sex_cock_portal_panties_slide_cum"):
		playAnimation(StageScene.FleshlightSit, "cum", {pc="kidlat", bodyState={underwear=true, hard=true}})
		saynn("And then.. with one forceful motion.. she forces the swollen knot deep inside herself, stretching her pussy out enough to slide her whole cock in.")

		saynn("[say=kidlat]..AH!.. F-fuck!.. It's in!.. Ah-h..[/say]")

		saynn("She throws her head back and lets out a passionate cry of pleasure, her body arching itself back, really testing how sturdy that chair is underneath. Her paw pulls and pushes on the fleshlight more.. but it's stuck for good, her inner walls pulse and squeeze her own cock, driving her toward a peak in an instant.")

		saynn("You can see the exact moment she cums.. Her balls tense up hard as her cock starts throbbing and pumping her own pulsing pussy full of creamy virile seed, stuffing her womb full of it.. and then more.. and more.")

		saynn("[say=kidlat]I'm c-cumming.. ss-so much.. f-fuck.. ahh-h-.. I c-can't.. s-stop..[/say]")

		saynn("She writhes around on that chair like crazy, her pussy being stimulated by her own cock extends her orgasm far beyond a normal one, causing her to moan and pant into the air while her balls are being milked and drained by the inner walls squeezing her knot.")

		saynn("You can see the throbbing outline of her cock showing up on her belly.. there is just not enough space inside her to fit it all.. with so much cum and all..")

		saynn("[say=kidlat]Nya-a-a..[/say]")

		saynn("Every fiber of her being seems to be receiving shockwaves of ecstasy.. she just keeps riding and riding these waves of raw, unrestrained pleasure.. cumming all her thoughts away..")

		saynn("Eventually, the feedback loop begins to slow down.. finally..")

		addButton("Continue", "See what happens next", "sex_cock_portal_panties_slide_after_cum")
	if(state == "sex_cock_portal_panties_slide_after_cum"):
		playAnimation(StageScene.FleshlightSit, "inside", {pc="kidlat", bodyState={underwear=true, hard=true}})
		saynn("As the climax begins to subside, turning into a lingering afterglow, Kidlat continues to moan and squirm, her worn out body getting quite exhausted by now.")

		saynn("[say=kidlat]Fuck.. s-so much..[/say]")

		saynn("[say=pc]Looks like you had a lot of fun there.[/say]")

		saynn("[say=kidlat]Pff.. yea.. I can still feel my pussy clenching around my cock.. f-fuck that feels good.. ahh-h..[/say]")

		saynn("She tugs on the fleshlight, trying to pull out.. but finds it quite difficult.")

		saynn("[say=kidlat]Ah.. w-why did I knot myself..[/say]")

		saynn("[say=pc]You regret it?[/say]")

		saynn("[say=kidlat]No.. I would do it again.. and again.. and another time more maybe..[/say]")

		saynn("She is panting heavily.")

		saynn("[say=kidlat]It will deflate? Right, luv?..[/say]")

		saynn("[say=pc]I mean.. as long as you don't think about how good it feels.. knotting your own pussy..[/say]")

		saynn("Kidlat shifts around on her chair.")

		saynn("[say=pc]..cumming inside your own pussy.. stuffing it feel of your seed..[/say]")

		saynn("Kidlat huffs and moans more.")

		saynn("[say=kidlat]I will bite you-u-u-u..[/say]")

		saynn("You can't hide the smile while the poor kitty is squirming hard.")

		saynn("[say=pc]Why did you grow a canine cock anyway? Aren't you a cock?[/say]")

		saynn("[say=kidlat]Damned if I knew.. Not complainin' though..[/say]")

		addButton("Continue", "See what happens next", "sex_cock_portal_panties_slide_after_pullout")
	if(state == "sex_cock_portal_panties_slide_after_pullout"):
		playAnimation(StageScene.FleshlightSit, "tease", {pc="kidlat", bodyState={underwear=true, hard=true}})
		saynn("You spend some time together, chatting on unrelated topics, waiting for Kidlat's cock to go soft..")

		saynn("When it finally does, she finally pulls it out of her pussy, causing a flood of cum to spawn from it.")

		saynn("[say=kidlat]Ah.. shit..[/say]")

		saynn("[say=pc]You were pretty pent up, huh.[/say]")

		saynn("[say=kidlat]Yeah..[/say]")

		saynn("She looks at her soft cock.")

		saynn("[say=kidlat]It's not permanent, is it?..[/say]")

		saynn("[say=pc]Not unless you eat another pill. I suggest you go see a doctor.[/say]")

		saynn("[say=kidlat]Okay-y-y..[/say]")

		saynn("You help her to get up.. and pull the shorts up. Her legs are still swaying like crazy.")

		saynn("[say=kidlat]I know where it is, luv..[/say]")

		setFlag("DrugDenModule.KidlatCustomTalkGreet", "That was.. crazy.. last time.. do you have another pill, luv?..")
		addButton("Continue", "See what happens next", "sex_cock_tf_back_panties")
	if(state == "sex_cock_tf_back_panties"):
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("Kidlat returns after some time.. her shorts don't have that obvious bulge on them any more.")

		saynn("That was fun.")

		addButton("Continue", "See what happens next", "endthescene")
func addStraponButtons(thestate):
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), thestate, [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ask_alcohol"):
		processTime(5*60)

	if(_action == "ask_alcohol_lock"):
		processTime(5*60)
		getCharacter("kidlat").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))

	if(_action == "ask_alcohol_drink"):
		processTime(3*60)

	if(_action == "ask_alcohol_uncuff"):
		processTime(3*60)
		getCharacter("kidlat").resetEquipment()

	if(_action == "sex_vag"):
		processTime(3*60)

	if(_action == "sex_cowgirl"):
		processTime(3*60)

	if(_action == "sex_takeoff_portal_panties"):
		processTime(3*60)
		setFlag("DrugDenModule.KidlatWearsPortalPanties", false)
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("PortalPanties"))
		getCharacter("kidlat").getInventory().removeItemFromSlot(InventorySlot.UnderwearBottom)

	if(_action == "sex_puton_portal_panties"):
		setFlag("DrugDenModule.KidlatWearsPortalPanties", true)
		GM.pc.getInventory().removeXOfOrDestroy("PortalPanties", 1)
		getCharacter("kidlat").resetEquipment()

	if(_action == "sex_cock"):
		GM.pc.getInventory().removeTFPillWithEffect("GrowPenisTF")

	if(_action == "sex_vag_strapon_pick_pick"):
		isStrapon=true
		setState("sex_vag")
		var strapon = _args[0]
		GM.pc.getInventory().removeItem(strapon)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		var theFluids = strapon.getFluids()
		if(theFluids != null):
			if(theFluids.hasFluidType("Cum")):
				straponHasCum = true
		return

	if(_action == "sex_cowgirl_strapon_pick_pick"):
		isStrapon=true
		setState("sex_cowgirl")
		var strapon = _args[0]
		GM.pc.getInventory().removeItem(strapon)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		var theFluids = strapon.getFluids()
		if(theFluids != null):
			if(theFluids.hasFluidType("Cum")):
				straponHasCum = true
		return

	if(_action == "sex_cowgirl_bed"):
		processTime(5*60)

	if(_action == "sex_cowgirl_bed_sex"):
		processTime(3*60)

	if(_action == "sex_cowgirl_bed_fast"):
		processTime(3*60)

	if(_action == "sex_cowgirl_cum"):
		processTime(3*60)
		if(isStrapon):
			getCharacter("kidlat").cummedInVaginaBy("pc", FluidSource.Strapon)
		else:
			getCharacter("kidlat").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("kidlat")

	if(_action == "sex_cowgirl_after"):
		processTime(10*60)
		GM.pc.unequipStrapon()

	if(_action == "sex_vag_grab"):
		processTime(5*60)

	if(_action == "sex_vag_sex"):
		processTime(3*60)

	if(_action == "sex_vag_sex_fast"):
		processTime(5*60)

	if(_action == "sex_vag_sex_cum"):
		processTime(5*60)
		if(isStrapon):
			getCharacter("kidlat").cummedInVaginaBy("pc", FluidSource.Strapon)
		else:
			getCharacter("kidlat").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("kidlat")

	if(_action == "sex_vag_sex_cum_pullout"):
		processTime(10*60)
		GM.pc.unequipStrapon()

	if(_action == "sex_cock_tf"):
		processTime(5*60)
		setFlag("DrugDenModule.KidlatPPTF", true)
		getCharacter("kidlat").updateBodyparts()

	if(_action == "sex_cock_reveal"):
		processTime(3*60)

	if(_action == "sex_cock_watch"):
		processTime(5*60)

	if(_action == "sex_cock_portal_panties"):
		var panties = getCharacter("kidlat").getInventory().getEquippedItem(InventorySlot.UnderwearBottom)
		panties.coversPenis = false

	if(_action == "sex_cock_stroke_cum"):
		processTime(5*60)

	if(_action == "sex_cock_stroke_more"):
		processTime(5*60)

	if(_action == "sex_cock_stroke_after"):
		processTime(5*60)

	if(_action == "sex_cock_tf_back"):
		processTime(10*60)
		setFlag("DrugDenModule.KidlatPPTF", false)
		getCharacter("kidlat").updateBodyparts()

	if(_action == "sex_cock_portal_panties_lick"):
		processTime(5*60)

	if(_action == "sex_cock_portal_panties_sit"):
		processTime(5*60)

	if(_action == "sex_cock_portal_panties_slide"):
		processTime(3*60)

	if(_action == "sex_cock_portal_panties_slide_fast"):
		processTime(5*60)

	if(_action == "sex_cock_portal_panties_slide_cum"):
		processTime(15*60)
		getCharacter("kidlat").cummedInVaginaBy("kidlat")

	if(_action == "sex_cock_portal_panties_slide_after_cum"):
		processTime(5*60)

	if(_action == "sex_cock_portal_panties_slide_after_pullout"):
		processTime(20*60)

	if(_action == "sex_cock_tf_back_panties"):
		var panties = getCharacter("kidlat").getInventory().getEquippedItem(InventorySlot.UnderwearBottom)
		panties.coversPenis = true
		processTime(10*60)
		setFlag("DrugDenModule.KidlatPPTF", false)
		getCharacter("kidlat").updateBodyparts()

	setState(_action)

func saveData():
	var data = .saveData()

	data["isStrapon"] = isStrapon
	data["straponHasCum"] = straponHasCum

	return data

func loadData(data):
	.loadData(data)

	isStrapon = SAVE.loadVar(data, "isStrapon", false)
	straponHasCum = SAVE.loadVar(data, "straponHasCum", false)
