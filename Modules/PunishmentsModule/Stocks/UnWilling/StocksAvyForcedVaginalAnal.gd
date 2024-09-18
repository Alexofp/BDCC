extends "res://Scenes/SceneBase.gd"

var usedCondom = false
var condomBroke = false
var extraScene = false

func _init():
	sceneID = "StocksAvyForcedVaginalAnal"
	
func _run():
	if(state == ""):
		addCharacter("avy")
		playAnimation(StageScene.StocksSexOral, "tease", {npc="avy"})

	if(state == ""):
		saynn("You feel a very firm smack on your butt! Ow! You squirm and try to protect your rear but that’s impossible, you feel another smach and then a feminine giggle behind you.")

		saynn("[say=avy]Your ass bounces so much.[/say]")

		saynn("A dark foxy walks into your view. She spots a uniform with a red trim to it so you know she is not up for no good. She crosses her arms and scratches her chin while humming.")

		saynn("[say=avy]"+RNG.pick([
			"Hey there, bondage slut. Want me to help you?",
			"Got yourself into quite a situation, didn’t you. Need some help?",
			"I saw your naked butt and just couldn’t walk past. Need my help?",
		])+"[/say]")

		saynn("You’re not sure how to react yet, her tone sounds awfully cunning. Avy smirks at the lack of answer, you notice her pulling down her shorts slightly and exposing her sheath, she is a dickgirl! She also pulls out a packaged condom and presents it to you.")

		saynn("[say=avy]I will make it easy for you. I’m fucking you either way. Your next words will decide if I will use this or not.[/say]")

		addButton("Breed me!", "You crave for a good fucking, who needs condoms", "breed_me!")
		addButton("Beg", "Beg her to use a condom. Avy might listen or she might not", "beg")
		addButton("Fuck off", "Tell her that she can go screw herself instead", "fuck_off")


	if(state == "breed_me!"):
		playAnimation(StageScene.StocksSexOral, "tease", {npc="avy", npcBodyState={exposedCrotch=true, hard=true}})
		
		saynn("[say=pc]"+RNG.pick([
			"Yes! Please use me raw!",
			"Screw the rubber, you can breed me!",
			"You don’t need it, you can cum inside me! Please!",
			"I’m too horny to say no to breeding, please fuck me rough!",
		])+"[/say]")

		saynn("Avy chuckles and puts the condom away. She walks up close to you and shoves her sheath into your face, her height is perfect for that. You eagerly nuzzle her crotch and lick her knotted canine-type cock when it starts poking out.")

		saynn("[say=avy]Well, if you ask so nicely.[/say]")

		saynn("She looks down at you, at how you get her cock ready without even any force. She cock-slaps your cheeks a few times, leaving a little line of precum on your face before walking behind you. You feel excited, the scent of her cock and its taste made you more aroused than ever.")

		addButton("Continue", "See what happens next", "fucking")

	if(state == "beg"):
		playAnimation(StageScene.StocksSexOral, "tease", {npc="avy", npcBodyState={exposedCrotch=true, hard=true, condom=usedCondom}})
		
		saynn("[say=pc]"+RNG.pick([
			"Please don’t breed me.. Anything but that.",
			"Please use the condom, I don’t need your babies..",
			"Condom?.. Please?",
		])+"[/say]")

		saynn("Avy puts on a cunning smile again and hums. You clearly see her canine-type cock peeking out of its sheath as you humiliate yourself in front of her.")

		# (if yes condom)
		if(usedCondom):
			saynn("[say=avy]Fine, I’m not feeling too frisky today.[/say]")

			saynn("She rips the package open and stretches it using her cock. Then she steps behind you.")

		# (if no condom)
		if(!usedCondom):
			saynn("[say=avy]But what am I supposed to do with my rut~. Your begging only made me breed you more, slut[/say]")

			saynn("She strokes her cock in your view until it’s fully hard. She makes it leak a drop of precum onto your forehead. You blush. Seems like your begging didn’t work, she puts the condom away and walks behind you.")

		addButton("Continue", "See what happens next", "fucking")

	if(state == "fuck_off"):
		playAnimation(StageScene.StocksSexOral, "tease", {npc="avy", npcBodyState={exposedCrotch=true, hard=true}})
		
		saynn("[say=pc]"+RNG.pick([
			"How about you go fuck yourself?",
			"I will make you regret it, bitch, don’t you dare.",
			"Fuck off, whore, go find another red to fuck you in the ass.",
		])+"[/say]")

		saynn("Avy leans towards you and laughs into your face. Then she lands a loud slap on your cheek.")

		saynn("[say=avy]"+RNG.pick([
			"Bitch please~. Fine, I hear you. Could have just said no",
			"You’re not in a position to tell me that, whore~. Fine, I will have it my way then.",
		])+"[/say]")

		saynn("She slaps your face a few more times until the cheeks burn red. Ow. Each time she does that, her cock is visibly peeking out of its sheath more and becomes harder. It reaches the point where her cock is dripping pre.")

		saynn("Satisfied with that, she walks behind you while tracing her hand over your body.")

		addButton("Continue", "See what happens next", "fucking")

	if(state == "fucking"):
		playAnimation(StageScene.StocksSex, "sex", {npc="avy", pcCum=true, npcCum=true, bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true, hard=true, condom=usedCondom}})
		
		saynn("You can’t look behind you with the stocks blocking your head but you can feel it for sure. Avy places her hands on your {pc.thick} butt and presses her cock against your cunt. She starts rubbing her shaft against your sensitive pussy lips, your body betrays you and gets aroused quickly.")

		# (if condom)
		if(usedCondom):
			saynn("Even though she is wearing a condom, you feel the bumps of her canine cock as she grinds it against you. Your eyes half-close themselves as you focus on the pleasurable sensations.")

		# (if no condom)
		if(!usedCondom):
			saynn("You feel every bump of her cock, the warm drops of precum streaming down your slit as she grinds her shaft against you. Your eyes half-close themselves as you focus on the pleasurable sensations.")

		saynn("Her hand directs the tip towards your wet pussy entering and after a few prods, she enters you! Your petals happily spread under the onslaught of her cock, she bucked her hips forward and forced most of her cock inside you while also landing a smack on your ass. You can’t help but to squirm and moan as she starts using your {pc.vaginaStretch} cunt.")

		saynn("[say=avy]Such a whore, already wet for me~. Maybe I wanted to make your dry cunt suffer.[/say]")

		saynn("She chuckles and bends forward to hold onto the top part of the stocks while she fucks you. She starts thrusting her hips back and forth, forcing her cock deeper inside your cunt and making it stretch to fit her length, you can only guess that the length of her cock is about {avy.penisSizeStr}, it easily reaches your cervix and starts pounding at it.")

		saynn("You can’t hold it, you open your mouth and moan, your body is forced into a prime position for breeding, your slit being ravaged so rough makes you feel ecstatic. You cum quick, your body starts squirming and struggling against the restraints but Avy keeps fucking you through your orgasm, your inner walls clenching around her cock overstimulate you and make you squirt.")

		# (if has penis)
		if(GM.pc.isWearingChastityCage()):
			saynn("You own cock shoots out a loud down at the floor, it’s useless in its chastity cage so it just sways a lot while you’re being fucked.")
		elif(GM.pc.hasPenis()):
			saynn("You own cock shoots out a loud down at the floor, it’s useless today so it just sways a lot while you’re being fucked.")

		saynn("[say=avy]Hope you’re ready to be bred, bitch.[/say]")

		# (if no condom)
		if(!usedCondom):
			saynn("She quickly closes in on her own climax before doing one last hard thrust and shoving her whole cock inside you, knot included. She grunts and growls while her cock breaks through your cervix and starts stuffing you full of her hot sticky cum. She doesn’t pull out, making sure that your pussy gets properly bred. The knot helps to keep most of the cum inside, you keep squirming while more warm orgasmic waves wash over you.")

			saynn("[say=avy]"+RNG.pick([
				"Such a cumdump.",
				"Slut.",
				"Cum bucket.",
				"Whore.",
			])+"[/say]")

		# (if condom)
		if(usedCondom && !condomBroke):
			saynn("She quickly closes in on her own climax before doing one last hard thrust and shoving her whole cock inside you, knot included. She grunts and growls while her cock breaks through your cervix and starts filling the condom while inside you with hot sticky cum. Your womb quickly starts to feel stuffed, she doesn’t pull out, using this chance to stretch you out more with her knot, maybe to cause you discomfort. But it only sends more warm orgasmic waves through your body, causing you to squirm and make more pleasure noises. Luckily the condom seems to hold all the cum nice and safe.")

			saynn("[say=avy]Aww. And I used the worst condom I could find. Lucky whore.[/say]")

		# (if condom breaks)
		if(usedCondom && condomBroke):
			saynn("She quickly closes in on her own climax before doing one last hard thrust and shoving her whole cock inside you, knot included. She grunts and growls while her cock breaks through your cervix and starts filling the condom while inside you with hot sticky cum. Your womb quickly starts to feel stuffed, she doesn’t pull out, using this chance to stretch you out more with her knot, maybe to cause you discomfort. But it only sends more warm orgasmic waves through your body, causing you to squirm and make more pleasure noises. Suddenly you feel that something is different.. The cum feels way more warm than before. [b]Oh no, the condom breaks and spills all of its contents![/b]")

			saynn("[say=avy]Oops. You probably didn’t want that? Oh well.[/say]")

		saynn("When the knot starts to deflate, Avy pulls her cock out and rubs it clean against your butt. She quickly catches her breath and then [b]grabs a black marker and draws a tally mark on your body![/b]")

		# (if condom didn’t break)
		if(usedCondom && !condomBroke):
			saynn("Avy also ties the used condom up and leaves it nearby.")

		# (if thats it)
		if(!extraScene):
			saynn("She puts her cock away and slaps your ass for the last time.")

			saynn("[say=avy]It was great using you~[/say]")

			saynn("And with that, she leaves you, alone and used.")

			# (scene ends)
			addButton("Continue", "See what happens next", "endthescene")
		else:
			addButton("Continue", "There is more??", "analSex")

	if(state == "analSex"):
		playAnimation(StageScene.StocksSex, "fast", {npc="avy", pcCum=true, npcCum=true, bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true, hard=true, condom=usedCondom}})
		
		saynn("But that’s not all of it, Avy’s cock is still as hard as it was and she is still horny. She spreads your {pc.masc} buttcheeks and starts prodding at your anal ring! You wiggle, squirm and try to voice your opinion but she calms you down with another smack.")

		saynn("[say=avy]Don’t need to waste a condom to fuck you in the ass at least.[/say]")

		saynn("You still squirm while she holds your hips still and slowly applies more pressure on your tailhole. Eventually it starts to give in no matter how much you clench, Avy uses this moment and shoves most of her length inside, causing a spike of discomfort as she stretches your insides. But she seems to be quite a sadistic bitch, without giving you even a breather she starts sliding her cock inside your {pc.analStretch} ass, using the old cum as a lube.")

		saynn("Discomfort quickly switches with pleasure as you relax and stop clenching, moans begin to escape your mouth again as Avy now fucks you in the ass. She quickly picks up the old pace, her hips slap against you as she explores your backdoor.")

		saynn("[say=avy]"+RNG.pick([
			"So you’re a buttslut too, good to know.",
			"Oh yeah, I feel a buttslut when I fuck one.",
			"Clench more, whore, it will only make me harder.",
		])+"[/say]")

		saynn("As her knot inflates she applies extra effort and shoves it inside you, switching to knot-fucking, pulling the orb out just to stuff it back in a second later. It stretches you out so much, you’re on the verge of cumming already.")

		# (if has penis)
		if(GM.pc.hasPenis()):
			saynn("Your {pc.cock} is leaking {pc.cum} constantly as Avy milks your prostate to death, it feels so fucking good to be a buttslut for her.")

		saynn("Her cock starts throbbing and shooting cum deep inside you! Avy groans as she cums again, she knots you and keeps stuffing your ass as your legs shake. This time she pulls out her cock very quickly, using the last waves of her cum to leave a sticky mess on your back and ass!")

		saynn("[say=avy]Wow. I will make sure you find you again later, you know how to drain a girl’s balls. Hah.[/say]")

		saynn("She takes the marker again and [b]draws another tally mark on you![/b]")

		saynn("And, as if nothing happened, Avy leaves you and goes on her way, leaving you alone with your both holes used.")

		# (scene ends)

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action in ["beg", "breed_me!", "fuck_off"]):
		processTime(RNG.randi_range(2, 5)*60)
		
	if(_action in ["fucking", "analSex"]):
		processTime(RNG.randi_range(30, 60)*60)

	if(_action == "beg"):
		if(RNG.chance(50)):
			usedCondom = true
		else:
			usedCondom = false
	
	if(_action == "fucking"):
		if(usedCondom):
			condomBroke = getCharacter("avy").shouldCondomBreakWhenFucking(GM.pc, 50)
		
		GM.pc.gotVaginaFuckedBy("avy")
		if(!usedCondom || (usedCondom && condomBroke)):
			GM.pc.cummedInVaginaByAdvanced("avy", {condomBroke=condomBroke})
			GM.pc.addSkillExperience(Skill.SexSlave, 20, "avy_fuck")
		else:
			GM.pc.addSkillExperience(Skill.SexSlave, 40, "avy_fuck")
			addFilledCondomToLootIfPerk(getCharacter("avy").createFilledCondom())
		
		GM.pc.orgasmFrom("avy")
		GM.pc.addTallymarkCrotch()
		
		if(RNG.chance(50)):
			extraScene = true
		else:
			extraScene = false
			
		if(RNG.chance(50)):
			var zone = BodyWritingsZone.getRandomZone()
			GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
			addMessage("Avy also left a memento on your "+BodyWritingsZone.getZoneVisibleName(zone)+"..")
			

	if(_action == "analSex"):
		GM.pc.gotAnusFuckedBy("avy")
		GM.pc.cummedInAnusBy("avy")
		GM.pc.cummedOnBy("avy")
		GM.pc.orgasmFrom("avy")
		
		GM.pc.addTallymarkButt()

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["usedCondom"] = usedCondom
	data["condomBroke"] = condomBroke
	data["extraScene"] = extraScene
	
	return data
	
func loadData(data):
	.loadData(data)
	
	usedCondom = SAVE.loadVar(data, "usedCondom", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
	extraScene = SAVE.loadVar(data, "extraScene", false)
