extends SceneBase

func _init():
	sceneID = "Eliza5UnlockMilkingScene"

func _reactInit():
	addMessage("You can now bring your slaves to Eliza so that she will automatically milk them every morning")

func _run():
	if(state == ""):
		addCharacter("eliza")
		aimCameraAndSetLocName("med_lobbymain")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("[say=eliza]Come here, my assistant![/say]")

		saynn("Eliza's voice stops you dead in tracks. You glance over and spot her behind the counter in her usual spot, coffee mug in hand, looking way too pleased with herself.")

		saynn("You approach her.")

		saynn("[say=pc]What's up?[/say]")

		saynn("She takes a sip before smiling.")

		saynn("[say=eliza]First of all, great job so far! Our lab setup is still, like.. 5% of what I had before I got sent here. But trust me, that's a lot![/say]")

		saynn("[say=pc]You really like that old lab, don't you?[/say]")

		saynn("[say=eliza]Ma-aybe? What makes you say so?[/say]")

		saynn("[say=pc]I don't know.. maybe the dozen times you've brought it up?[/say]")

		saynn("Eliza huffs, flicking her tail.")

		saynn("[say=eliza]Well, duh.. A master is only as good as their tools.. And I had the best tools. I need to work in that lab again. With everything I've learned here? I could do so much more.[/say]")

		saynn("She pauses for a second, barely able to contain her excitement.")

		saynn("[say=eliza]I've heard rumors about the miracles my mother pulled off.. I wanna push science even further.[/say]")

		saynn("A small thought forms in your mind. A very nagging thought that is hard to ignore.")

		saynn("[say=pc]Does that mean.. If she lets you back in, you're leaving?[/say]")

		saynn("Eliza barely even hesitates.")

		saynn("[say=eliza]A tool without a master is a wasted tool.. Yeah, nothing is really holding me here. Just the fears of my parents. I will get the fuck out of here as soon as I get the chance![/say]")

		saynn("Her casual gaze is directed at you while a short silence emerges. For some reason, it's hard not to be saddened by her words. But it makes sense for her to dream big.. she is not stuck behind bars like you.")

		saynn("Eliza's ears flick. She finally takes note of the void.. and gasps.")

		saynn("[say=eliza]Oh, right! I didn't call you to be all soapy. I've been busy, can't help you with the lab much, outside of scanning those pills. But! I think I can help you with something.[/say]")

		saynn("Any help would be nice.")

		saynn("[say=eliza]I have some free time in the mornings. I'm usually sleepy as fuck.. but I think I have enough brain power to milk someone![/say]")

		saynn("[say=pc]Milk someone?[/say]")

		saynn("[say=eliza]It isn't as gross as it sounds! I can just quickly put some pumps on inmates and continue with my morning routine while the milking machine is working on them. Just gotta not forget to check on them occasionally~.[/say]")

		saynn("That does sound useful.")

		saynn("[say=eliza]So.. I could obviously milk you~. But if you have someone else in mind, I can work my magic on them too. Hope you won't mind me taking some of the milk for myself, I love it with coffee~.[/say]")

		saynn("Right back into the gross territory.. But that could make for a nice passive.. income.. of sorts.")

		addButton("Leave", "Time to go", "just_leave")
		addButton("Kiss?", "You did a lot. Might as well ask for a bigger reward", "get_kiss")
	if(state == "just_leave"):
		saynn("[say=pc]Yeah, that could be useful. I will keep that in mind.[/say]")

		saynn("Eliza slowly eyes you from toes to tip of your ears.")

		saynn("[say=eliza]Mhm~. Keep it up. Call me when you find more of those strange drugs.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "get_kiss"):
		playAnimation(StageScene.Duo, "hurt", {npc="eliza"})
		saynn("You deserve more than a simple 'good job', you've been looking after her lab!")

		saynn("[say=pc]I think I deserve a reward for my work, don't you think? A little kiss would be a good start.[/say]")

		saynn("Eliza raises a brow, her eyes linger on your lips while a little smile is formed by hers.")

		saynn("[say=eliza]Kiss.. hmm~.[/say]")

		saynn("Her paw closes the laptop as she leans a bit closer, over the counter.")

		saynn("[say=eliza]Come here then.[/say]")

		saynn("As you get closer and lean yourself to meet her.. A sharp pain suddenly swipes through your body, starting at the neck. A painful grunt escapes your lips as your muscles seize up for a long, agonizing, two seconds.")

		saynn("[say=pc]Gh-h..[/say]")

		saynn("Eliza shows you her little remote with a face full of innocence.")

		saynn("[say=eliza]You will have to earn it, Fucker-r-r~~.[/say]")

		saynn("She really drags the last syllable, singing it.")

		saynn("You grab onto your neck and try to get your breathing back.")

		saynn("[say=pc]Is that how you play, kitty cat?[/say]")

		saynn("Her soft purring echoes in your ringing ears, her clawed digit scratching the red button on her remote.")

		saynn("[say=eliza]That would be Dr. Quinn for you, little patient~. And yes, sometimes I play rough. Explosive chemistry is what I'm known for~.[/say]")

		saynn("[say=pc]Noted.[/say]")

		saynn("Her second paw reaches out to gently scritch you under the chin. She bites her lip.")

		saynn("[say=eliza]You're always welcome to worship me though. Haha.[/say]")

		saynn("Such a brat. Eliza leans away to return to her post.")

		saynn("[say=eliza]Keep it up. Call me when you find more of those strange drugs.[/say]")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
