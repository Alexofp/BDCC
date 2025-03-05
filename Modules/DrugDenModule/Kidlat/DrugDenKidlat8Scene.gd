extends SceneBase

func _init():
	sceneID = "DrugDenKidlat8Scene"

func _run():
	if(state == ""):
		addCharacter("kidlat")
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("You sneakily peek your head into each cell of the lilac cellblock.. one cell after another.. until you find the one that has a familiar silhouette!")

		saynn("Kidlat is being lazy, for once, resting on her prisoner bed, her eyes closed.")

		saynn("Her ears perk when you step inside. With a sleepy smile, she lifts her head.")

		saynn("[say=kidlat]Oh, hey, luv.[/say]")

		saynn("She quickly swings her legs off the bed and stands. With a playful flourish, she invites you to step deeper into her cell.")

		saynn("[say=kidlat]Welcome to my crib![/say]")

		saynn("You look around. It's pretty much the same cell as any other, just with slightly more comfy furniture.. lilacs always get the best stuff.")

		saynn("[say=pc]Cozy.[/say]")

		saynn("Kidlat grins.")

		saynn("[say=kidlat]Ye! Come on, let's cuddle! No reason to stand around.[/say]")

		saynn("She reaches out and grabs your hand, pulling you towards her bed.")

		saynn("Why not.")

		addButton("Cuddle", "Spend some time together", "do_cuddle")
	if(state == "do_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {npc="kidlat"})
		saynn("There isn't much space.. but you both manage to squeeze in, your bodies finding a comfortable closeness. You wrap an arm around her as she nestles into your warmth, her head resting against your shoulder.")

		saynn("[say=pc]Much better than cuddling on those cold pipes, huh.[/say]")

		saynn("A soft laugh escapes her as she snugs deeper into your embrace.")

		saynn("[say=kidlat]Hah. I will probably never return there.[/say]")

		saynn("Makes you wonder if that means she's leaving her shopkeeper life behind.. a bittersweet thought.. but it's probably for the best.")

		saynn("[say=pc]That was quick. Not gonna miss that place?[/say]")

		saynn("Her shoulders do a little bounce.")

		saynn("[say=kidlat]What was there to miss? It was a good place to hide. Hide from both your problems and feelings..[/say]")

		saynn("She pauses, gazing around the cell before her eyes fall on her worn lilac uniform. A quite hum escapes her.")

		saynn("[say=kidlat]There is one thing that I will miss actually..[/say]")

		saynn("[say=pc]Your cardboard box?[/say]")

		saynn("A burst of laughter makes her spray a little spit onto her shirt.")

		saynn("[say=kidlat]PFFF! It's hard for me to bap ya from here. But consider yourself bapped.[/say]")

		saynn("[say=pc]Ow.[/say]")

		saynn("She chuckles and then slides down a bit.. so she can look up at you from an upside-down angle, her eyes shining brightly.")

		saynn("[say=kidlat]I will miss you, luv.[/say]")

		saynn("[say=pc]I'm still here, a little too early for that.[/say]")

		saynn("She rolls her eyes, still smiling.")

		saynn("[say=kidlat]You know what I mean, hun. I will miss the ability to help you.[/say]")

		saynn("After a pause, her tone softens further.")

		saynn("[say=kidlat]I couldn't understand why you were doing it. Why were you helping a silly blue cat..[/say]")

		saynn("A voice is warm.. a pleasing murmur.")

		saynn("[say=kidlat]But now I do. I think ya got this cat addicted to that.. feeling.[/say]")

		saynn("A brief pause, Kidlat keeps pausing to try to gather her scrambled thoughts together.")

		saynn("[say=kidlat]Sounds soapy, I know.. But you matter to me. And I wanna matter to you.[/say]")

		saynn("Her sweet words are making your heart melt.")

		saynn("[say=pc]You don't have to do anything to matter to me, Kidlat.[/say]")

		saynn("[say=kidlat]I don't have to. But I want to. That's what friends do, they help each other~. Out of the kindness of their hearts![/say]")

		saynn("Nice to hear that.")

		saynn("[say=pc]You do have a kind heart, Kidlat, I will give you that. I'm not sure if I can be helped, though.[/say]")

		saynn("[say=kidlat]You sure can be! I can help your adventures by continuing to be your shopkeeper~.[/say]")

		saynn("You raise a brow and tilt your head, your voice tease-y.")

		saynn("[say=pc]Didn't you say you're done? And already, you wanna return down there?[/say]")

		saynn("[say=kidlat]That wouldn't be a.. return.. I'd only be down there when you're down there. I can raid stashes and sell stuff only to you![/say]")

		saynn("Your very personal shopkeeper kitty.")

		saynn("[say=pc]How would you find me?[/say]")

		saynn("[say=kidlat]I know my ways around those tunnels, don't worry~.[/say]")

		saynn("Somehow you were always running into her after all..")

		saynn("[say=pc]It feels like I can't stop you from doing this.[/say]")

		saynn("[say=kidlat]Not even if you tie me up~.[/say]")

		saynn("She sticks her tongue at you.. but then stops staring at you from this awkward angle.")

		saynn("[say=kidlat]Speaking off.. Well.. if you don't wanna be down there.. We can just be buddies.. you know.. fuckbuddies. Haha.[/say]")

		saynn("[say=pc]Advanced friendship.[/say]")

		saynn("[say=kidlat]With benefits~.[/say]")

		saynn("She giggles and then yawns.")

		saynn("[say=kidlat]I'm pretty tired.. wanna rest for a bit?[/say]")

		saynn("[say=pc]I don't see why not.[/say]")

		saynn("She gets comfy in your hands.. a quiet purring escapes her maw.")

		addButton("Rest", "Spend some time together", "do_cuddle_spend_time")
	if(state == "do_cuddle_spend_time"):
		saynn("Some time passes.. Kidlat is snoozing in your hands.")

		saynn("With nothing better to do, your eyes wander around her cell.. until they stumble upon a loose panel on the wall. A panel that you can just about reach.")

		saynn("You pull it off slightly.. and see the cardboard box behind.. as well as her emotional support bread, resting on top of it. All is good in the world.")

		saynn("You put the panel back.. and just continue resting with Kidlat. Her quiet purring seems to have a very soothing effect on you..")

		addButton("Rest", "Spend even more time together", "do_cuddle_wakeup")
	if(state == "do_cuddle_wakeup"):
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("All good things eventually come to an end.")

		saynn("After some more warm cuddles, it was time to get up. Kidlat opens her eyes.")

		saynn("[say=kidlat]That was.. probably the best nap I ever had..[/say]")

		saynn("[say=pc]I'm glad I could provide.[/say]")

		saynn("[say=kidlat]Haha, ye.[/say]")

		saynn("She gets up and stretches. Her whole body is shivering while she is arching her back.. until a cute moan leaves her lips.")

		saynn("[say=kidlat]Ah~. Thank you for everything, luv~. You didn't have to help this blue cat-shaped thing but you did! Means a lot. I can't even explain it.[/say]")

		saynn("[say=pc]No worries.[/say]")

		saynn("She gives you a quick but tight hug.")

		saynn("[say=kidlat]You don't have to check on me now! Feel free to do your thing, luv! Maybe our paths will cross again sometime. Or maybe they won't. And that's okay![/say]")

		saynn("[say=pc]World works in mysterious ways, you're right.[/say]")

		saynn("You approach the exit of her cell, still feeling fuzzy inside.")

		saynn("[say=kidlat]See you around, hun![/say]")

		saynn("[say=pc]See you too, Kidlat.[/say]")

		saynn("Just like that, it was time to go.")

		saynn("(( Kidlat's dedicated content ends here. Thank you for playing <3 ))")
		setFlag("DrugDenModule.KidlatCustomTalkGreet", "Hey, luv! You're already back, hah.")
		addButton("Continue", "See you around..", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_cuddle"):
		processTime(10*60)

	if(_action == "do_cuddle_spend_time"):
		processTime(60*60)
		GM.pc.addPain(-500)
		GM.pc.addStamina(500)

	if(_action == "do_cuddle_wakeup"):
		processTime(60*60)
		addExperienceToPlayer(500)

	setState(_action)
