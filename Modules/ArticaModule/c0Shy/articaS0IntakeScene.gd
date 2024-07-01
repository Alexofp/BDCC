extends SceneBase

func _init():
	sceneID = "articaS0IntakeScene"

func _run():
	if(state == ""):
		saynn("While wandering around the station, your ears pick up on a small talk between the two inmates.")

		saynn("[sayFemale]Hey, I think it's the intake day.. Yeah, it must be.. Look at the busy bees being all busy and stuff.[/sayFemale]")

		saynn("You stop and look around. Indeed, you notice that the guard checkpoint is indeed looking more.. lively.. than usual.")

		saynn("[sayMale]Fresh meat! Hah. Always tastes better than leftovers! Just gotta tenderize it first, let's go see what future-bitches they brought.[/sayMale]")

		saynn("Might as well take a look yourself. After all, you were fresh meat at some point too..")

		addButton("Watch", "Look at the new inmates", "artica_arrives")
	if(state == "artica_arrives"):
		aimCameraAndSetLocName("hall_mainentrance")
		GM.pc.setLocation("hall_mainentrance")
		addCharacter("artica")
		addCharacter("risha")
		playAnimation(StageScene.Duo, "walk", {pc="artica", npc="risha", flipNPC=true, npcAction="walk", bodyState={leashedBy="risha"}})
		saynn("The news spread quickly in this place. Not even a minute later, there is already a whole crowd of inmates surrounding you, waiting to see the new faces.")

		saynn("[sayMale]Bring them out! The one with the biggest tits and widest hips is mine to claim![/sayMale]")

		saynn("[sayMale]Fuck off, how about you go suck a cock instead.[/sayMale]")

		saynn("The guards push the most eager inmates away from the checkpoint and form a wall of sorts, a corridor.. before the lift finally arrives.")

		saynn("A metal screech reveals a dozen new inmates.. wearing collars, cuffs and their shiny fresh inmate uniforms, some orange, some red, some purple.. Each new inmate is accompanied by a staff member that holds their leash.")

		saynn("The crowd around you cheers loudly as the 'fresh meat' is being paraded out. You see some faces full of fear and anger.. and some that are surprised.")

		saynn("[sayMale]Hell yeah! Which one is gonna snap first! Anyone wants to track bets?[/sayMale]")

		saynn("[sayFemale]So many pretty girls! Who wants to be my toy for the evening?[/sayFemale]")

		saynn("One of the new inmates catches your eye in particular.. The white bright fur with fancy cyan patterns stands out quite a lot, compared to others. She is accompanied by a mean tall lynx guard who is relentlessly tugging on the leash.. before shoving some eager inmate back with her free hand.")

		saynn("[say=risha]Contain your horny asses, you stupid whores![/say]")

		saynn("[sayMale]Suck my dick![/sayMale]")

		saynn("[say=risha]Oh yeah? Try me, fucker. You won't even need to remove your ribs after my personal treatment. I will break you in half![/say]")

		saynn("The fur behind is being quiet, avoiding any eye contact. She awkwardly puts one hindpaw forward after another, trying to keep up.")

		saynn("[say=risha]C'mon, let us pass, let us pass. You will get a good look at them later, the softies are tired after a long flight, can't you see.[/say]")

		saynn("The crowd is still cheering, giving the new inmates the proper intake experience. Things begin to quiet down only after all the inmates get pulled down to the cellblock.")

		saynn("Since that white-furred inmate is wearing a lilac uniform.. might be worth it to look for her in the lilac cellblock sometime later..")

		addButton("Continue", "That was fun", "endscene_clearrestraints")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "artica_arrives"):
		processTime(10*60)
		getCharacter("artica").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		getCharacter("artica").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))

	if(_action == "endscene_clearrestraints"):
		getCharacter("artica").removeAllRestraints()
		endScene()
		return

	setState(_action)
