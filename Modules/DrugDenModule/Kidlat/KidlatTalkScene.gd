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

		addButtonWithChecks("Vaginal", "Fuck Kidlat's pussy", "sex_vag", [], [[ButtonChecks.HasReachablePenis]])
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
