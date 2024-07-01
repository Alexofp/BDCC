extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "PortalPantiesShowerLewdScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.SexStanding, RNG.pick(["sex", "fast"]), {onlySub=true, npc="pc", npcBodyState={naked=true}})
		
		saynn("You’re wearing portal panties even while taking a shower, hopefully that won’t break them.")

		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("But that’s not the thing that you should worry about, a bigger problem arises when you suddenly feel your pussy being fingered by someone. Unknown digits are spreading your folds wide and start hammering at your g-spot, forcing moans out of you.")

			saynn(RNG.pick([
				"[say=pc]H-hey..[/say]",
				"[say=pc]Not n-now..[/say]",
			]))

			saynn("You’re so exposed, can’t even cover your pussy while forced to endure the constant pleasure. You bend forward and hold onto the cold wall while the shower washes over your back, more moans escape from you.")

		# (if no pussy)
		else:
			saynn("But that’s not the thing that you should worry about, a bigger problem arises when you suddenly feel your tailhole being fingered by someone. Unknown digits are spreading your ring wide and start hammering at your pleasure spot, forcing moans out of you.")
			
			saynn(RNG.pick([
				"[say=pc]H-hey..[/say]",
				"[say=pc]Not n-now..[/say]",
			]))

			saynn("You’re so exposed, can’t even cover your ass while forced to endure the constant pleasure. You bend forward and hold onto the cold wall while the shower washes over your back, more moans escape from you.")

		addButton("Cum", "Can’t push it away any longer", "cum")

	if(state == "cum"):
		playAnimation(StageScene.SexStanding, RNG.pick(["inside", "fast"]), {onlySub=true, npc="pc", npcBodyState={naked=true}})
		
		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("There is simply too much stimulation, the fingers keep fucking your slit until it starts pulsating and twitching around them and also showring them in your juices.")

		# (if no pussy)
		else:
			saynn("There is simply too much stimulation, the fingers keep fucking your tailhole until it starts pulsating and twitching around them.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Wherever your cock is, you hope it didn’t attract much attention because the climax made you waste a load and probably make a mess around.")

		saynn("The fingers push you through the orgasm and then just leave you alone, letting you catch your breath and finish showering.")

		# (scene ends)
		addButton("Continue", "Even she showers aren't safe", "endthescene")


func _react(_action: String, _args):
	if(_action in ["cum"]):
		var pickedInmate = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true})
		if(pickedInmate == "" || pickedInmate == null):
			pickedInmate = "inmateMaleCanine"

		GM.pc.orgasmFrom(pickedInmate)
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

