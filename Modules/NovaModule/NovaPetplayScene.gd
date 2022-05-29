extends "res://Scenes/SceneBase.gd"

var isPuppy = true

func _init():
	sceneID = "NovaPetplayScene"

func _run():
	if(state == ""):
		addCharacter("nova")
	if(state == ""):
		saynn("[say=pc]You’re looking for pets maybe?..[/say]")

		saynn("Nova’s face changes to a more smug one, she is smirking while circling around you. She holds a leash in her hand.")

		saynn("[say=nova]I like pets. Puppies. Or kittens. Which one are you, cutie?[/say]")

		addButton("Meow", "You are a kitty", "meow")
		addButton("Bark", "You are a puppy", "bark")

	if(state == "make_noise"):
		saynn("You blush slightly and decide to voice your choice a little differently.")

		# (if kitty)
		if(!isPuppy):
			saynn("[say=pc]Meow![/say]")

			saynn("[say=nova]Hah. Kitty then. Little brats that like to scratch furniture and disobey commands. Are you gonna be a good kitty for me?[/say]")

		# (if puppy)
		if(isPuppy):
			saynn("[say=pc]Bark![/say]")

			saynn("[say=nova]Hah. So you’re a puppy. Gonna wiggle your rear and obey my commands like a good pup?[/say]")

		saynn("You nod eagerly at her. The idea of being treated like a pet sounds very appealing.. She stops in front of you and grabs you by the chin. Little scritches that she offers to you cause you to slowly melt, cute animal noises escape from you.")

		# (if kitty)
		if(!isPuppy):
			saynn("You try to imitate the feline purring for Nova and bounce eagerly.")

		# (if puppy)
		if(isPuppy):
			saynn("You stick your tongue out and pant slightly for Nova and bounce eagerly.")

		# (if non naked)
		if(!GM.pc.isFullyNaked()):
			saynn("[say=nova]So-o~.. Last time I checked, pets usually don’t wear any clothes, do they~?[/say]")

			saynn("You tilt your head slightly. Then you look down at your clothes and back at Nova. You shake your head subtly.")

			saynn("[say=nova]No, they don’t~[/say]")

			saynn("She starts undressing you as you stand completely still. Nova {pc.undressMessageS}. Eventually, you are left with no clothing, your privates are all exposed. But that’s how a pet should look like.")

			# (if non flat breasts)
			if(GM.pc.hasNonFlatBreasts()):
				saynn("You cover your {pc.breasts} a bit but Nova is quick to swat your hands away.")

				saynn("[say=nova]Much better~[/say]")

		# (if naked)
		if(GM.pc.isFullyNaked()):
			saynn("[say=nova]You came prepared, I see~. No clothes just like it should be, pets aren’t supposed to wear anything[/say]")

			saynn("Your privates are all exposed but you stand proudly as Nova gives you a few pats on the head. You nod to her words, it’s a fact that pets are usually naked.")

			# (end)

		saynn("Satisfied with your looks, Nova shows you the chain leash.")

		# (if puppy)
		if(isPuppy):
			saynn("[say=nova]I’m gonna put you on a leash and you’re gonna let me do it. Mhm?[/say]")

			saynn("You bark softly and let Nova do it. As she clips the leash to your collar, you can’t help but to look excited, wiggling your butt and panting slightly. Nova smiles and boops noses with you.")

		# (if kitty)
		if(!isPuppy):
			saynn("[say=nova]Even though you’re a kitty, I can’t have you just slacking around. I’m gonna leash you~[/say]")

			saynn("You mewl softly and let Nova do it. As she clips the leash to your collar, you can’t help but to look excited, you nuzzle her hand and continue rubbing against her. Nova smiles and boops your nose.")

		saynn("[say=nova]Now, get on all fours~. Show me how pets crawl around.[/say]")

		addButton("Get on all fours", "Be the good pet for Nova", "get_on_all_fours")

	if(state == "get_on_all_fours"):
		GM.pc.playAnimation(TheStage.Kneeling)
		# (if puppy)
		if(isPuppy):
			saynn("You bark and take a little step back before lowering yourself to your knees. Then you bend forward and get on all fours. Nova holds your leash while you begin to crawl around her, swaying your {pc.masc} hips a lot in the process.")

			saynn("[say=nova]Very good~. Look at you. Such a good little puppy.[/say]")

		# (if kitty)
		if(!isPuppy):
			saynn("You purr and slowly lower yourself to your knees. You try to show off some feline-like agility as you bend forward and get on all fours. You arch your back as you lower your top part of the body so you can stretch a bit. Then you do a small circle around the husky, crawling very slowly so you can sway your {pc.masc} hips like a sexy kitty.")

			saynn("[say=nova]Very good~. Look at you. Such a good little kitty.[/say]")

		saynn("Nova passes the leash between her legs and then tugs on it, creating tension that invites you to move. You crawl between her legs as she lands a smack on your {pc.thick} butt.")

		saynn("[say=nova]Let’s go for a little walk~[/say]")

		addButton("Follow", "See where Nova brings you", "follow")

	if(state == "follow"):
		aimCameraAndSetLocName("yard_northCorridor")
		
		saynn("Nova tugs gently on the leash to make you follow her, you feel how it makes your bulky collar dig into the neck so you obey her while staying mostly quiet. Pets can’t speak after all.")

		saynn("You are being walked around the yard. Lots of greenery around, lots of fresh air. You crawl along the stone pathways and wiggling your rear. The husky makes sure that you keep up but each time you slow down, she tugs on the leash, forcing you to move your butt quicker. You slowly get used to crawling like this.")

		# (if puppy)
		if(isPuppy):
			saynn("[say=nova]How is it, puppy, having fun?[/say]")

			saynn("[say=pc]R-ruff![/say]")

		# (if kitty)
		if(!isPuppy):
			saynn("[say=nova]How is it, kitty, enjoying yourself?[/say]")

			saynn("[say=pc]Mew![/say]")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("To be honest, even just doing this makes you feel horny, your exposed {pc.cock} is hard as a rock and dripping precum onto the stone tiles as you crawl forward.")

			# (if also vagina)
			if(GM.pc.hasVagina()):
				saynn("Your slit is wet too, you wouldn’t mind a good breeding about now maybe..")

		# (if just vagina)
		elif(GM.pc.hasVagina()):
			saynn("To be honest, even just doing this makes you feel horny, your exposed pussy is shiny wet and drips juices onto the stone tiles as you crawl forward. A good pet breeding session doesn’t seem like that bad of an idea..")

		addButton("Follow", "Keep walking behind", "follow1")

	if(state == "follow1"):
		aimCameraAndSetLocName("yard_eastCorridor")
		
		saynn("Two orange inmates sit on one of the benches, a guy and a girl. Nova approaches them and tugs on the leash, bringing you closer too. You feel a little embarrassed, all their gazes are instantly glued to you.")

		# (if puppy)
		if(isPuppy):
			saynn("[say=nova]Hai there inmates~. Check out this puppy I have here. Puppy, voice.[/say]")

			saynn("[say=pc]Bark..[/say]")

		# (if kitty)
		if(!isPuppy):
			saynn("[say=nova]Hai there inmates~. Check out this kitty I have here. Kitty, meow for me.[/say]")

			saynn("[say=pc]Meow..[/say]")

		saynn("You can’t hide your blush, it feels humiliating for you. But you can’t even crawl away, Nova holds the leash tightly so you just tilt your head down.")

		saynn("[sayMale]Oh wow. That’s a nice pet you have there.[/sayMale]")

		saynn("[sayFemale]So obedient. Can I pet {pc.him}?[/sayFemale]")

		saynn("[say=nova]Yeah, go ahead. No biting, pet.[/say]")

		saynn("The female inmate reaches her hand at you and tries to pet you.")

		addButton("Let it happen", "You like pets, you want pets", "let_it_happen")
		if(isPuppy):
			addButton("Growl", "You don’t wanna receive pets from strangers", "hissgrowl")
		else:
			addButton("Hiss", "You don’t wanna receive pets from strangers", "hissgrowl")

	if(state == "let_it_happen"):
		# (if puppy)
		if(isPuppy):
			saynn("You move your head under the hand and stick your tongue out as it pets you. Happy panting escapes from your mouth as you wiggle your butt with excitement. It feels so good! You ruff softly and beg for more pets when the hand stops petting you.")

			saynn("[sayFemale]Gooood puppy[/sayFemale]")

			saynn("You’re still blushing but holy shit, she starts scritching you behind the ear and you can’t help but to moan softly, you lay down and turn onto your back, exposing yourself even more. Both inmates start groping your {pc.masc} body and giving you belly rubs as you wiggle and squirm. Nova chuckles watching you.")

		# (if kitty)
		if(!isPuppy):
			saynn("You carefully move your head under the offered hand and let it pet you. You can’t yourself, quiet feline-like purring escapes from your mouth, you let the hand pet you and then nuzzle it back. It feels so good. You mewl and beg for more pets, pawing at the hand when it stops petting you.")

			saynn("[sayFemale]Good kitty[/sayFemale]")

			saynn("You’re still blushing but holy shit, she starts scritching you behind the ear and you can’t help but to moan softly, you lay down and turn onto your back, exposing yourself even more. Both inmates start groping your {pc.masc} body and giving you belly rubs as you wiggle and squirm. Nova chuckles watching you.")

		saynn("[say=nova]So adorable.[/say]")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("One of the inmates reaches for your {pc.cock} and gently fondles your balls. You feel like you’re ready to cum there and now, your cock is twitching and leaking even more precum. Between the animal noises you begin to produce little moans.")

			# (if has pussy)
			if(GM.pc.hasVagina()):
				saynn("Your pussy and {pc.breasts} receive some attention too, you pant and squirm more as your slit leaks with more of your juices, practically begging to be used.")


		# (else if has vagina)
		elif(GM.pc.hasVagina()):
			saynn("The female inmate reaches for your slit and gently rubs the clit while the guy puts his hands on your {pc.breasts} and gives them a good squeeze.  Between the animal noises you begin to produce little moans, you pant and squirm more as your slit leaks with more of your juices, practically begging to be used.")

		saynn("[say=nova]And so horny.[/say]")

		saynn("When the inmates are done with you, Nova tugs on the leash, forcing you to get up to fall fours again. She then tugs you away, making you flash your ass to the inmates as you crawl away from them.")

		addButton("Follow", "See where she brings you now", "follow2")

	if(state == "hissgrowl"):
		# (if puppy)
		if(isPuppy):
			saynn("You show your teeth and growl at the unknown hand, showing that you’re not gonna be petted by some strangers. The inmate pulls her hand away, of course.")

			saynn("[sayFemale]Wow, {pc.he} is a bad pup.[/sayFemale]")

			saynn("[say=nova]Huh. Yes, {pc.he} needs to be punished for that.[/say]")

			saynn("Nova yanks you back a few steps and pushes you down so she can deliver a few powerful spanks to your naked {pc.masc} ass. You begin to whine and whimper as you’re getting punished in front of everyone.")

			saynn("[say=nova]You don’t growl at people that wanna pet you, understand?[/say]")

			saynn("Each second of waiting results in your butt getting spanked again and again, you nod very eagerly and put on sorry puppy eyes for Nova. But ow, your butt is red.")

			saynn("[say=nova]Good~. Maybe you wanted this[/say]")

		# (if kitty)
		if(!isPuppy):
			saynn("You show your fangs and hiss at the unknown hand, you bend your back upwards, showing that you’re not gonna be petted by some strangers. The inmate pulls her hand away, of course.")

			saynn("[sayFemale]Wow, {pc.he} is a bad kitty.[/sayFemale]")

			saynn("[say=nova]Huh. Yes, {pc.he} needs to be punished for that.[/say]")

			saynn("Nova yanks you back a few steps and pushes you down so she can deliver a few powerful spanks to your naked {pc.masc} ass. You begin to whine and whimper as you’re getting punished in front of everyone.")

			saynn("[say=nova]You don’t hiss at people that wanna pet you, understand?[/say]")

			saynn("Each second of waiting results in your butt getting spanked again and again, you nod very eagerly and put on sorry kitty eyes for Nova. But ow, your butt is red.")

			saynn("[say=nova]Good~. Maybe you wanted this[/say]")

			# (end)

		saynn("Nova tugs on the leash, forcing you to get up to fall fours again. She then tugs you away, making you flash your ass to the inmates as you crawl away from them.")

		addButton("Follow", "See where she brings you now", "follow2")

	if(state == "follow2"):
		aimCameraAndSetLocName("yard_novaspot")
		
		saynn("You complete the full circle around the green yard and return to where you started, by the end of it you feel more used to crawling on all fours. Being on a leash makes you happy, you wiggle your butt more and rub your face into Nova’s leg.")

		# (if puppy)
		if(isPuppy):
			saynn("[say=pc]Bark bark~[/say]")

		# (if kitty)
		if(!isPuppy):
			saynn("[say=pc]Mew meow~[/say]")

		saynn("[say=nova]Huh~? It’s like I should keep you like this. You want something, cutie?[/say]")

		addButton("Shake head", "You experienced enough for now", "shake_head")

	if(state == "shake_head"):
		saynn("You shake your head and raise yourself until you’re kneeling. Nova leans down to you and tugs on your cheeks, making you stick your tongue.")

		saynn("[say=nova]Adorable. You may stand up.[/say]")

		saynn("She disconnects the leash from your collar and gives you a few headpats. You stand up and swipe the dirt from your knees.")

		# (if puppy)
		if(isPuppy):
			saynn("[say=pc]Bark.. I mean.. thanks..[/say]")

		# (if kitty)
		if(!isPuppy):
			saynn("[say=pc]Meow.. I mean.. thanks..[/say]")

		saynn("Nova chuckles and sends you off with a smack on your butt.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")
		

func _react(_action: String, _args):
	if(_action == "hissgrowl"):
		GM.pc.addPain(20)
	
	if(_action == "meow"):
		isPuppy = false
		setState("make_noise")
		return
		
	if(_action == "bark"):
		isPuppy = true
		setState("make_noise")
		return

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["isPuppy"] = isPuppy
	
	return data
	
func loadData(data):
	.loadData(data)
	
	isPuppy = SAVE.loadVar(data, "isPuppy", false)
