extends RecruitSceneBase

var straponUsed = false
var vagVariant = false

func _init():
	sceneID = "FerriRecSceneOralSadism"

func _reactInit():
	putOn("ferri", "inmatewristcuffs")
	putOn("ferri", "basketmuzzle")

func _run():
	if(state == ""):
		addCharacter("ferri", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		straponUsed = (extra("strapon", "") != "") && (extra("variant", "") == "strapon")
		vagVariant = (extra("variant", "") == "vaginal")
		playAnimation(StageScene.Duo, "stand", {npc="ferri", npcBodyState={naked=true}})
		saynn("You ask your team for a ring gag.. receive one from Kait!")

		saynn("And so you step inside the cell. Ferri is still here, naked, cuffed, muzzled and leashed to the pipe.")

		saynn("Her cyan eyes lock onto you the second you step inside.")

		saynn("[say=ferri]Finally. You took your sweet time, meanie.. Unlock me already..[/say]")

		saynn("You hold up the ring gag. Her pupils shrink.")

		saynn("[say=ferri]Mew?! No way. I'm not putting that thing in my mouth.[/say]")

		saynn("[say=pc]"+str(ch1("You don't get to say no.", "Shut up and open wide, slut.", "You're mine to use and abuse. Accept it."))+"[/say]")

		saynn("[say=ferri]I'll bite your fingers off![/say]")

		saynn("She can't do that with the muzzle currently, the metal basket stops her fangs. But you gotta replace it somehow.")

		saynn("So you grab Ferri by the horns. She yelps, a shiver going down her spine as you get a good grip on them.")

		saynn("[say=ferri]M-mew.. don't.. don't touch those..[/say]")

		saynn("Right. Seems like you just gotta touch them more.")

		saynn("[say=pc]"+str(ch1("Then behave.", "Too late, bitch.", "You're so sensitive. Pathetic."))+"[/say]")

		saynn("While Ferri is busy squirming from you rubbing her horns, you take off her muzzle and shove the ring gag between her teeth. She is quick to try to spit it out but you buckle it tight behind her head.")

		saynn("[say=ferri]I'm.. not.. g-good.. with.. huff..[/say]")

		saynn("That's all she manages to say before you gag her.")

		addButton("Continue", "See what happens next", "pp_start")
	if(state == "pp_start"):
		playAnimation(StageScene.SexOralForced, "tease", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Her jaw is now locked open, drool already starts pooling at the corners of her lips.")

		saynn("[say=pc]"+str(ch1("There we go. That's better.", "Look at you. Mouth stretched open like a good little cocksleeve.", "Perfect. Now you can't bite. Not that your teeth would do much."))+"[/say]")

		saynn("She tries to close her jaw but can't, her cyan eyes glare at you with pure hate.")

		saynn("You grab her leash and yank her forward, making her stumble onto her knees. Then, you unlock her cuffs for a second, so that you could grab her arms and bring them high above her head.")

		saynn("[say=ferri]Mmnh..[/say]")

		if (straponUsed):
			saynn("You also swiftly secure a strapon harness around your waist, the tip hovering near her maw.")

			addButton("Continue", "See what happens next", "pp_fuck")
		elif (!vagVariant):
			saynn("Your {pc.penis} is already out and hard, hovering near her maw.")

			addButton("Continue", "See what happens next", "pp_fuck")
		else:
			saynn("Your {pc.vaginaStretch} pussy is already exposed, hovering near her maw.")

			addButton("Continue", "See what happens next", "vag_fuck")
	if(state == "pp_fuck"):
		playAnimation(StageScene.SexOralForced, "suck", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You line yourself up a bit better. She shakes her head frantically, her tail thrashing. That bitch really wants it rough. Okay.")

		saynn("Her paws are held by your right hand while your left one jumps onto her head, grabbing her by the hair and pulling on it, making her yelp and stop trying to turn away.")

		saynn("That's when you guide your "+str("cock" if !straponUsed else "rubber toy")+" to the steel ring and push!")

		saynn("[say=ferri]MMmph-..[/say]")

		saynn("Your "+str("shaft" if !straponUsed else "strapon")+" slides past her lips, over her feline tongue, and quickly hits the back of her throat. She gags instantly, her eyes watering.")

		saynn("[say=pc]"+str(ch1("Breathe through your nose. You'll need it.", "That's it. Take it. Take it all, slut.", "Choke on it, bitch."))+"[/say]")

		saynn("She tries to bite down still, her jaw clenching. But all she can do is gag and drool.")

		saynn("You push your "+str("dick" if !straponUsed else "rubber cock")+" deeper. Ferri's throat tightens around the tip of your "+str("member" if !straponUsed else "shiny member")+". She makes a wet, strangled noise.. and her whole body tenses. Her claws try to scratch at your arm but you don't let go of her wrists.")

		saynn("[say=ferri]Glrk-.. mmnn..[/say]")

		saynn("You start thrusting your hips, slowly at first. You pull back until just the tip is resting on her tongue.. before pushing forward again. With each thrust, you ram your shaft deeper.. until her nose presses against your crotch, her breathing stolen. Her eyes are wide, tears streaming down her blue fur.")

		saynn("[say=pc]"+str(ch1("You can take more. I know you can.", "Shut up and take it.", "Pathetic little whore."))+"[/say]")

		addButton("Continue", "See what happens next", "pp_fast")
	if(state == "pp_fast"):
		playAnimation(StageScene.SexOralForced, "suckfast", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You speed up, going at it harder and rougher. Your hips slam against her face, her tight throat clenches around your whole length, drool keeps dripping down her chin, onto her chest, between her breasts.")

		saynn("When you're fully in, she struggles to breathe. Her chest moves as she tries to gasp through her nose between thrusts. But you don't stop.")

		saynn("[say=ferri]Mmph.. hrrk.. nnngh..[/say]")

		saynn("[say=pc]"+str(ch1("Running out of air, huh?", "You don't need air. You just need my cock.", "Breathe? No. You don't get to breathe. Not until I'm done."))+"[/say]")

		saynn("You pull almost all the way out, letting her suck in a desperate ragged breath.. before you slam back in, all the way to the base. Her nose presses flat against your skin again.")

		saynn("She gags hard, her body convulses, her tail whips against the floor.")

		saynn("[say=ferri]Hrrk..[/say]")

		saynn("You grab one of her horns with your free hand and use it as leverage. Ferri's eyes roll back for a second, her hips twitching.")

		saynn("With that, you fuck her face more, making her bob her head back and forth with each your thrust. Tears run down her cheeks, her throat making hot wet noises.. gagging, choking, moaning.")

		saynn("She tries to bite again, her jaw muscles tensing up as she clenches.. but the ring gag does its job. Her teeth just click against the steel.")

		if (straponUsed):
			saynn("You feel the pressure building. Your balls tighten.")

			saynn("[say=pc]"+str(ch1("I'm close. You're going to swallow every drop.", "I'm going to cum down your throat. Don't you dare waste a single drop.", "Open wider. I'm going to fill that throat. Maybe you'll drown. Wouldn't that be a shame."))+"[/say]")

		else:
			saynn("You aren't using a real cock.. But you still feel the desire to really ram it in..")

			saynn("[say=pc]"+str(ch1("Get ready, cutie.", "Get ready, slut.", "Open wider, you stupid slut."))+"[/say]")

		addButton("Continue", "See what happens next", "pp_cum")
	if(state == "pp_cum"):
		playAnimation(StageScene.SexOralForced, "suckinside", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (!straponUsed):
			saynn("One last hard thrust. You go as deep as you can, your cock pulses.")

			saynn("[say=ferri]Mmmph-![/say]")

			saynn("You grunt as her clenching walls push you over the edge. Your member is throbbing as you unload down her throat, pumping your {pc.cum} down her belly. She gags and chokes at the same time, unable to grab any air while you're busy giving her a throatpie. Some seed shots back through her nostrils, making that dracat look pathetic indeed.")

			saynn("[say=pc]"+str(ch1("Cute. You love cum, huh?", "Cum whore.", "What a cum whore."))+"[/say]")

			saynn("You hold her there, on your cock for a long moment. More and more tears stream down her cheeks as you do, her cyan eyes getting weaker with every second.")

			saynn("Even though she is suffering.. for you it feels amazing. Your balls get drained hard by that slut's throat.")

		else:
			saynn("One last hard thrust. You go as deep as you can, ramming that rubber toy in!")

			saynn("[say=ferri]Mmmph-![/say]")

			saynn("You watch with great interest as she gags and chokes at the same time, unable to grab any air. Some of her own saliva shots back through her nostrils, making that dracat look pathetic indeed.")

			saynn("[say=pc]"+str(ch1("Cute.", "Whore.", "What a whore."))+"[/say]")

			saynn("You hold her there, on your shine shaft for a long moment. More and more tears stream down her cheeks as you do, her cyan eyes getting weaker with every second.")

			saynn("Even though she is suffering.. for you it's entertaining.")

		saynn("Still, it's probably enough for now.")

		addButton("Continue", "See what happens next", "pp_pullout")
	if(state == "pp_pullout"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="ferri", bodyState={naked=true, hard=true}})
		saynn("When you finally pull out, Ferri collapses. She starts coughing loudly"+str(", spitting some of your seed out, as much as she can" if !straponUsed else " while you take off your strapon harness and put it away")+".")

		saynn("[say=ferri]Ghk.. f-fuck.. ghk..[/say]")

		saynn("You pick up the basket muzzle and replace the ring gag with it. Her fangs click against the metal but she doesn't bite you.. busy trying to recover her breath.")

		if (!straponUsed):
			saynn("[say=pc]"+str(ch1("You did well. I'm proud of you.", "Look at you. Drooling cum like the worthless bitch you are.", "Pathetic. Absolutely pathetic."))+"[/say]")

		else:
			saynn("[say=pc]"+str(ch1("You did well. I'm proud of you.", "Look at you. Drooling like the worthless bitch you are.", "Pathetic. Absolutely pathetic."))+"[/say]")

		saynn("Her tail curls around her, her chest moves fast.")

		saynn("[say=ferri]Ugh.. f-fucker..[/say]")

		saynn("Her voice is very weak, hoarse.")

		saynn("[say=pc]"+str(ch1("Good girl. Rest now.", "That's what you get for being a brat.", "You're lucky I didn't go longer."))+"[/say]")

		saynn("You step out of the cell to see what Kait thinks.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "vag_fuck"):
		playAnimation(StageScene.SexOralForced, "lick", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You grab her by the hair with one hand while keeping her twists pinned above her head with the other. She tries to turn away but you wrench her face forward.")

		saynn("[say=ferri]Mmph-![/say]")

		saynn("You press your slit directly against her lips, her tongue is trapped inside the ring, unable to go anywhere but press against your flesh.")

		saynn("[say=pc]"+str(ch1("Taste me.", "That's it. Lick, slut. Use that tongue.", "You wanted to bite? Too bad. Now you just get to serve."))+"[/say]")

		saynn("You grind your pussy against her face, smearing your wetness across her lips, her chin, her cheeks. Ferri's muffled protests vibrate against your clit.")

		saynn("[say=ferri]Mnngh.. hrrk..[/say]")

		saynn("With your cunt pressed flush against her face, she can barely draw any air. Fun.")

		saynn("[say=pc]"+str(ch1("Just keep licking, girl.", "That's it. Suffer for me.", "Such a good little face to grind."))+"[/say]")

		saynn("You keep thrusting your hips, grinding your pussy slit against her tongue, mixing her saliva with your juices. She tries to shake her head but you hold her still, her nose rubbing against your crotch. Her eyes are wide, her ears turning down.")

		saynn("[say=pc]"+str(ch1("Running out of air already? Pathetic.", "You don't need air. You just need my pussy.", "Breathe? No. You don't get to breathe. Not until I'm done."))+"[/say]")

		saynn("You pull back for a moment.. just long enough for her to suck in a desperate, ragged gasp. Drool and your juices are hanging like little ropes between her face and your crotch.")

		saynn("Then you slam forward again, grinding harder. Her nose presses flat against your mound. Her muffled noises reverberate through your whole body. She tries to bite again but can't, the ring is just too rigid.")

		addButton("Continue", "See what happens next", "vag_fast")
	if(state == "vag_fast"):
		playAnimation(StageScene.SexOralForced, "lickfast", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You speed up, going at it harder and rougher. Your hips grind against her face in frantic circles, your clit dragging across her lips and tongue again and again. It feels so good that you start moaning..")

		saynn("Ferri gasps as she tries to grab any air she can between your motions.")

		saynn("[say=pc]"+str(ch1("You're drooling all over yourself. Cute.", "Messy little thing. I'm going to ruin that face.", "Scream for me. I want to feel it."))+"[/say]")

		saynn("You grab one of her horns with your free hand and use it as leverage to grind even harder. Ferri's eyes roll back for a second, her hips twitching involuntarily.")

		saynn("Her struggles grow weaker, her muffled protests turn into wet, pathetic whimpers. Tears stream down her cheeks, mixing with the spit and pussy juices.")

		saynn("You feel the pressure building.. heat spreading throughout your body..")

		saynn("[say=pc]"+str(ch1("I'm close. You're going to swallow everything I give you.", "I'm going to cum all over that stupid face.", "Open wider. I'm going to flood your mouth. Maybe you'll drown. Wouldn't that be a shame."))+"[/say]")

		addButton("Continue", "See what happens next", "vag_cum")
	if(state == "vag_cum"):
		playAnimation(StageScene.SexOralForced, "lick", {pc="pc", npc="ferri", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("One last hard grind. You press your cunt flush against her lips and let it happen..")

		saynn("Your whole body trembles as the orgasm rips through you.. waves of pleasure rushing through you, making you throw your head back and cry out a moan. Your pussy pulses and squirts, gushing directly into that brat's open mouth, coating her tongue and dribbling down her throat.")

		saynn("[say=ferri]MMmMph-![/say]")

		saynn("She gags and chokes as your juices fill her mouth faster than she can swallow. Some of it sprays past the ring, splashing on the chin and tits. Her nose is buried deep into your slick folds, cutting off any air intake.")

		saynn("[say=pc]"+str(ch1("Cute.", "Cum slut.", "What a messy little whore."))+"[/say]")

		saynn("You hold her there, grinding gently through the aftershocks, making sure every last drop gets smeared across her face. More tears stream down her cheeks as you do, her cyan eyes growing weaker with every second.")

		saynn("Still, it's probably enough for now.")

		addButton("Continue", "See what happens next", "vag_pullout")
	if(state == "vag_pullout"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="ferri", bodyState={naked=true, hard=true}})
		saynn("When you finally pull back, Ferri collapses. She starts coughing loudly, spitting out as much of your juices as she can, mixed with her own drool.")

		saynn("[say=ferri]Ghk.. f-fuck.. ghk..[/say]")

		saynn("You pick up the basket muzzle and replace the ring gag with it. Her fangs click against the metal but she doesn't bite you.. busy trying to recover her breath.")

		saynn("[say=pc]"+str(ch1("You did well. I'm proud of you.", "Look at you. Drenched in my juices like the worthless bitch you are.", "Pathetic. Absolutely pathetic."))+"[/say]")

		saynn("Her tail curls around her, her chest moves fast.")

		saynn("[say=ferri]Ugh.. b-bitch..[/say]")

		saynn("Her voice is very weak, hoarse.")

		saynn("[say=pc]"+str(ch1("Good girl. Rest now.", "That's what you get for being a brat.", "You're lucky I didn't go longer."))+"[/say]")

		saynn("You step out of the cell to see what Kait thinks.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "pp_start"):
		putOff("ferri", "basketmuzzle")
		putOn("ferri", "ringgag")
		if(straponUsed):
			recWearStrapon()

	if(_action == "pp_cum"):
		if(straponUsed):
			getCharacter("ferri").cummedInMouthBy("pc", FluidSource.Strapon)
		else:
			getCharacter("ferri").cummedInMouthBy("pc", FluidSource.Penis)
		GM.pc.orgasmFrom("ferri")

	if(_action == "pp_pullout"):
		putOff("ferri", "ringgag")
		putOn("ferri", "basketmuzzle")
		recRemoveStrapons()

	if(_action == "vag_cum"):
		getCharacter("ferri").cummedInMouthBy("pc", FluidSource.Vagina)
		GM.pc.orgasmFrom("ferri")

	if(_action == "vag_pullout"):
		putOff("ferri", "ringgag")
		putOn("ferri", "basketmuzzle")

	setState(_action)

func saveData():
	var data = .saveData()

	data["straponUsed"] = straponUsed
	data["vagVariant"] = vagVariant

	return data

func loadData(data):
	.loadData(data)

	straponUsed = SAVE.loadVar(data, "straponUsed", false)
	vagVariant = SAVE.loadVar(data, "vagVariant", false)
