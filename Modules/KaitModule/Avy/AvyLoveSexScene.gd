extends SceneBase

func _init():
	sceneID = "AvyLoveSexScene"

func _run():
	if(state == ""):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("You bite your lip softly while sneakily watching Avy's bulging shorts.")

		saynn("She catches your obvious stare and hums.")

		saynn("[say=avy]Hm. Looking for trouble?[/say]")

		saynn("You return eye contact and smile.")

		saynn("[say=pc]Maybe. Are you offering?[/say]")

		saynn("The foxy leans closer, she puts her list away and boldly caresses your hip.")

		saynn("[say=avy]More than you can handle.[/say]")

		saynn("You reach your hand out too.. but to feel her bulge instead.")

		saynn("[say=pc]I can handle a lot..[/say]")

		saynn("Avy turns her gaze down at your hand.. and then puts on a wide smile.")

		addButton("Continue", "See what happens next", "bj")
	if(state == "bj"):
		playAnimation(StageScene.ChairOral, "suckfast", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		aimCameraAndSetLocName("hideout_chill")
		saynn("Next moment you know, you're on your knees, sucking Avy's knotted cock. Your throat is making wet noises as she is forcing you deeper onto her shaft.. until your snout hits her crotch. Her knot isn't inflated enough to stop you.")

		saynn("[say=avy]Grhh..[/say]")

		saynn("Lonely tears stream down your cheeks as you're deepthroating that cock, bobbing your head, testing your own gag reflex.")

		saynn("[say=avy]I'm ready.[/say]")

		saynn("You got her quite worked up already. As you pull her cock from your mouth, a string of saliva is left hanging between your tongue and the red tip..")

		addButtonWithChecks("Offer pussy", "Let Avy fuck your pussy!", "pussy_fuck", [], [[ButtonChecks.HasReachableVagina]])
	if(state == "pussy_fuck"):
		playAnimation(StageScene.SexMatingPress, "inside", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Avy grabs your hips and pins you into the floor, your legs spreading wide for her. She looms over you, her blue eyes burning.")

		saynn("[say=pc]Fuck my pussy-..[/say]")

		saynn("She cuts you off with a growl and a single thrust of her cock down your wet slit. All the way in. You cry out against her, your nails digging into her shoulders as your pussy gets stretched wide already.")

		saynn("[say=pc]F-fuck..[/say]")

		saynn("[say=avy]Tight little cunt.[/say]")

		saynn("She pulls back.. only to slam forward again. Hard and fast. Again and again.")

		saynn("Her hips start to piston wildly, driving her hard cock into you. The room fills with wet slaps and your joined grunts. She really puts all her weight into it, her knot inflating and now pushing on your folds.")

		saynn("You're clenching hard around her, your inner walls gripping her shaft while she keeps pounding it.")

		saynn("She laughs between all the shared panting.")

		saynn("[say=avy]Told you.. can't handle me..[/say]")

		saynn("[say=pc]Go as hard as you can.. mhh.. fucking break me..[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "bj"):
		processTime(3*60)
		GM.pc.gotThroatFuckedBy("avy")

	setState(_action)
