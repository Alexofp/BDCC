extends "res://Scenes/SceneBase.gd"

var usedCondom = false
var condomBroke = false

func _init():
	sceneID = "JackWonScene"

func _run():
	if(state == ""):
		addCharacter("jack")
		playAnimation(StageScene.Duo, "stand", {npc="jack", npcAction="kneel"})

	if(state == ""):
		saynn("Jack knees before you, unable to continue fighting. The crowd gasps seeing the stud hit the floor.")

		saynn("[say=jack]Fine, I give up. How does it feel, pretty thing.[/say]")

		saynn("You notice him rubbing his crotch, the bulge in his pants looks so huge.")

		saynn("[say=jack]I won’t resist if ya want a breedin’ from a stallion[/say]")

		addButton("Leave", "You won and that all that matters", "leave")
		addButtonWithChecks("Vaginal", "Ride him using your pussy", "vaginal", [], [ButtonChecks.HasReachableVagina])
		addButton("Anal", "Ride him while taking his cock up your butt", "anal")
		GM.ES.triggerRun("ArenaFighterPCWon", ["jack"])


	if(state == "leave"):
		saynn("You chuckle and prepare to leave.")

		saynn("[say=pc]Nah, you can jerk off for the crowd though.[/say]")

		saynn("[say=jack]Huh, enjoy your victory.[/say]")

		saynn("You get over the fence and go get your hard-earned reward.")
		
		addButton("Continue", "Time to leave", "endthescene")


	if(state == "vaginal"):
		# (needs pussy)
		playAnimation(StageScene.SexCowgirl, "tease", {
			npc="pc", pc="jack", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,},
		})

		saynn("You tilt your head while gazing at that bulge, wondering how good it would feel to take an entire horse cock inside you. These thoughts make you horny quite quickly, you sneakily brush your hand over your slit and bite your lip as you step towards the stallion. Jack offers you a welcoming smile.")

		saynn("[say=jack]Ya made the right choice.[/say]")

		saynn("You slap his cheek for being so cocky and straddle him, feeling his sheathed member through his shorts while you grind him.")

		saynn("[say=pc]Shut up, this will be done on my terms.[/say]")

		saynn("[say=jack]Be my guest, pretty thing.[/say]")

		# (if clothed)
		if(!GM.pc.isFullyNaked()):
			saynn("You {pc.undressMessage}, leaving yourself naked and your {pc.pussyStretch} pussy exposed. Then you shift back slightly and grab onto the sides of Jack’s shorts to slowly tug them down, allowing his cock to spring back after being caught on the elastic band.")

		# (else)
		else:
			saynn("Since your {pc.pussyStretch} pussy is already exposed, you don’t need to undress. But Jack does, you shift back slightly and you grab onto the sides of his shorts to slowly tug them down, allowing his cock to spring back after being caught on the elastic band.")

		saynn("And wow, his horse cock is huge, it gets trapped between your {pc.masc} thighs and gradually gets more erect, reaching a length of at least {jack.penisSizeStr} by the end, even brushing against your {pc.breasts}. Its flared head is staring you in the face, between all the inflated glands there is an urethra that seems to be leaking pre already. The balls are massive and heavy too, just imagining how much is stored in them makes you more wet. You can’t deny it, you are kinda excited to try this stallion for a ride.")

		addButtonWithChecks("Condom", "Stay on the safe side", "condom", [], [ButtonChecks.HasCondoms])
		addButton("Go raw", "Who needs protection", "go_raw")

	if(state == "condom"):
		playAnimation(StageScene.SexCowgirl, "tease", {
			npc="pc", pc="jack", 
			bodyState={exposedCrotch=true,hard=true,condom=true,},
			npcBodyState={exposedCrotch=true,},
		})
		
		saynn("You decide that you’re not ready to be actually bred and pull out a packaged condom. You quickly rip it open with your teeth and start applying it onto the giant shaft. The tip is already stuffed full with Jack’s thick precum, it looks kinda lewd. The rubber becomes quite thin the more you stretch it over the full length, hopefully it will be enough..")

		saynn("[say=jack]Ya sure it will hold?[/say]")

		saynn("[say=pc]If not you will have so much more problems.[/say]")

		# (continue as normal)
		addButton("Continue", "Time for fun", "go_raw")

	if(state == "go_raw"):
		playAnimation(StageScene.SexCowgirl, "sex", {
			npc="pc", pc="jack", 
			npcCum=true,
			bodyState={exposedCrotch=true,hard=true,condom=usedCondom},
			npcBodyState={exposedCrotch=true,},
		})
		
		saynn("Jack is sitting on the floor, supporting his back with his hands and with you straddling his crotch.")

		saynn("[say=jack]Whacha waitin’ for, pretty thing? I’m not gonna bite[/say]")

		saynn("You put on your mean face and grab Jack by the chin, forcing eye contact. All the while you silently raise above him and hover your wet pussy just near his flared horse cock, teasingly brushing your sensitive folds against that giant shaft.")

		saynn("You force a long kiss on his lips as you get a hold of his rod with your free hand and proceed to gradually lower yourself onto him, that fat flared head is prodding at your slit and spreads it open but actually getting it in proves to be quite tricky. You wince and huff annoyed into Jack’s mouth as you struggle to impale yourself onto that cock.")

		saynn("Jack pulls away from the kiss and nickers at your attempts. The crowd yells for you to take that giant cock in already.")

		saynn("[say=jack]Need a hand?[/say]")

		saynn("[say=pc]Shut up![/say]")

		saynn("With so much rage, one of your attempts suddenly succeeds, your {pc.pussyStretch} pussy stretches enough for that flared head to pop in. Applying so much pressure makes you take half of his cock in one go, you let out a loud moan as your inner walls get pushed aside and the cervix smashed. Your legs shake uncontrollably, you stick your tongue out and drool.")

		saynn("Pants escape from your mouth as you slowly get used to having that dick inside you. You put your hand on your crotch and feel a hard bump, it makes you feel quite accomplished.")

		saynn("[say=pc]It’s.. inside.[/say]")

		saynn("Little moans escape from your mouth as you even attempt to raise again. The veiny texture of his thick cock brushes against your insides and makes you feel ecstatic. The size queen inside you awakens, you start grinding his horse cock up and down trying to lower yourself onto it deeper each time. Jack clearly likes the feeling of your pussy, he produces an equine neigh and grins while watching you.")

		# (if condom)
		if(usedCondom):
			saynn("You slowly pick up the pace and start riding the stud, your hand slides down to your slit and rubs the clit while the other one rests on your {pc.breasts}. It feels good, the condom provides extra lube so the friction isn’t as high.")

		# (if no condom)
		else:
			saynn("You slowly pick up the pace and start riding the stud, your hand slides down to your slit and rubs the clit while the other one rests on your {pc.breasts}. It feels good, you feel his member leaking a huge amount of precum into you so the friction isn’t as high.")

		saynn("Your first orgasm quickly overtakes your body, passionate moans leave your mouth while your slit starts pulsating around the shaft, your legs and arms shiver while the rest of your body tenses up. Fuck it feels good, you push yourself through your climax and keep riding the horse, causing Jack to let out another animal noise, he seems to be close.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your pleasure point got rubbed to the point of your {pc.cock} shooting out a weak line of {pc.cum}. And then a few more, messing up your chastity cage.")
		elif(GM.pc.hasPenis()):
			saynn("Your pleasure point got rubbed to the point of your {pc.cock} shooting out a strong line of {pc.cum}. And then a few more.")

		addButton("Inside", "Let the horsie cum", "inside")

	if(state == "inside"):
		playAnimation(StageScene.SexCowgirl, "fast", {
			npc="pc", pc="jack", 
			pcCum=true,
			bodyState={exposedCrotch=true,hard=true,condom=usedCondom},
			npcBodyState={exposedCrotch=true,},
		})
		
		saynn("You force yourself onto that shaft like there is no tomorrow and make quite a bit of progress, your pussy can now fit most of Jack’s length inside, there is a visible bump on your belly each time you lower yourself onto him. The more you do it the louder Jack’s noises are, his balls are tensing up and his cock starts throbbing until the moment he is finally pushed over the edge.")

		saynn("[say=jack]Nnghh-h[/say]")

		# (if raw)
		if(!usedCondom):
			saynn("You force yourself onto that shaft as deep as you can, your womb is smashed by that flared head that explodes with a barrage of thick sticky cum the next very second. He grips the floor tightly and grunts loudly as his body is going through the orgasm. You’re being stuffed full of Jack’s virile semen, just like how you wanted. The sensations trigger a second orgasm.. And then another few, all in a row, you moan and quiver around that cock while it continues to paint your insides white and force more cum into your babymaker.")

		# (if condom)
		elif(usedCondom && !condomBroke):
			saynn("You force yourself onto that shaft as deep as you can, your womb is smashed by that flared head that explodes with a barrage of thick sticky cum the next very second. He grips the floor tightly and grunts loudly as his body is going through the orgasm. Luckily the condom seems to be holding, all the Jack’s virile semen is protected from impregnating you, just like how you wanted. The sensations trigger a second orgasm.. And then another few, all in a row, you moan and quiver around that cock while it continues to shoot more cum into that latex condom.")

			saynn("[say=pc]F-fuck~![/say]")

		# (if condom broke)
		elif(usedCondom && condomBroke):
			saynn("You force yourself onto that shaft as deep as you can, your womb is smashed by that flared head that explodes with a barrage of thick sticky cum the next very second. He grips the floor tightly and grunts loudly as his body is going through the orgasm. You get a feeling like something is wrong.. Oh, it seems [b]the condom wasn’t strong enough and breaks, spilling all of its contents![/b], you’re being stuffed full of Jack’s virile semen. The sensations trigger a second orgasm.. And then another few, all in a row, you moan and quiver around that cock while it continues to paint your insides white and force more cum into your babymaker. You’re not yet aware of the problem, it just feels strange..")

			saynn("[say=pc]F-fuck~![/say]")

		# (if bare)
		if(!usedCondom):
			saynn("Your belly looks inflated, Jack’s balls are all drained empty. There is not enough space inside you so the rest of cum starts spilling out already and creating a mess on Jack’s crotch. You pant heavily and slowly stand up, offering the view of your gaping leaking cunt to everyone.")

			saynn("[say=jack]Ya took a whole stallion like a champ, I’m not even mad for losing.[/say]")

			saynn("You grin and take a step back, covering your slit with your palm.")

			saynn("[say=pc]Consider yourself worthy~[/say]")

		# (if condom)
		elif(usedCondom && !condomBroke):
			saynn("Your belly looks inflated, Jack’s balls are all drained empty. All the semen is contained nicely in that condom so there is no mess anywhere. You tie the rubber thingie up and slowly stand up, offering the view of your gaping cunt to everyone. As you tug on the condom, you feel how it leaves your womb and stretched insides empty. And wow, that’s one huge cum balloon, it’s the size of a head at least.")

			saynn("[say=jack]Shame ya decided to use the rubber but I’m not even mad, your pussy took a whole stallion like a champ.[/say]")

			saynn("You grin and take a step back, waiting until your slit closes up on its own.")

			saynn("[say=pc]Consider yourself worthy~[/say]")

		# (if condom broke)
		elif(usedCondom && condomBroke):
			saynn("Your belly looks inflated, Jack’s balls are all drained empty. There is not enough space inside you so the rest of cum starts spilling out already and creating a mess on Jack’s crotch. That’s when you realize that something is wrong, no leaking should be happening. You pant heavily and slowly stand up, offering the view of your gaping stuffed cunt to everyone.")

			saynn("[say=jack]Seems your rubber broke. Enjoy being bred.[/say]")

			saynn("You look down at your pussy and pull out a broken condom.")

			saynn("[say=pc]Oh.. fuck.. fuck-fuck[/say]")

			# (if visibly pregnant)
			if(GM.pc.isVisiblyPregnant()):
				saynn("[say=jack]You’re already pregnant, why worry.[/say]")

				saynn("[say=pc]Yeah.. I guess you’re right. Still..[/say]")

			# (else)
			else:
				saynn("[say=jack]What? Ya will be a great mother.[/say]")

				saynn("[say=pc]Shut up!.. Fuck.. You’re so dead if I’m pregnant![/say]")

				# (end)

		saynn("You quickly gather your belongings and leave.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")


	if(state == "anal"):
		playAnimation(StageScene.SexCowgirl, "tease", {
			npc="pc", pc="jack", 
			bodyState={exposedCrotch=true,hard=true,},
			npcBodyState={exposedCrotch=true,},
		})
		
		saynn("You tilt your head while gazing at that bulge, wondering how good it would feel to take an entire horse cock inside you. These thoughts make you horny quite quickly, you sneakily brush your hand over your slit and bite your lip as you step towards the stallion. Jack offers you a welcoming smile.")

		saynn("[say=jack]Ya made the right choice.[/say]")

		saynn("You slap his cheek for being so cocky and straddle him, feeling his sheathed member through his shorts while you grind him.")

		saynn("[say=pc]Shut up, this will be done on my terms.[/say]")

		saynn("[say=jack]Be my guest, pretty thing.[/say]")

		# (if clothed)
		if(!GM.pc.isFullyNaked()):
			saynn("You {pc.undressMessage}, leaving yourself naked and your {pc.analStretch} tailhole exposed. Then you shift back slightly and grab onto the sides of Jack’s shorts to slowly tug them down, allowing his cock to spring back after being caught on the elastic band.")

		# (else)
		else:
			saynn("Since your {pc.analStretch} tailhole is already exposed, you don’t need to undress. But Jack does, you shift back slightly and you grab onto the sides of his shorts to slowly tug them down, allowing his cock to spring back after being caught on the elastic band.")

		saynn("And wow, his horse cock is huge, it gets trapped between your {pc.masc} thighs and gradually gets more erect, reaching a length of at least {jack.penisSizeStr} by the end, even brushing against your {pc.breasts}. Its flared head is staring you in the face, between all the inflated glands there is an urethra that seems to be leaking pre already. The balls are massive and heavy too, just imagining how much is stored in them makes you more aroused. You can’t deny it, you are kinda excited to try this stallion for a ride.")

		addButtonWithChecks("Condom", "Use the best rubber you have", "condom1", [], [ButtonChecks.HasCondoms])
		addButton("Go raw", "Who needs protection", "go_raw1")


	if(state == "condom1"):
		playAnimation(StageScene.SexCowgirl, "tease", {
			npc="pc", pc="jack", 
			bodyState={exposedCrotch=true,hard=true,condom=true,},
			npcBodyState={exposedCrotch=true,},
		})
		
		saynn("You decide that you’re not ready to be actually bred and pull out a packaged condom. You quickly rip it open with your teeth and start applying it onto the giant shaft. The tip is already stuffed full with Jack’s thick precum, it looks kinda lewd. The rubber becomes quite thin the more you stretch it over the full length, hopefully it will be enough..")

		saynn("[say=jack]Ya sure it will hold?[/say]")

		saynn("[say=pc]Hope so. At least it provides lube.[/say]")

		# (continue as normal)
		addButton("Continue", "Time for fun", "go_raw1")

	if(state == "go_raw1"):
		playAnimation(StageScene.SexCowgirl, "sex", {
			npc="pc", pc="jack", 
			npcCum=true,
			bodyState={exposedCrotch=true,hard=true,condom=usedCondom,},
			npcBodyState={exposedCrotch=true,},
		})
		
		saynn("Jack is sitting on the floor, supporting his back with his hands and with you straddling his crotch.")

		saynn("[say=jack]Whacha waitin’ for, pretty thing? I’m not gonna bite[/say]")

		saynn("You put on your mean face and grab Jack by the chin, forcing eye contact. All the while you silently raise above him and hover your needy anal hole just near his flared horse cock, teasingly brushing your butt against that giant shaft.")

		saynn("You force a long kiss on his lips as you get a hold of his rod with your free hand and proceed to gradually lower yourself onto him, that fat flared head is prodding at your fuckhole and spreads it open but actually getting it in proves to be quite tricky. You wince and huff annoyed into Jack’s mouth as you struggle to impale yourself onto that cock.")

		saynn("Jack pulls away from the kiss and nickers at your attempts. The crowd yells for you to take that giant cock in already.")

		saynn("[say=jack]Need a hand?[/say]")

		saynn("[say=pc]Shut up![/say]")

		saynn("With so much rage, one of your attempts suddenly succeeds, your {pc.analStretch} anal ring stretches enough for that flared head to pop in. Applying so much pressure makes you take half of his cock in one go, you let out a loud moan as your inner walls get pushed aside. Your legs shake uncontrollably, you stick your tongue out and drool.")

		saynn("Pants escape from your mouth as you slowly get used to having that dick inside you. You put your hand on your crotch and feel a hard bump, it makes you feel quite accomplished.")

		saynn("[say=pc]It’s.. inside.[/say]")

		saynn("Little moans escape from your mouth as you even attempt to raise again. The veiny texture of his thick cock brushes against your insides and makes you feel ecstatic. The size queen inside you awakens, you start grinding his horse cock up and down trying to lower yourself onto it deeper each time. Jack clearly likes the feeling of your butt, he produces an equine neigh and grins while watching you.")

		# (if condom)
		if(usedCondom):
			saynn("You slowly pick up the pace and start riding the stud, your hand slides down to Jack’s crotch and gets used as support while the other one rests on your {pc.breasts}. It feels good, the condom provides extra lube so the friction isn’t as high.")

		# (if no condom)
		else:
			saynn("You slowly pick up the pace and start riding the stud, your hand slides down to Jack’s crotch and gets used as support while the other one rests on your {pc.breasts}. It feels good, you feel his member leaking a huge amount of precum into you so the friction isn’t as high.")

		saynn("Your first orgasm quickly overtakes your body, passionate moans leave your mouth while your anal ring starts pulsating around the shaft, your legs and arms shiver while the rest of your body tenses up. Fuck it feels good, you push yourself through your climax and keep riding the horse, causing Jack to let out another animal noise, he seems to be close.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your prostate got rubbed to the point of your {pc.cock} shooting out a weak line of {pc.cum}. And then a few more, messing up your chastity cage.")
		elif(GM.pc.hasPenis()):
			saynn("Your prostate got rubbed to the point of your {pc.cock} shooting out a strong line of {pc.cum}. And then a few more.")

		addButton("Inside", "Let the horsie cum", "inside1")

	if(state == "inside1"):
		playAnimation(StageScene.SexCowgirl, "fast", {
			npc="pc", pc="jack", 
			pcCum=true,
			bodyState={exposedCrotch=true,hard=true,condom=usedCondom,},
			npcBodyState={exposedCrotch=true,},
		})
		
		saynn("You force yourself onto that shaft like there is no tomorrow and make quite a bit of progress, your {pc.masc} butt can now fit most of Jack’s length inside, there is a visible bump on your belly each time you lower yourself onto him. The more you do it the louder Jack’s noises are, his balls are tensing up and his cock starts throbbing until the moment he is finally pushed over the edge.")

		saynn("[say=jack]Nnghh-h[/say]")

		# (if raw)
		if(!usedCondom):
			saynn("You force yourself onto that shaft as deep as you can, your ass is smashed by that flared head that explodes with a barrage of thick sticky cum the next very second. He grips the floor tightly and grunts loudly as his body is going through the orgasm. You’re being stuffed full of Jack’s virile semen, just like how you wanted. The sensations trigger a second orgasm.. And then another few, all in a row, you moan and quiver around that cock while it continues to paint your insides white and force more cum into you.")

		# (if condom)
		elif(usedCondom && !condomBroke):
			saynn("You force yourself onto that shaft as deep as you can, your ass is smashed by that flared head that explodes with a barrage of thick sticky cum the next very second. He grips the floor tightly and grunts loudly as his body is going through the orgasm. Luckily the condom seems to be holding, all the Jack’s virile semen is protected from stuffing you, just like how you wanted. The sensations trigger a second orgasm.. And then another few, all in a row, you moan and quiver around that cock while it continues to shoot more cum into that latex condom.")

			saynn("[say=pc]F-fuck~![/say]")

		# (if condom broke)
		elif(usedCondom && condomBroke):
			saynn("You force yourself onto that shaft as deep as you can, your ass is smashed by that flared head that explodes with a barrage of thick sticky cum the next very second. He grips the floor tightly and grunts loudly as his body is going through the orgasm. You get a feeling like something is wrong.. Oh, it seems [b]the condom wasn’t strong enough and breaks, spilling all of its contents![/b], you’re being stuffed full of Jack’s virile semen. The sensations trigger a second orgasm.. And then another few, all in a row, you moan and quiver around that cock while it continues to paint your insides white and force more cum into you. You’re not yet aware of the problem, it just feels strange..")

			saynn("[say=pc]F-fuck~![/say]")

		# (if bare)
		if(!usedCondom):
			saynn("Your belly looks inflated, Jack’s balls are all drained empty. There is not enough space inside you so the rest of cum starts spilling out already and creating a mess on Jack’s crotch. You pant heavily and slowly stand up, offering the view of your gaping leaking tailhole to everyone.")

			saynn("[say=jack]Ya took a whole stallion like a champ, I’m not even mad for losing.[/say]")

			saynn("You grin and take a step back, covering your butt with your palm.")

			saynn("[say=pc]Consider yourself worthy~[/say]")

		# (if condom)
		elif(usedCondom && !condomBroke):
			saynn("Your belly looks inflated, Jack’s balls are all drained empty. All the semen is contained nicely in that condom so there is no mess anywhere. You tie the rubber thingie up and slowly stand up, offering the view of your gaping tailhole to everyone. As you tug on the condom, you feel how it makes you feel empty inside. And wow, that’s one huge cum balloon, it’s the size of a head at least.")

			saynn("[say=jack]Ya took a whole stallion like a champ, I’m not even mad for losing.[/say]")

			saynn("You grin and take a step back, waiting until your anal ring closes up on its own.")

			saynn("[say=pc]Consider yourself worthy~[/say]")

		# (if condom broke)
		elif(usedCondom && condomBroke):
			saynn("Your belly looks inflated, Jack’s balls are all drained empty. There is not enough space inside you so the rest of cum starts spilling out already and creating a mess on Jack’s crotch. That’s when you realize that something is wrong, no leaking should be happening. You pant heavily and slowly stand up, offering the view of your gaping stuffed tailhole to everyone.")

			saynn("[say=jack]Seems your rubber broke. Oops.[/say]")

			saynn("You reach down to your butt and pull out a broken condom.")

			saynn("[say=pc]Oh.. fuck[/say]")

			# (if visibly pregnant)
			if(GM.pc.isVisiblyPregnant()):
				saynn("[say=jack]You’re already pregnant, why worry.[/say]")

				saynn("[say=pc]Yeah.. I guess you’re right.[/say]")

			# (else)
			else:
				saynn("[say=jack]What? You can’t get pregnant there, can you.[/say]")

				saynn("[say=pc]Shut up! Fuck, you made me a mess.[/say]")

				# (end)

		saynn("You quickly gather your belongings and leave.")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	if(_action in ["condom", "condom1"]):
		usedCondom = true
		var chance = GM.pc.useBestCondom()
		condomBroke = getCharacter("jack").shouldCondomBreakWhenFucking(GM.pc, chance)
		
	if(_action == "inside"):
		GM.pc.gotVaginaFuckedBy("jack")
		if(!usedCondom || condomBroke):
			GM.pc.cummedInVaginaByAdvanced("jack", {condomBroke=condomBroke})
			GM.pc.cummedOnBy("jack")
		elif(usedCondom):
			addFilledCondomToLootIfPerk(getCharacter("jack").createFilledCondom())
		
		GM.pc.orgasmFrom("jack")
		GM.pc.addSkillExperience(Skill.SexSlave, 50, "jack_getbred")
		
	if(_action == "inside1"):
		GM.pc.gotAnusFuckedBy("jack")
		if(!usedCondom || condomBroke):
			GM.pc.cummedInAnusBy("jack")
			GM.pc.cummedOnBy("jack")
		elif(usedCondom):
			addFilledCondomToLootIfPerk(getCharacter("jack").createFilledCondom())
		
		GM.pc.orgasmFrom("jack")
		GM.pc.addSkillExperience(Skill.SexSlave, 50, "jack_getbred")
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["usedCondom"] = usedCondom
	data["condomBroke"] = condomBroke
	
	return data
	
func loadData(data):
	.loadData(data)
	
	usedCondom = SAVE.loadVar(data, "usedCondom", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
