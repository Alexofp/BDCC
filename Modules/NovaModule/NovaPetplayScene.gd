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
		addButton("Oral", "You really wanna suck Nova off", "oral")


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
		

	if(state == "oral"):
		# (needs free mouth)

		saynn("You crawl up to Nova’s legs and put your paws on her thighs. She gasps as you stick your head under her skirt and press your nose against her bulge.")

		saynn("[say=nova]Someone’s thirsty~?[/say]")

		# (if puppy)
		if(isPuppy):
			saynn("[say=pc]Ruff![/say]")

		# (kitty)
		if(!isPuppy):
			saynn("[say=pc]Meow~[/say]")

		saynn("You wiggle your {pc.thick} ass as you nuzzle her crotch. You feel her cock getting harder under the suit, Nova bites her lip as you try to find the zipper, licking and nibbling around her crotch. She wraps the leash around her hand so you can’t back away anymore even if you wanted.")

		saynn("[say=nova]Such a silly~[/say]")

		saynn("Eventually you stumble upon a hidden zipper with your tongue and tug on it, exposing her red canine cock, it’s so hard that it lifts her skirt up. You press your muzzle against it and let it drip precum onto your face, sniffing her horny scent makes you feel even more aroused. You drag your tongue along the veiny texture of her member and then take the pointy tip in. Nova lets out a few little moans and scritches you behind the ear.")

		# (if puppy)
		if(isPuppy):
			saynn("[say=nova]Such a good puppy.[/say]")

		# (if kitty)
		if(!isPuppy):
			saynn("[say=nova]Such a good kitty.[/say]")

		saynn("You suck a little bit on her cock, getting used to the taste of her precum, you notice her knot slightly inflating already. You stick your tongue out and proceed to drag it across her member as you take more of it in. You stop just before the tip hits the back of your mouth and instead begin moving back and forth, taking you time, sucking Nova’s cock. She looks very aroused, her canine scent was only becoming stronger, she puts her paws on your head and offers you support, pulling your head onto her cock harder.")

		saynn("[say=nova]Take it, slut~[/say]")

		saynn("You hold your paws on her legs so she is free to make use of your mouth hole, she gets a better grasp and applies more pressure, causing her cock to slide deeper into your mouth and stretching your throat out, testing how well you can control your gag reflex. It gets to the point of her knot slapping against your nose as she starts to face-fuck you, throat bulging as you’re getting stretched. Your eyes roll up slightly, lack of air makes it really hard to concentrate. But it feels good, you keep pushing yourself deeper onto her cock and using your tongue to deliver so much pleasure to Nova that she starts to arch her back and moan loudly.")

		addButton("Take it", "Let her cum down your throat", "take_it")
		addButton("Outside", "You don’t wanna swallow Nova’s load", "outside")

	if(state == "take_it"):
		saynn("It only takes a few more seconds before that knot inflates even more and the whole cock starts throbbing inside your maw, the walls of your tight throat clench around the shaft and try to milk it, Nova moans as she shoves her member as deep as she can before going over the peak. Your belly quickly gets stuffed with her sticky cum, the husky sticks her tongue out and lets out passionate noises as more and more waves of hot semen get pushed into you. So much that some cum finds its way back and stuffs your mouth.")

		saynn("[say=nova]Fuck me~[/say]")

		saynn("Your eyes are rolled up, cheeks blushing red, you’re drooling saliva and cum. Nova tries to pull out but you hug her legs and don’t let her, you don’t wanna drop a single drop like a good slutty pet. It’s only when her balls are completely drained, you pull away and start gasping for air.")

		saynn("You both are panting heavily. You left Nova’s cock in a pretty messy state so you quickly return to it and start licking it clean, gathering all the cum and swallowing it as needed. You clean her meaty stick and offer Nova the view of your empty mouth. She smiles and pats you many times.")

		saynn("[say=nova]Good little cocksucker pet~[/say]")

		saynn("She puts away her cock and undoes the leash, letting you stand up.")

		# (if puppy)
		if(isPuppy):
			saynn("[say=pc]Bark..[/say]")

		# (if kitty)
		if(!isPuppy):
			saynn("[say=pc]Meow..[/say]")

		saynn("[say=nova]Thanks for sucking my cock, couldn’t have done it without you~[/say]")

		saynn("You’re very messy but at least you didn’t add a layer of cum to it. You quickly fix your hair and get ready to leave.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


	if(state == "outside"):
		saynn("It only takes a few more seconds before that knot inflates even more and the whole cock starts throbbing inside your maw, the walls of your tight throat clench around the shaft. You feel like Nova is about to cum any second so you push your hands against her thighs and manage to escape her grasp.")

		saynn("You pull away from her cock and it’s too late for the husky to do anything, she groans as she cums hard, her messy cock throbbing and shooting a line after line of sticky cum that hits your face and hair. You keep your eyes and mouth closed but you still got to taste it, Nova holds your face pressed against her cock as it explodes with more cum. Your head, your neck, your shoulders, {pc.breasts}, all quickly get covered with cum.")

		saynn("[say=nova]Didn’t wanna swallow and now you’re messy, bitch~[/say]")

		saynn("When that’s over, you can only open one eye. You’re a complete mess, cum keeps dripping from you. Nova carefully removes the leash and lets you stand up.")

		saynn("[say=nova]Hah, I don’t mind, you look like such a cute pet right now~[/say]")

		saynn("You’re blushing a lot, opening your mouth right now would mean getting more cum onto your tongue so you decide to stay quiet. You grab your belongings and get ready to leave.")

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
		
	if(_action == "oral"):
		GM.pc.gotThroatFuckedBy("nova")
		
	if(_action == "outside"):
		GM.pc.cummedOnBy("nova")
		GM.pc.addSkillExperience(Skill.SexSlave, 10, "nova_petsuckcock")
		GM.pc.addSkillExperience(Skill.CumLover, 20, "nova_petsuckcock")
		GM.pc.updateNonBattleEffects()
		
	if(_action == "take_it"):
		GM.pc.cummedInMouthBy("nova")
		#GM.pc.cummedOnBy("nova")
		GM.pc.addSkillExperience(Skill.SexSlave, 20, "nova_petsuckcock")
		GM.pc.addSkillExperience(Skill.CumLover, 10, "nova_petsuckcock")
		GM.pc.updateNonBattleEffects()
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["isPuppy"] = isPuppy
	
	return data
	
func loadData(data):
	.loadData(data)
	
	isPuppy = SAVE.loadVar(data, "isPuppy", false)
