extends "res://Modules/HypnokinkModule/Scenes/Sessions/HK_SessionBodyBase.gd"

func _init():
	sceneID = HK_Sessions.BodyDodgeBuff
	
func _initScene(_args = []):
	onBody()

func _run():
	if(state == ""):
		addCharacter("vion")
		playAnimation(StageScene.Duo, "sit", {npc="vion", npcAction="sit"})
		
		saynn("[say=vion]Focus on your legs for me. Flex your toes.[/say]")

		saynn("You slowly wiggle your toes.")

		saynn("[say=vion]Tense your legs. Lock them in place, as rigid as steel. Don't curl up, just tense in place.[/say]")

		saynn("You tense the muscles in your legs. Like forcing a spring to coil up.")

		saynn("[say=vion]Tense even more, until its almost painful. Now hold it. Feel that tension.[/say]")

		saynn("[say=vion]You carry some of this tension with you all day, every day. You don't even notice its there. But when you bring it to the surface like this...[/say]")

		saynn("Your legs almost feel like they're vibrating. Your toes curl. The tension builds, and builds...")

		saynn("[say=vion]Now... Release all of it. Let it dissolve and fade away.[/say]")

		saynn("Your legs relax more than you ever thought possible as the tension dissipates in an instant, and is replaced by a fuzzy, pleasant numbness.")

		saynn("[say=vion]Good. Isn't that better? Now the same with your arms. Tense them up. Ball your hands into fists. Tighter.[/say]")

		saynn("You squeeze hard. Your hands shake as if you were struggling against invisible restraints.")

		saynn("[say=vion]Build it up. Put as much effort into holding still as you can.[/say]")

		saynn("Your jaw tightens. Twitches and tremors travel up your arms, along your shoulders and down your back.")

		saynn("[say=vion]And... release. Let it all flow out.[/say]")

		saynn("Your arms drop by your side, suddenly relaxed and light as a feather. You sigh as tension weren't even aware of leaves your body.")

		saynn("[say=vion]Perfect.[/say]")

		saynn("[say=vion]Feel how limber your body can be, how effortless it can be to flex and stretch...[/say]")
		
		addButton("Continue", "", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		afterBody()
		GM.pc.addTimedBuffs([buff(Buff.DodgeChanceBuff, [6 if betterBuffs() else 4])], 60 * 60 * 4 * buffDurationMultiplier())
		return

	setState(_action)
