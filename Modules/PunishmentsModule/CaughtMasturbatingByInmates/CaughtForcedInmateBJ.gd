extends "res://Scenes/SceneBase.gd"

var brokeClothes = false

func _init():
	sceneID = "CaughtForcedInmateBJ"

func _run():
	if(state == ""):
		addCharacter("inmateMale")
		playAnimation(StageScene.Solo, "stand")
		#playAnimation(StageScene.Duo, "stand", {npc="inmateMale"})

	if(state == ""):
		saynn("You feel somebody approaching you from behind. It was too late though, he unceremoniously grabs you by the hair by the hair and pulls you down onto your knees before shoving his knotted cock into your face. His grasp is pretty painful, you wince and let out an annoyed noise.")

		saynn("[say=inmateMale]Quit whining and open your fucking mouth already.[/say]")

		saynn("You can’t even get a good look of his face as he starts using you as some kind of whore, roughly shoving your face into his balls while the knotted shaft leaks precum onto your hair.")

		saynn("When you try to complain or escape he only slaps your face and pulls you towards his cock again, it seems he doesn’t mind being rough with you.")

		saynn("[say=inmateMale]Quit resisting, no one will save you.[/say]")

		addButton("Open mouth", "Let him use your throat willingly", "open_mouth")
		addButtonWithChecks("Shove away", "Use your strength to overpower him", "shove_away", [], [ButtonChecks.HasStamina, [ButtonChecks.StatCheck, Stat.Strength, 6]])
		addButton("Resist", "(noncon, possible drug use) You’re not gonna be willing", "resist")


	if(state == "open_mouth"):
		saynn("You close your eyes and obey, lowering your resistance. As soon as you part your lips, you feel him shoving his canine cock past your teeth and down your throat, the guy clearly knows what he wants. You try to gasp but instead only choke on his shaft, the inmate gets a better grip on your hair before proceeding to fuck your face, shoving his dick in and out of your {pc.throatStretch} throat, stretching it out.")

		saynn("[say=pc]Gh-.. h.. mh..[/say]")

		saynn("[say=inmateMale]Yeah, whore, gag more, it feels fucking great.[/say]")

		saynn("It’s not like you have a choice, each time you try to breathe you feel your gag reflex triggering, causing you to make wet noises while your throat clenches around his shaft. Your blow job is sloppy but he seems to love it, the guy eagerly humps your face, bringing his peak closer. You might be getting used to it..")

		addButton("Cum", "Oh no, he is gonna cum", "cum")

	if(state == "cum"):
		saynn("The guy throws his head back and shoves his cock as deep as your throat allows, his knot is applying a great amount of pressure on your lips but that wasn’t enough to knot you. You spend a few seconds being his total cock slave before he suddenly starts to grunt and shooting his load directly down your throat.")

		saynn("It’s just too much, his cock steals your ability to breathe or even moan, your throat gets tighter around that shaft, milking it for all its cum.")

		saynn("As he starts to pull out, the last strings of his cum land into your opened mouth and onto your face, leaving quite a fancy mess. You’re forced to wear his facials and have a constant taste of his cock now.")

		saynn("[say=inmateMale]Yeah, swallow it all, bitch.[/say]")

		saynn("And just like that, he lets go of your hair and puts his cock away before leaving you alone.")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")


	if(state == "shove_away"):
		# (requires strength 6+, maybe stamina too)

		saynn("You manage to get a grasp on his fingers and pry them off one by one before shoving the guy away. He growls but doesn’t go further with you, instead showing off his sharp fangs before putting his cock away.")

		saynn("[say=inmateMale]Well go fuck yourself then.[/say]")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")



	if(state == "resist"):
		# (should be a few scenes probably? One where he uses some drug and fucks you anyway. One where he chokes you until you give up.)

		# (drug variant)

		saynn("The idea of having your throat fucked just like that doesn’t seem very appealing, you try back off and endure the pain of having your hair pulled. The guy snarls and grabs you by the chin, forcing you to look at him.")

		saynn("[say=inmateMale]What, you thought you could just get me hard and escape? Fine.[/say]")

		saynn("He produces a suspicious-looking blue pill, the sort you would see in the medical. You quickly realize what his intentions are and keep your mouth shut tight, grinding your teeth as he yanks you back towards him.")

		saynn("[say=inmateMale]Gonna play hard to get, whore? You have been quite eager before I grabbed you, what happened bitch? Let’s see how long you can last.[/say]")

		saynn("He has an edge in strength and position over you, all that you can do is try to get up, pull his hand away from your hair and break free while he tries to forcefully slip the pill between your lips. You don’t give up that easily though so he tries something special.")

		saynn("The guy suddenly stops trying to shove the pill in and instead covers your face with his palm, his digits are keeping your nostrils shut, preventing you from breathing through them. So simple. But it works, you really struggle to get enough air, your muscles are all tensed up, burning through the remaining oxygen left in your blood.")

		addButton("Get drugged", "Open your mouth and avoid getting choked", "get_drugged")
		addButton("Pass out", "You’re not gonna let him drug you no matter what", "pass_out")

	if(state == "pass_out"):
		saynn("You shake your head a lot, trying to escape the palm blocking your only source of air but it's useless. Your body tries to force you to breathe in but all you can do is gasp silently with your mouth shut. Quite quickly the corners of your vision begin to darken, your body starts to give up.. But at least you’re not gonna get drugged willingly.")

		saynn("The last thing that you hear is the inmate growling and then a sound of you hitting the cold floor. Sweet dreams, sleepyhead.")

		addButton("Sleep", "Sweet dreams", "sleep")

	if(state == "sleep"):
		# (sets time to night, breaks clothes)

		saynn("Your head hurts, ow. You open your eyes and get your cheek off the cold dirty floor. You slowly get up and check your mouth for any foreign substances but find nothing, it seems you lucked out.")

		# (if wearing uniform and it got borked)
		if(brokeClothes):
			saynn("You look down at your clothes and find that they endured lots of damage, they don't even cover you as much anymore. Oh well.")

		saynn("You hold onto your head and rub it while looking around. The place is empty. Time to go.")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")

	if(state == "get_drugged"):
		saynn("Fuck it, you don’t care anymore, you part a lips a little bit to catch some air but the guy notices that and swiftly squeezes the pill between your teeth. Even without swallowing it, you feel it basically melting on your tongue. Oooh…")

		saynn("Your body begins to feel very warm, especially near your crotch. Rubbing yourself feels so-o-o good.. The pain is still there but the other sensations are so overwhelming..")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Even though your hair is being pulled, your {pc.cock} is trying to get hard and is already leaking pre.")
		elif(GM.pc.hasPenis()):
			saynn("Even though your hair is being pulled, your {pc.cock} is getting hard and already leaking pre.")

		# (if has vagina)
		if(GM.pc.hasVagina()):
			saynn("Your slit gets wet and needy, that cock in front of your face suddenly doesn’t look so scary..")

		saynn("People around are watching but you can’t help but to let out a passionate moan and stick your tongue out before giving that knotted cock a lick over its whole length, catching the precum that's hanging from its tip.")

		saynn("[say=inmateMale]Much better. Now open up, slut.[/say]")

		addButton("Open mouth", "Let him use your throat willingly", "open_mouth_drugged")

	if(state == "open_mouth_drugged"):
		saynn("You keep your eyes on his veiny member and obey. As soon as you part your lips, you feel him shoving his canine cock past your teeth and deep down your mouth, the guy clearly knows what he wants. But you welcome that cock, you willingly start sucking it off, sliding your head onto it more, inviting it to fuck your throat. It quickly becomes too much though, you choke and gag but that only makes him more eager, the inmate gets a better grip on your hair before proceeding to fuck your face, shoving his dick in and out of your {pc.throatStretch} throat, stretching it out.")

		saynn("[say=pc]Gh-.. h.. mh..[/say]")

		saynn("[say=inmateMale]Yeah, whore, gag more, it feels fucking great.[/say]")

		saynn("It’s not like you have a choice, each time you try to breathe you feel your gag reflex triggering, causing you to make wet noises while your throat clenches around his shaft. Your blow job is sloppy but he seems to love it, the guy eagerly humps your face, bringing his peak closer. You love it too, the drug makes you so aroused that you don’t care about your throat being violated in such a rough way, you even feel like you might cum like that..")

		addButton("Cum", "Oh no, he is gonna cum", "cumDrugged")

	if(state == "cumDrugged"):
		saynn("The guy throws his head back and shoves his cock as deep as your throat allows, his knot is applying a great amount of pressure on your lips. Eager to fit his whole dick inside, you open your mouth as wide as your jaw allows before his meaty orb suddenly slips inside. He knots your mouth! You spend a few seconds being his total cock slave as he grunts and swiftly gets thrown over the edge, shooting his load directly down your throat.")

		saynn("It’s just too much, his cock steals your ability to breathe or even moan, your throat gets tighter around that shaft, milking it for all its cum. You try to force out some muffled moans but can’t, your own orgasm overtakes your body out of nowhere, you cum without even being stimulated!")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("You, flexing your kegel muscles too much, resulted in your {pc.cock} wasting its load! Even if it was a ruined orgasm, it felt so good.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Your slit squirts the female juices all over the floor, who knew you could cum from giving a blow job.")

		saynn("As he starts to pull out, the last strings of his cum land into your opened mouth and onto your face, leaving quite a fancy mess. You’re forced to wear his facials and have a constant taste of his cock now. But wow it was worth it, you swallow everything you can get to and then offer the guy a view of your empty mouth.")

		saynn("[say=inmateMale]Yeah, good bitch.[/say]")

		saynn("And just like that, he puts his cock away before leaving you alone with the afterglow of the drug.")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")


