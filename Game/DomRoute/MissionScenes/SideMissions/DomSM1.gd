extends SceneBase

func _init():
	sceneID = "DomSM1"

func _run():
	if(state == ""):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("Avy approaches you, her dark fur revealed by the fluorescent lights of the mission center.")

		saynn("[say=avy]Hey.[/say]")

		saynn("[say=pc]What do you need?[/say]")

		saynn("[say=avy]Wow, you're so direct.[/say]")

		saynn("[say=pc]I feel like I gotta be, with you especially.[/say]")

		saynn("[say=avy]Chill~. I ain't gonna kill you.. today. One guy owes me a bunch, I need someone to be near. Just in case.[/say]")

		saynn("[say=pc]Just in case?[/say]")

		saynn("[say=avy]Yeah. Ans isn't exactly a fighter. And Kait.. That cat is just too soft.[/say]")

		saynn("[say=pc]I thought you could stand for yourself.[/say]")

		saynn("[say=avy]I very much can. But this way I can share the knowledge, you know?[/say]")

		saynn("Sounds like you won't need to be doing much. So why not?")

		saynn("[say=pc]Alright. Let's go then.[/say]")

		addButton("Follow", "See where she brings you", "in_cellblock")
	if(state == "in_cellblock"):
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		saynn("You and Avy quietly exit your hideout and head out into the main areas of the prison.")

		saynn("[say=pc]Is the arena gonna be fine without you?[/say]")

		saynn("[say=avy]Yeah. Ans can handle most of it by himself.[/say]")

		saynn("[say=pc]You and him go a long way back?[/say]")

		saynn("[say=avy]Depends on how you look at it.[/say]")

		saynn("[say=pc]Before the prison?[/say]")

		saynn("[say=avy]Hah, fuck you, of course not. He is from Earth, that huge pile of trash. Our past livelines could not be any more parallel.[/say]")

		saynn("Soon, you reach the lilac cellblock. It's busy with life, as always, a bunch of inmates walking around.. most of them doing so quite seductively.")

		saynn("Seeing the two of you made the space a little more.. tense.")

		saynn("[say=pc]So who are we looking for?[/say]")

		saynn("[say=avy]Rubi. A cat. Loves walking around shirtless. Loves taking loans and never repaying them.[/say]")

		saynn("A shirtless cat.. shouldn't be too hard to find.")

		saynn("You and Avy lean against one of the walls and begin scanning the surroundings.")

		saynn("[say=pc]Why are you helping Ans? You don't seem very compatible as friends.[/say]")

		saynn("[say=avy]You're asking a lot of questions, you know~.[/say]")

		saynn("[say=pc]You don't have to answer.[/say]")

		saynn("[say=avy]He helped me. I helped him. Simple.[/say]")

		saynn("[say=pc]You rub my back, I rub yours.[/say]")

		saynn("[say=avy]That's how this life works, kiddo.[/say]")

		saynn("[say=pc]Don't call me kiddo.[/say]")

		saynn("[say=avy]I'm just teasing~.[/say]")

		saynn("You see a bunch of lilacs.. Some of them are cats.. some of them are naked.. but none of them are just shirtless.")

		saynn("But then you see it. The bright fur of his chest stands out against the dark concrete and painted metals. He steps out of his cell and takes his time to stretch.")

		saynn("[say=pc]Is that him?[/say]")

		saynn("[say=avy]Yuppity.[/say]")

		saynn("Sensing two sets of eyes directed at him, the guy's ears perk towards your direction. As soon as he sees Avy, the guy's expression changes from a happy one down to a concerned one.. he quickly retreats back into his cell.")

		saynn("[say=avy]Let's go pay him a visit.[/say]")

		saynn("[say=pc]Don't kill him.[/say]")

		saynn("[say=avy]I will try~.[/say]")

		addButton("Continue", "See what happens next", "avy_meets_rubi")
	if(state == "avy_meets_rubi"):
		playAnimation(StageScene.Duo, "stand", {pc="avy", npc="rubi"})
		addCharacter("rubi")
		saynn("You and Avy step inside the cell.. and find Rubi holding onto the chair, desperately trying to rip it off the floor.. but the bolts keep it secured in place.")

		saynn("[say=avy]I see you're working out.[/say]")

		saynn("Her voice makes the guy jump and turn around to face you.")

		saynn("[say=rubi]Avy![/say]")

		saynn("[say=avy]I'm listening.[/say]")

		saynn("[say=rubi]The last few arena fights didn't work out so well for me..[/say]")

		saynn("[say=avy]I thought you're strong.[/say]")

		saynn("[say=rubi]I am! Look at these gains![/say]")

		saynn("[say=avy]Charming.[/say]")

		saynn("[say=rubi]I've also put some bets on some fighters who were totally supposed to win..[/say]")

		saynn("[say=avy]Oh, so you're gambling now?[/say]")

		saynn("Avy approaches Rubi.. who pushes himself into a corner.")

		saynn("[say=rubi]Listen.. I will get you those credits, I just need time.[/say]")

		saynn("[say=avy]Sorry, can't do. I've waited long enough. Now you're just pulling my balls. And I don't appreciate my balls being pulled.[/say]")

		saynn("[say=avy]I'd rather be the one pulling.[/say]")

		saynn("[say=rubi]I don't.. have..[/say]")

		saynn("[say=avy]Give me what you have then. Turn those prison pockets out before I do it myself.[/say]")

		saynn("Avy catches Rubi's arm and wrenches it behind his back.. before shoving the guy against a wall.")

		saynn("[say=rubi]Avy![/say]")

		saynn("[say=avy]I will break your fingers. One by one. Until you give me what I want.[/say]")

		saynn("[say=pc]Avy.[/say]")

		saynn("[say=avy]I know what I'm doing, shush. Just watch if the guards walk past.[/say]")

		saynn("[say=rubi]Agh..[/say]")

		saynn("[say=avy]Do you know how painful it is to lose a claw? How about three? Ten?[/say]")

		saynn("[say=rubi]Please.. I don't..[/say]")

		saynn("Avy puts pressure on the guy's hand.. until something inside it starts shattering with a sickening noise.")

		saynn("[say=rubi]AHH-![/say]")

		saynn("[say=avy]Fingers gonna get broken first. Then your snout. Your fangs. Your toes. Your balls will be last. Without them, you can't earn me anything.[/say]")

		saynn("[say=rubi]AVY I WILL GET YOU THOSE CREDITS, I SWEAR![/say]")

		saynn("[say=avy]That's not enough, pretty boy.[/say]")

		saynn("She smashes him against the wall again..")

		saynn("[say=avy]Not gonna be so pretty after I'm done with you.[/say]")

		saynn("It really looks like she is about to fuck him up in front of you.. Or maybe she really does know what she is doing.")

		addButton("Let her", "(Avy's love +) Just watch and protect her from anyone who might try to stop her", "let_her")
		addButton("Stop her", "(Avy's obedience +) Stop her before she breaks that guy", "stop_her")
	if(state == "let_her"):
		saynn("You stay put. Arms crossed. Just watching.")

		saynn("Avy's grip tightens on Rubi's wrist again.")

		saynn("[say=rubi]Please.. I'm begging you..[/say]")

		saynn("The foxy ignores him. She grabs his pinky finger.. and bends it a bit too much.. until something inside it cracks.")

		saynn("[say=rubi]AHH! Fuck![/say]")

		saynn("The cat's legs buckle.. but Avy holds him upright.")

		saynn("[say=avy]Nine more to go.[/say]")

		saynn("She grabs his ring finger.")

		saynn("[say=rubi]WAIT WAIT WAIT![/say]")

		saynn("Avy pauses, her red eyes shine with curiosity.")

		saynn("[say=rubi]Under the pillow..[/say]")

		saynn("[say=avy]All of it?[/say]")

		saynn("[say=rubi]Yeah..[/say]")

		saynn("[say=avy]You better not be lying.[/say]")

		saynn("Avy releases his arm.. and so Rubi collapses to his knees, touching his broken finger, tears going down his cheeks.")

		saynn("The credits chip was indeed just hiding under the pillow. Avy grabs it and tests it with a fang.")

		saynn("[say=avy]I feel some current. Good. You could have saved yourself a finger.[/say]")

		saynn("[say=rubi]Sorry..[/say]")

		saynn("Avy gives the poor cat some headpats.")

		saynn("[say=avy]Good boy. Go to the medbay now. Before I get some kind of craving~.[/say]")

		saynn("Rubi doesn't argue.. He gets up and starts going towards the exit. You let him pass.")

		addButton("Continue", "See what happens next", "after_leave_break")
	if(state == "after_leave_break"):
		removeCharacter("rubi")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("Avy watches him go.. then turns her attention to you. Her tail flicks a bit.")

		saynn("[say=pc]He had the credits all along.[/say]")

		saynn("[say=avy]He sure did. He knew what would happen if he didn't.[/say]")

		saynn("[say=pc]Why not just pay your debt at that point.[/say]")

		saynn("[say=avy]Gambling, you heard him. It's fun to waste your credits on pointless shit.[/say]")

		saynn("Makes you wonder what pointless shit she is wasting her credits on.")

		saynn("[say=avy]Anyway. This is it.[/say]")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("[say=avy]Hah.[/say]")

		saynn("After that, you just return back to your hideout.")

		saynn("Mission completed!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "stop_her"):
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("You step forward and grab Avy's arm before she does anything else that's mean.")

		saynn("[say=pc]That's enough. That's not how we do things.[/say]")

		saynn("Avy freezes. Her blue eyes snap to you.")

		saynn("[say=avy]Excuse me?[/say]")

		saynn("[say=pc]I said. That's. Enough.[/say]")

		saynn("You pull her hand away from Rubi's. The cat gasps and slumps against the wall.")

		saynn("Avy furrows her brows, her claws extended.")

		saynn("[say=avy]Or what?[/say]")

		saynn("You tilt your head slightly.")

		saynn("[say=pc]Try me.[/say]")

		saynn("Her jaw tightens. Her claws tap away at her hips. She stares you directly into the eyes. You hold her gaze. Seconds tick..")

		saynn("But she doesn't strike you.")

		saynn("[say=avy]Oh, fuck you.[/say]")

		saynn("That looks like it worked.")

		saynn("[say=avy]Fine.[/say]")

		saynn("Avy rolls her eyes and then just goes towards the guy's bed.")

		saynn("[say=rubi]Hey, wait![/say]")

		saynn("She tears into the pillow.. and quickly finds a credits chip.")

		saynn("[say=rubi]Really?[/say]")

		saynn("[say=avy]Use another lilac as a pillow.[/say]")

		saynn("[say=rubi]I was gonna quadruple it![/say]")

		saynn("[say=avy]No you wouldn't, we both know it. You're lucky I didn't break your fingers.[/say]")

		saynn("She looks at you.")

		saynn("[say=avy]C'mon, let's go.[/say]")

		addButton("Continue", "See what happens next", "outside_didnt_break")
	if(state == "outside_didnt_break"):
		removeCharacter("rubi")
		saynn("You step outside. Avy just stands, facing away, staying quiet.")

		saynn("[say=pc]Are you mad at me?[/say]")

		saynn("[say=avy]A bit.[/say]")

		saynn("[say=pc]You knew where the credits were, why break his fingers.[/say]")

		saynn("[say=avy]For fun.[/say]")

		saynn("[say=pc]This prison has enough sadists.[/say]")

		saynn("Some time passes. You hear her chuckling.")

		saynn("[say=avy]Hah. You're right about that one.[/say]")

		saynn("She suddenly turns around and puts her face close to yours.")

		saynn("[say=avy]You can't stop me from being sadistic.[/say]")

		saynn("[say=pc]But maybe I can offer you something better.[/say]")

		saynn("[say=avy]PFF, right. Enjoy your boring life. See you around.[/say]")

		saynn("After that, you just return back to your hideout.")

		saynn("Mission completed!")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_cellblock"):
		processTime(10*60)

	if(_action == "avy_meets_rubi"):
		processTime(5*60)

	if(_action == "after_leave_break"):
		processTime(3*60)
		GM.main.MS.completeMission()

	if(_action == "outside_didnt_break"):
		processTime(3*60)
		GM.main.MS.completeMission()

	setState(_action)
