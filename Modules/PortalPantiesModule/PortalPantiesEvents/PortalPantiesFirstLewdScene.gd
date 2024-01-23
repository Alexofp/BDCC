extends "res://Scenes/SceneBase.gd"

var npcID = ""

func _init():
	sceneID = "PortalPantiesFirstLewdScene"

func _reactInit():
	GM.pc.addCredits(1)
	npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.Species, Species.Canine], [NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.Species: Species.Canine, NpcGen.HasPenis: true, NpcGen.NoChastity: true})
	if(npcID == null || npcID == ""):
		npcID = "inmateMaleCanine"
	GM.main.updateCharacterUntilNow(npcID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		playAnimation(StageScene.SexPortal, "tease", {pc=npcID, npc="pc", bodyState={exposedCrotch=true,hard=true}})
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You were going somewhere when you suddenly felt some activity in your panties. Someone’s breathing warmly over your pussy which makes it react by twitching ever so slightly and getting moist.")

			saynn("[say=pc]Oh, again so soon..[/say]")

			saynn("It doesn’t stop there, you feel their digits spreading your sensitive petals and getting shoved inside, causing you to stop doing what you are doing and grab onto your crotch.")

			saynn("[say=pc]Hey..[/say]")

			saynn("They are very rough with your slit, fingering it and hammering at your pleasure point until you start moaning quietly.")

			saynn("[say=pc]T-That’s not supposed to happen..[/say]")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your {pc.cock} is hard as a rock but it seems nobody cares about it at the moment, they just want your pussy.")

			saynn("They keep fingering you for a while until you get all wet and needy.")

		# (if no pussy)
		else:
			saynn("You were going somewhere when you suddenly felt some activity in your panties. Someone’s breathing warmly over your tailhole which makes it react by clenching ever so slightly.")

			saynn("[say=pc]Oh, again so soon..[/say]")

			saynn("It doesn’t stop there, you feel their wet digits prodding at your star and then getting shoved inside, causing you to stop doing what you are doing and grab onto your crotch.")

			saynn("[say=pc]Hey..[/say]")

			saynn("They are very rough with your butt, fingering it and hammering at your pleasure point until you start moaning quietly. At least the digits seem to be coated with lube..")

			saynn("[say=pc]T-That’s not supposed to happen..[/say]")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your {pc.cock} is hard as a rock but it seems nobody cares about it at the moment, they just want your ass.")

			saynn("They keep fingering you for a while until you get all lubed up and needy.")
		
		addButton("Continue", "See what happens next", "inside")


	if(state == "inside"):
		playAnimation(StageScene.SexPortal, "inside", {pc=npcID, npc="pc", bodyState={exposedCrotch=true,hard=true}})
		
		if(GM.pc.hasVagina()):
			saynn("But the digits are eventually retracted out of your slit, letting you calm down somewhat. But not for long, now you feel some kind of fleshy object brushing against your folds. Is that a.. cock?")

			saynn("There is no way it’s not, you gasp as you feel it finding your {pc.pussyStretch} pussy hole and stretching it wide open with ease. The cock gets shoved deeper inside, your belly even shows the outline, it's clearly a canine one. And it’s fucking your pussy..")
		else:
			saynn("But the digits are eventually retracted out of your {pc.thick} butt, letting you calm down somewhat. But not for long, now you feel some kind of fleshy object brushing against your star. Is that a.. cock?")

			saynn("There is no way it’s not, you gasp as you feel it prodding at your {pc.analStretch} fuckhole and stretching it wide open with ease. The cock gets shoved deeper inside, your belly even shows the outline, it's clearly a canine one. And it’s fucking you in the ass..")

		
		addButton("Resist", "That wasn’t supposed to happen", "resist")
		addButton("Enjoy", "Might as well try to get some pleasure out of this", "enjoy")

	if(state == "resist"):
		playAnimation(StageScene.SexPortal, "sex", {pc=npcID, npc="pc", bodyState={exposedCrotch=true,hard=true}})
		
		# (You try to struggle, try to take off the panties but fail)

		# (They cum inside you, make you cum)

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("That doesn’t seem like one of the tests, you didn’t agree to being fucked by someone you can’t even see! You gasp and cover your mouth as the cock starts pounding your pussy rough and fast, treating it like a fuckhole. You really hope nobody can see the outline of a cock sliding up and down across your belly or hear your muffled noises as you try to supress the moans.")

			saynn("Your free hand grabs onto the portal panties and desperately tries to take them off. Even if you tear the fabric off that will just reveal the portal devices which won’t help you at all. Fuck.")

			saynn("You try closing your legs, you try spreading them instead, even clenching just seems to make the cock fuck you more eagerly. More little noises of pleasure are forced out of you as the cock is trying to knot your pussy.")

			saynn("[say=pc]Please no..[/say]")

			saynn("They can’t hear you, all they see is a wet little pussy on a fleshlight that is so easy to fuck. A few rough thrusts and the knot slips past your folds, making so the whole cock is now inside you. That was too much, you are producing a loud moan which catches the attention of anyone who is nearby. You’re trying to make the fact that you’re cumming not too obvious but you think you failed. You put a hand on your belly and feel it.. inflating.. with cum? Yeah, somebody just came inside you.")

		# (if no pussy)
		else:
			saynn("That doesn’t seem like one of the tests, you didn’t agree to being fucked by someone you can’t even see! You gasp and cover your mouth as the cock starts pounding your tailhole rough and fast, treating it like some fuckhole. You really hope nobody can see the outline of a cock sliding up and down across your belly or hear your muffled noises as you try to supress the moans.")

			saynn("Your free hand grabs onto the portal panties and desperately tries to take them off. Even if you tear the fabric off that will just reveal the portal devices which won’t help you at all. Fuck.")

			saynn("You try closing your legs, you try spreading them instead, even clenching just seems to make the cock fuck you more eagerly. More little noises of pleasure are forced out of you as the cock is trying to knot your ass.")

			saynn("[say=pc]Please no..[/say]")

			saynn("They can’t hear you, all they see is a little {pc.analStretch} butthole on a fleshlight that is so easy to fuck. A few rough thrusts and the knot slips in, making so the whole cock is now inside you. That was too much, you are producing a loud moan which catches the attention of anyone who is nearby. You’re trying to make the fact that you’re cumming not too obvious but you think you failed. You put a hand on your belly and feel it.. inflating.. with cum? Yeah, somebody just came inside you.")

		addButton("Continue", "What now", "continue")

	if(state == "enjoy"):
		playAnimation(StageScene.SexPortal, "sex", {pc=npcID, npc="pc", bodyState={exposedCrotch=true,hard=true}})
		# (You don’t struggle and just hold against something while getting railed)

		# (They cum inside you, make you cum)

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You bite your lip and whisper lewdly to yourself, your eyes fill with lust.")

			saynn("[say=pc]Finally they’re doing something fun with my holes~.[/say]")

			saynn("That doesn’t seem like one of the tests but you don’t even care, you bend forward and hold onto the nearest wall as the cock starts pounding your pussy rough and fast, treating it like a fuckhole. The visible outline of a cock is sliding up and down on your belly, you really hope they won’t stop now.")

			saynn("These are the best panties ever, you moan and squirm like a slut. The canine cock is ravaging your slit and is now trying to shove its knot inside too. You’re not sure if it's gonna fit, your pussy is clenching around the intruding shaft, trying to milk it.")

			saynn("[say=pc]Yes.. please.. knot this slutty pussy.[/say]")

			saynn("The thrusts become more swift, each time the knot is stretching your folds more until suddenly slipping past them and sliding inside, making so the whole cock is now in. That makes you cum instantly, you throw your head back and moan passionately while the cock starts stuffing your womb with more and more cum, causing your belly to look more bumpy.")

			saynn("[say=pc]Yes-s-s~..[/say]")

			saynn("Who cares if somebody hears your moans, you just got fucked through a portal! And the best part is that you don’t have to clean anything, there is zero mess on your side.")

		# (if no pussy)
		else:
			saynn("You bite your lip and whisper lewdly to yourself, your eyes fill with lust.")

			saynn("[say=pc]Finally they’re doing something fun with my holes~.[/say]")

			saynn("That doesn’t seem like one of the tests but you don’t even care, you bend forward and hold onto the nearest wall as the cock starts pounding your butt rough and fast, treating it like a fuckhole. The visible outline of a cock is sliding up and down on your belly, you really hope they won’t stop now.")

			saynn("These are the best panties ever, you moan and squirm like a slut. The canine cock is ravaging your star and is now trying to shove its knot inside too. You’re not sure if it's gonna fit, your tailhole is clenching around the intruding shaft, trying to milk it.")

			saynn("[say=pc]Yes.. please.. knot this slut.[/say]")

			saynn("The thrusts become more swift, each time the knot is stretching your {pc.analStretch} anus more until suddenly slipping past it and sliding inside, making so the whole cock is now in. That makes you cum instantly, you throw your head back and moan passionately while the cock starts stuffing your ass with more and more cum, causing your belly to look more bumpy.")

			saynn("[say=pc]Yes-s-s~..[/say]")

			saynn("Who cares if somebody hears your moans, you just got fucked through a portal! And the best part is that you don’t have to clean anything, there is zero mess on your side.")

		addButton("Continue", "What now", "continue")

	if(state == "continue"):
		playAnimation(StageScene.SexPortal, "tease", {pc=npcID, npc="pc", bodyState={exposedCrotch=true,hard=true}})
		
		saynn("You pant and try to calm down. A few minutes pass, allowing you to gather your thoughts.")

		saynn("The engineer told you that this wouldn’t happen, they were supposed to only do tests. You feel like you gotta talk with him. Because you feel like this is not gonna stop..")

		# (You reflect and decide that this isn’t normal)

		# (From now on you’re getting fucked randomly)

		# (scene ends)
		addButton("Continue", "The heck", "endthescene")


func _react(_action: String, _args):
	if(_action in ["resist", "enjoy"]):
		var pickedInmate = npcID
		
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy(pickedInmate)
			GM.pc.cummedInVaginaBy(pickedInmate)
		else:
			GM.pc.gotAnusFuckedBy(pickedInmate)
			GM.pc.cummedInAnusBy(pickedInmate)
		
		GM.pc.orgasmFrom(pickedInmate)
		GM.pc.addSkillExperience(Skill.SexSlave, 10, "portalpanties_firstsex")
		
	if(_action == "continue"):
		addMessage("Task was updated")
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "inmateMaleCanine")
