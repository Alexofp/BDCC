extends SceneBase

var usedStrapon = false
var defStrapon = false
var straponHasCum = false

func _init():
	sceneID = "KaitLoveRideYouScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("It's quiet in here, for once. You let out a sigh. Kait's ears perk.")

		saynn("[say=kait]All good?[/say]")

		saynn("[say=pc]Yeah. Just. You know.[/say]")

		saynn("Her curious eyes scan you, her fluffy tail twitches slightly.")

		saynn("[say=kait]I don't know, actually. Say it. Tired? Annoyed with Avy?[/say]")

		saynn("You shrug.")

		saynn("[say=pc]I don't know. Just horny, maybe.[/say]")

		saynn("A little smile spreads across her face.")

		saynn("[say=kait]Oh yeah~?[/say]")

		saynn("She suddenly darts towards one of the chairs. She picks it up and positions it behind you.")

		saynn("[say=pc]Kait?[/say]")

		addButton("Continue", "See what happens next", "get_pushed_down")
	if(state == "get_pushed_down"):
		playAnimation(StageScene.SexChair, "start", {pc="pc", npc="kait"})
		saynn("[say=kait]Have a seat! Now.[/say]")

		saynn("Suddenly, she pushes you. There is no cushion on that chair.. so your butt experienced the whole impact.")

		saynn("[say=pc]Ouch. Easy, Kait.[/say]")

		saynn("She stands near, looming, smirking. Her tail is swishing behind her with a slow, hypnotic rhythm.")

		saynn("[say=kait]My bad. Didn't know you were so.. delicate~.[/say]")

		saynn("[say=pc]I'm not delicate.[/say]")

		saynn("[say=kait]Oh yeah? You're hard and firm~?[/say]")

		if (GM.pc.hasReachablePenis()):
			saynn("[say=pc]Don't think so either.[/say]")

		else:
			saynn("[say=pc]Don't think so either. I don't even have..[/say]")

			saynn("She cuts you off.")

			saynn("[say=kait]I know~. I'm not silly.[/say]")

		saynn("Slowly, she reaches for her shirt.. her digits begin to unbutton it, one little circle at a time. When there is nothing left that is connecting the two sides, she gradually opens them, setting her modest breasts free.")

		if (GM.pc.hasReachablePenis()):
			saynn("[say=kait]What about.. now.. Is this better?[/say]")

		else:
			saynn("[say=kait]Do you like these?[/say]")

		saynn("She is standing in front of you, licking her lips sneakily.")

		if (GM.pc.hasReachablePenis()):
			saynn("[say=pc]That helps.[/say]")

		else:
			saynn("[say=pc]Maybe.[/say]")

		if (!GM.pc.hasReachablePenis()):
			addButton("Continue", "See what happens next", "lap_pick_menu")
		else:
			addButton("Continue", "See what happens next", "kait_on_lap")
	if(state == "lap_pick_menu"):
		saynn("Pick which strapon you want to wear while Kait is riding you!")

		addButton("Default", "Use whatever strapon Kait has", "choose_strapon_def")
		addStraponButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "choose_strapon_pick")
	if(state == "kait_on_lap"):
		#if (!usedStrapon):
		playAnimation(StageScene.SexChair, "tease", {pc="pc", npc="kait", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true}})
		#else:
		#	playAnimation(StageScene.SexChair, "tease", {pc="pc", npc="kait", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true}})
		addCharacter("kait", ["naked"])
		saynn("She swiftly drops her shorts and her shirt completely before stepping closer and straddling your lap.")

		saynn("[say=pc]Kait..[/say]")

		saynn("Her paw lands on your face, blocking your mouth.")

		saynn("[say=kait]I will do everything.. Just relax and enjoy..[/say]")

		saynn("Well.. you're in good hands.. so why not.")

		if (defStrapon):
			saynn("You look down and watch her start securing a strapon harness around your waist. You didn't bring one so it is certainly hers, complete with a fat orb at the base.")

			saynn("[say=pc]You're into knots?[/say]")

			saynn("[say=kait]Shush..[/say]")

			saynn("She pours some lube on it and then uses her paws to spread it along the shaft.")

		elif (usedStrapon):
			saynn("You look down and watch her start securing a strapon harness that you have provided around your waist. Once she is done with that, she also pours some lube on it.. before using her paws to spread it along the shaft.")

			saynn("[say=kait]Nice..[/say]")

		else:
			saynn("You look down and watch her paw getting a grasp on your {pc.penis}, giving it a few good strokes.. until it's nice and hard.. resting against her fluffy crotch.")

		saynn("Both her paws are now resting on your shoulders as she just slowly moves her body up and down, letting her sensitive lips brush against your"+str(" new shiny" if usedStrapon else "")+" member. Kait bites her lip, quiet purring escapes her chest.")

		saynn("She leans closer to your face, almost touching noses now. Your hands land on her hips, fingers sinking into the soft fur.")

		saynn("[say=kait]Mmm.. feels like I'm ready for you..[/say]")

		saynn("She shares a little kiss with you.. and then adds a few more little ones on your cheek. Her voice is turning into a warm murmur..")

		saynn("[say=kait]And you are ready too..[/say]")

		addButton("Continue", "See what happens next", "kait_begins_riding")
	if(state == "kait_begins_riding"):
		#if (!usedStrapon):
		playAnimation(StageScene.SexChair, "sex", {pc="pc", npc="kait", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true}})
		#else:
		#	playAnimation(StageScene.SexChair, "sex", {pc="pc", npc="kait", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true}})
		saynn("She lifts herself up just enough, her paw reaching down to guide the tip of your "+str("cock" if !usedStrapon else "strapon")+" to her entrance. As soon as her folds catch "+str("your member" if !usedStrapon else "it")+", her eyes get locked on yours.")

		saynn("[say=kait]Look at you.. you've gotten me"+str(" horny too" if !usedStrapon else " so horny")+"..[/say]")

		saynn("Slowly, she sinks down, impaling herself on your "+str("cock" if !usedStrapon else "rubber cock")+" in one long.. dragged-out.. motion, letting her slick inner walls feel every ridge of "+str("you" if !usedStrapon else "your toy")+". By the end of it, a little gasp of a moan escapes her maw.")

		saynn("[say=kait]Ahh.. so full..[/say]")

		saynn("She lifts her rear paws off the floor.. now completely supported by your lap, her thighs clamping around you.")

		saynn("And then.. she begins to move.. grinding rather than bouncing.. rocking her hips back and forth, at a slow pace."+str(" You can feel her hot, needy pussy clamping around your cock." if !usedStrapon else " You can't really feel much.. but the view is great.. you can see her needy pussy clamping around your rubber shaft.")+"")

		saynn("[say=kait]Nngh.. yes.. like that..[/say]")

		saynn("Her paws get a tighter grip on your shoulders, her claws poking you slightly. All the while, your hands are still on her hips, offering support that she clearly doesn't need.")

		saynn("Without stopping, she leans in for a proper kiss.. a much deeper one. Her feline tongue slips past your teeth and finds yours, proceeding to dance with it. She closes her eyes for that, focusing entirely on the pleasurable sensations.. purring returns..")

		saynn("[say=kait]..purr-r~..[/say]")

		saynn("When you pull away from the kiss, you're both left a bit breathless, your foreheads still resting together. Kait's eyes look hazy.")

		saynn("[say=kait]You know.. you feel so good inside me..[/say]")

		addButton("Continue", "See what happens next", "ride_faster")
	if(state == "ride_faster"):
		#if (!usedStrapon):
		playAnimation(StageScene.SexChair, "fast", {pc="pc", npc="kait", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true}})
		#else:
		#	playAnimation(StageScene.SexChair, "fast", {pc="pc", npc="kait", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true}})
		saynn("She begins to move faster, grinding away on your "+str("cock" if !usedStrapon else "toy")+", using her whole body to rock herself back and forth on it. Her quiet purring is turning into breathy little moans, her cheeks getting a red glow.")

		saynn("[say=kait]Mhh.. ahh.. hh.. ah..[/say]")

		saynn("You could feel her pussy getting even wetter, pure heat radiating from her sex. Her inner walls begin to pulse.. clenching around you ever so often.")

		saynn("[say=kait]Oh.. hh.. I think I'm.. hah.. getting close..[/say]")

		saynn("She is panting so much.. but when you try to meet her motions with some thrusts of yours, she is quick to stop you.")

		saynn("[say=kait]No.. let me.. I will do.. mhh.. everything..[/say]")

		saynn("And so you let her.. Kait's grinding gets even more frantic.. more desperate. Her whole body is working to generate pleasure for the both of you, the "+str("friction is" if !usedStrapon else "friction and the pressure are")+" making you pant quietly too. Passionate moans are leaving her..")

		saynn("[say=kait]Ah.. ah.. you feel so good.. ah.. I'm gonna.. I'm..[/say]")

		if (!usedStrapon):
			saynn("You're close too..")

		addButton("Continue", "See what happens next", "ride_cum")
	if(state == "ride_cum"):
		if (!usedStrapon):
			playAnimation(StageScene.SexChair, "inside", {pc="pc", npc="kait", pcCum=true, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true}})
		else:
			playAnimation(StageScene.SexChair, "inside", {pc="pc", npc="kait", pcCum=straponHasCum, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true}})
			#playAnimation(StageScene.SexChair, "inside", {pc="pc", npc="kait", pcCum=straponHasCum, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true}})
		saynn("She doesn't get to finish the sentence before an overwhelming sensation takes over. Her claws dig into your shoulders as her entire body tenses, back arching, mouth opening to produce a hot cry of love.")

		saynn("[say=kait]Ahh-h-h..[/say]")

		if (!usedStrapon):
			saynn("Her pussy walls clench hard around your cock, doing multiple powerful pulses. The sheer tightness of her sex is what sends you over the edge.")

			saynn("[say=pc]Kait..[/say]")

			saynn("[say=kait]Just cum inside me.. mhh-h..[/say]")

			saynn("Nice to get the go-ahead.. but it was too late for that anyway. Your {pc.penis} is already throbbing inside her.. pumping thick, hot {pc.cum} deep into her convulsing pussy.. stuffing her full..")

			saynn("[say=kait]Ah-h-h..[/say]")

			saynn("She slumps forward and puts her arms around you, her body is still shivering from the incoming waves of ecstasy rocking through her, sending little aftershocks, making her twitch around your still-pulsing cock. Her breath comes in short, warm pants against your lips as you keep cumming inside her..")

			saynn("[say=kait]So.. much..[/say]")

		else:
			saynn("Her pussy walls clench hard around your rubber shaft, doing multiple powerful pulses. The view is so hot you can hardly contain yourself.")

			if (straponHasCum):
				saynn("[say=pc]Kait..[/say]")

				saynn("[say=kait]Just cum inside me.. mhh-h..[/say]")

				saynn("Nice to get the go-ahead.. but it was too late for that anyway. Your strapon got squeezed hard, already throbbing inside her.. pumping thick, hot seed deep into her convulsing pussy.. stuffing her full..")

				saynn("[say=kait]Ah-h-h..[/say]")

				saynn("She slumps forward and puts her arms around you, her body is still shivering from the incoming waves of ecstasy rocking through her, sending little aftershocks, making her twitch around your still-pulsing cock. Her breath comes in short, warm pants against your lips as you keep cumming inside her..")

				saynn("[say=kait]So.. much..[/say]")

			else:
				saynn("[say=kait]So g-good..[/say]")

				saynn("She slumps forward and puts her arms around you, her body is still shivering from the incoming waves of ecstasy rocking through her, sending little aftershocks, making her twitch around your rubber toy. Her breath comes in short, warm pants against your lips as you embrace her..")

		if (!usedStrapon):
			saynn("She doesn't move to get off.. just saying there.. impaled on you. As her orgasm begins to fade.. so does yours. A low, contented purr returns.. rumbling in her chest.")

		else:
			saynn("She doesn't move to get off.. just saying there.. impaled on you. Her orgasm begins to fade gradually. A low, contented purr returns.. rumbling in her chest.")

		saynn("[say=kait]Ha.. hah..[/say]")

		saynn("She nuzzles your face.")

		saynn("[say=kait]That was a.. nice workout..[/say]")

		saynn("She murmurs that.. her voice sleepy and satisfied. Your hands stay on her hips, gently stroking her fur.")

		saynn("You just sit there.. enjoying the company of each other.. Kait still with your "+str("cock" if !usedStrapon else "toy")+" inside her. The air smells of raw sex..")

		saynn("[say=kait]..love you..[/say]")

		saynn("Aww.")

		saynn("[say=pc]Love you too, Kait.[/say]")

		saynn("You leave a little kiss on her lips. She returns the favor.")

		saynn("You stay like that for a while longer.. until..")

		saynn("[say=kait]..it does begin to get uncomfortable though..[/say]")

		saynn("Best to stop there then.")

		if (!usedStrapon || straponHasCum):
			saynn("Kait gradually lifts herself up, making sure to cover her stuffed slit with her paw.. so nothing leaks out.")

		else:
			saynn("Kait gradually lifts herself up, making sure to cover her soaked slit with her paw.. she is so drippy she has to do that.")

		saynn("[say=kait]I think I need a little shower.."+str(" not inside me though~." if (!usedStrapon || straponHasCum) else "")+"[/say]")

		saynn("She puts her clothes on.. and rushes away.")

		addButton("Continue", "See what happens next", "endthescene_remstrapon")
