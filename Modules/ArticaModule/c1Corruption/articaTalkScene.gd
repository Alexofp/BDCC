extends SceneBase

var corruption = 0.0
var isNaked = false
var isCaged = false
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaTalkScene"

func _run():
	if(state == ""):
		addCharacter("artica")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		corruption = getModule("ArticaModule").getCorruption()
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		if (getModule("ArticaModule").isLusty()):
			saynn("Artica is swaying a lot, her cheeks blushing slightly.")

		else:
			saynn("Artica is standing still.")

		saynn("Corruption: "+str(Util.roundF(corruption*100.0, 1))+"%")

		addButton("Tease", "Do something half-lewd with her", "tease_menu")
		if (getModule("ArticaModule").isLusty()):
			addButton("Sex", "See what kind of kinky things you can do with her", "sex_menu")
		else:
			addDisabledButton("Sex", "Artica is not horny enough")
		if (getModule("ArticaModule").canTriggerWaitScene()):
			saynn("Artica is gonna do something if you wait for her to do so..")

			addButton("Wait..", "See what Artica will do if left alone", "trigger_wait")
		else:
			addDisabledButton("Wait..", "Nothing will happen if you do this. Can try to make Artica horny to encourage her to explore the station")
		addButton("Leave", "Time to go", "endthescene")
	if(state == "sex_menu"):
		saynn("Artica is horny. How do you wanna solve that?")

		addButton("Breed her", "Try for some pups", "sex_breed")
		addButton("Ride her", "Artica has a nice cock.. why not ride it", "sex_ride")
		if (corruption >= 0.2):
			addButton("Pawjob", "Make Artica cum with just your feet", "sex_pawjob")
		else:
			addDisabledButton("Pawjob", "Artica's corruption needs to be above 20% for her to agree to this")
		if (corruption >= 0.3):
			addButtonWithChecks("Ropes!", "Use some ropes to suspend Artica above the floor.. and then have some fun with her (Requires a rope harness!)", "sex_ropes", [], [[ButtonChecks.HasItemWithTag, ItemTag.RopeHarness]])
		else:
			addDisabledButton("Ropes!", "Artica's corruption needs to be above 30% for her to agree.. also.. prepare a rope harness")
		if (corruption >= 0.5):
			if (!isCaged):
				addButton("Mutual pawjob", "Help each other out with your paws", "sex_mutualpawjob")
			else:
				addDisabledButton("Mutual pawjob", "Artica can not be caged for this scene. Sorry!")
		else:
			addDisabledButton("Mutual pawjob", "Artica's corruption needs to be above 50% for her to be kinky enough to do this!")
		if (corruption >= 0.8):
			addButtonWithChecks("Hypnovisor fun..", "Mess with Artica's mind a little.. You will need a hypnovisor for this", "sex_hypnovisorfun", [], [[ButtonChecks.HasItemWithTag, ItemTag.Hypnovisor]])
		else:
			addDisabledButton("Mutual pawjob", "Artica's corruption needs to be above 80% for her to be kinky enough to do this.. also don't forget to bring a hypnovisor!")
		addButton("Back", "Never mind", "")
	if(state == "tease_menu"):
		saynn("What do you want to do?")

		addButton("Canteen", "(Pawplay) Invite Artica to go eat", "do_tease_canteen")
		addButton("Your cell", "Invite Artica to your cell", "do_tease_cell")
		if (corruption >= 0.25):
			addButton("Grope her", "Casually grope Artica out in the public", "do_grope")
		else:
			addDisabledButton("Grope her", "Artica's corruption needs to be at least 25% for you to casually grope her out in the public")
		if (corruption >= 0.5):
			addButton("Dirty language", "Get Artica horny with just words", "do_dirtylanguage")
		else:
			addDisabledButton("Dirty language", "Artica's corruption needs to be at least 50% for you to be able to get her horny with just your words")
		addButton("Back", "Go back to the previous menu", "")
	if(state == "do_dirtylanguage"):
		playAnimation(StageScene.Grope, "tease", {pc="artica", npc="pc", bodyState={hard=true}})
		var isPregnant = getCharacter("artica").isVisiblyPregnant()
		saynn("You lean in close to Artica, making her feel your hot breath against her ear.")

		var theTopic = RNG.pick(["naked", "whore", "paws"])
		if (isCaged && RNG.chance(40)):
			theTopic = "chastity"
		if (isPregnant && RNG.chance(30)):
			theTopic = "preg"
		if (!isPregnant && RNG.chance(30) && GM.pc.hasReachablePenis()):
			theTopic = "breed"
		if (theTopic == "naked"):
			saynn("[say=pc]You look so beautiful when you're naked, Artica.[/say]")

			saynn("Artica instantly lowers her gaze, her tail curling around her leg.")

			saynn("[say=pc]I just.. love.. seeing your tits.. cock.. your pussy.. all on display for me to see.[/say]")

			saynn(""+str("She is not naked right now.. but you can still see her nipples becoming perky and stiff behind the shirt" if !isNaked else "You notice her nipples becoming perky and stiff as you say that..")+"")

			saynn("[say=artica]Mm-m.. t-thank you.. for the c-compliment..[/say]")

			saynn("[say=pc]You're such a good pet. You're always ready to show off your body for me.[/say]")

			if (!isNaked):
				saynn("Her breathing becomes deeper, "+str("something in her shorts twitching" if isCaged else "her shorts bulging")+"..")

			else:
				saynn("Her breathing becomes deeper, "+str("her caged up cock becoming all cute and drippy" if isCaged else "her cock peeking out of its sheath, the tip leaking pre..")+"")

			saynn("[say=artica]Y-y.. y-yes.. I-I.. I.. love.. I love being a.. e-exhibionist little slut..[/say]")

			saynn("So cute to hear her say that.")

			saynn("[say=pc]Good girl.[/say]")

			saynn("Her chin is low.. but her"+str(" naked" if isNaked else "")+" chest is puffed out, her butt swaying sensually while her paws slide along the white fur on her sides.")

		elif (theTopic == "whore"):
			saynn("[say=pc]You're so obedient, Artica. Always ready to spread your legs for me.. or anyone really.. who wants to use you."+str(". Always ready to offer me your cock to play with too~." if GM.pc.hasVagina() else "")+"[/say]")

			saynn("Your words make her blink many times, her cheeks blush deep red as she stands up on her toes.")

			saynn("[say=pc]Right?[/say]")

			saynn("[say=artica]I.. um.. m-maybe..[/say]")

			saynn("You don't touch her at all.. but your eyes are drilling her, making the white fluff squirm in place.."+str(" while her nips are becoming visibly aroused behind the shirt." if !isNaked else " while her nips become visibly hard and stiff..")+"")

			saynn("[say=pc]Maybe? C'mon, you can do better than that.[/say]")

			saynn("Her voice is trembling.")

			saynn("[say=artica]I.. I love being.. a f-fucktoy..[/say]")

			saynn("Wow, brave words.")

			saynn("[say=pc]What else? Tell me.[/say]")

			saynn("[say=artica]I'm.. I.. a cocksleeve.. a plaything.. I-I w-wanna be u-used.. f-forced..[/say]")

			saynn("Her shy voice.. coupled with the dirty things that she is saying.. arouses even you.")

			saynn("[say=pc]Good girl.[/say]")

		elif (theTopic == "paws"):
			saynn("[say=pc]You have a thing for paws..[/say]")

			saynn("Artica lowers her gaze, her legs shuffling slowly..")

			saynn("[say=artica]I.. um.. d-don't what you are t-talking a-about..[/say]")

			saynn("[say=pc]Oh yeah? Saying that you don't like them would be a lie and you know it~.[/say]")

			saynn("[say=artica]I.. I.. am a pawslut..[/say]")

			saynn("Wow, so bold.")

			saynn("[say=artica]I like the way t-they feel.. the s-softness.. the warmth.. I like the way they smell..[/say]")

			saynn("She swallows audibly.")

			saynn("[say=artica]I l-ll..love.. sucking on toes.. a-and.. licking paw pads.. a.and aa..ah..and.. having my cock stroked with hind paws..[/say]")

			if (isNaked):
				saynn("She swallows again.. and again.. but her mouth is still watering itself.."+str(" Her caged cock twitching in its tight little prison.." if isCaged else " Her cock getting out of the sheath and becoming erect fast..")+"")

			else:
				saynn("She swallows again.. and again.. but her mouth is still watering itself.."+str(" Something in her shorts is twitching.." if isCaged else " Her shorts bulging fast, there is wet spot on the cloth already..")+"")

			saynn("[say=artica]I-I'm a h-huge.. slut.. for paws.. b-being stepped on.. s-sucking.. licking.. ah.. p-please.. hh-hh..[/say]")

			saynn("You smile while Artica is panting softly..")

			saynn("[say=artica]Ah.. hh-h.. ah.. t-that's about it..[/say]")

			saynn("She said more than enough.")

		elif (theTopic == "preg"):
			saynn("[say=pc]You're glowing, Artica. Pregnancy looks good on you.[/say]")

			saynn("Her gaze directed down, towards her round belly.")

			saynn("[say=artica]T-thank you.. I'm so.. f-fertile.. R-ready to carry litter after l-litter..[/say]")

			saynn("You smile while she gently embraces herself.")

			saynn("[say=artica]I'm.. a l-little breeding bitch.. m-made to b-breed and c-carry pups.. and k-kittens.. a-and.. a-.. ah.. hah..[/say]")

			saynn("[say=pc]Little litter carrier.[/say]")

			saynn("Her eyes.. so lusty..")

			saynn("[say=artica]I-I want to carry all"+str(" your" if GM.pc.hasReachablePenis() else "")+" pups.. t-to be filled with"+str(" your" if GM.pc.hasReachablePenis() else "")+" seed.. again and again..[/say]")

			saynn("Her shy tongue is saying some very naughty things..")

			saynn("[say=artica]I'm such a.. a c-cum dumpster.. a c-cock sleeve.. breeding sow.. m-meat hole.. s-seed receptacle.. a slut pup..[/say]")

			saynn("Wow.. she can keep going and going.. and going..")

		elif (theTopic == "breed"):
			if (getCharacter("artica").isInHeat()):
				saynn("[say=pc]You're glowing today, Artica. Feeling that heat again?[/say]")

			else:
				saynn("[say=pc]You like being bred, don't you~?[/say]")

			saynn("Her tail is swishing behind her as you say that.")

			saynn("[say=artica]I.. y-yes.. I c-can't s-stop thinking a-about i-it..[/say]")

			saynn("[say=pc]About what?[/say]")

			saynn("She bites her lip.")

			saynn("[say=artica]A-about.. b-being b-bred.. About f-feeling"+str(" your" if GM.pc.hasReachablePenis() else "")+" cock inside me.. filling me up with seed..[/say]")

			saynn("The scent her fur gives off.. is so arousing right now.")

			saynn("[say=pc]You like that, don't you? Being filled up, feeling that warm cum flooding your pussy.[/say]")

			saynn("She nods eagerly.")

			saynn("[say=artica]I.. I.. I d-don't know.. I.. I t-think I love it.. I l-love b-being f-fucked by big cocks, f-feeling them stretch m-me wide.. r-ravanging m-my h-holes.. i-inflating my b-belly with that.. t-thick v-virile seed.. ahh-h..[/say]")

			if (isNaked):
				saynn("She is shivering, her "+str("caged up cock is pulsing wildly inside.. her pussy is so needy she is making the floor wet." if isCaged else "canine cock leaves its sheath and is pulsing wildly.. her pussy is so needy that she is making the floor wet.")+"")

			else:
				saynn("She is shivering, her "+str("caged up cock is pulsing wildly inside her shorts.. her pussy is so needy it's making a big wet spot on the cloth." if isCaged else "canine cock is pulsing wildly inside her shorts.. her pussy is so needy it's making a big wet spot on the cloth.")+"")

			saynn("[say=artica]I..I'm a.. a dirty c-cumslut.. A-.. ah.. b-breeding whore who craves c-cock.. w-who begs to b-be filled with cum.. I.I.. l-love b-being used.. fucked.. i-impregnated.. any way y-you want..[/say]")

			saynn("You smile while watching the poor needy fluff squirm.")

			saynn("[say=pc]Good girl.[/say]")

		saynn("Making her horny is so easy now, Artica's libido seems to be off the charts..")

		addButton("Continue", "See what happens next", "")
	if(state == "do_grope"):
		playAnimation(StageScene.Grope, "grope", {pc="artica", npc="pc", bodyState={hard=true}})
		var isPregnant = getCharacter("artica").isVisiblyPregnant()
		var acceptCaged = getFlag("ArticaModule.cagedAcceptStage", 0)
		if (isPregnant):
			saynn("Seeing Artica pregnant.. you just can't stop yourself from doing this first..")

			saynn("Without much warning, your hands"+str(" undo the buttons of her shirt and open it. They then" if !isNaked else "")+" land on her swollen tits and cup then, her dark cyan nips dribble milk even from just a small amount of pressure.")

			saynn("[say=artica]Ahh..[/say]")

			saynn("[say=pc]You have some juicy tits, Artica..[/say]")

			saynn("[say=artica]T-thanks.. t-they just.. you k-know.. from b-breeding.. Ahh-h~..[/say]")

			saynn("You squeeze her lactating tits firmly, causing many little squirts of breast milk! You really get her going, Artica is arching her back while lots of little rivers of milk start trailing down from her nips.")

			saynn("[say=pc]I know.[/say]")

			saynn("After that, your hands slide lower and land on her pregnant belly. Gently, you begin to rub it.")

			saynn("[say=pc]Enough to feed many pups.. Like the ones that you are carrying.[/say]")

			saynn("[say=artica]Nnhh-h.. ah.. y-yeah.. haha.. h-ah.. I'm s-such a.. puppy maker..[/say]")

		else:
			saynn("Without much warning, your hands"+str(" undo the buttons of her shirt and open it. They then" if !isNaked else "")+" land on Artica's {artica.breasts} and cup them, emphasizing their form."+str(" Some lonely drops of breast milk leak from her dark cyan nips as you do that.." if getCharacter("artica").canBeMilked() else "")+"")

			saynn("[say=artica]Eep..[/say]")

			saynn("She looks around, checking if anyone is looking while you're casually groping her tits.")

			saynn("[say=pc]Afraid that someone might see this? Or maybe.. you want to be seen?[/say]")

			saynn("One hand stays and teases her nips, playing with the fancy purple piercings that the girl has.. while another slides down along her belly.. tracing around the belly button.. before reaching around and suddenly pulling"+str(" her shorts down and yanking her tail high" if !isNaked else " on her tail")+", exposing Artica's fluffy ass to any random onlookers. Her tail tries to curl down.. but you keep it high and use your second hand to spread her ass, making sure Artica's tight asshole and"+str(" creamed dripping cunt" if getCharacter("artica").hasEffect(StatusEffect.HasCumInsideVagina) else "wet need cunt")+" are visible.")

			saynn("[say=artica]Ah!..[/say]")

			saynn("[say=pc]Don't like it? Why don't you bite me then?[/say]")

			saynn("[say=artica]Eep.. I-I know better t-than to bite..[/say]")

			if (isVerySlut):
				saynn("Random inmates walk past.. staring at Artica's holes. This makes her.. drip eagerly.. the fluff is squirming in your hands while you grope her ass.")

				saynn("[say=pc]Good slut.[/say]")

			else:
				saynn("Random inmates walk past.. staring at Artica's holes. This makes her lower her gaze and.. and just take their teasing looks.")

				saynn("[say=pc]Good girl.[/say]")

		if (!isCaged):
			if (isLusty):
				saynn("The fluff is blushing.. while her cock is peeking out more and more from its sheath. It's gotten quite hard from you teasing her so much..")

			else:
				saynn("The fluff is blushing.. while her hard cock is throbbing more and more. It feels like any touch can set it off now..")

		else:
			if (isLusty):
				saynn("The fluff is blushing.. while her cock is throbbing inside the chastity cage.. It feels like any touch can set it off, her cyan shaft putting an immense amount of pressure on the metal.")

			else:
				saynn("The fluff is blushing.. while her cock is trying more and more to get out of its sheath.. failing as the metal keeps forced inside with only the drippy tip peeking.")

			if (acceptCaged <= 1):
				saynn("[say=artica]T-the c-cage.. hh-hurts a bit.. m-maybe you s-should..[/say]")

				saynn("[say=pc]Are you telling me what to do?[/say]")

				saynn("[say=artica]N-nno.. of course n-not.. nhh.. gods..[/say]")

				saynn("You let go of her ass and cup her fluffy balls instead, gently squeezing.")

				saynn("[say=pc]This stays on until I say otherwise.[/say]")

				saynn("Maybe you should bring the fluff into your cell sometime and train her to be less reliant on her dick for pleasure..")

			elif (acceptCaged <= 2):
				saynn("[say=artica]T-the c-cage.. S-sits so tight..[/say]")

				saynn("[say=pc]Are you complaining? Think I should unlock you?[/say]")

				saynn("[say=artica]Nn-no.. Its f-for you to d-decide..[/say]")

				saynn("You let go of her ass and cup her fluffy balls instead, gently squeezing.")

				saynn("[say=pc]Good.[/say]")

				saynn("She looks like she needs slightly more training to rely less on her dick.")

			else:
				saynn("[say=artica]M-my useless-s.. c-cock.. ah..[/say]")

				saynn("[say=pc]It is, indeed.[/say]")

				saynn("[say=artica]I'm.. a f-fucktoy.. nh-h..[/say]")

		saynn("You've gotten the fluff pent up in seconds.. good..")

		addButton("Continue", "See what happens next", "")
