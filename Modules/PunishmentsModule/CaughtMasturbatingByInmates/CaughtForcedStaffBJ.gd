extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "CaughtForcedStaffBJ"

func _run():
	if(state == ""):
		addCharacter("guardCrowd")
		playAnimation(StageScene.Duo, "kneel", {npc="maleguard_canine", npcAction="stand"})

	if(state == ""):
		saynn("A few guards crowd around you, each one holding a weapon or a shock remote. You look at all the armor they are equipped with and realize that you won’t even drop a single one before your neck gets fried. Oops, seems like it’s too late to stop exposing yourself, even after covering yourself the guards don’t back off.")

		saynn("[say=pc]What do you want?..[/say]")

		saynn("[say=maleguard_canine]Dunno. You were the one whoring yourself out.[/say]")

		saynn("[say=pc]So?[/say]")

		saynn("The guard behind you uses his advantageous position and suddenly grabs your arms and wrenches them behind your back before slapping some cuffs onto them. The one that was talking reaches his paw out to caress your cheek.")

		saynn("[say=maleguard_canine]So you will suck me off.[/say]")

		saynn("[say=pc]Ow.. And what if I don’t?[/say]")

		saynn("[say=maleguard_canine]Then the stocks will be a good place to think about that.[/say]")

		saynn("Seems like you don’t have much of a choice.")

		addButton("Suck him off", "Better than being put into stocks", "suck_him_off")
		addButton("Stocks", "Tell them to fuck off", "stocks")

	if(state == "stocks"):
		saynn("[say=pc]I’d rather be in stocks.[/say]")

		saynn("The guard hums and wiggles his head slightly, unsure if he agrees or disagrees with such logic. He then just clips a leash to your collar and tugs you off. You grumble but follow behind, each time you try to resist the collar digs into your neck and chokes you.")

		addButton("Follow", "See where they will bring you", "follow")

	if(state == "follow"):
		# (runs the parade scene)

		saynn("The guards bring you to the main platform where all the inmates usually hang around. There are also a few sets of stocks, quite convenient to show off punished inmates while also letting others have fun with them.")

		saynn("You grumble again as the guard pushes you, making you bend forward and hold your wrists in the stocks before lowering the top part and locking it, sealing your fate.")

		saynn("[say=pc]Hey. When are you gonna unlock me?[/say]")

		saynn("The guards just chuckle and give your {pc.thick} ass a smack before leaving you like that.")

		# (scene ends)
		addButton("Continue", "See what happens next", "startstocks")

	if(state == "suck_him_off"):
		# (sucks the first one. Then you are given a chance to suck a dickgirl or go to stocks again)

		saynn("You weigh your options and finally make a choice. As you begin to slowly lower yourself, the guards around you chuckle, the one behind you stops holding you. When your knees hit the floor, a red veiny knotted cock is already rubbing its scent into your cheek.")

		saynn("As your arms are still cuffed, you can only open your mouth and catch the pointy head of his dick with your lips.")

		saynn("[say=maleguard_canine]That was the right choice.[/say]")

		saynn("You look up at the guard’s smug eyes and feel somewhat embarrassed. Still, you show your tongue and drag it over the cock, feeling its texture and coating it with your saliva. As you get under the shaft and reach to give the balls some attention too, a drop of precum lands onto your hair, marking you.")

		saynn("You nuzzle the guy’s ballsack and stick your tongue into the base of his cock where the knot starts. The guards around you watch the show and smile.")

		# (if player red)
		if(GM.pc.getInmateType() == InmateType.HighSec):
			saynn("[say=maleguard_canine]Pretty good, makes me wonder why you’re not a lilac. Should we fix that, guys?[/say]")

		# (if player orange)
		elif(GM.pc.getInmateType() == InmateType.General):
			saynn("[say=maleguard_canine]Inmates from the general block are the best, they aren’t overly slutty and also won’t bite your dick off, it feels so good to use them.[/say]")

		# (if lilac)
		elif(GM.pc.getInmateType() == InmateType.SexDeviant):
			saynn("[say=maleguard_canine]Show us why you’re a lilac.[/say]")

		saynn("The guy doesn’t force you in any way, allowing you to do things at your own pace. You give that cock a good lick, starting from the knot and going up along the length before parting your lips wider and letting his shaft go past your teeth and rub against the walls of your mouth. You try not to look at them anymore as that makes you blush. Though you do feel the guy’s cock reacting, leaking pre onto your tongue.")

		saynn("You start slow, wrapping your lips around the member and sliding your head back and forth at a sluggish pace. You make sure to not use your teeth at all, only using your {pc.masc} lips. You made him feel good, the guy lets out a muffled noise and reaches to place a paw on the back of your head, preventing you from backing off from now on.")

		saynn("You get a little more eager, forcing yourself onto that cock faster, its length is enough to hit the back of your mouth also making you suppress your gag reflex while you suck him off.")

		saynn("Your tongue joins and slides along the length, providing extra stimulation. You can’t use your hands but at this point you don’t really need them, you got into a good rhythm, rocking your head back and forth while hearing the guy’s noises of approval.")

		addButton("Cum", "He is gonna cum!", "cum")

	if(state == "cum"):
		saynn("The guy pants sometimes, you feel his cock twitching inside your mouth, his knot is slapping against your lips while visibly getting bigger. His hand starts to apply more pressure, inviting you to use your throat. You try to fight that but suddenly both his paws land on your head, followed by him thrusting his hips forward, shoving his canine cock deep down your throat. The feeling of tightness quickly shoots him over the edge, the guy drops a few grunts as his dick throbs and bursts with sticky cum.")

		saynn("You struggle a lot and can’t swallow everything, some of the seed escapes back, creating a mess.")

		saynn("[say=maleguard_canine]Fuck, swallow better, bitch.[/say]")

		saynn("As he pulls his cock out, you are left coughing and panting for air. You can’t even clean your face with your hands, forced to wear his facials.")

		saynn("Thinking that you’re done, you try to get up but another guard stops you, pushing his hand into your shoulder, making you hit the floor again. But this guard.. looks quite feminine. It’s a girl. Or is it..")

		saynn("[say=shemaleguard]Hold up, cutie, I’m next.[/say]")

		saynn("[say=pc]Huh?[/say]")

		saynn("You look at the female guard and watch her remove her crotch armor plate just to then expose a canine cock too! She giggles seeing your surprised face.")

		saynn("[say=shemaleguard]Never seen a dickgirl, slut?[/say]")

		saynn("She takes the place of the first guard and shoves her cock into your face, slapping you with it. Cum drips down from your chin as you think about it.")

		saynn("[say=shemaleguard]It’s fine if you don’t want to, stocks are always an option~.[/say]")

		addButton("Suck her off too", "Might as well..", "suck_her_off_too")
		addButton("Stocks", "Tell her to fuck off", "stocks1")

	if(state == "stocks1"):
		saynn("[say=pc]I’d rather be in stocks.[/say]")

		saynn("The dickgirl guard giggles and grabs you by the chin. She then just clips a leash to your collar and tugs you off. You grumble but follow behind, each time you try to resist the collar digs into your neck and chokes you.")

		addButton("Follow", "See where they will bring you", "follow")

	if(state == "suck_her_off_too"):
		saynn("You quickly swallow the rest of what you had in your mouth before proceeding to stick out your tongue again and licking the fresh knotted cock. This girl is much less patient though, when you try to tease her by just rubbing your cheek against the shaft, she grabs you and guides her member directly towards your mouthhole, the tip spreads open your lips and slides inside. And she doesn’t stop there, she lets her cock gradually sink in deeper and eventually hit the back wall of your mouth. She then angles herself in a way that would make her cock curve and start stretching your used throat even more. She shoves her cock so deep that your lips kiss her knot.")

		saynn("[say=shemaleguard]There we go~.. Look at this cock sucker, {pc.he} does it so well.[/say]")

		saynn("After she pulls her paws away from your head, you pick up where she left, proceeding to suck her knotted cock, sliding your lips across its length. You begin to get used to this, not even noticing all the wet noises that you make while your throat gets violated.")

		saynn("Your blush is still there, every time you catch somebody’s eyes glued to your work, you quickly look away. What if this is not the last cock either..")

		saynn("The dickgirl moves her hips slightly, helping you to deep throat her cock. The pace gets intense, you can’t help but to start choking and gagging on her dick but that only seems to make her let out moans of pleasure. Her knot visibly inflates, you hit it with your lips each time she thrusts inside.")

		saynn("[say=shemaleguard]C’mon baby, I’m so close~[/say]")

		addButton("Cum", "She is gonna cum!", "cum1")

	if(state == "cum1"):
		saynn("The dickgirl lets out a passionate moan as her cock starts cumming inside your mouth, quickly stuffing your belly with her hot seed. All the while you sit on your knees and swallow her load like a good cock slut, your eyes are closed as you are focused on giving the girl the best experience.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your {pc.cock} is hard as your chastity allows, you wish you could stroke yourself at this moment..")
		elif(GM.pc.hasPenis()):
			saynn("Your {pc.cock} is hard as a rock, you wish you could stroke yourself at this moment..")

		saynn("[say=shemaleguard]Ah~.. Such a good little fucktoy.[/say]")

		saynn("When she is done, she pulls her messy cock out and cleans it using your face before hiding her sheath.")

		saynn("The guard removes your cuffs before letting you go. You quickly make your escape before more horny guards decide to try you.")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")


func _react(_action: String, _args):
	if(_action == "follow"):
		runScene("ParadedOnALeashScene", ["maleguard_canine", GM.pc.getLocation(), "main_punishment_spot"])

	if(_action == "startstocks"):
		#runScene("StocksPunishmentScene", ["maleguard_canine"])
		endScene()
		GM.main.IS.startInteraction("InStocks", {inmate="pc"})
		return

	if(_action in ["cum"]):
		processTime(60*6)
		GM.pc.gotThroatFuckedBy("maleguard_canine")
		GM.pc.cummedInMouthBy("maleguard_canine")
		GM.pc.cummedOnBy("maleguard_canine")
		GM.pc.addLust(20)
		GM.pc.addSkillExperience(Skill.SexSlave, 10, "caught_staff_forcedbj")
		
	if(_action in ["cum1"]):
		processTime(60*6)
		GM.pc.gotThroatFuckedBy("shemaleguard")
		GM.pc.cummedInMouthBy("shemaleguard")
		GM.pc.cummedOnBy("shemaleguard")
		GM.pc.addLust(20)
		GM.pc.addSkillExperience(Skill.SexSlave, 10, "caught_staff_forcedbj2")
		
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

