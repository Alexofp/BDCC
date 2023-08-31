extends "res://Scenes/SceneBase.gd"

var isPuppy = true
var usedCondom = false
var condomBroke = false

func _init():
	sceneID = "NovaPetplayScene"

func _run():
	if(state == ""):
		addCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {npc="nova", npcAction="stand"})
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
		playAnimation(StageScene.Duo, "allfours", {
			npc="nova", npcAction="stand", 
			bodyState={naked=true,hard=true, leashedBy="nova"},
			npcBodyState={},
		})
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
		playAnimation(StageScene.Duo, "crawl", {
			npc="nova", npcAction="walk", flipNPC=true, 
			bodyState={naked=true,hard=true, leashedBy="nova"},
			npcBodyState={},
		})
		
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
			if(GM.pc.isWearingChastityCage()):
				saynn("To be honest, even just doing this makes you feel horny, your exposed {pc.cock} is trying to get hard while dripping precum onto the stone tiles as you crawl forward. A caged up pet is probably such a good sight.")
			else:
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
		playAnimation(StageScene.Duo, "crawl", {
			npc="nova", npcAction="walk", flipNPC=true, 
			bodyState={naked=true,hard=true, leashedBy="nova"},
			npcBodyState={},
		})
		
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
		playAnimation(StageScene.Duo, "crawl", {
			npc="nova", npcAction="walk", flipNPC=true, 
			bodyState={naked=true,hard=true, leashedBy="nova"},
			npcBodyState={},
		})
		
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
		addButtonWithChecks("Vaginal", "Breed me!", "vaginal", [], [ButtonChecks.HasReachableVagina])
		addButtonWithChecks("Anal", "Offer your butt!", "anal", [], [ButtonChecks.HasReachableAnus])



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
		playAnimation(StageScene.SexOral, "sex", {
			pc="nova",npc="pc",
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={naked=true,hard=true, leashedBy="nova"},
		})

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
		playAnimation(StageScene.SexOral, "fast", {
			pc="nova",npc="pc",
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={naked=true,hard=true, leashedBy="nova"},
		})
		
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
		playAnimation(StageScene.SexOral, "tease", {
			pc="nova",npc="pc",
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={naked=true,hard=true, leashedBy="nova"},
		})
		
		saynn("It only takes a few more seconds before that knot inflates even more and the whole cock starts throbbing inside your maw, the walls of your tight throat clench around the shaft. You feel like Nova is about to cum any second so you push your hands against her thighs and manage to escape her grasp.")

		saynn("You pull away from her cock and it’s too late for the husky to do anything, she groans as she cums hard, her messy cock throbbing and shooting a line after line of sticky cum that hits your face and hair. You keep your eyes and mouth closed but you still got to taste it, Nova holds your face pressed against her cock as it explodes with more cum. Your head, your neck, your shoulders, {pc.breasts}, all quickly get covered with cum.")

		saynn("[say=nova]Didn’t wanna swallow and now you’re messy, bitch~[/say]")

		saynn("When that’s over, you can only open one eye. You’re a complete mess, cum keeps dripping from you. Nova carefully removes the leash and lets you stand up.")

		saynn("[say=nova]Hah, I don’t mind, you look like such a cute pet right now~[/say]")

		saynn("You’re blushing a lot, opening your mouth right now would mean getting more cum onto your tongue so you decide to stay quiet. You grab your belongings and get ready to leave.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")
		

	if(state == "vaginal"):
		# (needs pussy)
		playAnimation(StageScene.SexAllFours, "tease", {
			pc="nova", npc="pc", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={naked=true,hard=true, leashedBy="nova"},
		})

		# (if puppy)
		if(isPuppy):
			saynn("You ruff playfully and turn around, putting your wet pussy and ass on full display. Nova hums as you eagerly wiggle your {pc.thick} butt and spread your legs more for her. It’s quite visible that the husky is visibly aroused by your actions.")

			saynn("[say=nova]Such a needy puppy~[/say]")

		# (if kitty)
		if(!isPuppy):
			saynn("You purr softly and rub your back against Nova’s legs as you crawl around her. You let the husky catch glimpses of your exposed pussy that is visibly wet. Nova hums as you stop a few steps away from her and lower your chest down to the floor so you can tease your slit in front of her.")

			saynn("[say=nova]Such a needy kitty~[/say]")

		saynn("You look behind you and notice Nova’s skirt bulging slightly. She chuckles and lifts it, exposing the undersuit underneath. Her hands catch the hidden zipper and undo it, exposing her hard canine cock that has a drop of precum hanging from its tip already.")

		saynn("[say=nova]You want this, sweetie~?[/say]")

		addButton("Nod", "No protection, you’re feeling very risky", "vaginalNoCondom")
		addButtonWithChecks("Condom", "Offer your best condom to her", "vaginalCondom", [], [ButtonChecks.HasCondoms])

	if(state == "fucking"):
		playAnimation(StageScene.SexAllFours, "sex", {
			pc="nova", npc="pc", 
			bodyState={exposedCrotch=true,hard=true,condom=usedCondom},
			npcBodyState={naked=true,hard=true, leashedBy="nova"},
		})
		
		# (if condom)
		if(usedCondom):
			saynn("You quickly rummage through your belongings and produce a packaged condom. You grab it with your mouth and proceed to wiggle your behind while watching Nova, your needy pussy gets more aroused from anticipation.")

			saynn("[say=nova]You look so slutty with that thing, aww.[/say]")

		# (else)
		else:
			saynn("You nod eagerly and just offer Nova the best view of your needy pussy you can give. You stick your tongue out at the husky, with each second you feel more aroused just from anticipation.")

			saynn("[say=nova]Well, don’t complain when you get my pups, slut~.[/say]")

		saynn("Nova unzips the skirt so it wouldn’t get in the way and takes off some armor pieces too, her bodysuit emphasizes her rich muscle structure. She crouches behind you and licks her digits before shoving a few down your snatch. You moan as she quickly checks how lubricated you are. And she seems very satisfied.")

		# (if puppy)
		if(isPuppy):
			saynn("[say=nova]I’m gonna fuck you doggystyle because that’s what a pup deserves.[/say]")

			saynn("[say=pc]R-Ruff![/say]")

		# (if kitty)
		if(!isPuppy):
			saynn("[say=nova]I’m a dog so today you’re getting fucked doggystyle, kitty.[/say]")

			saynn("[say=pc]M-mew![/say]")

		# (if condom)
		if(usedCondom):
			saynn("She fetches the condom from your maw and swiftly opens the package. She then takes the rubber and puts it on her cock, stretching it over the whole length of her shaft, its tip already holding some precum.")

		saynn("Nova doesn’t plan to wait for very long, she puts her paws on your hips and pulls them back while directing her hard veiny cock towards your cunt. You gasp as your pussy petals get forced open and stretched for Nova to shove her dick inside, the amount of natural lube certainly helps.")

		saynn("She is doing it right here, in a place that’s barely secluded, any inmate walking past would probably notice you being fucked by a guard. But you don’t mind, you love both the idea and the execution of it, you hold onto the stone tiles while Nova holds your butt above the floor and uses your cunt for her pleasure.")

		saynn("You try to only make animal noises but the moans do start to slip past your lips, Nova’s cock is about 18 centimeters so she can easily stretch you out. She gets a grasp on your hair and uses it to make you move towards her cock as she thrusts inside, you can feel the bump appearing on your lower belly as she starts pounding at your cervix. You stick your tongue out and start moaning a lot, your pussy leaks more of your juices, creating a little wet spot under you both.")

		saynn("Nova’s knot is inflating. You can’t see it but you certainly feel how it’s slapping against your pussy lips each time she pushes her hips forward. Nova’s lips produce some little moans too in between all the panting, it seems she wants to breed you nice and swift.")

		saynn("[say=nova]Ready to be knotted, slut? I’m not gonna stop now[/say]")

		saynn("With each her thrusts, your cunt is getting stretched more and more by Nova knot, it already starts to slip in deeper. You drool all over the floor and touch your {pc.breasts} with one hand, pulling on the firm nipple. Your own moans become louder. Fuck, you’re gonna cum.")

		addButton("Cum", "Can’t hold it off forever", "vaginalcum")

	if(state == "vaginalcum"):
		playAnimation(StageScene.SexAllFours, "fast", {
			pc="nova", npc="pc", 
			bodyState={exposedCrotch=true,hard=true,condom=usedCondom},
			npcBodyState={naked=true,hard=true, leashedBy="nova"},
		})
		
		saynn("Your whole body starts to experience orgasmic convulsions, your legs shake, body shivers, you squirm under Nova while your pussy gets tighter around her cock and starts to squirt. Your inner walls clench around the canine member, milking it while the cervix becomes less rigid and opens up more. Your passionate moans can probably be heard from a long distance so Nova decides to help you and shoves her paw into your mouth for you to suck on.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your cock throbs and shoots a weak line of {pc.cum} through the hole in your chastity cage onto the stone pathway underneath you!")
		elif(GM.pc.hasPenis()):
			saynn("Your cock throbs and shoots a strong line of {pc.cum} onto the stone pathway underneath you!")

		saynn("[say=nova]Oh fuck, your cunt is gonna make me cum[/say]")

		saynn("And indeed, Nova puts all her strength into the next thrust and manages to shove her inflated red orb inside you, stretching your slit twice as much as it was before. The pure sensation of getting knotted sends you over the second peak instantly, you cum and squirt again, your pussy pulsates around the orb, trying to squeeze it but it’s no help, Nova’s is completely inside you, its head breaks into your womb.")

		# (if condom)
		if(usedCondom && !condomBroke):
			saynn("Nova can’t pull out or even just move anymore, only about a second passes before she lets out a series of groans and moans as her cock starts filling the condom inside your womb. There is so much, your belly quickly becomes inflated. The husky is experiencing the climax together with you. But then she slaps your ass and holds you pinned to the floor, still with the cock deep inside.")

		# (if condom broke)
		if(usedCondom && condomBroke):
			saynn("Nova can’t pull out or even just move anymore, only about a second passes before she lets out a series of groans and moans as her cock starts filling the condom inside your womb. There is so much, your belly quickly becomes inflated. But you feel kinda strange.. You feel the hot cum freely slashing inside your womb.. [b]Oh no, the condom broke, spilling out all of its contents[/b]. Still, not knowing that, Nova slaps your ass and holds you pinned to the floor, still with the cock deep inside.")

		# (if no condom)
		if(!usedCondom):
			saynn("Nova can’t pull out or even just move anymore, only about a second passes before she lets out a series of groans and moans as her cock starts filling your womb to the brim with virile cum. There is so much, your belly quickly becomes inflated. The husky is experiencing the climax together with you, moaning loudly and panting. But then she slaps your ass and holds you pinned to the floor, still with the cock deep inside.")

		saynn("[say=nova]Good slut~. And now we rest until my knot deflates.[/say]")

		saynn("The knot seems to isolate most of the leakage. You try to escape it but no, you’re stuck together for quite a while. At least it gives you time to catch your breath.")

		# (if puppy)
		if(isPuppy):
			saynn("[say=pc]W-wuf..[/say]")

		# (if kitty)
		if(!isPuppy):
			saynn("[say=pc]M-meow..[/say]")

		addButton("Rest", "Aftercare is good, right?", "vagrest")

	if(state == "vagrest"):
		playAnimation(StageScene.SexAllFours, "tease", {
			pc="nova", npc="pc", 
			bodyState={exposedCrotch=true,hard=true,condom=usedCondom},
			npcBodyState={naked=true,hard=true, leashedBy="nova"},
		})
		
		saynn("You both lay down on the floor for about half an hour. Eventually you begin to feel the discomfort of being stretched so much for so long so you whine a bit. Nova pets you and caresses your body.")

		saynn("[say=nova]It’s okay, sweetie. It’s almost out.[/say]")

		# (if condom)
		if(usedCondom && !condomBroke):
			saynn("After some effort Nova finally manages to pull out her cock. Luckily, all of the cum is still held by the condom inside you. Nova carefully ties it up and pulls it out too.")

			saynn("[say=nova]That’s a nice load~.[/say]")

		# (if condom broke)
		if(usedCondom && condomBroke):
			saynn("After some effort Nova finally manages to pull out her cock. But that’s when she realizes that something is wrong, your used cunt is leaking cum a lot, meaning that the condom broke..")

			saynn("[say=nova]Ohh, tough love, cutie. I think I might have bred you by accident, hope you don’t mind~[/say]")

			# (if puppy)
			if(isPuppy):
				saynn("You perk your ears.")

				saynn("[say=pc]BARK?[/say]")

			# (if kitty)
			if(!isPuppy):
				saynn("You perk your ears.")

				saynn("[say=pc]MEOW?[/say]")

			saynn("[say=nova]The condom broke~[/say]")

			saynn("Oh well, what can you do.")

		# (if nothing)
		if(!usedCondom):
			saynn("After some effort Nova finally manages to pull out her messy cock. Your used cunt is leaking cum a lot, the husky spanks your ass and the stream increases for a second.")

			saynn("[say=nova]Such a slut~[/say]")

		# (if puppy)
		if(isPuppy):
			saynn("[say=pc]Bark..[/say]")

		# (if kitty)
		if(!isPuppy):
			saynn("[say=pc]Meow..[/say]")

		saynn("Nova offers you her cock and you quickly clean it for her. Then she puts it away and disconnects the leash from your collar.")

		saynn("[say=nova]You may stand up, sweetie.[/say]")

		saynn("[say=pc]T-thanks..[/say]")

		saynn("You stand up and gather your belongings.")

		saynn("[say=nova]See you around~[/say]")

		# (scene end)
		addButton("Continue", "Time to go", "endthescene")
		
	if(state == "anal"):
		playAnimation(StageScene.SexAllFours, "tease", {
			pc="nova", npc="pc", 
			bodyState={exposedCrotch=true,hard=true,},
			npcBodyState={naked=true,hard=true, leashedBy="nova"},
		})
		# (if puppy)
		if(isPuppy):
			saynn("You ruff playfully and crawl around Nova on all fours before stopping before her and turning around so she can see your {pc.masc} butt in full glory. You wiggle it eagerly and spread your rear legs more so she can get a look at your {pc.analStretch} star.")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("Your chastity cage wiggles too as you do it. You are horny so much that you keep dripping onto the stone floor.")
			elif(GM.pc.hasPenis()):
				saynn("Your {pc.cock} wiggles too as you do it. You are horny so much that you keep dripping onto the stone floor.")

		# (if kitty)
		if(!isPuppy):
			saynn("You purr softly and crawl around Nova on all fours, making sure to put as much elegance as you can into your paw and hip movement. Then stop before Nova and teasingly offer her a view of your {pc.analStretch} star. You wiggle your {pc.masc} butt and watch her with your eyes full of desire.")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("Your chastity cage wiggles too as you do it. You are horny so much that you keep dripping onto the stone floor.")
			elif(GM.pc.hasPenis()):
				saynn("Your {pc.cock} wiggles too as you do it. You are horny so much that you keep dripping onto the stone floor.")

		saynn("[say=nova]My little pet wants to be fucked, huh~. How can I say no to that.[/say]")

		saynn("Nova quickly drops her skirt and finds a hidden zipper on her undersuit that she undoes, exposing her sheath with the red canine cock that’s slightly peeking. Then she wraps the leash around her hand and yanks you closer to her crotch, forcing your face into her ballsack.")

		saynn("[say=nova]You better lick me good first cause that’s all the lube you’re getting~[/say]")

		saynn("You eagerly press your face into the area between the sheath and the balls and give it a good sniff. Then you stick your tongue out and start lapping at her package, your paws rest on her knees while she holds your leash and keeps it deliberately short so you can feel your collar digging into your neck more.")

		saynn("The husky pants softly while her dick starts to become harder. You decide to take advantage of that by shoving your tongue between her veiny cock and the ring of the sheath. Nova suddenly moans as you proceed to slide your tongue in that tight space, tracing the thick outline of it and feel it inflate with more blood. You open your mouth and welcome the pointy head, your tongue only works harder, brushing against the cock’s texture at its base as Nova puts her free hand on your head and scritches you behind the ear.")

		saynn("[say=nova]Fuck~. Such an eager whore.[/say]")

		saynn("You can only smile and proceed to suck on her meaty candy, you make sure to catch all her drops of precum and spread it along the full length while also coating the shaft with your saliva, at this point Nova is fully hard. You get a little carried away and get more of it in your mouth, testing your throat as you try to shove it down your throat but Nova yanks on the leash and pulls you out.")

		saynn("[say=nova]Present me your ass, bitch~[/say]")

		addButton("Do it", "Time for the fun part", "anal_fucking")

	if(state == "anal_fucking"):
		playAnimation(StageScene.SexAllFours, "sex", {
			pc="nova", npc="pc", 
			bodyState={exposedCrotch=true,hard=true,},
			npcBodyState={naked=true,hard=true, leashedBy="nova"},
		})
		
		# (if puppy)
		if(isPuppy):
			saynn("You bark softly and lick your lips before doing as told, turning around and raising your ass up for Nova.")

		# (if kitty)
		if(!isPuppy):
			saynn("You meow softly and lick your lips before doing as told, turning around and raising your ass up for Nova.")

		saynn("She gets on one knee behind you and puts her paws on your {pc.thick} buttcheeks. She gives each one a few firm smacks, causing them to bounce and you to moan in anticipation. Then she spreads them open and takes a good look at your tailhole. You don’t even notice as you spread your legs more, just cause you feel so needy. Nova then stretches open your star with two digits and spits inside.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("You are so aroused that your {pc.cock} is throbbing already and leaking pre, creating a little wet spot underneath.")

		saynn("[say=nova]Hope you like doggystyle, slut~[/say]")

		saynn("Nova holds you still with one hand while the other one directs her cock directly towards your tailhole. She starts slowly, just prodding at your anus and seeing how tight it is. Thankfully, with so much lube you don’t feel any discomfort, you slightly sway your hips and move yourself back, trying to force the penetration but Nova just spanks you again. You’re practically begging to be taken roughly already.")

		saynn("[say=nova]Fine~[/say]")

		saynn("With one steady movement, Nova starts forcing her canine cock down your {pc.analStretch} rearhole. The pointy head finds your pucker resisting at first but with one hard push it stretches your star wide and slides inside with relative ease, preparing your butt for more thick parts of the cock that come soon after.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("You arch your back and feel how her {nova.penisSizeStr} cock starts pushing against the bumpy sensitive spot that is your prostate, causing you to let out a passionate moan and drip with more precum.")

		# (if has vagina)
		if(GM.pc.hasVagina()):
			saynn("It’s very filling, so much that you feel the inner wall stretching out and pressing on your g-spot, your wet slit looks smaller than it usually is but more spread open instead.")

		saynn("You tilt your head down and keep making noises of pleasure while Nova shoves her cock deeper, until the knot part is stopped by your ring. Fuck it feels great, every time you clench you feel more pleasure from increased friction and feeling of your butt being stretched.")

		saynn("[say=nova]You’re a tight slut, milking my cock already~[/say]")

		saynn("Nova starts pulling her cock out, leaving the empty space behind. Space that you really want to get filled again. You moan eagerly and drag your hips back along with her cock, trying to keep more of it. But just before she withdraws it completely, she instead shoves it back deep with full strength, causing you to fall forward even. It feels, you squirm around the cock and don’t even try to get up, just holding your ass up so Nova can fuck you raw.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("You moan as your p-spot is squeezed so much that your cock leaks some of your {pc.cum}.")

		saynn("[say=nova]Bet you love it~. I do. Breaking little pets down until they’re a complete mess, begging to be stuffed with my cum 24/7.[/say]")

		saynn("She doesn’t stop and switches to ravaging your tailhole at a steady pace, slowly stretching your inner walls to fit her knotted member. You bite your lip and focus on enjoying the pleasurable sensations. You feel Nova’s knot becoming bigger as it fills up with blood, it doesn’t even fit inside you anymore, your tight ring is keeping it out.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("With each her thrust, your poor little prostate is getting pounded again and again, forcing your {pc.cock} to leak more of your {pc.cum}. You’re not even touching yourself and your cock is getting milked just from anal sex.")

		saynn("The husky lands a spank on your butt and stands pulling your ass back for each thrust. You welcome that and help her, moving your hips to meet Nova’s dick, forcing it deeper each time. The knot is putting quite a bit of pressure on your backdoor, you feel it slowly winning over you clenching. Nova starts to grunt and pant heavily, she seems to be quite close. And so are you.")

		saynn("[say=nova]You’re clenching so much~. You must be loving this~[/say]")

		addButton("Get knotted", "Ohhhh", "anal_get_knotted")

	if(state == "anal_get_knotted"):
		playAnimation(StageScene.SexAllFours, "fast", {
			pc="nova", npc="pc", 
			bodyState={exposedCrotch=true,hard=true,},
			npcBodyState={naked=true,hard=true, leashedBy="nova"},
		})
		
		saynn("Nova puts her hand onto your back and pins you still while she pounds your butt with slow but powerful thrusts, stretching you out even more. Eventually your ring gets stretched so much that her meaty orb slips inside, sending waves of sharp sensations throughout your body. You’re squirming and moaning like a slut, you’re so full.")

		# (if has cock, say)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your metal chastity cage puts a lot of pressure on your poor cock. Your prostate gets milked so much that it sends you over the edge, your cock shoots many weak lines of {pc.cum} that all hit the floor. You have created a mess!")
		elif(GM.pc.hasPenis()):
			saynn("Your prostate gets milked so much that it sends you over the edge, your cock shoots many weak lines of {pc.cum} that all hit the floor. You have created a mess!")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Your G-spot gets rubbed enough through the inner wall that it causes overstimulation, your cunt squirts with your juices even though it never received any stimulation. You’re such a buttslut!")

		saynn("[say=nova]Oh fuck-k[/say]")

		saynn("Nova grunts heavily as she cums too, the sure feeling of your tight insides applying so much pressure on her member causes it to explode with cum, the husky lets out long noises of pleasure while stuffing your butt full of cum with her knot keeping it all nice and secure inside. The orgasmic waves cause all your muscles to flex, including your anal ring, you’re milking Nova’s ball for all her cum!")

		saynn("When her balls get drained, you both are left feeling like a mess. Nova tries to pull her cock out but it’s stuck too tight.")

		saynn("[say=nova]Bitch, we’re stuck together for a while now~[/say]")

		saynn("You pant heavily as you slowly recover from your orgasm.")

		# (if puppy)
		if(isPuppy):
			saynn("[say=pc]Bark..[/say]")

		# (if kitty)
		if(!isPuppy):
			saynn("[say=pc]Me-eow..[/say]")

		saynn("You put a hand on your belly and feel that it’s slightly inflated with so much cum and cock in you. You feel like you’re gonna be there for a while so you decide to get into a better pose.")

		addButton("Rest", "Wait until the knot deflates", "analrest")

	if(state == "analrest"):
		playAnimation(StageScene.SexAllFours, "tease", {
			pc="nova", npc="pc", 
			bodyState={exposedCrotch=true,hard=true,},
			npcBodyState={naked=true,hard=true, leashedBy="nova"},
		})
		
		saynn("Eventually Nova manages to pull out her cock, causing a strong stream of cum from your used butthole, you moan again as Nova offers you her messy cock.")

		saynn("[say=nova]Clean it, slut~[/say]")

		saynn("You do as told, quickly whipping out your tongue and gathering all the cum that you can, moving your tongue along the full length of Nova’s cock and then swallowing what you got. As a reward you get patted. Husky puts away her cock, removes your leash and lets you stand up.")

		saynn("[say=nova]Had fun?[/say]")

		saynn("You nod, a red deep blush appears on your face, your butt is gonna be leaking for a while.")

		saynn("[say=nova]Good~. Now let me rest before I get too horny looking at you and decide to fuck you again~[/say]")

		saynn("It doesn’t seem like the worst fate but still, you gather your belongings and prepare to leave.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")
		

func _react(_action: String, _args):
	if(_action in ["meow", "bark", "get_on_all_fours", "follow", "follow1", "let_it_happen", "hissgrowl", "follow2"]):
		processTime(RNG.randi_range(3, 10)*60)
		
	if(_action in ["oral", "vaginal", "anal", "vagrest", "analrest"]):
		processTime(RNG.randi_range(30, 60)*60)
	
	if(_action == "vaginalCondom"):
		usedCondom = true
		GM.pc.gotVaginaFuckedBy("nova")
		setState("fucking")
		return
	
	if(_action == "vaginalNoCondom"):
		usedCondom = false
		GM.pc.gotVaginaFuckedBy("nova")
		setState("fucking")
		return
	
	if(_action == "vaginalcum"):
		if(usedCondom):
			var chance = GM.pc.useBestCondom()
			condomBroke = getCharacter("nova").shouldCondomBreakWhenFucking(GM.pc, chance)

		if(!usedCondom || (usedCondom && condomBroke)):
			GM.pc.cummedInVaginaBy("nova")
			GM.pc.addSkillExperience(Skill.SexSlave, 20, "nova_petfuck")
		else:
			GM.pc.addSkillExperience(Skill.SexSlave, 40, "nova_petfuck")
			addFilledCondomToLootIfPerk(getCharacter("nova").createFilledCondom())
		
		GM.pc.orgasmFrom("nova")
	
	if(_action == "anal_fucking"):
		GM.pc.gotAnusFuckedBy("nova")
	
	if(_action == "anal_get_knotted"):
		GM.pc.gotAnusFuckedBy("nova")
		GM.pc.cummedInAnusBy("nova")
		
		GM.pc.addSkillExperience(Skill.SexSlave, 20, "nova_petfuck")
		
		GM.pc.orgasmFrom("nova")
	
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
		
	if(_action == "take_it"):
		GM.pc.cummedInMouthBy("nova")
		#GM.pc.cummedOnBy("nova")
		GM.pc.addSkillExperience(Skill.SexSlave, 20, "nova_petsuckcock")
	
	if(_action in ["oral", "anal_fucking", "vaginalcum"]):
		GM.main.addRoomMemoryCurrentLoc("You notice some cum stains, a sign that somebody had sex here. Meow? Bark?", 1)
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["isPuppy"] = isPuppy
	data["usedCondom"] = usedCondom
	data["condomBroke"] = condomBroke
	
	return data
	
func loadData(data):
	.loadData(data)
	
	isPuppy = SAVE.loadVar(data, "isPuppy", false)
	usedCondom = SAVE.loadVar(data, "usedCondom", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)

func getDevCommentary():
	return "Petplay is fun. If you ever played TiTs, that game had a really fun scene where you walk one of the cuties around the station. It was pure text but still fun to read. Very lewd too. It probably what planted a seed in my head and made me enjoy that particular kink ^^. But yeah, I tried to replicate that fun in this scene. To lesser success probably.. If you want better petplay scene, try Rahi's content, I tried to go all-out in those scenes.."

func hasDevCommentary():
	return true