func getDebugActions():
	return [
	{
	"id": "setCorruption",
	"name": "Set Corruption",
	"args": [
	 {
	 "id": "corruption",
	 "name": "How much (0-100)",
	 "type": "number",
	 "value": 100,
	 },
	],
	},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "setCorruption"):
		setFlag("ArticaModule.corruption", clamp(_args["corruption"]/100.0, 0.0, 1.0))
		corruption = getModule("ArticaModule").getCorruption()


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sex_breed"):
		endScene()
		runScene("articaSexBreedScene")
		return

	if(_action == "sex_ride"):
		endScene()
		runScene("articaSexRideScene")
		return

	if(_action == "sex_pawjob"):
		endScene()
		runScene("articaSexPawjobScene")
		return

	if(_action == "sex_ropes"):
		endScene()
		runScene("articaSexRopesScene")
		return

	if(_action == "sex_mutualpawjob"):
		endScene()
		runScene("articaSexMutualPawjobScene")
		return

	if(_action == "sex_hypnovisorfun"):
		endScene()
		runScene("articaSexHypnovisorScene")
		return

	if(_action == "do_tease_canteen"):
		runScene("articaCanteenTeaseScene")
		endScene()
		return

	if(_action == "do_tease_cell"):
		runScene("articaCellTeaseScene")
		endScene()
		return

	if(_action == "do_grope"):
		processTime(2*60)
		getModule("ArticaModule").makeLusty()

	if(_action == "do_dirtylanguage"):
		processTime(2*60)
		getModule("ArticaModule").makeLusty()

	setState(_action)

func saveData():
	var data = .saveData()

	data["corruption"] = corruption
	data["isNaked"] = isNaked
	data["isCaged"] = isCaged
	data["isSlut"] = isSlut
	data["isVerySlut"] = isVerySlut
	data["isLusty"] = isLusty
	data["nakedAndShy"] = nakedAndShy

	return data

func loadData(data):
	.loadData(data)

	corruption = SAVE.loadVar(data, "corruption", 0.0)
	isNaked = SAVE.loadVar(data, "isNaked", false)
	isCaged = SAVE.loadVar(data, "isCaged", false)
	isSlut = SAVE.loadVar(data, "isSlut", false)
	isVerySlut = SAVE.loadVar(data, "isVerySlut", false)
	isLusty = SAVE.loadVar(data, "isLusty", false)
	nakedAndShy = SAVE.loadVar(data, "nakedAndShy", false)
