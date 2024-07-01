extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "StocksNovaRishaForcedVagOrAnal"
	
func _run():
	if(state == ""):
		addCharacter("nova")
		addCharacter("risha")

	if(state == ""):
		playAnimation(StageScene.StocksSpitroast, "tease", {npc="risha", npc2="nova", bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true, hard=true}, npc2BodyState={exposedCrotch=true, hard=true}})
		
		saynn("You hear two guards approaching, they were patrolling the station but now they seem to be more interested in your assets on offer. A husky and a tall lynx walk up to the stocks. Nova is first to talk.")

		saynn("[say=nova]Oh hey, look at who is still stuck in stocks.[/say]")

		saynn("Risha smirks and purrs softly while watching you.")

		saynn("[say=risha]You thinking what I’m thinking?[/say]")

		saynn("Both guards stand in front of you, showing off their feminine hips to you. The lynx hipbumps the husky, causing her to lose balance for a second.")

		saynn("[say=nova]You’re such a bitch, Risha.[/say]")

		saynn("Risha giggles and pats your head. You’re being slightly confused by their interaction.")

		saynn("[say=risha]Pfff. Nova, I bet you’d love to be locked in one of these, have your cunt stuffed by every inmate’s dick in the prison.[/say]")

		saynn("[say=nova]Projecting much? Anyway, who fucks what?[/say]")

		saynn("Nova unzips her undersuit and exposes her sheath with the canine-type dick poking out already. Risha does the same, exposing her barbed cock. They’re both herms, dickgirls!")

		saynn("Risha asserts herself first.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("[say=risha]The cunt is mine.[/say]")

		# (else)
		else:
			saynn("[say=risha]Ass is mine.[/say]")

		saynn("Nova crosses her arms.")

		saynn("[say=nova]And why is that? I’m an alpha dog of this prison![/say]")

		saynn("[say=risha]Pff, you’re soft, Nova. I'm a better breeder than you, stronger genes. Wanna try me, slut?[/say]")

		saynn("You’re too afraid to join this conversation, they both look quite strong while you’re stuck helplessly in the stocks. Nova pouts and growls softly.")

		saynn("[say=nova]Fine. I will take {pc.his} throat hole then, it’s more tight anyway.[/say]")

		saynn("They both take their places around you, Risha walks up behind you and puts her paws on your {pc.masc} butt, groping it. You squirm under her less-than-gentle touch and receive a spank for your wiggling. Nova stays in front of you and rubs her own crotch until her canine cock shows up from the sheath and gets harder. She smirks watching you being helpless like that. She gets herself almost fully hard and then plops her cock onto your face.")

		saynn("[say=nova]Open your mouth, cutie, don’t make me force it open~.[/say]")

		if(GM.pc.hasVagina()):
			addButton("Open mouth", "Accept your faith, maybe you will like it", "vaginal")
		else:
			addButton("Open mouth", "Accept your faith, maybe you will like it", "anal")

	if(state == "vaginal"):
		playAnimation(StageScene.StocksSpitroast, "sex", {npc="risha", npc2="nova", npcCum=true, pcCum=true, bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true, hard=true}, npc2BodyState={exposedCrotch=true, hard=true}})
		# (vaginal version)

		saynn("You open your mouth a bit, enough to stick your tongue out to lap at the base of her member. Nova smirks and positions herself so the tip of her cock is brushing against your lips. You take it in and start to teasingly lick it, catching her precum. Her husky tail wiggles happily.")

		# (if pussy)

		saynn("All the while Risha presses her feline cock against your outer pussy lips and easily spreads them open, now prodding at the entering itself. Her barbs are soft, their friction against your sensitive folds feels pretty nice, you let out little moans while your body betrays you and gets aroused.")

		saynn("[say=risha]Oh yeah, you love being used, don’t you.[/say]")

		saynn("It didn’t even sound like a question, Risha puts her paws on your waist and pulls you back, forcing her cock to penetrate your slit and stretch it. And when you open your mouth to let out a moan, Nova buckles her hips forward and shoves a huge chunk of her cock down your throat, instantly muffling any noises from you. You’re being fucked from both sides and can’t do anything about it! Your throat and pussy clench around their dicks but it only makes them more eager to start using your holes in unison.")

		saynn("Risha quickly picks up the pace, pounding your cunt so much that her hips send your {pc.thick} buttcheeks bouncing, your soft inner walls quickly gets spread out and coated with a mix of your female juices and her precum, the barbs softly racking at them, such a strange but pleasurable feeling.")

		saynn("[say=risha]Know what these are for? To scrape at wombs and make sluts like you ovulate.[/say]")

		saynn("On the other end, Nova takes it nice and slow, preparing your mouth with slow steady thrusts, she shoves her cock deep enough for it to go down your throat, really putting your gag reflex and breathing technique under the test. Your eyes are glued to her crotch, you notice her knot slowly inflating and already smacking against your lips as she tries to force that orb in too. Nova reacts to what Risha said.")

		saynn("[say=nova]Mmh~. Knots are better though, they keep sluts still to make sure they’re bred nicely. And also prevent cum from leaking.[/say]")

		saynn("Nova starts holding onto the stocks and then just moving her hips back and forth, using your throat hands-free. You don’t forget to use your tongue, you try to press it against the veiny surface, creating more friction and coating the cock with more of your saliva. Nova starts panting heavily, her cock throbbing even so slightly inside your mouth. Risha chuckles at the answer.")

		saynn("[say=risha]Bitch, spread your cunt for me and I will show you what a properly bred whore looks like, you will be begging for more kittens when I’m done with you.[/say]")

		saynn("You can barely follow the conversation when your fuck holes are being used at the same time, you let out muffled noises and drool a lot while you’re getting face-fucked by Nova and pussy-fucked by Risha, you feel yourself quickly closing in on your peak. Risha’s barbed cock rubs against your g-spot while also pounding at the blockade leading to your womb, your eyes begin to roll up by themselves from a sure amount of pleasure.")

		saynn("It only takes a few more seconds before you feel your first orgasm overwhelming you. You squirm and struggle against the stocks, your legs shake and wanna give up but Risha holds your ass nice and stuffed while still pushing you through your orgasm, overstimulating you. You’re forced to deepthroat Nova’s cock so you’re experiencing a slight lack of oxygen, it amplifies each orgasmic wave, sending your mind somewhere high, your eyes roll up, you’re being fucked silly.")

		# (if has penis)
		if(GM.pc.hasPenis()):
			saynn("Your {pc.cock} shoots its whole load and creates a mess underneath you.")

		saynn("[say=nova]Oh fuck, {pc.his} throat is milking my cock, I can’t-[/say]")

		saynn("[say=risha]Yeah, the bitch is cumming. Hope {pc.he} likes to be bred by a barbed cock.[/say]")

		saynn("Nova’s knot is pressed against your lips, she is breathing heavily as your throat squeezes her shaft and your tongue rubs against her orb. After a few passionate moans, she tries to thrust her hips forward a few times before suddenly cumming, her canine cock sending a huge load down your throat. At the same time, Risha breaks through your cervix and proceeds to stuff your womb full to the brim with her cum, the barbs of her cock suddenly feel way more stiff as they dig into the soft inner walls of your pussy. It’s too much, you feel yourself being pushed over another peak. No thoughts, your eyes only show primal desire, your body squirms and welcomes all the cum from the dickgirls.")

		saynn("Since Nova doesn’t have barbs on her cock, she pulls out early and gives you a great cum shower as her orgasm comes to its end. Then Risha waits for her cock to become less spiky before pulling out too, causing your used cunt to leak with her sticky semen. You’re gasping for air and feel just as full as you were a second ago, you’re stuffed with so much cum.")

		addButton("Continue", "Wow..", "continue")

	if(state == "anal"):
		playAnimation(StageScene.StocksSpitroast, "sex", {npc="risha", npc2="nova", pcCum=true, npcCum=true, bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true, hard=true}, npc2BodyState={exposedCrotch=true, hard=true}})
		# (anal version)

		saynn("You open your mouth a bit, enough to stick your tongue out to lap at the base of her member. Nova smirks and positions herself so the tip of her cock is brushing against your lips. You take it in and start to teasingly lick it, catching her precum. Her husky tail wiggles happily.")

		# (if anal diff)

		saynn("All the while Risha spits on her feline cock and then presses it against your anal ring. She holds your butt spread open while prodding at the tailhole with more pressure until the head of her cock slips in. Her barbs are soft, their friction against your sensitive flesh feels pretty nice, you let out little moans while your body betrays you and gets aroused.")

		saynn("[say=risha]Oh yeah, you love being used, don’t you.[/say]")

		# (diff)

		saynn("It didn’t even sound like a question, Risha puts her paws on your waist and pulls you back, forcing her cock to penetrate your anus and stretch it. And when you open your mouth to let out a moan, Nova buckles her hips forward and shoves a huge chunk of her cock down your throat, instantly muffling any noises from you. You’re being fucked from both sides and can’t do anything about it! Your throat and pussy clench around their dicks but it only makes them more eager to start using your holes in unison.")

		# (diff)

		saynn("Risha quickly picks up the pace, pounding your ass so much that her hips send your {pc.thick} buttcheeks bouncing, your soft inner walls quickly gets spread out and coated with a mix of her saliva and precum, barbs softly racking at them, such a strange but pleasurable feeling.")

		saynn("[say=risha]Know what these are for? To scrape at wombs and make sluts ovulate.[/say]")

		saynn("On the other end, Nova takes it nice and slow, preparing your mouth with slow steady thrusts, she shoves her cock deep enough for it to go down your throat, really putting your gag reflex and breathing technique under the test. Your eyes are glued to her crotch, you notice her knot slowly inflating and already smacking against your lips as she tries to force that orb in too. Nova reacts to what Risha said.")

		saynn("[say=nova]Mmh~. Knots are better though, they keep sluts still to make sure they’re bred nicely. And also prevent cum from leaking.[/say]")

		saynn("Nova starts holding onto the stocks and then just moving her hips back and forth, using your throat hands-free. You don’t forget to use your tongue, you try to press it against the veiny surface, creating more friction and coating the cock with more of your saliva. Nova starts panting heavily, her cock throbbing even so slightly inside your mouth. Risha chuckles at the answer.")

		saynn("[say=risha]Bitch, spread your cunt for me and I will show you what a properly bred whore looks like, you will be begging for more kittens when I’m done with you.[/say]")

		# (diff)

		saynn("You can barely follow the conversation when your fuck holes are being used at the same time, you let out muffled noises and drool a lot while you’re getting face-fucked by Nova and butt-fucked by Risha, you feel yourself quickly closing in on your peak.")

		# (if has penis)
		if(GM.pc.hasPenis()):
			saynn("Risha’s barbed cock smashes your prostate each time she thrusts inside you, causing your {pc.cock} to leak a bit of your {pc.cum} every time.")

		saynn("It only takes a few more seconds before you feel your first orgasm overwhelming you. You squirm and struggle against the stocks, your legs shake and wanna give up but Risha holds your ass nice and stuffed while still pushing you through your orgasm, overstimulating you. You’re forced to deepthroat Nova’s cock so you’re experiencing a slight lack of oxygen, it amplifies each orgasmic wave, sending your mind somewhere high, your eyes roll up, you’re being fucked silly.")

		# (if has penis)
		if(GM.pc.hasPenis()):
			saynn("Your {pc.cock} shoots its whole load and creates a mess underneath you.")

		saynn("[say=nova]Oh fuck, {pc.his} throat is milking my cock, I can’t-[/say]")

		saynn("[say=risha]Yeah, the bitch is cumming. Hope {pc.he} likes to be fucked by a barbed cock.[/say]")

		# (diff)

		saynn("Nova’s knot is pressed against your lips, she is breathing heavily as your throat squeezes her shaft and your tongue rubs against her orb. After a few passionate moans, she tries to thrust her hips forward a few times before suddenly cumming, her canine cock sending a huge load down your throat. At the same time, Risha shoves her dick as deep as your ass allows and proceeds to stuff you full to the brim with her cum, the barbs of her cock suddenly feel way more stiff as they dig into your soft inner walls. It’s too much, you feel yourself being pushed over another peak. No thoughts, your eyes only show primal desire, your body squirms and welcomes all the cum from the dickgirls.")

		# (diff)

		saynn("Since Nova doesn’t have barbs on her cock, she pulls out early and gives you a great cum shower as her orgasm comes to its end. Then Risha waits for her cock to become less spiky before pulling out too, causing your used butt to leak with her sticky semen. You’re gasping for air and feel just as full as you were a second ago, you’re stuffed with so much cum.")

		addButton("Continue", "Wow..", "continue")

	if(state == "continue"):
		playAnimation(StageScene.StocksSpitroast, "tease", {npc="risha", npc2="nova"})
		
		saynn("Dickgirls wipe their dicks against you and put them away. You’re still a mess, both mentally and physically, your face doesn’t show much of anything, just.. lust. Nova notices that and scritches you under the chin and then [b]draws a tally mark on your cheek[/b].")

		saynn("[say=nova]Sorry for breaking you, sweetie~[/say]")

		saynn("Risha lands a smack on your ass before [b]leaving a tally mark on you too[/b].")

		saynn("[say=risha]Don’t be, that’s what the inmates are for.[/say]")

		saynn("They both eye you out and then leave you to rest.")

		# (scene ends)

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action in ["continue"]):
		processTime(RNG.randi_range(3, 5)*60)
	
	if(_action in ["vaginal", "anal"]):
		processTime(RNG.randi_range(40, 60)*60)
	
	if(_action == "vaginal"):
		GM.pc.gotVaginaFuckedBy("risha")
		GM.pc.cummedInVaginaBy("risha")
		GM.pc.gotThroatFuckedBy("nova")
		GM.pc.cummedInMouthBy("nova")
		GM.pc.cummedOnBy("nova")
		GM.pc.addSkillExperience(Skill.SexSlave, 40, "rishanova_fuck")
		GM.pc.orgasmFrom("risha")
		
	if(_action == "anal"):
		GM.pc.gotAnusFuckedBy("risha")
		GM.pc.cummedInAnusBy("risha")
		GM.pc.gotThroatFuckedBy("nova")
		GM.pc.cummedInMouthBy("nova")
		GM.pc.cummedOnBy("nova")
		GM.pc.addSkillExperience(Skill.SexSlave, 40, "rishanova_fuck")
		GM.pc.orgasmFrom("risha")
		
	if(_action == "continue"):
		GM.pc.addTallymarkFace()
		GM.pc.addTallymarkCrotch()
			
		if(RNG.chance(60)):
			var zone = BodyWritingsZone.getRandomZone()
			GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
			addMessage("Risha also left a memento on your "+BodyWritingsZone.getZoneVisibleName(zone)+"..")

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)


