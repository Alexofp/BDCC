extends SceneBase

var isStrapon = false
var straponHasCum = false
var isVag = true
var npcID = ""
var pcHadFun = false

func _init():
	sceneID = "KidlatTalkScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

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

		addButton("How is", "Just ask how is she doing now", "ask_howis")
		addButton("Alcohol", "Ask if she is still drinking", "ask_alcohol")
		addButton("Betrayal", "Ask how she feels about her ex-friend betraying her now", "ask_betrayal")
		addButton("Future", "Ask what will she do after BDCC", "ask_future")
		addButton("Back", "Enough chatting", "")
	if(state == "ask_howis"):
		saynn("[say=pc]How is this cat doing?[/say]")

		saynn("[say=kidlat]I'm doing well, thank you, luv~. I like being up here. I can wander around the prison without the threat of running into some angry junkie.. or triggering a trap.[/say]")

		saynn("[say=pc]It's almost like the drug den sucks ass.[/say]")

		saynn("She chuckles.")

		saynn("[say=kidlat]Well, I had my reasons to be down there. But now there are more reasons to be up here, near you~.[/say]")

		saynn("Her words still warm your heart..")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "ask_betrayal"):
		saynn("[say=pc]You ended up in this prison..[/say]")

		saynn("[say=kidlat]Because I got betrayed, ye. Buddy locked me up in a van full of stolen sex toys.[/say]")

		saynn("[say=pc]So how do you feel about that now, after everything settled down?[/say]")

		saynn("She shrugs.")

		saynn("[say=kidlat]I don't know.. I don't crave revenge. The police were on our butts so I can kinda understand it.[/say]")

		saynn("[say=pc]Will you still talk with them? If you get out of here I mean.[/say]")

		saynn("[say=kidlat]Maybe. I'd like to hear what they have to say at least. I can boil in my soup of anger and despair all I want here.. But might as well give them a chance first, am I right?[/say]")

		saynn("[say=pc]Sure.[/say]")

		saynn("[say=kidlat]Like you did, with me~.[/say]")

		saynn("[say=pc]How could I pass up on such a cute kitty?[/say]")

		saynn("Her tail darts straight for your nose, bapping you..")

		saynn("[say=kidlat]Sorry, just a reflex~.[/say]")

		saynn("[say=pc]..brat. A cute brat.[/say]")

		saynn("She sticks her tongue out.")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "ask_future"):
		saynn("[say=pc]Whatcha gonna do after BDCC?[/say]")

		saynn("She tilts her head.")

		saynn("[say=kidlat]What do you mean, luv?[/say]")

		saynn("[say=pc]After your sentence ends. Do you know when that is?[/say]")

		saynn("[say=kidlat]I'm not sure. I don't recall them giving me a timed sentence.[/say]")

		saynn("It's gotta end sometime, right?..")

		saynn("[say=pc]Well, still. What are your plans?[/say]")

		saynn("[say=kidlat]Gonna follow my gaze probably, see where the road brings me.[/say]")

		saynn("[say=pc]C'mon, you probably have a dream?[/say]")

		saynn("She hums.")

		saynn("[say=kidlat]Dream? Hm.. Luv. You know what house cats are?[/say]")

		saynn("[say=pc]Cats who never get out of their owner's house?[/say]")

		saynn("[say=kidlat]Ye! They don't really have dreams, do they? They just purr and provide warmth~.[/say]")

		saynn("[say=pc]So you're saying.. You want an owner who will cherish and cuddle you? Who will give you a place to sleep, who will feed you?[/say]")

		saynn("She puts on a cheeky smile, her hips swaying to one side a bit, adding a seductive curve to her back.")

		saynn("[say=kidlat]What I'm saying is.. that I'm more a slut cat rather than a house cat~. The rest of the logic applies~.[/say]")

		saynn("The devilishly naughty kitty giggles softly.")

		saynn("Somehow, it all makes perfect sense.")

		addButton("Continue", "See what happens next", "chat_menu")
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
		if (GM.main.getFlag("FightClubModule.BulldogBypassed")):
			addButton("Free use", "(Heavy sharing) See if Kidlat would be up to be put inside a slut wall for anyone to fuck", "sex_freeuse")
		else:
			addDisabledButton("Free use", "You need access to a slut wall if you want to put Kidlat into it for everyone to fuck.")
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
		addButtonWithChecks("Offer pussy", "Let Kidlat try her new cock out on your pussy..", "sex_cock_vag", [], [[ButtonChecks.HasReachableVagina]])
		addButtonWithChecks("Offer ass", "Let Kidlat try her new cock out on your tailhole..", "sex_cock_ass", [], [[ButtonChecks.HasReachableAnus]])
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
	if(state == "sex_cock_vag"):
		playAnimation(StageScene.Grope, "watchstroke", {pc="kidlat", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Watching Kidlat stroke her new member awakens something inside you.. Maybe it's curiosity?")

		saynn("The way her palm slides along the hard, pulsing length, milking precum out of it.. makes you wonder..")

		if (isVag):
			saynn("You bite your lip.. your hand sneakily slides down to your pussy.. you're all wet down there..")

		else:
			saynn("You bite your lip.. your hand sneakily lands on your butt and slides down to your {pc.analStretch} tailhole.. gently massaging the sensitive outer ring.")

		saynn("[say=kidlat]Nhh..[/say]")

		saynn("She is so pent up.. maybe you can help her a little? Let her test that cock in a real.. intercourse.")

		addButton("All fours", "Get on all fours and get Kidlat's attention", "sex_cock_vag_tease")
	if(state == "sex_cock_vag_tease"):
		playAnimation(StageScene.SexLowDoggy, "tease", {pc="kidlat", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]Hey.. I got something you can test-drive your new toy on..[/say]")

		saynn("[say=kidlat]Oi?..[/say]")

		saynn("As Kidlat looks in your direction, she sees you on all fours, your back arched, your {pc.thick} ass sticking out high.. so that every curve of your butt and the inviting view of your "+str("wet, needy slit" if isVag else "needy tailhole")+" are laid bare.. a display that makes that cock of hers twitch uncontrollably, the sight creating raw hunger in her eyes.")

		saynn("[say=kidlat]Oh, luv..[/say]")

		saynn("She hesitates for a bit but is unable to resist for long, your "+str("digits spreading your slick folds" if isVag else "hands spreading your cheeks")+" for her was the last straw. Kidlat jumps up to you and kneels behind, her paws carefully stroking your back and groping your rear.")

		saynn("[say=kidlat]I'm pretty soft for a..[/say]")

		saynn("[say=pc]Just fuck me, Kidlat. Shove that juicy cock inside.[/say]")

		saynn("Your words send shivers down her spine. With a deliberate but delicate touch, she pins you into the floor, one of her paws supporting her off of your back while the second gets a grasp on her twitching canine cock and lines it up with your "+str("wet, waiting pussy" if isVag else "back entrance")+".")

		saynn("Just the tip of her length prodding your "+str("folds" if isVag else "anal ring")+" is sending your mind.. somewhere else.. You already want all of it..")

		addButton("Continue", "See what happens next", "sex_cock_vag_sex")
	if(state == "sex_cock_vag_sex"):
		playAnimation(StageScene.SexLowDoggy, "sex", {pc="kidlat", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Kidlat's new cock prods the entrance a bit more.. until she applies more pressure, letting the tip sink in.")

		saynn("[say=kidlat]That's so tight.. you're so tight.[/say]")

		saynn("You chuckle softly and bite your lip again, letting Kidlat do it at her own pace. The more she slides inside you, the more your "+str("pussy" if isVag else "ass")+" grips her shaft, each buried inch sending shivers through both of you.")

		saynn("[say=pc]Mmh~..[/say]")

		saynn("Feels great to be the first one to test that great dick, little quiet moans escape your lips as Kidlat starts doing slow, measured thrusts, pulling a bit back before letting her length fill the empty space inside you yet again. Your back arches further in response, your inner walls "+str("leave a layer of transparent juices on her canine member" if isVag else "become slick from the abundant amount of precum that her new canine member seems to be producing")+".")

		if (!isVag && GM.pc.hasPenis()):
			saynn("It quickly finds your little sensitive button.. and starts putting pressure on it.. already milking some prostate fluid out of it.")

		saynn("[say=kidlat]Ah.. your "+str("pussy" if isVag else "tailhole")+" is just top-notch, luv.. I can't..[/say]")

		saynn("At this steady pace, you can feel her cock pulsating as it grinds against your slick walls, the sounds of her hips slapping against your butt blending with your moans.")

		addButton("Continue", "See what happens next", "sex_cock_vag_fast")
	if(state == "sex_cock_vag_fast"):
		playAnimation(StageScene.SexLowDoggy, "fast", {pc="kidlat", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Kidlat gets eager, enjoying fucking your "+str("{pc.pussyStretch} pussy" if isVag else "{pc.analStretch} asshole")+" so much that her thrusts grow more dominant and rough. With each of these thrusts, your body starts to react uncontrollably.. your hips buck, your legs shiver"+str(" and even your anus clenches involuntarily" if isVag else ", toes curl up")+". You look down, under yourself, for a second and notice Kidlat's pussy dripping steadily.. each motion drawing out another bead of arousal from her folds.")

		saynn("[say=pc]Mhm.. ah.hh.. nhh~..[/say]")

		saynn("That cock.. feels amazing.. the way it pounds your "+str("slit" if isVag else "rear")+".. makes your eyes want to roll up. Hot moans leave your mouth as you're gripping the floor with all your might, meeting that veiny shaft with your ass, making the plaps louder.")

		saynn("Amid all of that, the knot at the base of Kidlat's cock begins to inflate, swelling with blood, turning into a fat orb that is slapping against your "+str("folds" if isVag else "star")+", spreading "+str("them" if isVag else "it")+" wider, trying to fit inside.")

		saynn("[say=kidlat]C-can I knot you, luv.. ah.. I really wanna knot your "+str("pussy" if isVag else "ass")+".. hhah.. Please, this feels amazing..[/say]")

		addButton("Allow it", "Allow Kidlat to knot you and cum inside", "sex_cock_vag_inside")
		addButton("Pull out", "Order her to pull out rather than cumming inside", "sex_cock_vag_pullout")
	if(state == "sex_cock_vag_pullout"):
		playAnimation(StageScene.SexLowDoggy, "tease", {pc="kidlat", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Better not to risk it..")

		saynn("[say=pc]I'd rather you pull out, Kidlat.. ah..[/say]")

		saynn("It pains you to say it.. but who knows what that knot will do to your inner walls.")

		saynn("[say=kidlat]Okay, luv.. I won't.. ah..[/say]")

		saynn("Kidlat's thrusts still take on a final, feral intensity.. pushing you over the edge in moments. Your whole body starts squirming under her grasp, your "+str("pussy" if isVag else "tailhole")+" clenching hard around her pulsing member"+str(", your prostate squeezed hard" if (!isVag && GM.pc.hasPenis()) else "")+".."+str(" Your {pc.penis} shooting {pc.cum} all over the cold floor, wasting its load.." if GM.pc.hasPenis() else "")+"")

		saynn("But right after she is pushed over her edge, she finds the strength inside her to pull out and direct her cock away from your "+str("pussy" if isVag else "ass")+".. She moans and pants heavily while her body convulses from orgasmic waves, her knotted member throbbing as it sends beautiful white arcs of her seed through the air, one after another.. draining her balls..")

		saynn("[say=kidlat]Fuck.. bloody.. f-fucking.. ah.. nyaa.. hah..[/say]")

		saynn("After your orgasms begin to subside, you two are left to pant, resting against each other.")

		saynn("[say=pc]Did that feel good?[/say]")

		saynn("[say=kidlat]Yep.. ye.. hah.. you got a great "+str("pussy" if isVag else "butt")+", hun. Was a real pleasure fucking it..[/say]")

		saynn("[say=pc]And your cock was a real pleasure to be fucked by~.[/say]")

		saynn("A little gasp leaves your lips as your butt gets spanked by her paw. Deserved..")

		saynn("[say=pc]What, I'm serious.[/say]")

		saynn("[say=kidlat]I just felt like spanking you, luv~.[/say]")

		saynn("After emptying her balls, her cock quickly gets soft, retracting into its sheath.")

		saynn("[say=kidlat]Is this now.. permanent?[/say]")

		saynn("[say=pc]Not unless you eat another pill. I suggest you go see a doctor.[/say]")

		saynn("[say=kidlat]Okay-y-y.[/say]")

		saynn("Kidlat gets up and helps you to get up too.")

		saynn("[say=kidlat]I will go pay them a visit..[/say]")

		setFlag("DrugDenModule.KidlatCustomTalkGreet", "That was.. crazy.. last time.. do you have another pill, luv?..")
		addButton("Continue", "See what happens next", "sex_cock_tf_back")
	if(state == "sex_cock_vag_inside"):
		playAnimation(StageScene.SexLowDoggy, "inside", {pc="kidlat", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Without hesitation, your voice comes out low and breathless.")

		saynn("[say=pc]Yes.. do it. I need you deep inside me..[/say]")

		saynn("And with that, Kidlat's thrusts take on a final, feral intensity. She keeps ramming her cock inside your "+str("slit" if isVag else "ass")+", trying to fit the whole length, her knot stretching your "+str("petals" if isVag else "anal ring")+".. bit by bit..")

		saynn("..until finally, with one big forceful push, she drives her cock deep into your trembling "+str("pussy" if isVag else "asshole")+", the fat orb slipping inside with a satisfying plop.. sending you over the edge.")

		saynn("The tight walls of your "+str("cunt" if isVag else "butt")+" squeeze around her throbbing length as the swollen knot locks you in place.")

		saynn("[say=kidlat]So t-tight..[/say]")

		saynn("Kidlat's cock begins to pulse furiously.. each rhythmic contraction sending a wave of cum flooding deep "+str("into your womb, stuffing it full" if isVag else "down your tailhole, stuffing you full")+". Her balls twitch in time with the climax, each spurt marking your inner walls, painting them white..")

		saynn("[say=kidlat]I'm b-breeding you, luv.. nya-a..[/say]")

		saynn("[say=pc]Fuck-k..[/say]")

		if (GM.pc.hasPenis()):
			saynn("While she is breeding you, your {pc.penis} is wasting its load, shooting {pc.cum} onto the floor beneath you"+str(", your prostate smashed hard" if (!isVag && GM.pc.hasPenis()) else "")+".. but you don't mind that..")

		saynn("Your body keeps milking her cock until her balls are completely dry.. and now.. you two remain locked together..")

		saynn("[say=kidlat]Bloody.. f-fucking.. ah.. nyaa.. hah..[/say]")

		saynn("Your orgasms finally subside, leaving you and Kidlat panting.")

		saynn("[say=pc]Did that feel good? Mmh..[/say]")

		saynn("[say=kidlat]Yep.. ye.. hah.. you have a great "+str("pussy" if isVag else "butt")+", hun. Was a real pleasure fucking it..[/say]")

		saynn("[say=pc]And your cock was a real pleasure to get knotted by~.[/say]")

		saynn("A little gasp leaves your lips as your butt gets spanked by her paw. Deserved..")

		saynn("[say=pc]What, I'm serious.[/say]")

		saynn("[say=kidlat]I just felt like spanking you, luv~.[/say]")

		saynn("You wiggle your butt.. making her moan again.")

		saynn("[say=kidlat]E-easy, luv.. I can't pull it out..[/say]")

		saynn("[say=pc]That's how it works, yes.[/say]")

		saynn("[say=kidlat]Huff..[/say]")

		saynn("And so you and Kidlat begin to rest.. chatting about random things.. while her knot is still stuck inside you.")

		addButton("Continue", "See what happens next", "sex_cock_vag_inside_rest")
	if(state == "sex_cock_vag_inside_rest"):
		playAnimation(StageScene.SexLowDoggy, "tease", {pc="kidlat", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Finally, after a while, Kidlat manages to pull her half-hard member out.")

		saynn("[say=pc]Ah~.. so messy..[/say]")

		saynn("Your "+str("pussy" if isVag else "asshole")+" continues to gape, leaking some of Kidlat's seed.")

		saynn("After this, her cock quickly gets soft, retracting into its sheath. You catch her concerned stare.")

		saynn("[say=kidlat]Is this now.. permanent?[/say]")

		saynn("[say=pc]Not unless you eat another pill. I suggest you go see a doctor.[/say]")

		saynn("[say=kidlat]Okay-y-y.[/say]")

		saynn("Kidlat gets up and helps you to get up too.")

		saynn("[say=kidlat]I will go pay them a visit..[/say]")

		saynn("You nod.")

		setFlag("DrugDenModule.KidlatCustomTalkGreet", "That was.. crazy.. last time.. do you have another pill, luv?..")
		addButton("Continue", "See what happens next", "sex_cock_tf_back")
	if(state == "sex_freeuse"):
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("A somewhat of a wild idea shows up in your head.. a forbidden one even.. some might even say.. lewd.")

		saynn("Of course Kidlat wouldn't agree to it.. surely. But still, curiosity makes you wonder.")

		saynn("[say=pc]I have a question.[/say]")

		saynn("Her ears perk up.")

		saynn("[say=kidlat]Shoot![/say]")

		saynn("You're not sure how to word it in the least.. offensive.. way.")

		saynn("[say=pc]You like.. sex.. right?[/say]")

		saynn("Your question is met with a cheeky smile.. and a slight sway of her hips.")

		saynn("[say=kidlat]Who doesn't? Of course I like sex, hun~. Are ya offering?[/say]")

		saynn("She flicks her tongue out and drags it over her upper lip.. seductively.")

		saynn("[say=pc]Maybe. I'm wondering if you like casual sex in particular.[/say]")

		saynn("Kidlat raises a brow.. but then chuckles and approaches you, putting her full femininity into her slow steps. Her paw reaches out and gently slides along the side of your {pc.masc} body..")

		saynn("[say=kidlat]As casual as you can offer~. Anything for you, luv~.[/say]")

		saynn("Interesting. Maybe there is a chance.")

		saynn("[say=pc]Really now? You're saying that you have no limits?[/say]")

		saynn("She hums.")

		saynn("[say=kidlat]Well.. as long as it doesn't get me into a mess. If not, be my guest~.[/say]")

		saynn("She leans in closer and gives you a little smooch on the cheek, her paws keep exploring your body, sliding dangerously close to your crotch..")

		saynn("[say=pc]There might be a mess.. a lot of it.[/say]")

		saynn("[say=kidlat]I don't mind that kind of mess, luv~. I welcome it. Let's just do it, why talk about it, hah.[/say]")

		addButton("Slutwall", "Show Kidlat the slutwall", "sex_slutwall_show")
	if(state == "sex_slutwall_show"):
		aimCameraAndSetLocName("fight_slutwall")
		saynn("Without another word, you take her paw and lead her from the confidence of her cell out into the public.")

		saynn("[say=kidlat]Don't tell me you wanna fuck me while everyone is watching. That'd be so kinky~.[/say]")

		saynn("[say=pc]Worse. Or better, depends on how you look at it. Although, not sure if you'd be looking at much.[/say]")

		saynn("Your words certainly peak her interest.")

		saynn("You and Kidlat get out into the main hall and walk down to the yard area.")

		saynn("[say=kidlat]Giving me walkies~? I'm not a puppy.. unless you want me to bark.[/say]")

		saynn("[say=pc]You will get your walkies later, Kidlat. If you will have any energy for them.[/say]")

		saynn("She bites her lip.")

		saynn("You pass by the bulldog guard without much trouble.. and start following the narrow dimly-lit corridor.")

		saynn("[say=kidlat]Oh wow, I haven't been in these maintenance tunnels yet.[/say]")

		saynn("Soon, you reach a special.. inmate hangout area. A big seemingly-abandoned space that got transformed into a room for inmates to enjoy their arena fights and cheap whores.")

		saynn("[say=kidlat]This is cool. I don't even see any obvious junkies here.[/say]")

		saynn("[say=pc]It's a nice little separated place, yes. I wanted to show you this..[/say]")

		saynn("As you approach the corner of this space, Kidlat's eyes fix on one of the walls. She raises a brow, curious about the reason for those big holes in it.. but then her breath catches.")

		saynn("[say=kidlat]Oh-.. Is that what I think it is?[/say]")

		saynn("You smile, your hand scritches her under the chin. The chains, the little holes above the big one, tip boxes, markers, it all makes sense for her now.")

		saynn("[say=pc]You said you're into casual sex. Doesn't get much more casual than this~.[/say]")

		saynn("She doesn't show it.. but her body responds instinctively.. The mere sight of this wall makes her blush and rub her thighs against each other.")

		saynn("[say=kidlat]I don't know, luv.. I'm concerned about how it would make you feel..[/say]")

		saynn("She is being so sweet. But you don't hear her saying no.")

		saynn("You lean in closer to her ear and start whispering..")

		saynn("[say=pc]Doesn't the thought of getting fucked by a complete strange turn you on? Who says I can't be one of those strangers~?[/say]")

		saynn("Even with all the inmates around, you can hear you swallowing her saliva.")

		saynn("[say=pc]Cock after cock, fucking your little tight pussy while you're stuck in that slutwall.. unable to even see them.. Don't you wanna be a free-use whore, kitty~? Just this time~?[/say]")

		saynn("Her blush becomes deeper and deeper, her eyes lustier.. You can just tell that she is wet down there by now.. you can just tell..")

		saynn("[say=pc]C'mon, kitty cat. One word and I will lock you in~.[/say]")

		saynn("Her nips look all stiff under that shirt of hers, her tail wrapped around her leg, little cute noises escape her maw. She keeps biting her lip.")

		saynn("[say=kidlat]S-sure, luv..[/say]")

		saynn("Your smile gets wider. Time to do this.")

		addButton("Lock her in", "Lock Kidlat inside the slutwall", "sex_slutwall_lock")
	if(state == "sex_slutwall_lock"):
		addCharacter("kidlat", ["naked"])
		playAnimation(StageScene.Slutwall, "idle", {pc="kidlat", bodyState={naked=true, hard=true}})
		saynn("You grab her by the paw and guide her towards the slutwall, picking the middle spot that's empty.")

		saynn("[say=pc]Don't mind me.[/say]")

		saynn("With some extra authority, your hands begin to undo Kidlat's shirt buttons, exposing her perky tits to inmates around.. who already begin to gather interest in the new toy.. Kidlat sees all the eyes that are drawn towards her.. but doesn't cover herself up, allowing you to pull her shorts down as well, exposing her neat little cyan slit.")

		saynn("[say=kidlat]Hey, uh.. luv..[/say]")

		saynn("[say=pc]I will keep your clothes, don't worry~.[/say]")

		saynn("While the audience is waiting.. you help Kidlat to get inside the big hole.. positioning her so that her butt is still sticking out.")

		saynn("You grab some cuffs that are hanging by the chains and lock them around Kidlat's ankles and wrists, securing her body in this.. extremely vulnerable position.. where Kidlat's slick, cyan slit and tailhole are now on full display.")

		saynn("[say=kidlat]Kinky.. Everyone is probably hungrily watching my pussy already..[/say]")

		saynn("And now.. as a last finishing touch, you grab a marker and write 'Free to use!' on the wall, near Kidlat's butt.")

		saynn("Your bold marketing strategy seems to be working well.. there is a queue forming behind you..")

		saynn("[say=kidlat]How did I end up in this situation.. meow..[/say]")

		saynn("You chuckle and take a step back, inviting the first person. Now all you can do is watch.")

		addButton("Watch", "See what happens next", "sex_slutwall_first")
	if(state == "sex_slutwall_first"):
		playAnimation(StageScene.SlutwallSex, "tease", {pc="kidlat", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You can see Kidlat's toes curling as the first inmate steps forward, his {npc.penis} already hard, twitching in {npc.his} hand.")

		saynn("Without hesitation, {npc.he} approaches the bound Kidlat, {npc.his} gaze quickly watching her over. {npc.His} touch is rough, lacking any.. empathy. {npc.He} spreads her cyan pussy wide with two digits, making the slick entrance itself open up, a string of juices already hanging between the folds.")

		saynn("[say=kidlat]Oh.. hey there, lad.. um..[/say]")

		addButton("Continue", "See what happens next", "sex_slutwall_first_sex")
	if(state == "sex_slutwall_first_sex"):
		playAnimation(StageScene.SlutwallSex, "sex", {pc="kidlat", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("The inmate doesn't respond, {npc.he} just positions {npc.himself} between her spread legs and aligns {npc.his} cock with her wet, exposed slit. Then, with a single, forceful, thrust, {npc.he} plunges into her.")

		saynn("[say=kidlat]..wai-.. ah!..[/say]")

		saynn("You can barely hear the feline in there.. but you sure sees her body reacting.. her inner walls reflexively clenching around the intruding dick, spreading her juices along its length.")

		saynn("{npc.He} doesn't stop there, already establishing a steady rhythm, pounding Kidlat's fresh pussy, enjoying getting to be the first.")

		saynn("[say=kidlat]..hah.. you're a bold lad.. Oi![/say]")

		saynn("Kidlat's ass jiggles as the inmate's hand slaps it hard, offering the girl a good lesson.. Fucktoys don't speak up.. they just get used.")

		saynn("The inmate's thrusts are fast and unyielding, each one sending plaps and wet sounds to echo around the big open space. Kidlat's body is bound nicely, unable to squirm free.. she can only endure the rough fucking and let out occasional moans and shudders.")

		saynn("[say=kidlat]Hh.. ah..[/say]")

		addButton("Continue", "See what happens next", "sex_slutwall_first_cum")
	if(state == "sex_slutwall_first_cum"):
		playAnimation(StageScene.SlutwallSex, "inside", {pc="kidlat", npc=npcID, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("..but before Kidlat can realize it, the inmate already starts cumming inside her! {npc.He} rams {npc.his} cock as deep as her pussy allows.. and lets the clenching walls bring {npc.him} over the edge. {npc.He} starts stuffing her pussy full of seed.. emptying {npc.his} load inside.. a first of many, for sure..")

		saynn("[say=kidlat]Oh.. ah.. a-already? That was a little.. fast.. AH![/say]")

		saynn("Another smack leaves a glowing spot on Kidlat's ass, her slit pulsing around the throbbing cock.. Looks like it happened so fast, she didn't even get to cum..")

		saynn("After the inmate pulls out, a great view of Kidlat's creamed pussy opens up to your eyes. Seed begins to drip out of her used hole..")

		saynn("[say=kidlat]Mhh..[/say]")

		saynn("Before leaving, the inmate grabs the marker and scribbles something bold and humiliating on her fur.. and then also draws a single tally mark on her butt.")

		saynn("[say=kidlat]Are you drawing on me?.. Like I'm a slut?..[/say]")

		saynn("The crowd is still tight around her.. but then someone cuts through it, ignoring the queue.")

		addButton("Continue", "See what happens next", "sex_slutwall_second")
	if(state == "sex_slutwall_second"):
		addCharacter("jack")
		playAnimation(StageScene.SlutwallSex, "tease", {pc="kidlat", npc="jack", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("A big, hung horse steps out and takes the spot of the next.. user. He didn't wait for his turn.. but no one seems to want to stop him.. they probably all know better than to mess with such a.. hung.. stallion.")

		saynn("[say=jack]Huh, pretty thing already got used. No worries, gonna shove that weak beta sperm right out.[/say]")

		saynn("His massive, veiny horsecock is pulsing between his legs, already fully out of its sheath. The head of his cock has a circle of spherical little.. bulges.. all of them already a bit inflated.")

		saynn("[say=kidlat]Hey, uh.. hai, I guess..[/say]")

		saynn("[say=jack]Little pussy still able to speak? Not for long.[/say]")

		saynn("[say=kidlat]Um..[/say]")

		saynn("She can't see him.. but she can surely feel the weight of his giant shaft resting on her used cunt, grinding against her cyan sensitive folds.")

		saynn("[say=kidlat]I hope you're not too..[/say]")

		saynn("While she is speaking, the horse aligns its fat flat tip with her pussy..")

		addButton("Continue", "See what happens next", "sex_slutwall_second_sex")
	if(state == "sex_slutwall_second_sex"):
		playAnimation(StageScene.SlutwallSex, "fast", {pc="kidlat", npc="jack", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("The horse's rough hands find their places on Kidlat's hips.. before he does a forceful, strong push of his hips, ramming his horsecock into her, his thick girth spreading her cyan petals extremely wide, stretching them to their limits..")

		saynn("[say=kidlat]AH!.. B-bloody![/say]")

		saynn("Sharp moan escapes from behind the wall, Kidlat's tight, stretched pussy meets the guy's powerful thrusts with a desperate clench.. but that only seems to fuel the stallion's desire to fuck her pussy harder.")

		saynn("[say=kidlat]Mhh-hh.. ahh.. ahh.. f-fu-uck.. it's s-so big.. ah..[/say]")

		saynn("Poor kitty is squirming against the chains and cuffs.. but nah, she is completely helpless in that slutwall, her pussy at the horse's full mercy. And his thrusts are fierce.. a stark contrast to the previous inmate. With every strong, rapid thrust, he pounds into her, his flat tip smashing into her organic barricade over and over.")

		saynn("Kidlat's moans grow louder and louder.. until her body begins to tremble, legs and arms starting to shake. She cums hard from that cock, her pussy visible clenching around him in a long series of spasmodic convulsions. Each powerful thrust forces her slit to stay stretched.. and makes it gush transparent fluids all over his length.")

		saynn("[say=kidlat]Nhh-h.. fu-uck.. ahh.. ahh.. C-cumming.. ah.. c-can't s-stop.. ah..[/say]")

		saynn("And the horsie is still not done, driving his member in faster and deeper, trying to fit more of his length inside. You can notice his balls twitching..")

		addButton("Continue", "See what happens next", "sex_slutwall_second_cum")
	if(state == "sex_slutwall_second_cum"):
		playAnimation(StageScene.SlutwallSex, "inside", {pc="kidlat", npc="jack", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("..until, with one final, rough motion, he buries his whole horsecock inside that poor little stretched pussy, stretching Kidlat's inner walls wide..")

		saynn("The old cum that was inside Kidlat shoots out from around his shaft that has flared out, the little bumps on its head inflating greatly, pushing seed out..")

		saynn("[say=kidlat]NYaaaaAaa-a.. hh.. ahh..[/say]")

		saynn("[say=jack]Nghh. Such a tight whore.[/say]")

		saynn("The stallion's body starts to spasm as his cock starts to release a torrent of thick, virile sperm deep inside Kidlat, flooding her sex and her babymaker until there is no space left.. and then more.. and more.. so much that it starts to overflow already, dripping messily onto the floor.")

		saynn("It's impressive, really.. how Kidlat can handle such a cock.. but also how those twitching balls can produce so much..")

		saynn("After his orgasm, his cock already begins to go soft.. so he decides to pull out.. unleashing another torrent of seed.. Kidlat's gaping pussy gushing out seed at a rate of her crazy heartbeat.. and there is no end to it..")

		saynn("[say=kidlat]Mhh-h-h.. ahh-h-h.. m-my p-pussy.. ah..[/say]")

		saynn("Her body is squirming, unable to contain the sensations.. unable to contain the cum..")

		saynn("Before leaving, the guy reaches for a marker and scribbles a humiliating thing on her fur.. before adding a second tally mark.. At this rate, Kidlat won't be able to endure this for very long..")

		saynn("[say=jack]Enjoy my foals, pretty thing.[/say]")

		saynn("[say=kidlat]Nya-a-a.. ok-kay..[/say]")

		saynn("Her answer makes you smile for some reason.")

		saynn("After the stallion, it comes time for another inmate.. The queue is still long.. Everyone seems to want a piece of that puss..")

		addButton("Continue", "See what happens next", "sex_slutwall_third")
	if(state == "sex_slutwall_third"):
		removeCharacter("jack")
		addCharacter("axis")
		playAnimation(StageScene.SlutwallSex, "tease", {pc="kidlat", npc="axis", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("A wolf approaches Kidlat.. a fancy-looking lilac that has white fur and red eyes.. a real alpha wolf. He sees Kidlat's pussy that is still not fully closed after that fat horsecock, his digits open it a bit more, exposing the creamed depths..")

		saynn("[say=axis]Grr.. We should stop letting that fucker break the toys.[/say]")

		saynn("His gaze shifts purposefully to her untouched second entrance.. the little clenched tailhole. Even though Kidlat's mind is probably quite.. foggy.. from the previous guy, she gasps when the new knotted cock starts prodding at her anal ring, teasingly stretching her, the pointy tip spreading pre all around the sensitive star.")

		saynn("[say=kidlat]AH.. ah.. t-that's.. that's the wrong hole, lad..[/say]")

		saynn("[say=axis]I ain't fucking a used hole.[/say]")

		saynn("He spits on his dick and starts working it in more, the pointy tip stretching Kidlat's anal ring gradually, making her toes curl up, her fluffy tail swiping the floor.")

		saynn("[say=kidlat]Eek.. oi..[/say]")

		saynn("Her muscles try to clench.. but the wolf just applies more and more force..")

		addButton("Continue", "See what happens next", "sex_slutwall_third_sex")
	if(state == "sex_slutwall_third_sex"):
		playAnimation(StageScene.SlutwallSex, "sex", {pc="kidlat", npc="axis", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("..until one of the powerful motions makes Kidlat's now-slick tailhole open enough to let the head of the new cock slide inside.")

		saynn("[say=kidlat]Ah!.. my butt..[/say]")

		saynn("And the wolf keeps going at it, doing little deliberate thrusts that bury more of his length inside the poor bound kitty, stretching her out to fit him.")

		saynn("[say=axis]Good thing this slut had at least some anal fucking before. Right, whore?[/say]")

		saynn("Kidlat's body is trembling in that slutwall.. but more and more moans start to escape from behind it.")

		saynn("[say=kidlat]Ah.. ah.. m-maybe.. hah.. I'm s-such a slut.. ah..[/say]")

		saynn("It gets easier for the guy to fuck her.. his cock probably stretched and coated her inner walls with some precum by now. Kidlat's neglected pussy is still dripping the left-over seed, her anus being fucked with a thick cock makes her wet folds look smaller..")

		addButton("Continue", "See what happens next", "sex_slutwall_third_fast")
	if(state == "sex_slutwall_third_fast"):
		playAnimation(StageScene.SlutwallSex, "fast", {pc="kidlat", npc="axis", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("The guy increases his pace, his cock sliding inside Kidlat's ass at a more urgent and forceful rate. Each thrust sends waves of sharp, intense pleasure ripping through the feline, her anal muscles clenching tightly around him.")

		saynn("[say=kidlat]Ah.. ah.. bloody hell.. hhh..ah..[/say]")

		saynn("She doesn't even see who is pounding her tight anal ring.. she only feels a fat canine cock ravaging her insides.. and hears the loud plaps echoing around the open space. The knot at the base of that member begins inflating with blood.. it's slapping against her fuckhole, stretching it even wider..")

		saynn("[say=kidlat]W-wait.. you're n-not gonna..[/say]")

		addButton("Continue", "See what happens next", "sex_slutwall_third_cum")
	if(state == "sex_slutwall_third_cum"):
		playAnimation(StageScene.SlutwallSex, "inside", {pc="kidlat", npc="axis", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Before Kidlat can finish her sentence, her ass gets suddenly knotted by that fat cock, her sensitive anal ring gets forced open extremely wide by the fat orb that then slips inside, trapping the whole length inside.")

		saynn("[say=kidlat]AHH-hHH!.. Hhnhh!.. hhhahh.. AhHHhh-..[/say]")

		saynn("Kidlat is thrashing against the cuffs and chains.. while the guy unleashes his thick, virile load inside her squirming, clenching ass, his balls tensing up as he keeps pumping her second hole full to the brim.")

		saynn("Both of Kidlat's fuckholes pulse hard, her pussy spawning a fountain of girlcum while her asshole keeps milking that wolf's cock for all of his seed..")

		saynn("[say=axis]Grrh.. That's a good fucktoy.[/say]")

		saynn("Kidlat just moans into the air, her body still shuddering, pussy pulsing and squirting from the overstimulation..")

		saynn("While the wolf is stuck inside her, he grabs a marker and adds to the old scribbles.. and also adds an extra tallymark.. of course..")

		saynn("Then, when his knot deflates enough, he just yanks his cock out, leaving Kidlat's tailhole to gape, showing how stuffed it is to all the observers.. extremely lewd sight.")

		saynn("[say=kidlat]Ah!.. I'm s-such a fucktoy.. s-such a whore.. h-h.. nyaa-ah..[/say]")

		saynn("The poor kitty tries to clench.. but it still takes a while for her hole to fully close, her ass and pussy now both dripping with seed..")

		saynn("After the wolf steps away, another person begins to approach her.. but they are pushed back by another bold inmate who decides to skip the queue.")

		saynn("Kidlat just can't get a break. But it looks like she is having fun at least.")

		addButton("Continue", "See what happens next", "sex_slutwall_fourth")
	if(state == "sex_slutwall_fourth"):
		playAnimation(StageScene.SlutwallSex, "tease", {pc="kidlat", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		removeCharacter("axis")
		addCharacter("avy")
		saynn("A mean-looking foxie with dark fur approaches the slutwall. A bulge on her shorts makes it obvious that this foxy is packing heat.. Her eyes take in the sight before her.")

		saynn("Kidlat's butt.. covered in scribbles, cum and her own juices.. shuddering. Both her used holes are pulsing faintly, leaking seed..")

		saynn("[say=avy]GRr.. Fuck, I'm always too late. Whatever, I hope your holes are not too loose yet, you stupid whore.[/say]")

		saynn("With a rough touch, she grips Kidlat's hips, forcing her cum-soaked slit open.. while her cock starts to leave its sheath, getting harder. The foxy lets her shaft land on that messy crotch and start grinding against the cyan folds.")

		saynn("[say=kidlat]Mhh..[/say]")

		addButton("Continue", "See what happens next", "sex_slutwall_fourth_sex")
	if(state == "sex_slutwall_fourth_sex"):
		playAnimation(StageScene.SlutwallSex, "fast", {pc="kidlat", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Then, when she gets hard enough, she just guides her cock down that used fuckhole, letting the girl's folds spread around her veiny member. With one forceful thrust, the foxy plunges most of her length inside.. pushing some of the old cum out, replacing it with high-quality hard meat.")

		saynn("[say=kidlat]..ah.. nyaah..[/say]")

		saynn("[say=avy]Got your brains fucked out already? Don't worry, I will make sure you remember me.[/say]")

		saynn("Foxy begins fucking the kitty.. while her claws dig deeper into her butt.")

		saynn("[say=kidlat]Agh.. eek.. hh-hgh..[/say]")

		saynn("She is dragging her claws, leaving a few shallow cuts.. that instantly begin bleeding. Kidlat's body reacts instantly, jerking to the side as much as the cuffs allow.. her pussy clenches hard around the girl's cock.")

		saynn("[say=avy]There you go, slut. The only way to feel something with your stupid gaping holes.[/say]")

		saynn("After leaving her marks, the foxy just smacks that ass a few times, sending it jiggling. Her paw then just catches the tail and uses it as a handle-bar, pulling on it while thrusting inside.")

		saynn("[say=kidlat]Nhh.. nyaa.. ahh..[/say]")

		saynn("Kidlat keeps letting out disjointed moans and occasional whimpers, her mind seems to be clouded by the constant barrage of pleasure, leaving her unable to respond with anything but.. just noises. The foxy's rough assault on her pussy is unyielding though, she quickly intensifies her pace, using that pussy for her pleasure.")

		saynn("[say=avy]Can you take more, little bitch?[/say]")

		saynn("With each hard, aggressive thrust, she drives her cock deeper, sometimes scratching Kidlat's butt more to make her clench.")

		saynn("At some point soon, the foxy's knot begins to grow.. and so she is quick to force it inside!")

		saynn("[say=kidlat]Ahh-hh~.. k-knotted.. Ahh![/say]")

		saynn("Kidlat's pussy gets stretched wide open again.. but only for a short moment.. The mean girl rams her whole length inside just to pull it out moments later.. leaving empty space that she fills soon yet again.")

		saynn("[say=avy]Oh yeah, there we fucking go.. Take it, whore.[/say]")

		saynn("She keeps forcing her knot in and out, never letting Kidlat's gaping, pulsing hole to fully close.. Poor kitty is squirming and squirting, her slit gushing with juices as it's being knot-fucked raw..")

		addButton("Continue", "See what happens next", "sex_slutwall_fourth_cum")
	if(state == "sex_slutwall_fourth_cum"):
		playAnimation(StageScene.SlutwallSex, "inside", {pc="kidlat", npc="avy", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("With one final thrust, the foxy knots Kidlat.. and leaves her throbbing length inside. She herself begins to grunt, her body arching a bit as begins cumming inside, her thick cum flooding the cum-laden depths in big waves.")

		saynn("[say=avy]Nhh.. ngh..[/say]")

		saynn("All the while Kidlat just accepts it.. her body eagerly receiving another load, inner walls squeezing the intruding knotted shaft, milking it for all of its cream.")

		saynn("[say=kidlat]Nyaa.aa.. I'm a.. ah.. t-total cum dumpster..[/say]")

		saynn("The foxy adds another tally mark and something extra on her fur.")

		saynn("[say=avy]Mhm. Enjoy, needy bitch.[/say]")

		saynn("As she pulls out, the overflowing cum begins to drip messily down Kidlat's butt. The foxy finds some untouched fur to clean her messy cock with.")

		saynn("And just like that, she puts her member away and disappears inside the crowd, leaving Kidlat for the rest of the crowd..")

		addButton("Continue", "See what happens next", "sex_slutwall_montage_1")
	if(state == "sex_slutwall_montage_1"):
		playAnimation(StageScene.SlutwallSex, "sex", {pc="kidlat", npc=npcID, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("What happens next is more of a blur than anything.. All of the.. bold inmates.. already did what they wanted with the kitty. But there is still a small crowd of lads who wanna add their loads.. or just watch the action.")

		saynn("Another {npc.boy} steps in closer, eyes fixed on Kidlat's exposed, fucked fuckholes. Without hesitation, {npc.he} drives {npc.his} hard cock into her slick heat.. using all the previous seed at lube.")

		saynn("[say=kidlat]Mhah.. a-another cock.. f-fucking me~..[/say]")

		saynn("This inmate is not the most.. delicate one.. but {npc.he} is still better than the mean foxy.")

		saynn("{npc.His} thrusts quickly become a barrage of pounding.. an assault on Kidlat's used pussy.. The space around the slutwall fills with plaps, slaps and noises of love from Kidlat.. until the inmate slams deep into her slit, pumping it full of {npc.his} seed, leaving {npc.his} mark on the kitty in a form of a creampie.. and also a tally mark and a writing.")

		saynn("[say=kidlat]Ah.. yes.. Breed me~.. nyaa..[/say]")

		addButton("Continue", "See what happens next", "sex_slutwall_montage_2")
	if(state == "sex_slutwall_montage_2"):
		playAnimation(StageScene.SlutwallSex, "fast", {pc="kidlat", npc=npcID, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("The inmate pulls and steps away.. which lets Kidlat rest for a bit. There is so much cum oozing out of her holes, the floor underneath is getting quite messy and slippery by now.")

		saynn("[say=kidlat]Who is next.. meow..[/say]")

		saynn("Seeing how eager she still is, another inmate already approaches her. {npc.He} does what most others do, grabbing Kidlat's waist roughly and shoving {npc.his} cock inside her.")

		saynn("{npc.His} thrusts are lightning-fast.. lacking any feelings attached to them.. only focussed on raw pleasure.. hard fucking.")

		saynn("[say=kidlat]Mhhh-hh~.. ahh..[/say]")

		saynn("Kidlat is cumming again, her body shaking against the chains, making them rattle, her pussy is milking the intruding dick.. making it throb.. and then causing it to start pumping her womb with yet another load of sticky stuff..")

		saynn("[say=kidlat]Nya-a-a..[/say]")

		saynn("Another scribble.. and a tally mark.. Kidlat probably lost count of how many times her holes got used a long time ago.. good thing it's easy for you and others to track it.")

		addButton("Continue", "See what happens next", "sex_slutwall_montage_3")
	if(state == "sex_slutwall_montage_3"):
		playAnimation(StageScene.SlutwallSex, "fast", {pc="kidlat", npc=npcID, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("One inmate after another, Kidlat's pussy is being fucked and creampied.. again and again..")

		saynn("At this point, most of the inmates have had their fun with her.. there is only one left in the queue.")

		saynn("Same process.. quick penetration.. hard, rough pounding.. another load of seed forced inside the bound feline.. a tally mark..")

		addButton("Continue", "See what happens next", "sex_slutwall_montage_after")
	if(state == "sex_slutwall_montage_after"):
		playAnimation(StageScene.Slutwall, "idle", {pc="kidlat", bodyState={naked=true, hard=true}})
		saynn("The queue is finally empty.. Everyone who wanted to use Kidlat, did so..")

		saynn("You decide to approach the kitty and take a closer look at the aftermath.")

		saynn("Kidlat's used holes are displayed for all to see.. her twitching pussy folds are still slightly spread from all the cocks that stretched them and also from all the creampies.. Her tailhole is leaking someone's seed as well..")

		saynn("All around her body are the many marks that got left after this.. brutal ritual.. Her used holes, her bruises and bleeding scratches, cum-stained fur, the many tally marks and humiliating writings..")

		saynn("[say=kidlat]Nya-a..h..[/say]")

		saynn("You were about to start unlocking her.. but maybe there is something else you might wanna do first..")

		addButton("Just unlock", "Enough sex for Kidlat", "sex_slutwall_justunlock")
		addButtonWithChecks("Fuck her", "Add one last creampie from you..", "sex_slutwall_fuckher", [], [[ButtonChecks.HasReachablePenis]])
		addButton("Eat her", "Her holes are leaking so much cum.. Might as well help clean her with your tongue", "sex_slutwall_eather")
	if(state == "sex_slutwall_justunlock"):
		playAnimation(StageScene.SexStart, "start", {npc="kidlat", npcBodyState={naked=true}})
		saynn("Kitty has had enough.")

		saynn("You unlock her cuffs and begin to pull her out.. being careful as to not get any mess on you.")

		saynn("[say=kidlat]Oh?.. F-fun is over?..[/say]")

		saynn("Kidlat slumps to the floor fast, her legs still weak.")

		saynn("[say=kidlat]Hey, luv..[/say]")

		saynn("She is sitting in the puddle of cum..")

		saynn("[say=pc]How was it?[/say]")

		saynn("[say=kidlat]It was.. something.. for sure.. fun.. ye..[/say]")

		saynn("Judging from how much she was moaning before.. yeah, safe to say that she had some 'fun'.")

		saynn("She finally looks down at herself.. and sees.. everything.")

		saynn("[say=kidlat]I'm such a slut.. Hah..[/say]")

		saynn("She turns her head back and looks at the slutwall itself..")

		saynn("[say=kidlat]Did the whole prison came down here to fuck me.. Bloody hell..[/say]")

		saynn("[say=pc]Yeah, looks like your butt quickly got popular.[/say]")

		saynn("[say=kidlat]Makes me regret hiding in the drug den more, ha.[/say]")

		saynn("She tries to get up.. but the slippery surface.. and her overall weakness.. makes it difficult.")

		saynn("[say=kidlat]I might need a hand, hun..[/say]")

		saynn("[say=pc]What you need is a shower.[/say]")

		saynn("[say=kidlat]That's a fair point. There is no way I'm licking all that off..[/say]")

		saynn("You give her a strange look.. while she just smiles.")

		saynn("[say=kidlat]Wha? I'm a cat.[/say]")

		addButton("Shower", "Time to shower", "sex_slutwall_shower")
	if(state == "sex_slutwall_shower"):
		aimCameraAndSetLocName("main_shower2")
		GM.pc.setLocation("main_shower2")
		playAnimation(StageScene.ShoweringDuo, "shower", {pc="kidlat", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You bring Kidlat to the nearest shower room and support her.. while cold water begins to wash away any mess..")

		saynn("And there is a lot of mess to wash.. for obvious reasons.")

		if (pcHadFun):
			saynn("[say=kidlat]Your touch is so nice, luv.. You totally did have some fun with me too, ha.[/say]")

			saynn("Makes you blush a bit.")

			saynn("[say=kidlat]I don't mind~. Hope you don't mind that I got.. you know.. I feel kinda bad now..[/say]")

			saynn("[say=pc]Don't feel bad. It was my idea after all.[/say]")

		else:
			saynn("[say=kidlat]Your touch is so nice, luv..[/say]")

			saynn("[say=pc]Thanks.[/say]")

		saynn("Your hands travel along the fur of her butt, helping to get rid of any writings and marks..")

		saynn("Eventually, she begins to look like her old self.. less white.. but only on the outside.")

		addButton("Wash inside", "Spread Kidlat's holes and make her push all the cum that got forced inside her", "sex_slutwall_washinside")
		addButton("Enough showering", "Leave her womb and ass stuffed..", "sex_slutwall_leavestuffed")
	if(state == "sex_slutwall_leavestuffed"):
		addCharacter("kidlat")
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("You decide to leave her holes stuffed.. why not..")

		saynn("After the shower time ends, Kidlat puts on her uniform with your help.")

		saynn("[say=kidlat]Thank you, luv.. This was fun~. I think I won't be able to sit for a while. Nya.[/say]")

		saynn("[say=pc]Yeah, I think you should take it easy from now on.[/say]")

		saynn("[say=kidlat]I will! Take care, hun![/say]")

		saynn("She gives you a quick kiss on the cheek.. and then heads back to her cell.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "sex_slutwall_washinside"):
		playAnimation(StageScene.ShoweringDuo, "rub", {pc="kidlat", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("After finishing washing the fur, your hands slide closer to her crotch.")

		saynn("With a gentle touch, your digits spread her cyan folds, making the kitty gasp softly.")

		saynn("[say=kidlat]Ah..[/say]")

		saynn("Not that long after, old cum begins to ooze out of Kidlat's sex..")

		saynn("[say=pc]Push a little.[/say]")

		saynn("She obeys.. increasing the flow of seed leaving her holes.")

		saynn("[say=kidlat]So much..[/say]")

		saynn("Some of it lands on her inner thighs.. but it's all quickly washed away by running water anyway.")

		saynn("[say=kidlat]"+str("I'm pregnant anyway already.. But I appreciate the gesture, luv." if getCharacter("kidlat").isVisiblyPregnant() else "Let's hope I didn't get pregnant..")+"[/say]")

		saynn("You spread her butt next, making sure her tailhole is mostly clean now too.")

		addButton("Enough showering", "Time to stop..", "sex_slutwall_spread_leave")
	if(state == "sex_slutwall_spread_leave"):
		addCharacter("kidlat")
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("After the shower time ends, Kidlat puts on her uniform with your help.")

		saynn("[say=kidlat]Thank you, luv.. This was fun~. I think I won't be able to sit for a while. Nya.[/say]")

		saynn("[say=pc]Yeah, I think you should take it easy from now on.[/say]")

		saynn("[say=kidlat]I will! Take care, hun![/say]")

		saynn("She gives you a quick kiss on the cheek.. and then heads back to her cell.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "sex_slutwall_fuckher"):
		playAnimation(StageScene.SlutwallSex, "tease", {pc="kidlat", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("That pussy has gotten so many creampies that she won't even notice another one.")

		saynn("You put your hands on her thighs, keeping her pussy spread for you and your cock..")

		saynn("[say=kidlat]Mh..[/say]")

		saynn("Her body.. is like a battered canvas, muscles twitching ever so slightly from the many exhausting orgasms. Both of her holes are slick and dripping with mixed fluids of previous inmates.")

		saynn("You guide your {pc.penis} down her spread slit..")

		addButton("Thrust inside", "Time to have some fun", "sex_slutwall_fuckher_sex")
	if(state == "sex_slutwall_fuckher_sex"):
		playAnimation(StageScene.SlutwallSex, "sex", {pc="kidlat", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("..and thrust your hips forward, letting your length penetrate her worn out pussy entrance, spreading her sensitive folds wide.")

		saynn("[say=kidlat]Ah..[/say]")

		saynn("Little moans begin to come up from behind the wall.. Kidlat doesn't even realize that it's your cock is now fucking her, rubbing against her inner walls, pressing on her buttons.")

		saynn("A copious amount of old spunk helps a lot, making her tunnel slick.. but she is still undeniably wet, the fur around her flower gives out a nice shine.. what a slut.")

		saynn("[say=kidlat]Mhh.. ah.. another cock is fucking me.. feels so good..[/say]")

		addButton("Faster", "Increase your onslaught on that bound pussy", "sex_slutwall_fuckher_fast")
	if(state == "sex_slutwall_fuckher_fast"):
		playAnimation(StageScene.SlutwallSex, "fast", {pc="kidlat", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("As you get bored of a slow pace, you speed up, throwing your hips forward at a faster rate, making them slap against Kidlat's butt while your cock buries itself deep inside her each time, smashing her cervix.")

		saynn("[say=kidlat]Ah.. y-yes~.. f-fuck that little slutty pussy~.. raw..[/say]")

		saynn("Despite all the.. tear and wear.. her love tunnel still manages to clamp around you with every forceful thrust. It's like she is sucking you in..")

		saynn("Room is filled with her moans and the many plaps that come from this brutal vaginal fucking. With nothing holding you back, you pin her legs into the wall and start pounding her little stuffed slit as fast as you can.")

		saynn("[say=kidlat]Nyaa-ahh..[/say]")

		saynn("It doesn't take long before Kidlat's next climax catches up with her. Her inner walls begin squeezing hard on your cock, her whole body squirming under your relentless onslaught. Feels so good that you can't stop yourself from letting out a few grunts.. your balls begin to tense up, pressure rising inside you..")

		saynn("There is only one way to finish this.")

		addButton("Cum inside", "Add your load to all the other ones", "sex_slutwall_fuckher_cum")
	if(state == "sex_slutwall_fuckher_cum"):
		playAnimation(StageScene.SlutwallSex, "inside", {pc="kidlat", npc="pc", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("That great cyan pussy pushes you over the edge.. You shove your {pc.penis} inside her and just let your orgasm take over.")

		saynn("[say=kidlat]Yes-s-s-s..[/say]")

		saynn("More primal grunts escape from you.. while your cock throbs inside her, pumping her already saturated womb with your load of thick, creamy {pc.cum}, so much that some of the old mess gets displaced and pushed out from around your shaft, adding more cum stains on her fur.")

		saynn("Kidlat's body twitches in tact with your member throbbing.. passionate.. even if exhausted.. moans slip from behind the slutwall..")

		saynn("[say=kidlat]So much.. inside me.. ah..[/say]")

		saynn("After your orgasm begins to subside, you still stay inside, using her pussy as a cock warmer. Your hand reaches out to grab the marker and scribble some stuff on her.. as well as adding the final tally mark. Nice.")

		saynn("After you're done using her, you slowly withdraw, trying to keep as much of your seed as possible inside her. Still, her pulsing pussy already pushes some out.. such a cum slut.")

		saynn("Time to get her out.")

		addButton("Unlock her", "Enough sex for Kidlat", "sex_slutwall_justunlock")
	if(state == "sex_slutwall_eather"):
		playAnimation(StageScene.SlutwallSexOral, "tease", {pc="kidlat", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You kneel in front of her.. in front of her used holes.")

		saynn("Seeing her pussy like this.. slick and dripping cum messily after so many cocks.. it makes your mouth water up.")

		saynn("You put your hands on her fluffy thighs and keep her legs spread wide while you lean a bit closer.. The sight up close is overwhelming.. Kidlat's used slit shines in the dim light, every fold and curve.. glorious.")

		saynn("[say=kidlat]..more cocks?.. ah..[/say]")

		saynn("You stick your tongue out and lick your lips. You don't even care how it will look.. you wanna taste her..")

		addButton("Lick", "Start licking", "sex_slutwall_eather_lick")
	if(state == "sex_slutwall_eather_lick"):
		playAnimation(StageScene.SlutwallSexOral, "lick", {pc="kidlat", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Determined, you dig your face in and press your lips against her messy slit. Your tongue begins its exploration.. with smooth, deliberate strokes that carefully trace the curves of her glistening folds.")

		saynn("[say=kidlat]Ah.. t-that's not a cock.. I think..[/say]")

		saynn("While she is surprised, you continue dragging your tongue along the sensitive bits of her pussy, tracing her clit and petals.. while catching some of the mess.")

		saynn("[say=kidlat]Mhh-h~.. feels kinda good though.. soothing..[/say]")

		saynn("You swallow what you gathered.. you can definitely feel the salty taste of her juices mindled with a huge dose of creamy seed. Repulsive and yet.. irresistible. Not too bad..")

		saynn("You dig in again, your tongue finding the entrance and pushing its tip inside, spreading her worn out cyan folds further. You can feel her heat.. while you lap at the pulsing inner walls, your tongue thrusting a bit deeper each time, trying to catch more of the mess.")

		saynn("[say=kidlat]Mmhh.. ah.. fuck that feels good~..[/say]")

		saynn("The more you eat her out, the more her flavours assault your senses.. a wild blend that you can't get enough of. With each lick, you become more insistent.. more forceful. You pull your tongue out to trace slow circles around her slit before darting in and out more. Kidlat's body is reacting more and more to your attention, you can feel her inner walls hugging your tongue.. until..")

		saynn("[say=kidlat]N-nn.. nya..a-ah..[/say]")

		saynn("Until suddenly, you push her over the edge. Her body convulses in time with your hungry licks, soft moans and urgent gasps filling the space. Her muscles contract around your tongue hard, drawing you deep into her.. before a final explosion of juices washes over your face.")

		saynn("[say=kidlat]Ahh-h!..[/say]")

		saynn("Kidlat squirts, her pussy gushing out a fountain of juices.. that you are quick to catch and swallow..")

		saynn("Even during her orgasm, you continue to lick and taste, savoring every drop of this nectar.")

		saynn("But eventually, it was time to pull her out of there..")

		addButton("Unlock her", "Enough sex for Kidlat", "sex_slutwall_justunlock")
func addStraponButtons(thestate):
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), thestate, [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ask_howis"):
		processTime(5*60)

	if(_action == "ask_alcohol"):
		processTime(5*60)

	if(_action == "ask_betrayal"):
		processTime(5*60)

	if(_action == "ask_future"):
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

	if(_action == "sex_freeuse"):
		processTime(3*60)

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
		getCharacter("kidlat").fillBalls(1.0)

	if(_action == "sex_cock_reveal"):
		processTime(3*60)

	if(_action == "sex_cock_watch"):
		processTime(5*60)

	if(_action == "sex_cock_portal_panties"):
		var panties = getCharacter("kidlat").getInventory().getEquippedItem(InventorySlot.UnderwearBottom)
		panties.coversPenis = false

	if(_action == "sex_cock_vag"):
		processTime(5*60)
		isVag = true

	if(_action == "sex_cock_ass"):
		processTime(5*60)
		isVag = false
		setState("sex_cock_vag")
		return

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

	if(_action == "sex_cock_vag_tease"):
		processTime(5*60)

	if(_action == "sex_cock_vag_sex"):
		processTime(5*60)

	if(_action == "sex_cock_vag_fast"):
		processTime(5*60)

	if(_action == "sex_cock_vag_inside"):
		processTime(5*60)
		if(isVag):
			GM.pc.gotVaginaFuckedBy("kidlat")
			GM.pc.cummedInVaginaBy("kidlat")
		else:
			GM.pc.gotAnusFuckedBy("kidlat")
			GM.pc.cummedInAnusBy("kidlat")
		GM.pc.orgasmFrom("kidlat")

	if(_action == "sex_cock_vag_pullout"):
		processTime(5*60)
		if(isVag):
			GM.pc.gotVaginaFuckedBy("kidlat")
		else:
			GM.pc.gotAnusFuckedBy("kidlat")
		GM.pc.orgasmFrom("kidlat")

	if(_action == "sex_cock_vag_inside_rest"):
		processTime(15*60)

	if(_action == "sex_slutwall_show"):
		processTime(10*60)

	if(_action == "sex_slutwall_lock"):
		processTime(10*60)
		getCharacter("kidlat").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		getCharacter("kidlat").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))

	if(_action == "sex_slutwall_first"):
		processTime(3*60)
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true})

	if(_action == "sex_slutwall_first_sex"):
		processTime(5*60)

	if(_action == "sex_slutwall_first_cum"):
		processTime(5*60)
		getCharacter("kidlat").cummedOnBy(npcID, FluidSource.Penis, 0.3)
		getCharacter("kidlat").cummedInVaginaBy(npcID)
		getCharacter("kidlat").addBodywritingLowerBody()
		getCharacter("kidlat").addTallymarkButt()

	if(_action == "sex_slutwall_second"):
		removeCharacter(npcID)
		processTime(5*60)

	if(_action == "sex_slutwall_second_sex"):
		processTime(5*60)

	if(_action == "sex_slutwall_second_cum"):
		processTime(3*60)
		getCharacter("kidlat").cummedOnBy("jack", FluidSource.Penis, 0.3)
		getCharacter("kidlat").cummedInVaginaBy("jack", FluidSource.Penis)
		getCharacter("kidlat").addBodywritingLowerBody()
		getCharacter("kidlat").addTallymarkButt()

	if(_action == "sex_slutwall_third"):
		processTime(5*60)

	if(_action == "sex_slutwall_third_sex"):
		processTime(5*60)

	if(_action == "sex_slutwall_third_fast"):
		processTime(5*60)

	if(_action == "sex_slutwall_third_cum"):
		processTime(3*60)
		getCharacter("kidlat").cummedOnBy("axis", FluidSource.Penis, 0.3)
		getCharacter("kidlat").cummedInAnusBy("axis")
		getCharacter("kidlat").addBodywritingLowerBody()
		getCharacter("kidlat").addTallymarkButt()

	if(_action == "sex_slutwall_fourth"):
		processTime(3*60)

	if(_action == "sex_slutwall_fourth_sex"):
		processTime(5*60)

	if(_action == "sex_slutwall_fourth_cum"):
		processTime(5*60)
		getCharacter("kidlat").cummedOnBy("avy", FluidSource.Penis, 0.3)
		getCharacter("kidlat").cummedInVaginaBy("avy")
		getCharacter("kidlat").addBodywritingLowerBody()
		getCharacter("kidlat").addTallymarkButt()

	if(_action == "sex_slutwall_montage_1"):
		processTime(10*60)
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true})
		getCharacter("kidlat").cummedOnBy(npcID, FluidSource.Penis, 0.3)
		getCharacter("kidlat").cummedInVaginaBy(npcID)
		getCharacter("kidlat").addBodywritingLowerBody()
		getCharacter("kidlat").addTallymarkButt()
		removeCharacter("avy")
		addCharacter(npcID)

	if(_action == "sex_slutwall_montage_2"):
		processTime(10*60)
		removeCharacter(npcID)
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true})
		getCharacter("kidlat").cummedOnBy(npcID, FluidSource.Penis, 0.3)
		getCharacter("kidlat").cummedInVaginaBy(npcID)
		getCharacter("kidlat").addBodywritingLowerBody()
		getCharacter("kidlat").addTallymarkButt()
		addCharacter(npcID)

	if(_action == "sex_slutwall_montage_3"):
		processTime(10*60)
		removeCharacter(npcID)
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true})
		getCharacter("kidlat").cummedOnBy(npcID, FluidSource.Penis, 0.3)
		getCharacter("kidlat").cummedInVaginaBy(npcID)
		getCharacter("kidlat").addBodywritingLowerBody()
		getCharacter("kidlat").addTallymarkButt()
		addCharacter(npcID)

	if(_action == "sex_slutwall_montage_after"):
		processTime(5*60)
		removeCharacter(npcID)
		npcID=""

	if(_action == "sex_slutwall_justunlock"):
		getCharacter("kidlat").resetEquipment()

	if(_action == "sex_slutwall_fuckher"):
		pcHadFun = true

	if(_action == "sex_slutwall_eather"):
		pcHadFun = true

	if(_action == "sex_slutwall_shower"):
		processTime(10*60)
		getCharacter("kidlat").afterTakingAShower()
		GM.pc.afterTakingAShower()

	if(_action == "sex_slutwall_washinside"):
		processTime(5*60)
		getCharacter("kidlat").clearOrificeFluidsCheckBlocked()

	if(_action == "sex_slutwall_leavestuffed"):
		processTime(5*60)

	if(_action == "sex_slutwall_spread_leave"):
		processTime(3*60)

	if(_action == "sex_slutwall_fuckher_sex"):
		processTime(5*60)

	if(_action == "sex_slutwall_fuckher_fast"):
		processTime(5*60)

	if(_action == "sex_slutwall_fuckher_cum"):
		processTime(5*60)
		getCharacter("kidlat").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("kidlat")
		getCharacter("kidlat").addBodywritingLowerBody()
		getCharacter("kidlat").addTallymarkButt()

	if(_action == "sex_slutwall_eather_lick"):
		processTime(5*60)
		getCharacter("kidlat").bodypartTransferFluidsTo(BodypartSlot.Vagina, "pc", BodypartSlot.Head, 0.6, 20.0)
		GM.pc.cummedInMouthBy("kidlat", FluidSource.Vagina, 0.4)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isStrapon"] = isStrapon
	data["straponHasCum"] = straponHasCum
	data["isVag"] = isVag
	data["npcID"] = npcID
	data["pcHadFun"] = pcHadFun

	return data

func loadData(data):
	.loadData(data)

	isStrapon = SAVE.loadVar(data, "isStrapon", false)
	straponHasCum = SAVE.loadVar(data, "straponHasCum", false)
	isVag = SAVE.loadVar(data, "isVag", true)
	npcID = SAVE.loadVar(data, "npcID", "")
	pcHadFun = SAVE.loadVar(data, "pcHadFun", false)
