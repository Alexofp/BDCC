extends SceneBase

var isStrapon = false

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

		addButtonWithChecks("Cowgirl", "Kidlat will ride you with her pussy", "sex_cowgirl", [], [[ButtonChecks.HasReachablePenis]])
		addButton("Back", "Never mind", "")
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

	if(_action == "sex_cowgirl"):
		processTime(3*60)

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

	setState(_action)

func saveData():
	var data = .saveData()

	data["isStrapon"] = isStrapon

	return data

func loadData(data):
	.loadData(data)

	isStrapon = SAVE.loadVar(data, "isStrapon", false)
