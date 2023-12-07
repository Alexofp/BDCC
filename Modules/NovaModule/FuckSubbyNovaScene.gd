extends "res://Scenes/SceneBase.gd"

var usedCondom = false
var usedNovasCondom = false
var condomBroke = false

func _init():
	sceneID = "FuckSubbyNovaScene"

func _run():
	if(state == ""):
		addCharacter("nova", ["naked"])
		playAnimation(StageScene.SexAllFours, "tease", {
			pc="pc",npc="nova",
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})
	
	if(state == ""):
		saynn("You pick up her weapon and jam it into the backplate of her armor where the reactor is. You send a little shock through it and all the armor pieces disconnect and fall to the floor, exposing the guard’s skin-tight undersuit. Nova gets pinned to the floor by you as you search her belt for handcuffs. Then you wrench her hands behind her back and cuff them together. She tries to resist, to shove you off, but she is not too enthusiastic about it. You give her round ass a firm smack so she would stop.")

		saynn("[say=nova]H-hey.[/say]")

		saynn("You grab her and make her get up before bending her over the nearby metal crate, holding her cuffed arms with one hand while the second one lifts her skirt and lands on the crotch. While searching for some kind of zipper on her suit, you grope her bulging out area and what’s under it, the girl really got a full package there. As you do that, Nova lets out some muffled noises and struggles against the cuffs.")

		saynn("[say=nova]So rough..[/say]")

		saynn("She gasps as you catch the hidden zipper and undo it, exposing Nova’s slightly aroused pussy slit and her cock sheath. You move her husky tail out of the way and give her red pussy lips a rub, they seem nice and wet, giving off a scent of a horny female. She squirms and moans around your digits, the tip of her canine cock shows up as she gets more horny.")

		saynn("[say=nova]What are you gonna do..[/say]")

		saynn("You decide to show rather than tell, you expose your {pc.cock} and quickly get yourself hard. Nova is huffing and puffing before giving up with the cuffs.")

		saynn("[say=nova]At least use a condom?.. I have some if you don’t..[/say]")

		saynn("The way she said it, it didn’t exactly sound like an order, more of a suggestion. While you are deciding, her own knotted cock seems to be fully erect, it’s stuck between her legs and the crate, pointing down at the floor.")

		addButton("No condom", "Go bare on her", "no_condom")
		addButtonWithChecks("Use condom", "Use the best condom that you have", "use_condom", [], [ButtonChecks.HasCondoms])
		addButton("Use her condom", "Use the condom from her. Who knows what quality it has", "use_her_condom")
		

	if(state == "fucking"):
		playAnimation(StageScene.SexAllFours, "sex", {
			pc="pc",npc="nova",
			bodyState={exposedCrotch=true,hard=true,condom=usedCondom},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		# (if no condom)
		if(!usedCondom):
			saynn("You decide that the rubber is not for you, that bratty slut deserves to be bred. You lick your digits and shove a few into her slit, spreading the petals open. Yes, she is wet and ready, her cock is leaking pre as you tease her.")

		# (if your condom)
		if(usedCondom && !usedNovasCondom):
			saynn("You lick your digits and shove a few into her slit, spreading the petals open. Yes, she is wet and ready, her cock is leaking pre as you tease her. You produce a packaged condom and rip it open with your teeth before swiftly putting it on your cock.")

		# (if nova’s condom)
		if(usedCondom && usedNovasCondom):
			saynn("You lick your digits and shove a few into her slit, spreading the petals open. Yes, she is wet and ready, her cock is leaking pre as you tease her. You find a strip of condoms on her belt, grab one and rip it open with your teeth before swiftly putting it on your cock.")

		saynn("[say=pc]You’re such a slut[/say]")

		saynn("[say=nova]Hmpf.. no you..[/say]")

		saynn("She is still acting like a brat. You get some of her arousal on your digits and then get a grasp on her neck before pulling her head to you a bit, making her arch her back. She was about to complain but you silence her by shoving the wet digits into her canine maw and resting them on her tongue. She seems quite confused at first.")

		saynn("[say=pc]Suck.[/say]")

		saynn("Nova is blushing hard, your cock is still brushing against her butt while you hold your digits in her mouth. She doesn’t seem to listen at first so you give her ass another smack, making it bounce. Nova whines and closes her eyes before proceeding to lick the digits. She cleans them well, thrusting her canine tongue between all your digits and then swallowing her juices. You can feel her getting more needy.")

		saynn("[say=pc]Good slut.[/say]")

		saynn("Though the nice time is over. You pull your digits out and dry them against her unzipped bodysuit. Then you guide your {pc.cock} towards her wet cunt and ram it in with one rough motion, stretching her wide and causing her to produce a loud moan. Fuck yeah, it feels good to have that brat squirming and clenching around your cock. You let go of her neck and press her back into the crate again, she will be fucked like this.")

		# (if no condom)
		if(!usedCondom):
			saynn("[say=nova]Ah.. Just.. Don’t cum inside.. I don’t need the pups.[/say]")

			saynn("[say=pc]That’s not for you to decide.[/say]")

		# (if condom)
		if(usedCondom):
			saynn("[say=nova]Ah.. You’re so lucky.[/say]")

			saynn("[say=pc]Maybe you just wanted this.[/say]")

			# (end)

		# (if no condom)
		if(!usedCondom):
			saynn("And with that, you pull your cock almost fully out just to ram it in again. She seems to be more used to you, her inner soft walls are slick from juices and your precum. You start moving your hips back and forth, taking that husky pussy and using it. The guard is clearly enjoying herself, her head is resting on the cold metal surface as she moans, her cock’s knot looks slightly inflated already.")

		# (if condom)
		if(usedCondom):
			saynn("And with that, you pull your cock almost fully out just to ram it in again. She seems to be more used to you, her inner soft walls are slick from juices and the condom’s lube. The rubber seems to be holding your precum well enough. You start moving your hips back and forth, taking that husky pussy and using it. The guard is clearly enjoying herself, her head is resting on the cold metal surface as she moans, her cock’s knot looks slightly inflated already.")

			# (end)

		saynn("[say=pc]You love being fucked, don’t deny it.[/say]")

		saynn("[say=nova]Nn.. hmphf..[/say]")

		saynn("You pick up the pace, you can hear your hips slapping against her butt as you fuck her nice and steady, you get a hold of her curly tail and tug on it, making her pull her lower half as you thrust deep inside, pounding at her g-spot and cervix already. Her own dick, rubbing against the corner of that crate, is leaking pre left and right, but you deny it any pleasure. Nova is rubbing her legs together, her pussy is leaking juices a lot, she has created quite a big wet spot underneath herself. You can feel her girly bits getting tighter around your cock, she can’t hide her feelings, she is moaning and panting a lot, her slutty eyes show desire. She is quite close. And so are you")

		saynn("[say=pc]Yeah? You accepted who you are? Little whore for me to fuck and breed.[/say]")

		addButton("Pull out", "Stay on the safe side and cum outside", "pull_out")
		addButton("Cum inside", "You are not planning to stop now", "cum_inside")
		addButton("Random", "Fifty fifty between cumming inside and outside", "do_random")

	if(state == "pull_out"):
		playAnimation(StageScene.SexAllFours, "tease", {
			pc="pc",npc="nova",
			bodyState={exposedCrotch=true,hard=true,condom=usedCondom},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		saynn("You keep pushing yourself to your peak, you push your hand into her back firmly just so you can switch to slow powerful pounding. After a few seconds of such a great onslaught, her moans become more loud and passionate, her slit clenches around your shaft as she starts cumming. Her body is shaking and shivering, her red canine cock shooting a few weak lines of cum down at the floor, her pussy pulsating and squirting girlcum, her cunt is trying to milk you. That’s when you pull your throbbing {pc.cock} out, just in time for your own orgasm.")

		# (if condom)
		if(usedCondom):
			saynn("The condom stays inside her slit, letting you enjoy cumming on her body.")

		saynn("You grunt a bit as you begin showering the back of that slut with your {pc.cum}. Wave after wave of your hot jizz lands on her butt, tail, skirt, suit, some even messes up her hair. Nova is thrashing against her restraints, her tongue is out while she rides her orgasm, still moaning and panting heavily.")

		saynn("Eventually you both calm down. Nova catches her breath, her messy cock slowly hides in its sheath. She wiggles as your hot {pc.cum} drips down from her bodysuit.")

		saynn("[say=nova]Bitch.. You made me a mess..[/say]")

		saynn("[say=pc]You want me to make you clean it?[/say]")

		saynn("[say=nova]No..[/say]")

		saynn("You rub your cock clean against her ass while listening to her grumbling. Then you put it away and ready yourself to walk away.")

		saynn("[say=nova]Hey! Unlock the cuffs!.. Please?[/say]")

		saynn("You feel like that will bring more trouble than it’s worth so you leave her alone and make your escape.")

		# (scene ends)

		addButton("Continue", "Time to run", "endthescene")

	if(state == "cum_inside"):
		playAnimation(StageScene.SexAllFours, "fast", {
			pc="pc",npc="nova",
			bodyState={exposedCrotch=true,hard=true,condom=usedCondom},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		saynn("You’re not gonna stop until that slut’s pussy is fully bred, you keep pounding at her cervix at a crazy pace. Your cock throbs inside and keeps stuffing Nova with pre but that’s not the goal, you hold the cocky brat still while you focus on ravaging her needy pussy. She is squirming under you, legs shivering, each slap of your hips against her butt shifts her forward a bit but you pull her back, trying to shove your dick deeper.")

		saynn("She can’t endure it for long, after a few strong thrusts Nova opens her mouth and lets out long lusty pleasure noises while her pussy walls get tight around your cock, making fucking her harder but also more pleasurable. Her body is shaking and shivering, her red canine cock shooting a few weak lines of cum down at the floor, her pussy pulsating and squirting girlcum, her cunt is trying to milk you. And you don’t stop.")

		saynn("[say=nova]Ah-h.. W-wai..[/say]")

		# (if no condom)
		if(!usedCondom):
			saynn("You just give her thighs a smack and grunt before shoving your {pc.cock} as deep as you can and breaking into Nova’s womb. Your own legs shiver while you begin stuffing the slut full of your hot sticky {pc.cum}. So much that the free space inside the womb quickly runs out and the rest escapes back, creating a mess on Nova’s butt and legs. But most of it is still stuffed inside her babymaker, causing her belly to look inflated.")

			saynn("You pull your cock out and watch a stream of {pc.cum} coming out of the guard’s used hole. Nova is breathing heavily, her canine tongue is still out.")

			saynn("[say=nova]So.. much..[/say]")

			saynn("Eventually you both calm down. Nova catches her breath, her messy cock slowly hides in its sheath. You quickly clean your cock against her and ready yourself to walk away.")

		# (if condom)
		if(usedCondom && !condomBroke):
			saynn("You just give her thighs a smack and grunt before shoving your {pc.cock} as deep as you can. Your own legs shiver while you begin stuffing the condom inside the slut’s womb full of your hot sticky {pc.cum}. You got lucky because despite the amount of it the condom managed to keep it all nice and secured. It had to stretch so much that Nova’s belly now looks inflated.")

			saynn("You pull your cock out and quickly tie the condom up before anything would leak. Nova is breathing heavily, her canine tongue is still out.")

			saynn("[say=nova]So.. much..[/say]")

			saynn("Eventually you both calm down. Nova catches her breath, her messy cock slowly hides in its sheath. You quickly fetch the filled condom and ready yourself to walk away.")

		# (if condom broke)
		if(usedCondom && condomBroke):
			saynn("You just give her thighs a smack and grunt before shoving your {pc.cock} as deep as you can. Your own legs shiver while you begin stuffing the condom inside the slut’s womb full of your hot sticky {pc.cum}. Suddenly you feel that something is very different.. Oh no. [b]The condom breaks inside Nova, spilling all its contents out![/b] There is so much {pc.cum} that Nova’s belly now looks inflated and it’s all in her womb so risky.")

			saynn("You pull your cock out and watch a stream of {pc.cum} coming out of the guard’s used hole. Nova is breathing heavily, her canine tongue is still out. She can feel something running down her leg.")

			saynn("[say=nova]Wait.. D-Did you use a condom?[/say]")

			saynn("[say=pc]It broke.[/say]")

			# (if visible pregnant already)
			if(getCharacter("nova").isVisiblyPregnant()):
				saynn("[say=nova]Wow. Whatever I guess, I’m already pregnant.[/say]")

			# (else)
			else:
				saynn("[say=nova]It did WHAT? Don’t you dare make me pregnant![/say]")

			saynn("Nova slowly catches her breath, her messy cock hides in its sheath. You quickly remove the popped condom and ready yourself to walk away. You really wanna walk away.")

			# (end)

		saynn("[say=nova]Hey! Don’t leave me like this![/say]")

		saynn("You feel like that will bring more trouble than it’s worth so you leave her alone and make your escape.")

		# (scene ends)


		addButton("Continue", "Time to run", "endthescene")
		
		

func _react(_action: String, _args):
	if(_action in ["no_condom", "use_condom", "use_her_condom"]):
		processTime(RNG.randi_range(10, 40)*60)
	
	if(_action == "use_condom"):
		usedCondom = true
		setState("fucking")
		return
		
	if(_action == "no_condom"):
		usedCondom = false
		setState("fucking")
		return
	
	if(_action == "use_her_condom"):
		usedCondom = true
		usedNovasCondom = true
		setState("fucking")
		return
	
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_random"):
		_action = RNG.pick(["cum_inside", "pull_out"])
	
	if(_action == "pull_out"):
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "nova_subbyfuck")
		GM.pc.orgasmFrom("nova")
	
	if(_action == "cum_inside"):
		if(usedCondom):
			var chance
			if(usedNovasCondom):
				chance = 50
			else:
				chance = GM.pc.useBestCondom()
			
			condomBroke = GM.pc.shouldCondomBreakWhenFucking("nova", chance)

		if(!usedCondom || (usedCondom && condomBroke)):
			GM.main.addRoomMemoryCurrentLoc("You notice some cum stains, a sign that somebody had sex here", 1)
			
			getCharacter("nova").cummedInVaginaByAdvanced("pc", {condomBroke=condomBroke})
			GM.pc.addSkillExperience(Skill.SexSlave, 20, "nova_subbyfuck")
		else:
			GM.pc.addSkillExperience(Skill.SexSlave, 40, "nova_subbyfuck")
			addFilledCondomToLootIfPerk(getCharacter("pc").createFilledCondom())
		
		GM.pc.orgasmFrom("nova")
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["usedCondom"] = usedCondom
	data["usedNovasCondom"] = usedNovasCondom
	data["condomBroke"] = condomBroke
	
	return data
	
func loadData(data):
	.loadData(data)
	
	usedCondom = SAVE.loadVar(data, "usedCondom", false)
	usedNovasCondom = SAVE.loadVar(data, "usedNovasCondom", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
