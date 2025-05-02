extends SceneBase

func _init():
	sceneID = "DrugDenKidlat2Scene"

func _run():
	if(state == ""):
		addCharacter("kidlat", ["naked"])
		playAnimation(StageScene.Duo, "stand", {npc="kidlat", kidlatBox=true, further=true, npcBodyState={naked=true}})
		saynn("You notice Kidlat, your friendly, trusty shopkeeper. This time, something is different..")

		saynn("Her usual uniform is nowhere to be seen. Instead, Kidlat stands there completely naked, her black and cyan illuminated by the dim emergency lights. She has got her hands firmly planted on her hips.")

		saynn("[say=kidlat]Welcome to Kidlat's humble.. Oh hey, how are you doin', hun?[/say]")

		saynn("Her breasts and crotch are on full display, the outline of her slit shining between her legs, her blue nips catching some highlights.. you can just tell that it's cold here from looking at her.. but she acts like she isn't affected.")

		saynn("[say=pc]I'm okay. How is your business going, sold your last set of pants already?[/say]")

		saynn("She chuckles, her stiff nips bobbing up and down.")

		saynn("[say=kidlat]Oi, I might be silly but I'm not that silly![/say]")

		saynn("You raise a brow.")

		saynn("[say=pc]Where is your uniform then?[/say]")

		saynn("Her tail flicks, her tough stance wobbling a little..")

		saynn("[say=kidlat]It's a long story, luv. I try not to rip people off.. But some bastard thought it would be fun to do so with my clothes. I managed to bolt before things go worse.. but now.. well[/say]")

		saynn("She looks down at herself.. your gaze involuntarily follows, observing her exposed forms.")

		saynn("[say=kidlat]The cat is all outta wardrobe options now.[/say]")

		saynn("She notices your stare, her cheeks blush cyan a little..")

		saynn("[say=kidlat]Enjoying the view, are we?[/say]")

		saynn("Kidlat tilts her head, her cyan and purple eyes sparkling with amusement.")

		saynn("[say=kidlat]Careful, luv. I still sell stuff. Gonna charge extra if you're gawkin'~.[/say]")

		saynn("You try not to from that point.. but the extra swing that she puts into her hips as she sways from one side to the other makes it kinda hard.")

		saynn("[say=kidlat]With all my bits out, I have to be more careful from now on.. so my inventory is gonna be limited until I find my uniform.[/say]")

		saynn("Her paw directed attention to the bathered cardboard box.. it sure has less stuff now. A slight sigh precedes her next words.")

		saynn("[say=kidlat]If you, maybe, find it, this gal would appreciate it. You don't have to, though. Worry about yourself, hun.[/say]")

		saynn("You nod.. but before you can say anything, she places a paw on her hip and offers you a cheeky smile.")

		saynn("[say=kidlat]I don't mind makin' you squirm anyway. And you probably love havin' a helpless little kitty like me around, eh~?[/say]")

		saynn("Kidlat winks and pulls her gaze down again, allowing you to.. gaze.")

		saynn("After a few seconds of silence, she leans closer to your ear, showing off a black patch of fur in the shape of a heart heart on her breasts.")

		saynn("[say=kidlat]You buyin' something, hun? Or you just wanna stand here and stare at my tits all day~?[/say]")

		saynn("You snap out of it.")

		saynn("[say=pc]You're sure, you're gonna be okay, Kidlat?[/say]")

		saynn("She gives you a confused look.")

		saynn("[say=kidlat]I'm used to being down here. In places where no one really cares about you. This kitty got teeth and claws~.[/say]")

		saynn("She got claws and ways to distract.. she will probably do fine indeed.")

		addButton("Continue", "See what happens next", "start_browsing_shop")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_browsing_shop"):
		addMessage("Task updated! (Task log can be found inside the 'Me' menu during drug den runs)")
		getModule("DrugDenModule").regenerateKidlatItems()
		runScene("DrugDenKidlatShopScene")
		endScene()

	setState(_action)