func _react(_action: String, _args):

	if(_action == "sleep"):
		GM.main.processTimeUntil(23*60*60)
		
		if(GM.pc.canDamageClothes()):
			GM.pc.damageClothes()
			brokeClothes = true

	if(_action == "get_drugged"):
		GM.pc.addIntoxication(0.7)
		GM.pc.addLust(100)

	if(_action in ["cum", "cumDrugged"]):
		processTime(60*6)
		GM.pc.gotThroatFuckedBy("inmateMale")
		GM.pc.cummedInMouthBy("inmateMale")
		GM.pc.cummedOnBy("inmateMale")
		if(_action == "cumDrugged"):
			GM.pc.orgasmFrom("inmateMale")
			
			if(RNG.chance(50)):
				var zone = BodyWritingsZone.getRandomZone()
				GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
				addMessage("He also left a memento on your "+BodyWritingsZone.getZoneVisibleName(zone)+"..")
		GM.pc.addSkillExperience(Skill.SexSlave, 10, "caught_inmate_forcedbj")
		
	if(_action == "shove_away"):
		processTime(60*1)
		GM.pc.addStamina(-20)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["brokeClothes"] = brokeClothes
	
	return data
	
func loadData(data):
	.loadData(data)
	
	brokeClothes = SAVE.loadVar(data, "brokeClothes", false)
