extends SceneBase

func _init():
	sceneID = "AvyObedienceLightDomScene"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("hideout_chill")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("Avy's blue eyes, sharp mean, fixate on you.")

		saynn("[say=avy]So? Why am I here? Make it quick, I've got better things to do, I gotta run the arena.[/say]")

		saynn("You let the silence stretch for some time.. offering eye contact.")

		saynn("[say=pc]I want you to do something for me, Avy.[/say]")

		saynn("[say=avy]Oh yeah? Personal requests might cost quite a bit, you know. Depends on what you want. Give me the name and I will break 'em.[/say]")

		saynn("[say=pc]No. No breaking. I just want you to stand still for me.[/say]")

		saynn("She tilts her head, confused.")

		saynn("[say=avy]What?[/say]")

		saynn("[say=pc]You heard my order.[/say]")

		saynn("She blinks and raises her brows.")

		saynn("[say=avy]Your order. Wow. Cool.[/say]")

		saynn("She scoffs and crosses her arms, her hind paws spread out more, giving the rest of the body more support.")

		saynn("[say=avy]And why would I do that?[/say]")

		saynn("[say=pc]Because..[/say]")

		saynn("You step forward, towards the threatening foxy, still keeping eye contact with her.")

		saynn("[say=pc]..it's a very simple order. But if you do it, you will make me happy.[/say]")

		saynn("A soft, mean chuckle escapes her.")

		saynn("[say=avy]And why would I care about your happiness?[/say]")

		saynn("You cross your arms too, mirroring her action.")

		saynn("[say=pc]Because then I can reward you in some way. I can call you a good girl, for example.[/say]")

		saynn("[say=avy]Pff. That sounds so cringey. I will break your fucking kneecaps if you call me that.[/say]")

		saynn("You put on your most strict eyes that you have.")

		saynn("[say=pc]Stay still, Avy. It's not that hard, you know it.[/say]")

		saynn("Avy's jaw tightens, her lips twitching ever so slightly. She holds your stare for a long, tense moment, furrowing her brows. Then, with a huff of air, she plants her rear paws roughly on the same line and goes rigid, letting her arms go limp too.")

		saynn("[say=avy]Fine. There you go. Happy?[/say]")

		saynn("You put more authority into your voice.")

		saynn("[say=pc]Now. Look forward. Straight ahead, not at me. And don't move.[/say]")

		saynn("[say=avy]This is dumb-b-b.[/say]")

		saynn("She complies, focusing her annoyed stare on the wall behind you.")

		saynn("You wait a few seconds.. and then you begin to circle her, stepping around her, slowly and gradually. Your eyes begin inspecting her from every angle.")

		saynn("Avy's eyes track your movement for a bit, until you end up by her side, out of her sight. She doesn't dare to turn her head.")

		saynn("You see some things in her posture.")

		saynn("[say=pc]Fix your spine, bring shoulders back, push chest forward, make chin straight, lower your tail, put hands by your sides exactly.[/say]")

		saynn("She looks at you and growls.")

		saynn("[say=avy]I will fix your spine alright.. Best part is, you won't feel a thing.[/say]")

		saynn("You sigh.")

		saynn("[say=pc]Avy.. Keep looking forward.[/say]")

		saynn("She rolls her eyes and directs her gaze into a wall again. She slowly fixes all the things that you have mentioned, arching her back a bit, pulling her shoulders back, straightening her neck and chin.")

		saynn("Her tail goes low but the very tip still twitches with suppressed aggression.")

		saynn("[say=pc]That's better. Much better. A little too tense maybe. But that should go away over time.[/say]")

		saynn("She doesn't answer.. but her chest swells with a deeper breath.")

		saynn("You keep circling her, now ending up behind her, your {pc.feet} echoing softly against the concrete floor. Your eyes inspect her a little more from this angle. You feel a wild beast trapped in her body, ready to take over at any moment.")

		saynn("And yet, you still dare to approach her from behind, so close that she feels your breath on her shoulder.")

		saynn("Avy can only endure your presence for a few seconds before her whole body starts to shiver. She gives up and steps forward, quickly turning around.")

		saynn("[say=avy]Listen! This is fucking weird. I'm gonna punch you, I swear. Why are you fucking doing this shit?[/say]")

		saynn("[say=pc]I like how you look, Avy. I really do.[/say]")

		saynn("Her lips twitch, her snout does so too.")

		saynn("[say=avy]Don't say that! I don't care how you think I look! Fuck you.[/say]")

		saynn("[say=pc]Sorry if I'm making you uncomfortable. Was not my intent.[/say]")

		saynn("[say=avy]What was your intent then?![/say]")

		saynn("[say=pc]For the both of us, to have a good time.[/say]")

		saynn("[say=avy]Well, I'm not having a good time. I feel fucking weird![/say]")

		saynn("[say=pc]What makes it weird? Can you describe it please?[/say]")

		saynn("[say=avy]I don't fucking know. You're treating me like I'm a fucking princess! I'm not! I'm an evil bad bitch, you know?[/say]")

		saynn("Looking at her.. it does make sense. Maybe being soft with her isn't the right approach indeed. Hearing good things just seems to be making her feel weird and icky. Huh.. Maybe you can try something else then..")

		saynn("You put on your mean eyes.")

		saynn("[say=pc]Why don't you kneel for me then, bad bitch.[/say]")

		saynn("She blinks again, her eyes getting wider, her lips half-parted, stare confused at first.")

		saynn("[say=pc]I'm not walking to you. Approach me. And get on your knees. Now.[/say]")

		saynn("You keep your voice extremely strict.")

		saynn("Avy swallows audibly, her chin goes slightly lower as she does it, her gaze slips off of yours. She looks around, at only the entrance into this room.")

		saynn("[say=pc]No one is gonna enter. Only I'm gonna see it. Avy, look at me.[/say]")

		saynn("She blinks again and slowly establishes weak eye contact with you.")

		saynn("[say=pc]Do what I told you, don't annoy me.[/say]")

		addButton("Continue", "See what happens next", "avy_kneels")
	if(state == "avy_kneels"):
		playAnimation(StageScene.Duo, "stand", {npc="avy", npcAction="kneel"})
		saynn("[say=pc]I'm gonna grab your chin. Just to hold it. If you try to bite.. or even just growl.. this session is gonna end instantly. Do you understand that, little bitch?[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "avy_kneels"):
		processTime(3*60)

	setState(_action)
