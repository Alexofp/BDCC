extends SceneBase

func _init():
	sceneID = "PlayerSlaveryStartMemeScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("There is a credits chip, just lying on the floor here.")

		saynn("From the looks of it, this one must contain at least a 100 credits.")

		addButton("Grab it!", "Free credits!", "grab1")
		addButton("Leave", "Leave the chip alone", "endthescene")
	if(state == "grab1"):
		playAnimation(StageScene.Solo, "kneel")
		saynn("Maybe someone has lost this chip. But that's none of your problems.")

		saynn("You bend down and try to grab the chip.. but it's stuck in place. No wonder no one has bothered to pick it up, the thing feels like it's glued to the floor.")

		if (GM.pc.getStamina() > 0):
			addButton("Use strength!", "Apply extra force", "grab2")
		else:
			addDisabledButton("Use strength!", "You don't have any stamina")
		addButton("Give up", "Whatever", "endthescene")
	if(state == "grab2"):
		saynn("You keep applying more and more of your strength, trying to pry the chip off of the floor with your digits..")

		saynn("It's hard.. the chip is small so it's hard to get a good grip. You're also afraid you might just snap the thing too. Still, bit by bit, you manage to get leverage.")

		saynn("You keep pulling..")

		saynn("Until suddenly..")

		saynn("The chip gives!")

		saynn("It gives so much, the thing flies out of your hands and straight into one of the vent shafts.")

		saynn("Shit.")

		saynn("You look into it.. it's dark in there. Dark and dirty. There aren't any.. sticks.. around really.")

		saynn("If you want to get this chip, you will have to bend over and reach into the vent really far..")

		addButton("Reach in!", "You really need those 100 creds", "grab3")
		addButton("Give up", "It's not worth it", "endthescene")
	if(state == "grab3"):
		playAnimation(StageScene.SexVent, "tease", {pc="pc", hideNPC=true})
		saynn("In pursuit of that chip, you get into that ventilation shaft, reaching your hand out to try to find it.")

		saynn("Only now you begin to realize.. that this position is quite vulnerable. What if someone decides to take advantage of you?")

		addButton("Keep reaching!", "Give me those sweet credits", "grab4")
		addButton("Get out", "Better safe than sorry", "grab3_cancel")
	if(state == "grab3_cancel"):
		playAnimation(StageScene.Solo, "stand")
		saynn("As quickly as you can, you get out of that shaft and swipe off any dirt.")

		saynn("Looking around.. no one really cares about you. The others are mostly watching the arena.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "grab4"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You keep reaching.. until you manage to find the chip!")

		saynn("With a sense of triumph, you get out of that vent and swipe off any dirt or dust with your free hand.")

		saynn("From a quick glance.. it seems to be the real deal. You are holding a chip with a hundred credits on it!")

		saynn("You begin bringing it closer to your collar so that you can transfer the credits to your account..")

		saynn("But then the chip miraculously flies out of your hand! You weren't looking so you're not even sure what happened.")

		addButton("Catch it!", "You're not letting it go that easy", "grab5")
		addButton("Give up", "Just forget about it", "endthescene")
	if(state == "grab5"):
		playAnimation(StageScene.Solo, "crawl")
		saynn("You leap after the chip! But as you catch the thing, it slips out of your hands again.. such a slippery bastard!")

		saynn("Both, you and the chip, fall onto the floor.")

		saynn("So close.. The chip is only a meter or two away.. You crawl after it and grab it.. only for it to slip away yet again. Something is wrong here..")

		saynn("You do it again, crawling after the chip and grabbing it.. just to feel it get yanked out of your grip.")

		saynn("Wait, you have just noticed that there is a very thin wire attached to it. Someone's been pulling on it this whole time, pranking you.. or luring you somewhere.")

		saynn("You begin to get a feeling that this might not end well for you.. Maybe you should stop before things get too far.")

		addButton("Give up", "Now might be a good time to stop", "grab5_cancel")
		addButton("Step on it", "Step on the wire and try to get the chip!", "grab5_fail")
		if (GM.pc.getInventory().hasItemID("Shiv")):
			addButton("Use a shiv", "Cut the thin wire with a shiv!", "grab6")
		else:
			addDisabledButton("Shiv", "You don't have a shiv so you can't cut the wire")
	if(state == "grab5_cancel"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You decide to stop the chase. Whoever designed this prank, they won. It's not worth it anymore.")

		saynn("You get off of the dirty floor.. and continue on your way.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "grab5_fail"):
		playAnimation(StageScene.Solo, "defeat")
		saynn("A plan is brewing in your head..")

		saynn("Instead of chasing after the thing, you get up and walk around it.")

		saynn("Your eye spots the subtle shine of the thin wire, following the floor.. somewhere unknown.")

		saynn("You wait for a good moment.. and step on it!")

		saynn("The wire slides under your {pc.foot}.. but the chip itself gets caught on it! Bingo!")

		saynn("But before you can pick it up, the pressure on your {pc.foot} suddenly increases.. Something REALLY strong yanks on the wire.. making the chip swipe you off of your {pc.feet}!")

		saynn("You hit the floor.. again.. ow..")

		saynn("The chip gets yanked who knows where..")

		saynn("Maybe if you had a shiv, you'd be able to just cut the wire..")

		saynn("Or maybe.. this is just a trap.. who knows..")

		saynn("Either way, it's time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "grab6"):
		playAnimation(StageScene.Solo, "stand")
		saynn("A great plan is brewing in your head..")

		saynn("Instead of going after the chip, you go after the wire!")

		saynn("You wait for a good moment.. and then reach to cut it with your shiv! And, without much trouble, you manage to do so.")

		saynn("With that out of the way, the chip becomes still, allowing you to grab it.")

		saynn("It's in your hand now.. it's a little dusty.. but one hundred well-earned credits look great in any condition, really.")

		saynn("But..")

		saynn("As you look around, you can't shake off a feeling that all of this was some kind of plan.. to trap you.")

		saynn("(( If you continue, you will trigger a soft bad end ))")
		
		addButton("Transfer credits", "(Bad end) Transfer the credits onto your account", "grab7")
		addButton("Cancel", "Stop it right here", "bad6_cancel")
	if(state == "bad6_cancel"):
		saynn("You decide to put the chip back where it was.")

		saynn("It's best to let some other poor soul have it. You had your fun with it.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "grab7"):
		playAnimation(StageScene.Solo, "defeat")
		saynn("No way you're stopping now. You earned every single one of the credits!")

		saynn("You bring the chip to your collar so that it can be scanned and transferred to your inmate account.")

		saynn("Instead.. you hear an angry beep.. followed by a [b]sudden shock[/b] rocking through your whole body, spreading from your neck across your nervous system!")

		saynn("[say=pc]ARGH![/say]")

		saynn("You hit the floor instantly.. Your limbs give out, your body spasming out of control. It hurts.. Everything hurts.")

		saynn("You can live with most of that.. but you realize that you can't really breathe much.. the muscles of your lungs have seized.. your loud scream has left you with no air..")

		saynn("The darkness creeps around the corners of your vision..")

		addButton("Nap time!", "Looks like it was a trap all along..", "grab8")
	if(state == "grab8"):
		playAnimation(StageScene.Sleeping, "sleep")
		saynn("Panic settles in.. You force yourself to breathe a tiny bit.. but it's not enough to stay conscious. You black out.")

		saynn("The last thing you see.. some blurry figures approaching you.")

		saynn("[sayFemale]We got {pc.him}, we got {pc.him}! The killer chip prank claims another victim. What now? Can {pc.he} be my bitch?[/sayFemale]")

		saynn("[sayMale]No, you got plenty already. This one.. will yield us some real credits instead. I know just the guy.[/sayMale]")

		saynn("You get dragged off somewhere..")

		addButton("Continue", "See what happens next", "start_slavery")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "grab1"):
		processTime(3*60)

	if(_action == "grab2"):
		GM.pc.addStamina(-10)

	if(_action == "grab4"):
		processTime(3*60)
		GM.pc.addStamina(10)

	if(_action == "grab5"):
		processTime(3*60)

	if(_action == "grab5_fail"):
		GM.pc.addPain(5)

	if(_action == "start_slavery"):
		endScene()
		runScene(getModule("PlayerSlaveryModule").getSlaveryStartScene())
		return

	setState(_action)
