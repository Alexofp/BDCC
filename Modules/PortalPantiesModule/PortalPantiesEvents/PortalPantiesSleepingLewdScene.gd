extends "res://Scenes/SceneBase.gd"

var npcID = ""

func _init():
	sceneID = "PortalPantiesSleepingLewdScene"

func _reactInit():
	GM.pc.addCredits(1)

func _run():
	if(state == ""):
		saynn("You were still sleeping in your cell, enjoying the empty pointless dreams that your mind produces. Little stories that are composed out of familiar elements that seem so meaningless together.")

		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("Oh, but this dream seems particularly interesting. Quite lewd too, someone’s hand is reaching down for your crotch and gives your pussy slit a rub, making you quite wet.")

			saynn("Then the hand gets pulled away, replaced with a dick that brushes against your sex. You begin to wonder if it's still a dream even, the sensations are quite real.")

		# (if no pussy)
		else:
			saynn("Oh, but this dream seems particularly interesting. Quite lewd too, someone’s hand is reaching down for your butt and gives your tailhole a rub, making you quite eager.")

			saynn("Then the hand gets pulled away, replaced with a dick that brushes against your pucker. You begin to wonder if it's still a dream even, the sensations are quite real.")

		addButton("Keep sleeping", "Whatever, you just want your rest", "keep_sleeping")
		addButton("Wake up!", "That shouldn’t be happening", "wake_up!")


	if(state == "keep_sleeping"):
		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("You try to really immerse yourself into that dream and push away the awakening. Dream-you spreads {pc.his} legs more for that cock and lets it spread your {pc.pussyStretch} pussy wide before entering it.")

			saynn("This surreal experience feels so good to you, little passionate moans escape from your lips as the cock starts fucking you in a dream. While the other you is squirming around in {pc.his} bed, reaching for the portal panties. Such a nice dream.")

			saynn("You feel the intruding dream cock approaching its peak, the thrusts become fast and powerful. You both get shoved over the peak and climax. More little sleepy moans escape from you while the cock starts shooting its load deep into your womb.")

		# (if no pussy)
		else:
			saynn("You try to really immerse yourself into that dream and push away the awakening. Dream-you spreads {pc.his} legs more for that cock and lets it prod at your {pc.analStretch} ring before stretching it wide and sliding in.")

			saynn("This surreal experience feels so good to you, little passionate moans escape from your lips as the cock starts fucking you in a dream. While the other you is squirming around in {pc.his} bed, reaching for the portal panties. Such a nice dream.")

			saynn("You feel the intruding dream cock approaching its peak, the thrusts become fast and powerful. You both get shoved over the peak and climax. More little sleepy moans escape from you while the cock starts shooting its load deep inside you.")

		addButton("Wake up", "That was a nice dream", "wake_up")

	if(state == "wake_up"):
		saynn("When the dream is over, you open your eyes and sit down, still panting from the magical experience. Strange thoughts start going through your head, you reach down for your crotch but only find the portal panties there.")

		saynn(RNG.pick([
			"[say=pc]Was I?..[/say]",
			"[say=pc]Was that..[/say]",
		]))
		
		addButton("Continue", "Wet dreams", "endthescene")


	if(state == "wake_up!"):
		playAnimation(StageScene.SexAllFours, RNG.pick(["sex", "fast", "sexflop", "fastflop"]), {onlySub=true, npc="pc", npcBodyState={naked=true}})
		
		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("You open your eyes and realize that nothing of it was a dream, you indeed feel a cock rubbing against your pussy through the portal panties before suddenly penetrating your sex!")

			saynn("You try to get up but the rough thrusts pin you to the bed. You turn around and get on all fours, moaning while someone’s cock pounds your slit hard, making you shift forward each time.")

			saynn(RNG.pick([
				"[say=pc]Fuck..[/say]",
				"[say=pc]So rough..[/say]",
			]))

			saynn("It doesn’t take long before the orgasm overwhelms your body, little shivers in your limbs cause your top part of the body to flop onto the bed while your {pc.thick} butt gets sticked out more. You moan into the pillow as the cock thrusts harder, powering through your clenching before cumming too and stuffing your pussy full of cum!")

		# (if no pussy)
		else:
			saynn("You open your eyes and realize that nothing of it was a dream, you indeed feel a cock rubbing against your tailhole through the portal panties before suddenly penetrating your ass!")

			saynn("You try to get up but the rough thrusts pin you to the bed. You turn around and get on all fours, moaning while someone’s cock pounds your fuckhole hard, making you shift forward each time.")

			saynn(RNG.pick([
				"[say=pc]Fuck..[/say]",
				"[say=pc]So rough..[/say]",
			]))

			saynn("It doesn’t take long before the orgasm overwhelms your body, little shivers in your limbs cause your top part of the body to flop onto the bed while your {pc.thick} butt gets sticked out more. You moan into the pillow as the cock thrusts harder, powering through your clenching before cumming too and stuffing your ass full of cum!")

		addButton("Continue", "Can't even sleep without getting used", "endthescene")

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _react(_action: String, _args):
	if(_action in ["keep_sleeping", "wake_up!"]):
		var pickedInmate = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true})
		if(pickedInmate == "" || pickedInmate == null):
			pickedInmate = "inmateMaleCanine"
		npcID = pickedInmate
		
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy(pickedInmate)
			GM.pc.cummedInVaginaBy(pickedInmate)
		else:
			GM.pc.gotAnusFuckedBy(pickedInmate)
			GM.pc.cummedInAnusBy(pickedInmate)
		GM.pc.orgasmFrom(pickedInmate)
	
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
