extends "res://Scenes/SceneBase.gd"

var rishaRemovedGag = false
var rishaPayed = false
var hadTallymarks = false

func _init():
	sceneID = "StocksRishaBlowjob"

func _reactInit():
	if(RNG.chance(50)):
		rishaPayed = true
	
func _run():
	if(state == ""):
		addCharacter("risha")
		playAnimation(StageScene.StocksSexOral, "tease", {npc="risha"})
		# (if can see)
		if(!GM.pc.isBlindfolded()):
			saynn("A guard walks up to you, a familiar one. It’s the lynx that helped to process you here.")

		# (if can’t see)
		else:
			saynn("Someone walks up to you. You hear heavy footsteps. You can’t quite tell but hearing the voice quickly makes you realize who it is. It’s the lynx that helped to process you here.")

		saynn("[say=risha]So. Doing well?[/say]")

		saynn("You try to shrug but realize that it’s impossible. The guard grabs you by the chin and makes you look at her crotch. No doubt she has a barbed feline cock somewhere behind all the armor.")

		#ACEPREGEXPAC - Risha face fucking you in the stocks has a few line variants
		#The If/Else statements are getting repetitive but atleast Im learning. I also have the suspicion that doing them everytime is not exactly *the best* way to code this, but hey, this early if it's working, it's working.
		#also with how horny Risha usually is, I imagine Preg-Risha is even hornier. I know there are "themes" to a pregnancy. Horny, Tired, Affectionate, Sick, and so on. Maybe if I added more scenes I could play into that?? Maybe its better if it was a guide rather than a strict rule, so I can whatever.

		if(getCharacter("risha").isVisiblyPregnant()):
			saynn("[say=risha]Here is the deal. This pregnancy has me so fucking horny. You suck me off right here and now and I will even reward you.[/say]")
		else:
			saynn("[say=risha]Here is the deal. I’m so fucking horny. You suck me off right here and now and I will even reward you.[/say]")

		# (if can’t oral)
		if(GM.pc.isOralBlocked()):
			saynn("[say=risha]I will even remove your gag free of charge.[/say]")

		addButton("Shake head", "You don’t wanna be paid for sex", "shake_head")
		addButton("Nod", "Getting credits for a little favor? Seems fair", "nod")

	if(state == "shake_head"):
		saynn("You break free from her grasp and shake your head. She hums and ruffles your hair.")

		saynn("[say=risha]Fine. Next time I might not be so kind.[/say]")

		addButton("Continue", "It's fine", "endthescene")

	if(state == "nod"):
		playAnimation(StageScene.StocksSexOral, "sex", {npc="risha", npcBodyState={exposedCrotch=true,hard=true}})
		
		saynn("You nod slightly. Risha chuckles and strips the crotch piece of her heavy armor. Then she pulls down her panties and exposes her girthy cock. It’s about {risha.penisSizeStr} and is of a feline type, no knot or anything, just little barbs on its long tip.")

		# (if can’t oral)
		if(rishaRemovedGag):
			saynn("She also frees your mouth, just as promised.")

		saynn("[say=risha]The barbs are soft, don’t worry~. I won’t destroy your throat. Unless you really want it.[/say]")

		saynn("Well that’s a relief. You can’t really use your arms or move your head so all the initiative is on her. She positions herself in front of you and guides her cock towards your lips. You part them and stick your tongue out. Then you lick her red shaft and drag your tongue along its length. The barbs indeed feel soft, through tickling them like that made Risha moan deeply. She can’t stand all the teasing anymore and pushes her member between your lips and then shoves it deeper, forcing you to open your mouth wide.")

		saynn("[say=risha]Oh fuck yeah. I like it rough, slut. Keep your preludes for soft bitches.[/say]")
		
		if(getCharacter("risha").isVisiblyPregnant()):
			saynn("She has to reach around her own pregnant belly to grab the back of your head to start face-fucking you, thrusting her giant cock deep until it hits the back of your mouth and then goes down your throat. She seems to be leaking already, you feel the taste of her precum on your tongue as she uses you like some fucktoy.")
		else:
			saynn("She puts her hands above and below your maw and starts face-fucking you, thrusting her giant cock deep until it hits the back of your mouth and then goes down your throat. She seems to be leaking already, you feel the taste of her precum on your tongue as she uses you like some fucktoy.")

		saynn("[say=risha]Were you practicing? You’re a natural cock sucker.[/say]")

		if(getCharacter("risha").isVisiblyPregnant()):
			saynn("She rams her cock deeper, with the underside of her belly pressed against your forehead, stealing your breathing each time she thrusts forward and causing your throat to visibly bulge. Her balls are slapping against your chin as she pounds your mouth faster and faster, you rub her barbs with tongue and feel the shaft pulsing as it shoots precum down your throat. Being forced to deepthroat her cat cock doesn’t feel quite good but at the same time.. it kinda does.. You clench your throat around her cock and watch her squirm and moan as she continues to stretch-fuck your mouthhole.")
		else:
			saynn("She rams her cock deeper, stealing your breathing each time she thrusts forward and causing your throat to visibly bulge. Her balls are slapping against your chin as she pounds your mouth faster and faster, you rub her barbs with tongue and feel the shaft pulsing as it shoots precum down your throat. Being forced to deepthroat her cat cock doesn’t feel quite good but at the same time.. it kinda does.. You clench your throat around her cock and watch her squirm and moan as she continues to stretch-fuck your mouthhole.")

		saynn("[say=risha]Fuck me, I’m close already. Don’t fucking move when I cum.[/say]")

		saynn("And you soon understand why. As she gets closer to her peak, her barbs become stiffer, they begin to softly rake your throat. Risha switches to slow but powerful thrusts, ramming that cock nice and deep each time. You barely get any air and she is breathing deeply, her cock throbs inside your throat. A few deep thrusts and she rams it in for the last time, moaning and grunting as her cock erupts with her sticky hot jizz. The stiff barbs keep you both stuck together like a knot would but this way Risha can at any moment decide to destroy your throat if she wanted to. She forcefully keeps your lips shut around her shaft, as she shoots more of her load into you. Eventually the barbs soften a little and she pulls her cock out and gives your facial too with the last few waves of cum.")

		saynn("She dries her shaft clean against your face and puts it away. Then she grabs a little black sharpie and [b]draws a tally mark on your cheek[/b].")

		# (if didn’t have any)
		if(!hadTallymarks):
			saynn("[say=risha]I’m first huh. This is just to keep track~.[/say]")

		# (else)
		else:
			saynn("[say=risha]You deserve that one~.[/say]")

		saynn("Then she grabs her tablet and finds your record. She hums.")

		# (if decided to pay)
		if(rishaPayed):
			saynn("[say=risha]Good slut. One work credit for you~.[/say]")

			saynn("She carefully pats your head and leaves you alone, still stuck in stocks.")

		# (if not decided to pay)
		else:
			saynn("[say=risha]You know. I don’t think you deserve the payment. Just because whores must suffer sometimes~[/say]")

			saynn("You’re so angry. But she quickly leaves before you can tell her too much. You’re still helpless but now also helpless and used.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action in ["nod"]):
		processTime(RNG.randi_range(30, 60)*60)

	if(_action == "nod"):
		if(GM.pc.hasTallymarks()):
			hadTallymarks = true
		
		if(rishaPayed):
			GM.pc.addCredits(1)
			addMessage("You received 1 credit")
		
		if(GM.pc.isOralBlocked()):
			rishaRemovedGag = true
			GM.pc.freeMouthDeleteAll()
			
		if(RNG.chance(40)):
			var zone = BodyWritingsZone.getRandomZone()
			GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
			addMessage("Risha also left a memento on your "+BodyWritingsZone.getZoneVisibleName(zone)+"..")
			
		GM.pc.addTallymarkFace()
		GM.pc.cummedInMouthBy("risha")
		GM.pc.cummedOnBy("risha")
		GM.pc.addSkillExperience(Skill.SexSlave, 20, "risha_stocksblow")
		GM.pc.gotThroatFuckedBy("risha")

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["rishaRemovedGag"] = rishaRemovedGag
	data["rishaPayed"] = rishaPayed
	data["hadTallymarks"] = hadTallymarks
	
	return data
	
func loadData(data):
	.loadData(data)
	
	rishaRemovedGag = SAVE.loadVar(data, "rishaRemovedGag", false)
	rishaPayed = SAVE.loadVar(data, "rishaPayed", false)
	hadTallymarks = SAVE.loadVar(data, "hadTallymarks", false)
