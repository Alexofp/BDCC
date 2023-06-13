extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "ForcedChastityScene2"

func _run():
	
	if(state == ""):
		aimCameraAndSetLocName("medical_confessionary")
		GM.pc.setLocation("medical_confessionary")
		playAnimation(StageScene.HangingDuo, "idle", {npc="eliza", bodyState={naked=true}})
		addCharacter("eliza")
		
	if(state == ""):
		saynn("Huh, while still being drowsy you begin to realize that something about your sleeping position is weird, almost like someone has switched the gravity direction. You slowly open your eyes and see a somewhat familiar dark room that somehow manages to combine renaissance decorations such as lamps, paintings and carpets with a few pieces of rich-looking furniture and dark iron hooks with you being chained to one of them.")

		saynn("Before you can say something, a reinforced door opens and doctor Quinn enters your view, holding a few things.")

		saynn("[say=eliza]Missed me?[/say]")

		saynn("She steps into the room and walks up to the dorky table near the leather chair before placing a pair of white latex gloves and some kind of tube.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		saynn("[say=pc]How are you even bringing me here.[/say]")

		saynn("The doc chuckles while taking off her lab coat, exposing her simple top and a knee length skirt, a somewhat casual look.")

		saynn("[say=eliza]You must be a deep sleeper, what can I say~.[/say]")

		saynn("You catch her gaze and realize that you’ve been naked this whole time with all your privates and your chastity cage exposed.")

		saynn("[say=eliza]Wonder how your deep sleeper is doing though.[/say]")

		saynn("Doctor Quinn approaches you with a big smile on her face, her paw reaches out and gets a hold of your cage. She plays with your locked member a bit, caressing the exposed skin and tugging on a cage a few times to make sure it sits all neat and tightly.")

		saynn("[say=eliza]Some call locked dicks useless. But tell me, are decorations useless? No, of course not. They provide so much to the viewers. It’s almost art. And you know what makes an art piece great? If someone suffered for it. A sacrifice is the greatest gift.[/say]")

		saynn("You can faint purring coming from Eliza while she inspects your dick for a bit longer. Then her paw reaches to grab the latex gloves that she swiftly puts on.")

		saynn("[say=eliza]How much was it already? At least ten days, right? You must be quite pent up, patient?[/say]")

		addButton("Yes", "Tell her that you are horny", "yes")
		addButton("No", "You’re not horny", "no")

	if(state == "yes"):
		saynn("[say=pc]Yes..[/say]")

		saynn("[say=eliza]Aww~. You are so precious. Well, habits are formed after about 4 weeks. Takes roughly the same time to lose one too. So let’s begin.[/say]")


	if(state == "no"):
		saynn("[say=pc]I’m not.[/say]")

		saynn("[say=eliza]Aw, you don’t have to lie to me, patient. Or maybe you’re serious? Huh, already got used to wearing a cage? Either way, let me help you.[/say]")
	
	if(state in ["yes", "no"]):
		playAnimation(StageScene.HangingSex, "tease", {npc="eliza", bodyState={naked=true}})
		# (Same from here)

		saynn("Eliza also fetches the tube that she left on the table and steps behind you. You can’t turn your head around enough but you can guess that she opened it and got some onto her protected digits.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("The excitement is killing you, your pussy becomes slightly aroused but it seems like Eliza is not planning to do anything with your flower. The scent is great though..")

		saynn("[say=eliza]I will be touching you down there, don’t be afraid~.[/say]")

		saynn("[say=pc]Huh?[/say]")

		saynn("Oh! Cold! Doctor’s digits land on your backdoor and begin rubbing something in with gentle circular motions.")

		saynn("[say=eliza]Wonder if you already did anything with your little star~.[/say]")

		var anusLoosness = 0.0
		var bodypartAnus = GM.pc.getBodypart(BodypartSlot.Anus)
		if(bodypartAnus != null):
			var orifice = bodypartAnus.getOrifice()
			if(orifice != null):
				anusLoosness = orifice.getLooseness()
			
		# (if anal stretch high)
		if(anusLoosness >= 0.5):
			saynn("Her digits switch to prodding your {pc.analStretch} tailhole. And since you’re quite stretchy, she has no problem sliding a few digits inside and wiggling them, bringing you strange but pleasurable sensations.")

			saynn("[say=eliza]Ohh, you did~. I knew your focus would switch after being locked, great~. More people should explore themselves and their bodies, so much untapped potential.[/say]")

		# (else)
		else:
			saynn("Her digits switch to prodding your {pc.analStretch} tailhole. And since you barely had any intercourses recently, you are incredibly tight there, doctor’s digits have a really hard time trying to penetrate you. It feels strange..")

			saynn("[say=eliza]Aww. Don’t be afraid to explore yourself and your body. Don’t listen to silly people who think anal is somehow weird or unnatural. The only thing true about nature is the constant change. Nature is constantly trying to find what works and what doesn’t.[/say]")

		# (end)

		saynn("Doc puts more lube on her digit and proceeds to slowly slide it in and out of your backdoor while you are completely helpless, dangling from the ceiling with your toes barely touching the floor.")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		saynn("After exploring how deep your anus is, the doctor instead curls her finger and proceeds to tap at your soft inner walls. And very quickly, she finds something, a bump that feels like a little walnut. As soon as her finger finds it, a small noise of pleasure involuntarily escapes your lips.")

		saynn("Eliza is clearly curious about that one, she starts prodding it again and again so much that you can’t help but squirm a bit. The member behind your cage fills with more blood but any attempts to get hard are prevented by the bulky cage.")

		saynn("[say=eliza]Good~. That’s your pleasure spot.[/say]")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Your neglected pussy is so wet, the intimacy of the situation mixed with a professional hand is just too much.")

		saynn("She stops going so hard on your prostate and instead rubs it with slow methodical motions, from left to right, from up to down, almost like she is trying to pump something through it. And it works, a single drop of precum leaks down your cage and onto your balls, soon followed by a few more. Eliza rests her chin on your shoulder and looks down at your member dripping through the cage.")

		saynn("[say=eliza]See? So handy, I can see when you are enjoying this. What do you say? Maybe I’m wrong and I should stop now?[/say]")

		# (Options are Continue, Ask to stop, Stay silent)

		addButton("Continue", "Tell her everything is good", "everything_is_good")
		addButton("Ask to stop", "Tell her you don’t like it", "ask_to_stop")
		addButton("Stay silent", "You don’t wanna admit anything", "stay_silent")

	if(state == "everything_is_good"):
		saynn("[say=pc]It feels good, don’t stop..[/say]")

		saynn("Her purring becomes more audible, Eliza continues to rub your p-spot while also sliding her digit in and out, imitating the motions of a real dick for you.")

		saynn("[say=eliza]Good..[/say]")


	if(state == "ask_to_stop"):
		saynn("[say=pc]Ngh.. That’s enough.. I don’t like it. Really.[/say]")

		saynn("Eliza frowns, the purring goes away, replaced with a slight growl. She stops rubbing your spot.")

		saynn("[say=eliza]Don’t tell me you wanna give up already. Because I don’t believe you.[/say]")

		saynn("Suddenly she starts fingering your butt even harder, making sure to curl her finger enough to push at your prostate. Your mind might not agree but your body sure can’t lie, more and more transparent fluid leaks out of your caged up dick while she pretty much milks you. Your eyes roll up on their own, the sensations are breathtaking even if you don’t wanna accept them.")

		saynn("[say=eliza]See. You have it in you. I’m not taking no for an answer until you experience everything this has to offer, you hear me? Have some trust in me. Now try to enjoy it~.[/say]")

		saynn("Her voice softens up again, she slows down a bit.")


	if(state == "stay_silent"):
		saynn("You stay silent. Or at least try to. It’s hard to be silent when your mind is being bombarded with strange sensations.")

		saynn("[say=eliza]Can’t hear you~. But that’s okay. Just enjoy the pleasure waves.[/say]")

		saynn("Eliza continues to rub your p-spot while also sliding her digit in and out, imitating the motions of a real dick fucking you.")

		# (Same from here)
	if(state in ["everything_is_good", "ask_to_stop", "stay_silent"]):
		saynn("She brings her mouth to your ear, letting you feel her warm breath while she fingers your butt at a steady pace, causing the pressure to begin rising inside your cage even higher. Eventually you can’t hold back the moans, occasional ones escape your mouth while Eliza bathes in your pleasure, probably enjoying this more than you do.")

		saynn("And as she keeps hammering at your prostate, you feel it becoming more firm and seemingly more sensitive, that rising pressure means something is about to happen.")

		saynn("But it doesn’t.")

		saynn("Your caged member is leaking transparent fluids a lot, your body squirms as much as the chains allow. But the feeling that you’re about to cum.. gone.. aw.. Eventually Eliza gives up too and lets you have your rest, pulling the digits out of your backdoor. She hums into your ear.")

		saynn("[say=eliza]It’s okay~. It’s a journey. You still need time for your body to rewire itself and accept it.. accept that you will never cum from penis stimulation ever again. Hear me, cutie?..[/say]")

		saynn("Even though she stopped fingering you, the afterglow.. oh wow.. You feel a strange weakness back there. A pleasurable type of weakness. It feels so good to clench that you moan.. you moan and nod at the doctor's words while she continues to whisper into your ear.")

		saynn("[say=eliza]I will help you on this journey. As long as you obey my every single word.. And in exchange.. I will carry the key to your cage until you are ready..[/say]")

		saynn("She nuzzles your ear, then playfully bites and gives it a little kiss before pulling away completely. Such a quick switch.")

		addButton("Continue", "See what happens next", "continue3")

	if(state == "continue3"):
		aimCameraAndSetLocName("medical_nearconfessionary")
		GM.pc.setLocation("medical_nearconfessionary")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("Doctor Quinn takes off the gloves and puts the lab coat on again before unchaining you.")

		saynn("[say=eliza]I think this was a very productive session. I will see you in five days~.[/say]")

		saynn("And with that, she lets you out into the hall of the medical wing before leaving you to be.")

		saynn("The afterglow.. still there.. Making you horny for more..")

		# (scene ends)

		addButton("Continue", "That was something", "endthescene")
		


func _react(_action: String, _args):
	if(_action in ["yes", "no"]):
		processTime(5*60)
		setFlag("MedicalModule.Chastity_Event2Choice1", _action)
	
	if(_action in ["everything_is_good", "ask_to_stop", "stay_silent"]):
		processTime(5*60)
		GM.pc.addLust(50)
		
		setFlag("MedicalModule.Chastity_Event2Choice2", _action)
	
	if(_action in ["continue3", "continue"]):
		processTime(5*60)

	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)

func getDevCommentary():
	return "I dunno, there is something cool about prostate milking. Normally, males wouldn't be able to cum from anal at all. But for some reason we, humans, decided to evolve sensitive prostates that can be reached from anal penetrations.. but only for males x3. Almost like nature wanted buttsluts to exist x3 sorry x3 yeah-yeah-yeah, there is probably a good reason why its like that. But like, have you noticed that a lot of things that we evolved have multiple purposes?\n\nAnd yes, I know, girls can get off from anal too, calm down ^^"

func hasDevCommentary():
	return true