func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "choose_strapon_pick", [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "kait_on_lap"):
		pullShortsDown("pc")

	if(_action == "choose_strapon_def"):
		usedStrapon = true
		defStrapon = true
		pullShortsDown("pc")
		putOn("pc", "StraponCanine")
		setState("kait_on_lap")
		return

	if(_action == "choose_strapon_pick"):
		usedStrapon = true
		defStrapon = false
		var strapon = _args[0]
		GM.pc.getInventory().removeItem(strapon)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		var theFluids = strapon.getFluids()
		if(theFluids != null):
			if(theFluids.hasFluidType("Cum")):
				straponHasCum = true
				setFlag("KaitModule.gotKaitPregMaybe", true)
		pullShortsDown("pc")
		setState("kait_on_lap")
		return

	if(_action == "ride_cum"):
		getCharacter("kait").cummedInVaginaBy("pc", FluidSource.Penis if !usedStrapon else FluidSource.Strapon)
		GM.pc.orgasmFrom("kait")

	if(_action == "endthescene_remstrapon"):
		if(defStrapon):
			GM.pc.removeStrapon()
		elif(usedStrapon):
			GM.pc.unequipStrapon()
		fixUniform("pc")
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["usedStrapon"] = usedStrapon
	data["defStrapon"] = defStrapon
	data["straponHasCum"] = straponHasCum

	return data

func loadData(data):
	.loadData(data)

	usedStrapon = SAVE.loadVar(data, "usedStrapon", false)
	defStrapon = SAVE.loadVar(data, "defStrapon", false)
	straponHasCum = SAVE.loadVar(data, "straponHasCum", false)
