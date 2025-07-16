extends SceneBase

var helpedMirri = false
var mirriTimes = 0

func _init():
	sceneID = "PlayerSlaveryStartMirriScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.GivingBirth, "idle", {pc="pc"})
		aimCameraAndSetLocName("solitary_cell")
		helpedMirri = getFlag("SlaveAuctionModule.s2hap", false)
		mirriTimes = getFlag("PlayerSlaveryModule.mirriTimes", 0)
		saynn("Your head is ringing.. everything throbs in time with your heartbeat.. and not in a good way. The coarse concrete under you offers cold support as your mind slowly comes back to senses.")

		saynn("Time to open your eyes.")

		saynn("You force your vision into focus. You're in one of the solitary cells.. tiny cubicles of justice for inmates who've earned a special kind of punishment.")

		saynn("A voice pulls your attention away from the confined space.")

		if (mirriTimes <= 0):
			saynn("[say=mirri]Someone's been a bad {pc.girl}..[/say]")

		elif (mirriTimes == 1):
			saynn("[say=mirri]Back for more, huh~.[/say]")

		elif (mirriTimes == 2):
			saynn("[say=mirri]Hello, love. Welcome back.[/say]")

		elif (mirriTimes == 3):
			saynn("[say=mirri]Third time I see you here. Interesting.[/say]")

		elif (mirriTimes == 4):
			saynn("[say=mirri]Going for a record, huh~.[/say]")

		elif (mirriTimes == 5):
			saynn("[say=mirri]You are such a slut for slavery auctions, aren't you~? Perhaps, we both are.[/say]")

		elif (mirriTimes == 6):
			saynn("[say=mirri]I keep selling you. But you keep coming back for more. For me~?[/say]")

		else:
			saynn("[say=mirri]You just can't get enough, can you~?[/say]")

		saynn("Your ears snap towards the reinforced glass wall, where the"+str(" familliar" if helpedMirri else "")+" feminine voice has revealed itself. Mean blue eyes are staring at you from the dim corridor behind. Seeing the armored silhouette is enough to know that you are screwed.")

		addButton("Get up", "Enough being lazy", "do_get_up")
	if(state == "do_get_up"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		addCharacter("mirri")
		if (mirriTimes <= 0):
			if (!helpedMirri):
				saynn("You push yourself to your feet, back against the wall, muscles disobeying slightly. As your sight adjusts, you begin to see more of the guard.. a strange-looking guard, for sure. She is missing what feels like half of her armor.")

				saynn("Red ponytail.. some obvious human features.. but with a sprinkle of uniqueness in the form of feline ears and tail.")

				saynn("[say=mirri]Scared?[/say]")

				saynn("[say=pc]Should I be?[/say]")

				saynn("[say=mirri]I don't know, should you~?[/say]")

				saynn("She tilts her head, the transparent surface between you and her means you can't reach her even if you wanted to.")

				saynn("[say=pc]C'mon, what is happening? Am I getting punished?[/say]")

				saynn("The feline smiles and looks at something under her forearm's armor.")

				saynn("[say=mirri]Depends on how you look at it. Anything is an improvement, if compared to this AlphaCorp shithole.[/say]")

				saynn("She looks around and then reaches into her pouches. The guard seems to be missing her pants.. but she doesn't mind it.")

				saynn("[say=pc]What do you..[/say]")

				saynn("You hear a click.. followed by a bright flash.")

			else:
				saynn("You push yourself to your feet, back against the wall, muscles disobeying slightly. As your sight adjusts, you begin to see more of the guard.. It's her, for sure.. It's Mirri.")

				saynn("Red ponytail.. some obvious human features.. but with a sprinkle of uniqueness in the form of feline ears and tail.")

				saynn("[say=mirri]Scared?[/say]")

				saynn("[say=pc]Why should I be? C'mon, let me out.[/say]")

				saynn("[say=mirri]I don't know, should I~?[/say]")

				saynn("She tilts her head, the transparent surface between you and her means you can't reach her even if you wanted to.")

				saynn("[say=pc]I'm the one who helps you with selling slaves. Did you forget me already?[/say]")

				saynn("The feline smiles and looks at something under her forearm's armor.")

				saynn("[say=mirri]I remember you, don't worry~. It's just.. you know.. how things are. No hard feelings. Business is business.[/say]")

				saynn("She looks around and then reaches into her pouches. Shit.")

				saynn("[say=pc]You are not doing this to me, you slut. You are not gonna sell..[/say]")

				saynn("You hear a click.. followed by a bright flash.")

		elif (mirriTimes == 1):
			saynn("You push yourself to your feet, back against the wall, muscles disobeying slightly. As your sight adjusts, you begin to see Mirri clearly. She is still missing half of her armor..")

			saynn("[say=mirri]You're back faster than I would've expected it~.[/say]")

			saynn("[say=pc]Is that bad?[/say]")

			saynn("[say=mirri]No. I think that's exciting~. You know why?[/say]")

			saynn("She tilts her head, the transparent surface between you and her means you can't reach her even if you wanted to.")

			saynn("[say=pc]You're gonna sell me into slavery again, aren't you?[/say]")

			saynn("The feline smiles and looks at something under her forearm's armor.")

			saynn("[say=mirri]You're a smart {pc.boy}~. You know the drill.[/say]")

			saynn("She looks around and then reaches into her pouches. The guard seems to be missing her pants.. but she doesn't mind it.")

			saynn("[say=pc]Well..[/say]")

			saynn("You hear a click.. followed by a bright flash.")

		elif (mirriTimes == 2):
			saynn("You push yourself to your feet, back against the wall, muscles disobeying slightly. As your sight adjusts, you begin to see Mirri clearly. Half-naked catgirl, the usual..")

			saynn("[say=mirri]I love you~. You know that?[/say]")

			saynn("[say=pc]Is that why you keep selling me into slavery?[/say]")

			saynn("[say=mirri]Yes~. I begin to see this as a family business of sorts~.[/say]")

			saynn("She tilts her head, the transparent surface between you and her means you can't reach her even if you wanted to.")

			saynn("[say=pc]Selling your loved ones into slavery is quite a business.[/say]")

			saynn("The feline smiles and looks at something under her forearm's armor.")

			saynn("[say=mirri]It's more of an.. investment, I guess~.[/say]")

			saynn("She looks around and then reaches into her pouches to grab the flasher.. a little device that looks like a top part of a fancy camera.")

			saynn("[say=pc]Well.. Do your thing then.[/say]")

			saynn("You hear a click.. followed by a bright flash.")

		addButton("Continue", "See what happens next", "get_stripped")
	if(state == "get_stripped"):
		playAnimation(StageScene.Duo, "defeat", {npc="mirri"})
		if (mirriTimes <= 0):
			saynn("The familiar throbbing pain makes a comeback. Everything around you acquires a sharp white tint to it which is hard to look at. The floor isn't so nice this time, hitting you hard.")

			saynn("[say=pc]Argh.. fuck..[/say]")

			saynn("The guard steps into your cell.. and kicks you further down, adding to the sea of unpleasant sensations.")

			saynn("[say=mirri]Don't move a muscle, fucker. I'm done playing games.[/say]")

			saynn("Guard brutality continues with her running her knee into your stomach while her clawed hands strip you of all of your items..")

			saynn("[say=mirri]You won't need this where you are going.[/say]")

			saynn("Resisting only makes her wrench your arms behind your back, twisting them almost to their snapping point. As soon the whiteness in your eyes begins to dissipate.. another flash follows.")

			saynn("[say=pc]The fuck are you doing.. ugh..[/say]")

			saynn("[say=mirri]Say goodbye to this place.[/say]")

			saynn("You hear noise a few feet away.. before the guard begins dragging you off towards the source of it.")

		elif (mirriTimes == 1):
			saynn("The familiar throbbing pain makes a comeback. Everything around you acquires a sharp white tint to it which is hard to look at. The floor isn't so nice this time, hitting you hard.")

			saynn("[say=pc]Argh.. fuck..[/say]")

			saynn("Mirri steps into the cell.. and pins you to the floor.")

			saynn("[say=mirri]Don't move a muscle, fucker.[/say]")

			saynn("Her clawed hands grope your {pc.thick} butt, fondle your {pc.breasts} and then strip you of all of your items..")

			saynn("[say=mirri]This is mine, until you return again soon.[/say]")

			saynn("Not much point in resisting.. She will have it her way anyway.. As soon the whiteness in your eyes begins to dissipate.. another flash follows.")

			saynn("[say=pc]Ugh.. I will return alright.[/say]")

			saynn("[say=mirri]Can't escape me~.[/say]")

			saynn("You hear noise a few feet away.. before the guard begins dragging you off towards the source of it.")

		else:
			saynn("The familiar throbbing pain makes a comeback. Everything around you acquires a sharp white tint to it which is hard to look at. The floor isn't so nice this time, hitting you hard.")

			saynn("[say=pc]Argh.. fuck.. every time..[/say]")

			saynn("Mirri steps into the cell.. and pins you to the floor with her half-naked butt and thighs.")

			saynn("[say=mirri]Don't move a muscle, fucker~.[/say]")

			saynn("Her clawed hands grope your {pc.thick} butt, fondle your {pc.breasts} and then strip you of all of your items..")

			saynn("[say=mirri]I will keep these nice and safe for you, don't worry.[/say]")

			saynn("Not much point in resisting.. She will have it her way anyway.. As soon the whiteness in your eyes begins to dissipate.. another flash follows.")

			saynn("[say=pc]That one was uncesessary.. ugh..[/say]")

			saynn("[say=mirri]It was~.[/say]")

			saynn("You hear noise a few feet away.. before the guard begins dragging you off towards the source of it.")

		addButton("Continue", "See what happens next", "get_tpd")
	if(state == "get_tpd"):
		playAnimation(StageScene.HangingDuo, "idle", {pc="pc", npc="mirri", bodyState={naked=true}})
		aimCameraAndSetLocName("market_market")
		if (mirriTimes <= 0):
			saynn("The next moment you know it, you are getting pulled up by your chained wrists.. forcing you to stand on your toes.")

			saynn("Your head feels like it's about to split in two..")

			saynn("But a slap brings you back from the dream land.")

			saynn("[say=mirri]Hey! Look at me.[/say]")

			saynn("You open your eyes.. and see an entirely different environment surrounding you. Extremely high ceiling.. black wooden floor.. long hanging curtains behind the catgirl, blocking something.")

			if (!helpedMirri):
				saynn("[say=pc]Wait.. where is the..[/say]")

				saynn("Another slap.. ow.. followed by the guard grabbing your chin.")

				saynn("[say=mirri]Your prison? Far away. You are on Syndicate territory now, little bitch.[/say]")

				saynn("Her words are like a bucket of ice.. In one single moment, your whole life got turned upside down.")

				saynn("[say=pc]The fuck..[/say]")

				saynn("[say=mirri]Even worse for you, I'm a slaver.[/say]")

				saynn("You hear shuffling behind the curtains.. several voices. A mild panic spreads through your body as you realize.. this is a stage.. an auction stage.")

				saynn("[say=pc]Hey, I don't.. ugh..[/say]")

				saynn("Her quick fist beats the air out of you.")

				saynn("[say=mirri]Shut your pretty mouth, AlphaCorp slave. I don't have time for foreplay, the event is about to start. Strap in and pretend to look nice. I will get more credits.. and you.. maybe you will even enjoy your new fate.. You seem like the type.[/say]")

				saynn("The guard.. or whoever she is.. jumps onto a little raised platform.. and spreads her arms, welcoming the bright projector light gradually illuminating the stage while the curtains are sliding to the sides.")

			else:
				saynn("You know this place. You just.. can't believe that you'd be standing here, in this spot.")

				saynn("[say=pc]Really, Mirri? After everything?[/say]")

				saynn("Another slap.. ow.. followed by the guard grabbing your chin, her eyes staring at your lips while she licks hers.")

				saynn("[say=mirri]I love you. Really, I do. But sometimes, you gotta let go of what you love.[/say]")

				saynn("What a sick way to love someone.")

				saynn("[say=pc]Are you serious?[/say]")

				saynn("[say=mirri]See this as a small challenge. If you love me as much as I do you, you will find a way to escape~.[/say]")

				saynn("You hear shuffling behind the curtains.. several voices. An auction is about to start.")

				saynn("[say=pc]You are a crazy, fucking bitch.[/say]")

				saynn("Her quick fist beats the air out of you. She cups your cheek right after, rewarding you with a soft touch.")

				saynn("[say=mirri]Shut your pretty mouth, AlphaCorp slave~. You've tamed a wild, ferocious lioness and expect her to act like a soft pussy cat. See you, love~.[/say]")

				saynn("Mirri jumps onto a little raised platform.. and spreads her arms, welcoming the bright projector light gradually illuminating the stage while the curtains are sliding to the sides.")

			saynn("[say=mirri]You got this, Mirri.[/say]")

		else:
			saynn("The next moment you know it, you are getting pulled up by your chained wrists.. forcing you to stand on your toes. Not your first that this is happening..")

			saynn("Your head feels like it's about to split in two..")

			saynn("But a gentle slap brings you back from the dream land.")

			saynn("[say=mirri]There we go~..[/say]")

			saynn("You open your eyes.. and see the auction stage. Extremely high ceiling.. black wooden floor.. long hanging curtains behind the catgirl, blocking the future audience.")

			saynn("[say=pc]Familiar spot.[/say]")

			saynn("Another slap.. ow.. followed by the guard grabbing your chin.. and going for a kiss.")

			saynn("[say=mirri]Do you like this, my little slave?[/say]")

			saynn("She leaves your lips wet.. and scritches you behind the ears.")

			saynn("[say=pc]Do I have a choice?[/say]")

			saynn("[say=mirri]No, not really.[/say]")

			saynn("You hear shuffling behind the curtains.. several voices. A mild panic spreads through your body as you realize.. this is a stage.. an auction stage.")

			saynn("[say=pc]Then what does it matter?[/say]")

			saynn("Your mindset changes rapidly on its own as the moment approaches.. The situation.. makes you want to lower your head.")

			saynn("[say=mirri]I will do my best to sell you~.[/say]")

			saynn("The guard.. or whoever she is.. jumps onto a little raised platform.. and spreads her arms, welcoming the bright projector light gradually illuminating the stage while the curtains are sliding to the sides.")

			saynn("[say=mirri]You got this, Mirri.[/say]")

		addButton("Continue", "See what happens next..", "start_auction")
	if(state == "after_auction"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri", bodyState={leashedBy="mirri"}, flipNPC=true})
		saynn("Everything has happened so quickly..")

		saynn("The guard slowly approaches you, her paw pulling out a chain leash.")

		saynn("[say=mirri]You already have a collar, so handy.[/say]")

		saynn("She clips the leash to your neck in one skilled motion and gestures to someone behind you to relax the tension on your wrists.")

		saynn("[say=mirri]Don't be sad, I'm sure your new owner will treat you exactly the way you deserve it.[/say]")

		saynn("Your {pc.feet} get fully planted onto the ground. A million thoughts rush through your head.")

		saynn("[say=mirri]C'mon, move it, fucker. I ain't got all day.[/say]")

		saynn("Mirri walks you to your new owner.. before handing them the leash.")

		saynn("[say=mirri]Enjoy, {pc.heShe} {pc.isAre} all yours~.[/say]")

		saynn("The masked figure nods.. and brings you along onto their spaceship.")

		saynn("A few minutes later, you are already cruising the stars.. not as a free person.. but as someone's property.")

		addButton("Continue", "See what happens next", "start_slavery")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_get_up"):
		processTime(3*60)

	if(_action == "get_stripped"):
		processTime(3*60)
		GM.main.PSH.storePlayersItems()
		addMessage("All your items were safely stored")

	if(_action == "get_tpd"):
		processTime(3*60)

	if(_action == "start_auction"):
		setFlag("SlaveAuctionModule.knowsMirriName", true)
		runScene("PlayerSlaveryAuctionScene")
		setState("after_auction")
		return

	if(_action == "start_slavery"):
		increaseFlag("PlayerSlaveryModule.mirriTimes")
		endScene()
		runScene("PlayerSlaveryPickScene")
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["helpedMirri"] = helpedMirri
	data["mirriTimes"] = mirriTimes

	return data

func loadData(data):
	.loadData(data)

	helpedMirri = SAVE.loadVar(data, "helpedMirri", false)
	mirriTimes = SAVE.loadVar(data, "mirriTimes", 0)
