extends SceneBase

func _init():
	sceneID = "Eliza7EndingScene"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("med_lobbymain")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("No point in pushing this back any further. Might as well tell her.")

		saynn("[say=pc]I think.. I think the database now has entries for each of the drugs that are floating around in the prison.[/say]")

		saynn("[say=eliza]Oh, do they?[/say]")

		saynn("She pulls out her datapad and quickly swipes through some menus.")

		saynn("[say=eliza]Shit, you're right. They're all fully tested too.[/say]")

		saynn("[say=elizaMom]I never taught you to swear, dear.[/say]")

		saynn("That voice came from behind you..")

		addButton("Continue", "See what happens next", "mom_comes_in")
	if(state == "mom_comes_in"):
		addCharacter("elizaMom")
		playAnimation(StageScene.Duo, "stand", {pc="elizaMom", npc="eliza"})
		saynn("You step aside as soon as you notice the familiar figure, accompanied by the two familiar armed guards exit the elevator. Scarlet's gaze pushes you further into the corner, away from the counter..")

		saynn("[say=eliza]Oh, you haven't left yet?[/say]")

		saynn("[say=elizaMom]Just wanted to see my daughter again, I finally finished discussing all the current issues with the captain.[/say]")

		saynn("[say=eliza]That's great, I wanna show you something.[/say]")

		saynn("Eliza swiftly steps out of view and then appears in one of the doors. She is holding a datapad.")

		saynn("[say=eliza]Look, we solved the prison's drug problem![/say]")

		saynn("[say=elizaMom]Did you really?[/say]")

		saynn("Scarlet grabs the offered datapad and begins swiping through the data.")

		saynn("[say=elizaMom]Hm.[/say]")

		saynn("[say=eliza]Yeah, we found and tested each of the drugs that were floating around in the prison.[/say]")

		saynn("[say=elizaMom]And that solved it?[/say]")

		saynn("[say=eliza]Well.. uh.. we now know exactly what we're dealing with, down to the molecular structure. I filled a database entry full of information for each drug, there is nothing that's super dangerous. All the effects could be reversed. With all that info, it will be easy for the guards to find the contraband and destroy it![/say]")

		saynn("[say=elizaMom]Right. Hm.[/say]")

		saynn("Scarlet stays quiet, her eyes idly reading the data, her face expressionless.. Occasionally, she darts a look into a random direction.. occasionally that direction is yours.")

		saynn("[say=elizaMom]I'm certainly glad you managed to avoid endangering yourself, you have really grown, my dear girl. But I think the drug problem isn't solved until it's fully solved.[/say]")

		saynn("[say=eliza]Hah? It is solved..[/say]")

		saynn("[say=elizaMom]It will only be solved once all of these drugs are fully eliminated from this prison. And something tells me.. this will never realistically happen.[/say]")

		saynn("[say=elizaMom]Still, you proved that you know your way around a lab. What's left to do here, it's not up to you anymore.[/say]")

		saynn("Eliza's eyes light up.")

		saynn("[say=elizaMom]So I wanna take you back with me.[/say]")

		saynn("[say=eliza]Does that mean..?[/say]")

		saynn("Scarlet nods.")

		saynn("[say=elizaMom]I would love to have you in my lab, sweetheart. You're incredibly smart.[/say]")

		saynn("[say=eliza]Yay.[/say]")

		saynn("Hearing these words is probably a dream come true for the feline. Makes you happy too.")

		saynn("[say=elizaMom]Seeing what you did here, I really could use an assistant like you. So, you can go start packing your things.[/say]")

		saynn("Something in Eliza's gaze changes instantly.")

		saynn("[say=eliza]Assistant?..[/say]")

		saynn("[say=elizaMom]Yes, we'd be working together.[/say]")

		saynn("Eliza blinks.. many times.")

		saynn("[say=eliza]Assistant..[/say]")

		saynn("[say=elizaMom]Something is wrong? Isn't that what you wanted?[/say]")

		saynn("[say=eliza]I kinda like our lab..[/say]")

		saynn("[say=elizaMom]Excuse me? Am I hearing you correctly?[/say]")

		saynn("[say=eliza]I.. I don't know.[/say]")

		saynn("[say=elizaMom]Eliza? Sweetie? What's wrong?[/say]")

		saynn("[say=eliza]I..[/say]")

		saynn("[say=elizaMom]I'm not gonna get angry at you. Right now I'm just curious.. How can your current lab setup be better than what we have at home?[/say]")

		saynn("[say=eliza]Well.. it's not. The equipment we have is much worse.[/say]")

		saynn("[say=elizaMom]Obviously. So if you wanna help me push science forward, you should come with me.[/say]")

		saynn("[say=eliza]Right.. well..[/say]")

		saynn("[say=elizaMom]Something is holding you here.[/say]")

		saynn("[say=eliza]Maybe..[/say]")

		saynn("[say=elizaMom]Look.. I know that we're not always on the best terms. We had our.. disagreements. Maybe we should start to stop being afraid of being honest with each other?[/say]")

		saynn("[say=eliza]Hm..[/say]")

		saynn("[say=elizaMom]I can be first. It might seem like a punishment that I sent you here.. and I certainly worded it like that back then. I was pretty loud.[/say]")

		saynn("[say=elizaMom]Real reason is.. I was busy back then, with a very important project. I just had no time to look after you. Which is why I was very angry. I was angry at myself. I failed to protect you.[/say]")

		saynn("[say=elizaMom]That project is over. I'm free, for now at least. We can join efforts. I'd rather your skills not be wasted.. here.. in this place.[/say]")

		saynn("[say=elizaMom]Now.. please.. sweetheart.. I love you more than anyone. If you want to stay.. Perhaps you can stay. But can I maybe know what powers your decision?[/say]")

		saynn("[say=eliza]I like the freedom..[/say]")

		saynn("[say=elizaMom]Freedom? But you are in a prison, sweetie.[/say]")

		saynn("[say=eliza]Freedom of being able to work on what I wanna work on. You would never allow me to work on what I'm working on right now..[/say]")

		saynn("[say=elizaMom]Fair point. If you want some more of my honesty, that is part of the reason why I wanna take you back with me. But.. I also thought that you wanted to push science forward?[/say]")

		saynn("[say=eliza]I thought so too.. I was confused.[/say]")

		saynn("Eliza looks at you, smiling.")

		saynn("[say=eliza]But maybe the answer was right there. Maybe I just wanna have fun.. doing things that I wanna do.. with people that I like.[/say]")

		saynn("Scarlet follows her daughter's stare.. until it collides with yours. She judges you at first.")

		saynn("[say=eliza]Even though I'm stuck in a prison, surrounded by criminals, working with old equipment.. I'm happy here.[/say]")

		saynn("[say=eliza]You wanna protect me.. but I think I don't need protection anymore. Khm..[/say]")

		saynn("Everyone in the room clears their throats for some reason.")

		saynn("[say=eliza]I think I can protect myself now. And I also got someone that will help~. If all that fails, well, such is life, I'm ready to receive the consequences of my own actions. I think that's.. good.[/say]")

		saynn("[say=elizaMom]I guess my little girl did really grow up.[/say]")

		saynn("[say=eliza]Hah.. mom..[/say]")

		addButton("Continue", "See what happens next", "they_hug")
	if(state == "they_hug"):
		playAnimation(StageScene.Hug, "hug", {pc="elizaMom", npc="eliza"})

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "mom_comes_in"):
		processTime(3*60)

	if(_action == "they_hug"):
		processTime(5*60)

	setState(_action)
