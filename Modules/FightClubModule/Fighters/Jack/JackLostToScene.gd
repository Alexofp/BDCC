extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "JackLostToScene"

func _run():
	if(state == ""):
		addCharacter("jack")
		playAnimation(StageScene.Duo, "kneel", {
			npc="jack", npcAction="stand", 
			bodyState={},
			npcBodyState={exposedCrotch=true,hard=true},
		})

	if(state == ""):
		saynn("You lose all the ability to fight but just before you hit the ground, Jack catches you by the collar and keeps you from collapsing.")

		saynn("[say=jack]Got ya.[/say]")

		saynn("You grab onto his hand and try to pry it off but his grasp is just too powerful. Then you try to strike and kick his chest but he is like a wall, impenetrable to your weak attacks. Jack just nickers at your silly actions.")

		addButtonWithChecks("Offer a condom", "(oral) Maybe the horsie won’t breed you raw", "offer_a_condom", [], [ButtonChecks.HasCondoms])
		addButton("Breeding", "See what happens next..", "breeding")
		GM.ES.triggerRun("ArenaFighterPCLost", ["jack"])

	if(state == "offer_a_condom"):
		# (needs a condom)
		playAnimation(StageScene.SexOral, "tease", {
			pc="jack", npc="pc", 
			bodyState={exposedCrotch=true,hard=true,condom=true,},
			npcBodyState={},
		})

		saynn("You give up any resistance and instead produce a packaged condom and bring it into Jack’s view. Your gaze is pleading for him to use it. Jack raises his brow.")

		saynn("[say=jack]Hah. Ya sure it’ll hold? Although, now I have a different idea.[/say]")

		saynn("Jack grabs your offering and lets go of your collar, letting you hit the floor. You get up to your knees and watch the horse rip the package open and then expose his sheath that houses his cock. The tip of his member is out but that's not enough to put the rubber on.")

		saynn("[say=jack]Need ya help here.[/say]")

		saynn("Instead of explaining, Jack instead puts a hand on the back of your head and shoves it towards his crotch, letting you get a great view of his flat flared member while it’s being rubbed against your cheek. His precum is thick, it quickly makes you look like a wet mess. After being used as a sheath polisher for a bit, you begin to feel his cock getting harder and pushing you away even as it fills with blood.")

		saynn("His cock is huge, like {jack.penisSizeStr} huge. The glands on the tip being inflated and the veiny texture make it look even more intimidating. Jack grabs your attention by pulling your chin close while holding the condom.")

		saynn("[say=jack]I’m gonna put this on. And stuff it inside your belly.[/say]")

		saynn("Oh no, it doesn’t sound like he wants to hear your input on this. He holds his shaft with one hand while applying the condom and dragging it over most of his length, making it look like a tasty oversized lollipop.")

		saynn("The crowd cheers for him to destroy your throat faster. Jack holds the back of your head again and positions himself above you, making it so you have to raise your chin super high, probably to avoid excessive bending of a cock. So experienced this guy is.")

		saynn("[say=jack]Open up, pretty thing.[/say]")

		saynn("Well, it seems you don’t have a choice..")

		addButton("Open mouth", "Let it happen", "open_mouth")

	if(state == "open_mouth"):
		playAnimation(StageScene.SexOral, "sex", {
			pc="jack", npc="pc", 
			bodyState={exposedCrotch=true,hard=true,condom=true,},
			npcBodyState={},
		})
		
		saynn("Blush appears on your cheeks the more you watch his erect horse cock. You slowly part your lips and then try to open your mouth as wide as you can but even that wasn’t enough, the flat flared out tip plugs your mouth full and gets caught on the teeth, preventing easy insertion.")

		saynn("[say=jack]This is gonna be a bit rough, ya better brace.[/say]")

		saynn("Brace how? Hearing his words makes you tense up slightly, you turn your palms into fists and rest them on Jack’s leg while he positions himself at a bit of an angle before suddenly applying extra pressure, squeezing his flare past your teeth and forcing his cock down your throat.")

		saynn("It’s not fully inside but you already feel.. filled.. You find yourself barely being able to breathe, your suppression of the gag reflex is constantly being checked and your throat is stretched beyond what it can take. At least the condom seems to be a lubed one which allows Jack to slide his cock without feeling much friction.")

		saynn("Your whole body is tensed up hard, including your throat. But the stud pushes past that, shoving his horse cock deeper, gradually stretching you out. Your eyes already start to roll up slightly on their own from the lack of oxygen.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your own {pc.cock} is putting a lot of pressure against your chastity cage and leaking profusely, who thought that deepthroating can be so arousing.")
		elif(GM.pc.hasPenis()):
			saynn("Your own {pc.cock} is hard as a rock and leaking profusely, who thought that deepthroating can be so arousing.")

		saynn("[say=jack]So tight.[/say]")

		saynn("So deep, you feel his cock stuffing the tip of the condom with precum somewhere.. in your belly. Jack slowly picks up the pace, his huge balls slap against your chin every time he thrusts inside. You feel like you can’t do it anymore, you start gagging on his giant cock but that only makes him more eager. The audience loves seeing how much your throat is bulging out right now.")

		saynn("[say=jack]Nhhhrh.. Get ready.[/say]")

		saynn("Oh wow, you’re surprised you managed to endure such an onslaught on your throat for so long. But the main event is still yet to happen, as your stretched fuckhole clenches tighter around the shaft, Jack switches to slow powerful thrusts instead, pushing himself to his peak until finally letting out a horse whinny and cumming. As the cum travels through his shaft, his dick pulsates and throbs while you are forced to sit still and obey his flared cock stuffing the condom inside you with so much sticky stuff that your belly quickly starts to look inflated.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your {pc.cock} shoots out a weak load too! Being used as a cock sleeve felt so good that you managed to cum just from that. Through the cage even.")
		elif(GM.pc.hasPenis()):
			saynn("Your {pc.cock} shoots out its load too! Being used as a cock sleeve felt so good that you managed to cum just from that.")

		# (else if has pussy)
		elif(GM.pc.hasVagina()):
			saynn("Your wet pussy squirts out juices all over the floor. Being used as a cock sleeve felt so good that you managed to cum just from that.")

		saynn("After Jack is done using your throat, he gradually retracts his cock while leaving the filled rubber balloon inside, so lewd. There is zero mess, he ties up the condom and chuckles watching your slutty eyes and open mouth.")

		saynn("[say=jack]Ya did good, pretty thing.[/say]")

		saynn("You start pulling out the condom and it takes quite a while, you feel a lot of friction as the rubber rubs against your throat walls. But eventually you manage to do it. And wow, it’s so big that you’re wondering how it even was fitting inside you.")

		saynn("Jack nickers and puts his cock away, he seems satisfied enough with your throat. He climbs over the fence, leaving you alone with a hundred inmate eyes staring at you, so humiliating.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")


	if(state == "breeding"):
		playAnimation(StageScene.SexAllFours, "sexflop", {
			npc="pc", pc="jack", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,},
		})
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Jack makes you turn around and puts his free hand over your crotch, possessively feeling your pussy. His touch isn’t soft or gentle but you find it arousing. His bulge is pressing against your {pc.thick} butt.")

			saynn("[say=jack]Such a good catch.[/say]")

		# (if no pussy)
		else:
			saynn("Jack makes you turn around and puts his free hand over your crotch but not finding what he was looking far. His hand jumps onto your butt instead and prodding at your rear. His touch isn’t soft or gentle but you find it arousing.")

			saynn("[say=jack]Shame ya don’t possess a cunt. But this will do.[/say]")

		saynn("Resisting doesn’t seem to work against him, there is a reason this stud is one of the best fighters here on the arena. You might as well try to get some pleasure out of it..")

		# (if has clothing)
		if(!GM.pc.isFullyNaked()):
			saynn("Jack {pc.undressMessageS}, leaving you naked and exposed. The crowd quickly takes note of your {pc.breasts}.")

		# (else)
		else:
			saynn("Jack slides his hand over your naked curves and plays with your {pc.breasts}, making the crowd happy.")

		saynn("He then forcibly pulls you down to your knees before tugging his shorts down, letting his cock out. And wow, as he strokes it in your view, you notice how huge it is, the shaft must be at least {jack.penisSizeStr} with the heavy balls swaying underneath, one slightly higher than the other. Jack also offers you a view of the flat flared tip with inflated glances and a drop of thick precum hanging off of it.")

		saynn("You gulp and raise your brow, your body tenses up just imagining this cock inside you.")

		saynn("[say=pc]There is no way it will fit..[/say]")

		saynn("[say=jack]Wanna bet? Ya lost the first one.[/say]")

		saynn("You shake your head and glance down at the ground. Jack crouches behind you and presses a hand into your back, making you stand on all fours and stick your ass up for him.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("The stud takes it slow, holding you with one hand and guiding his shaft with another, the flared tip of his cock brushing against your {pc.pussyStretch} slit and lubricating it with pre. You produce some soft noises while your outer folds are being parted and your pussy entering being prodded. Such girth causes you to bite your lip and grip the floor tighter. Your inner walls slowly stretch until the fat head finally manages to sink in. That’s when he thrusts his hips forward, forcing half of his cock inside and making you squirm from the sensations of being penetrated.")

			saynn("[say=jack]Pretty tight.[/say]")

			saynn("Oh fuck, Jack starts railing you hard, pulling his horse cock out until only the flared head is left before shoving it deep inside your wet slit and smashing the cervix. All the while his hands pull your body back each time he thrusts forward, causing you to stick your tongue out and drool, it’s just too much.")

			saynn("It only takes a few more pleasurable motions before your pussy starts squirting juices from too much stimulation, you arch your back and moan passionately for the whole crowd while your legs really want to shake.")

			saynn("[say=pc]You’re too b-big! D-don’t break me![/say]")

			saynn("[say=jack]Why not?[/say]")

			saynn("Jack only pounds you harder, the crowd cheers when they see his cock creating a visible bulge on your belly. You’re not sure how but your pussy got stretched enough to fit his whole shaft, you feel his huge balls slapping against your crotch.")

			saynn("Your stretched slit squirts again and gets tighter around the horse cock while your shaky arms give up, causing you to lie down with your butt still up. Jack lets out a horse whinny, he is clearly close.")

		# (if no pussy)
		else:
			saynn("The stud takes it slow, holding you with one hand and guiding his shaft with another, the flared tip of his cock brushing against your {pc.analStretch} tailhole and lubricating it with pre. You produce some soft noises while your star is being prodded. Such girth causes you to bite your lip and grip the floor tighter. Your inner walls slowly stretch until the fat head finally manages to sink in. That’s when he thrusts his hips forward, forcing half of his cock inside and making you squirm from the sensations of being penetrated.")

			saynn("[say=jack]Pretty tight.[/say]")

			saynn("Oh fuck, Jack starts railing you hard, pulling his horse cock out until only the flared head is left before shoving it deep inside your butt. All the while his hands pull your body back each time he thrusts forward, causing you to stick your tongue out and drool, it’s just too much.")

			saynn("It only takes a few more pleasurable motions before your pleasure point receives too much stimulation, you arch your back and moan passionately for the whole crowd while your legs really want to shake.")

			saynn("[say=pc]You’re too b-big! D-don’t break me![/say]")

			saynn("[say=jack]Why not?[/say]")

			saynn("Jack only pounds you harder, the crowd cheers when they see his cock creating a visible bulge on your belly. You’re not sure how but your fuckhole got stretched enough to fit his whole shaft, you feel his huge balls slapping against your crotch.")

			saynn("Your stretched tailhole gets tighter around the horse cock while your shaky arms give up, causing you to lie down with your butt still up. Jack lets out a horse whinny, he is clearly close.")

		addButton("Get bred", "See what happens to you next..", "get_bred")

	if(state == "get_bred"):
		playAnimation(StageScene.SexAllFours, "fastflop", {
			npc="pc", pc="jack", 
			pcCum=true, npcCum=true,
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,},
		})
		
		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("After a few strong thrusts Jack neighs and forces his entire shaft inside you, smashing your womb before proceeding to stuff it! You bend your back and cry out a passionate moan while your babymaker is being filled to the brim with thick white horse cum. There is not nearly enough space, you can’t stop squirming around his cock while your soft insides are being painted white with some cum already escaping back and creating a quite wet mess.")

			saynn("[say=pc]F-f-ffuuck!..[/say]")

			saynn("Your own orgasm overwhelms you, a dragged out noise of pleasure escapes from your lips while ecstatic waves resonate and bounce inside you, leaving your mind shattered from too much pleasure. Your eyes are rolled up, your tongue is out, you look fucked silly.")

			saynn("Jack yanks his cock out and cums on your ass too, the audience is going wild over the view of your gaping pussy leaking so much cum.")

		# (if no pussy)
		else:
			saynn("After a few strong thrusts Jack neighs and forces his entire shaft inside you, smashing your ass before proceeding to stuff it! You bend your back and cry out a passionate moan while your butt is being filled to the brim with thick white horse cum. There is not nearly enough space, you can’t stop squirming around his cock while your soft insides are being painted white with some cum already escaping back and creating a quite wet mess.")

			saynn("[say=pc]F-f-ffuuck!..[/say]")

			saynn("Your own orgasm overwhelms you, a dragged out noise of pleasure escapes from your lips while ecstatic waves resonate and bounce inside you, leaving your mind shattered from too much pleasure. Your eyes are rolled up, your tongue is out, you look fucked silly.")

			saynn("Jack yanks his cock out and cums on your ass too, the audience is going wild over the view of your gaping anal leaking so much cum.")

			# (end)

		saynn("With no support from the horsie, you flop forward and proceed to pant heavily. Jack’s horse cock quickly becomes flaccid and hides in its sheath so he puts it away.")

		saynn("[say=jack]Pleasure breeding ya. Come back for more, pretty thing.[/say]")

		saynn("Jack admires the view for a second and climbs over the fence, leaving you a mess.")

		# (scene ends)
		
		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	
	if(_action == "offer_a_condom"):
		GM.pc.useBestCondom()
	
	if(_action == "open_mouth"):
		GM.pc.gotThroatFuckedBy("jack")
		GM.pc.addSkillExperience(Skill.SexSlave, 20, "jack_condombj")
		addFilledCondomToLootIfPerk(getCharacter("jack").createFilledCondom())
	
	if(_action == "get_bred"):
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy("jack")
			GM.pc.cummedInVaginaBy("jack")
		else:
			GM.pc.gotAnusFuckedBy("jack")
			GM.pc.cummedInAnusBy("jack")
		GM.pc.orgasmFrom("jack")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "jack_getbred")

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

