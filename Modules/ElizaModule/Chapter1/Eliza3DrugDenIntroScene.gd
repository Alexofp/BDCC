extends SceneBase

func _init():
	sceneID = "Eliza3DrugDenIntroScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		aimCameraAndSetLocName("med_lobbymain")
		saynn("As you traverse medbay's lobby, you hear someone choking on coffee.. followed by a familiar voice.")

		saynn("[say=eliza]Khm.. fuck.. Oh hey! Come here, assistant.[/say]")

		saynn("You approach the counter, behind which you see Doctor Quinn, with her usual mag in her paw. Her lab coat has some dark wet splotches.")

		saynn("[say=pc]Looks like you have a coffee addiction.[/say]")

		saynn("[say=eliza]What I have is a serious case of 'clumsy cat'. Inoperable. Coffee I can quit at any point.[/say]")

		saynn("She puts the mug down and sighs.. before licking the wet cloth.")

		saynn("[say=eliza]But I just don't want to.[/say]")

		saynn("You notice some damage on her personal mag. Little cracks that mess with the 'Best mom' print a bit. Probably not the first time she has almost dropped it.")

		saynn("[say=pc]Clumsy chemist sounds like a dangerous combination.[/say]")

		saynn("She uses some piece of cloth to clean her labcoat and giggles at your words.")

		saynn("[say=eliza]Oh yeah. Did I ever tell you that I managed to blow a whole lab up once before~? That was fun.[/say]")

		saynn("This takes her 'clumsy' description up a few levels.. Right up to 'dangerous'.")

		saynn("[say=pc]You sure you're qualified?[/say]")

		saynn("[say=eliza]I got a paper that says that I am! Listen, you can't do science without an occasional boom, just not how it works. Laboratories can be rebuilt but the knowledge.. that stuff is eternal.[/say]")

		saynn("Rebuilding that laboratory is what you've been doing for some time now.")

		saynn("[say=pc]Is that why the lab equipment is so outdated? You keep blowing it up?[/say]")

		saynn("[say=eliza]Pff. I blow something once and now everyone thinks that I'm a serial blower![/say]")

		saynn("She realizes that her voice was loud enough for all the nurses to hear her way too late..")

		saynn("[say=eliza]Did I say something? No. That was a different lab, wasn't even on this station. That lab was pure pleasure to work in though.[/say]")

		saynn("She puts extra purring into the pure word. She sips some more coffee out of her mug.")

		saynn("[say=eliza]You're right, the stuff here is pretty old. Would be so cool to see some of it upgraded.[/say]")

		saynn("She guides her gaze away and stares at a wall for some time, her eyes reminiscing the past.")

		addButton("Continue", "See what happens next", "start_dungeon_unlock")
	if(state == "start_dungeon_unlock"):
		saynn("[say=eliza]Anyway.. Speaking of labs.[/say]")

		saynn("She looks at her laptop.")

		saynn("[say=eliza]Good job so far! I'm looking at our database, you've been busy. Love to see it~.[/say]")

		saynn("[say=pc]Thanks.[/say]")

		saynn("She nods.")

		saynn("[say=eliza]I've been busy too, for different reasons.. Can't help you with the lab much, outside of scanning those pills. But! I think I can help you with something.[/say]")

		saynn("She leaves the mug on the counter and grabs something else.. some kind of little device.. an injector of sorts.")

		saynn("[say=pc]What is that?[/say]")

		saynn("Eliza's eyes glint mischievously.")

		saynn("[say=eliza]You will see! Let's go.[/say]")

		saynn("There is hope she won't experiment on you..")

		addButton("Follow", "See where she will bring you", "near_drugden")
	if(state == "near_drugden"):
		aimCameraAndSetLocName("yard_deadend2")
		GM.pc.setLocation("yard_deadend2")
		saynn("Instead of heading toward the lab, Eliza surprises you by leading you in a completely different direction.")

		saynn("The two of you step into the elevator and ride it up to the main floor of the prison. From there, you head towards the prison yard and begin following the stone pathways.")

		saynn("Eliza starts talking before you even arrive at your destination.")

		saynn("[say=eliza]So.. This drug problem that we're having.. I managed to find an inmate with some.. interesting information.[/say]")

		saynn("[say=pc]Is that so?[/say]")

		saynn("[say=eliza]Yeah. He didn't want to share it, though. So I had to.. you know.. convince him a little bit.[/say]")

		saynn("You give her a skeptical look.")

		saynn("[say=pc]Don't tell me you tortured him.[/say]")

		saynn("[say=eliza]Noo-o-o! Of course not.[/say]")

		saynn("She places a paw on her before smirking.")

		saynn("[say=eliza]I actually helped him. I actually improved his living conditions! Gave him a better cell to enjoy.[/say]")

		saynn("[say=pc]A padded one?[/say]")

		saynn("Eliza grins, her tail flicking mischievously.")

		saynn("[say=eliza]It's so soft and cozy. He really appreciated the gesture, told me everything that I wanted~.[/say]")

		saynn("Sounds a lot like she did torture him..")

		saynn("[say=pc]Glad you had a good time.[/say]")

		saynn("[say=eliza]Oh, it was fun indeed..[/say]")

		saynn("You finally reach a spot.. some kind of spot. Walls and tall greenery all around you, the place feels cut off from the rest of the prison, eerily silent except for the distant hum of machinery.")

		saynn("Eliza steps toward the very back, where a dense patch of thorny bushes meets a cold concrete wall.")

		saynn("[say=eliza]Anyway, this is the spot! Remember it.[/say]")

		saynn("[say=pc]Why?[/say]")

		saynn("Instead of answering, she crouches down and starts pushing against a heavy-looking rock wedged into the dirt.")

		saynn("[say=eliza]Damn thing is heavy..[/say]")

		saynn("You crouch beside her and press your hands against the stone. With both of you pushing, it finally shifts, revealing something hidden behind it.")

		saynn("An old maintenance vent.")

		saynn("It's rusted, scratched to hell.. and the lights on its panel are dead. It's clearly abandoned.")

		saynn("[say=eliza]So.. apparently there is a whole little underground world to the station.[/say]")

		saynn("[say=pc]Really? First time I'm hearing about it.[/say]")

		saynn("[say=eliza]Oh, shush.[/say]")

		saynn("Eliza tugs on the cover plate.. but it doesn't budge.")

		saynn("[say=eliza]It's unpowered.. hm.. There must be a manual way to open it.[/say]")

		saynn("You glance around and spot a lever tucked along the side. With a firm pull, the cover shudders, then begins to lift, while letting out a loud, metallic screech.")

		saynn("Beyond it is nothing but darkness..")

		saynn("[say=eliza]According to my source, these are the old maintenance tunnels.. which some inmates have turned into a drug den.[/say]")

		saynn("[say=pc]A drug den?[/say]")

		saynn("[say=eliza]Yep. They've been setting up underground labs down there. That's where the weird new drugs are coming from and flooding the prison.[/say]")

		saynn("[say=pc]Where are they getting the materials? Tools?[/say]")

		saynn("Eliza folds her arms, smirking.")

		saynn("[say=eliza]Well.. materials are bodily fluids, like you already know. It's not hard to source them.. just grab a bunch of horny deviants and milk them dry. Tools.. I guess they've been stealing from us.[/say]")

		saynn("Huh. Interesting.")

		saynn("[say=pc]Why not just tell the guards? They would do a few raids and clear it all out.[/say]")

		saynn("Eliza snaps her fingers.")

		saynn("[say=eliza]Exactly, they would destroy everything. And I think that would be a.. huge waste.[/say]")

		saynn("Her gaze shifts back toward the dark slit of the tunnel.. You can already guess where this is going.")

		saynn("[say=pc]You want me to go in there?[/say]")

		saynn("Eliza's tail flicks, her grin widening.")

		saynn("[say=eliza]You don't have to.. bu-u-u-ut I think you might find a lot of new drugs we haven't discovered yet![/say]")

		saynn("You squint into the opening. It's pitch black.. no markings, no indicators. Just endless winding tunnels waiting for you to get lost.")

		saynn("[say=pc]And how would I find my way back?[/say]")

		saynn("[say=eliza]I knew that this would be the problem. I have a plan! Hold the vent open for me.[/say]")

		saynn("Sure.. You focus on keeping the vent opened.. and wait for Eliza to do something. Suddenly, you feel her injecting something into your neck.")

		saynn("[say=pc]Ow. What was that?[/say]")

		saynn("[say=eliza]These.. are nanobots![/say]")

		saynn("Eliza pulls out her datapad and taps on the screen a few times. She then shows it displaying your vitals in real-time.")

		saynn("[say=eliza]See? The nanobots will monitor your condition. And if you start.. you know.. dying..[/say]")

		saynn("[say=pc]Dying?![/say]")

		saynn("[say=eliza]..they will create a bluespace rift straight to medical and teleport you to me![/say]")

		saynn("You stare at her, processing that.. plan..")

		saynn("[say=pc]Right. This sounds safe.[/say]")

		saynn("She nods-nods.")

		saynn("[say=eliza]Totally! One little catch though..[/say]")

		saynn("Of course there is a catch.")

		saynn("[say=eliza]The rift can only teleport so much weight. Meaning.. You gotta leave all your stuff here.[/say]")

		saynn("You furrow your brows.")

		saynn("[say=pc]Are you insane? I have to go bare-handed? No weapons, no supplies, Just me?[/say]")

		saynn("She pats your shoulder.")

		saynn("[say=eliza]I'm sure you will find something helpful during your journeys there![/say]")

		saynn("So this is it huh.. Go in there alone, fight with the junkies, steal their drugs for Eliza.. The plan can not be any more perfect.")

		saynn("[say=eliza]Again, if you don't want to go there, you don't have to. We will just have to get our hands on new drugs in a different way. But science often requires some sacrifices..[/say]")

		saynn("You sigh and look away.")

		saynn("[say=pc]You know.. I'm not doing this for science.[/say]")

		saynn("You look at Eliza.. who looks slightly confused by your words. Then, a slight blush begins to spread around her cheeks, her ears turning down a little.")

		saynn("[say=eliza]Hey.. well.. in any case.. thank you..[/say]")

		saynn("For once, she doesn't have a witty comeback. She leans close to your face.. and gives your cheek a small, warm lick.")

		saynn("[say=eliza]I will return to my boring shift now..[/say]")

		saynn("You nod.")

		saynn("Eliza leaves.. while you're left standing in front of a hidden entrance to a drug den. Beside the vent, there is a small stash spot where you can leave your belongings.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_dungeon_unlock"):
		processTime(5*60)

	if(_action == "near_drugden"):
		processTime(15*60)
		addMessage("You can now do raids on the underground drug den!")

	setState(_action)
