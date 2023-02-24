extends SceneBase

func _init():
	sceneID = "Ch4s1SolitaryScene"

func _run():
	if(state == ""):
		GM.pc.setLocation("solitary_cell")
		playAnimation(StageScene.HangingDuo, "idle", {npc="tavi", npcAction="kneel", bodyState={naked=true}, npcBodyState={naked=true}})
		aimCameraAndSetLocName("solitary_cell")
		addCharacter("tavi", ["naked"])
		saynn("You hear a loud click as one of the lights has turned on automatically.")

		saynn("Your sleep wasn't the best. Being cuffed to something above you means your neck didn't receive any support. But that seems to be the least of your concerns.")

		saynn("You slowly open your eyes. Even though there are lights here, they barely give off any light. The concrete walls are of a dark color too, making the whole space look.. cramped.")

		saynn("You're in a small.. room? A small rectangular box with 3 of the walls being this dark concrete and the last one being some kind of thick glass panel. No furniture. Your hands are cuffed and chained to one of the ceiling hooks while Tavi is cuffed to the wall instead. Both of you.. naked.. stripped of any dignity.")

		addButton("Tavi?", "Check if she is okay", "poke_tavi")
	if(state == "poke_tavi"):
		saynn("Tavi stands out a lot in this room, her glowing spots are the brightest source of light here. At least it's warm enough here. And you haven't seen any rats.. yet.")

		saynn("[say=pc]Tavi? You're alright?[/say]")

		saynn("You can't tell if her eyes are closed.")

		saynn("[say=pc]Miss Tavi?[/say]")

		saynn("[say=tavi]Mhm..[/say]")

		saynn("Behind the glass there seems to be a long corridor that goes somewhere. The glass itself doesn't even have a door. There are no doors to get out of this place in fact.")

		saynn("[say=pc]Where are we?[/say]")

		saynn("[say=tavi]Solitary. I'm usually alone here.[/say]")

		saynn("[say=pc]How long?[/say]")

		saynn("Tavi shrugs. Slowly. Her silent shrug tells you a lot.")

		addButton("Continue", "See what happens next", "show_questions")
	if(state == "show_questions"):
		saynn("Since you seem to be here for a while, you might as well ask some questions.")

		addButton("Plan failed", "Ask her why the plan didn't work", "ask_plan")
		addButton("Voice", "Ask about the voice from the transmitter", "ask_voice")
		addButton("Kait", "Ask about Kait", "ask_kait")
		addButton("Nova", "Ask about Nova", "ask_nova")
		addButton("What now?", "Ask about the next move", "ask_next")
	if(state == "ask_plan"):
		saynn("[say=pc]What went wrong?[/say]")

		saynn("Tavi rattles her chains idly.")

		saynn("[say=tavi]You saw what went wrong. Bluespace crystal can exchange energy and data over any distance. That's why they encrypt their messages.[/say]")

		saynn("[say=pc]We heard the Syndicate people though. Just couldn't talk with them.[/say]")

		saynn("[say=tavi]Yeah, AlphaCorp isn't dumb. When they stole the technology, they kept Syndicate's cryptography keys. But only the ones used for decryption it seems.[/say]")

		saynn("A few seconds of silence.")

		saynn("[say=pc]So it was all for nothing? Again?[/say]")

		saynn("Tavi hears your annoyed tone. She looks at you and offers a modest smile.")

		saynn("[say=tavi]Not quite, cutie. But it could have gone better, you're right.[/say]")

		addButton("Continue", "Ask something else", "show_questions")
	if(state == "ask_voice"):
		saynn("[say=pc]What was that voice? A female one. It sounded.. too perfect. Almost robotic.[/say]")

		saynn("Tavi tilts her head down.")

		saynn("[say=tavi]That's Elena. My ship's ai.[/say]")

		saynn("[say=pc]You have a ship? With an ai?![/say]")

		saynn("Tavi chuckles softly and looks at you.")

		saynn("[say=tavi]Yeah, cutie. I'm a hacker but sometimes I get traced back. And then I have to jump planets.[/say]")

		saynn("Wow.")

		saynn("[say=tavi]But it quickly gets lonely out there, you know.[/say]")

		saynn("[say=pc]What will Elena do?[/say]")

		saynn("[say=tavi]I.. I don't know. She has free will so she might do anything. Or nothing. I didn't have enough time to tell her what to do.[/say]")

		addButton("Continue", "Ask something else", "show_questions")
	if(state == "ask_kait"):
		saynn("[say=pc]You have to tell me who Kait is.[/say]")

		saynn("Tavi throws her head back and watches the ceiling.")

		saynn("[say=tavi]I can't believe it. That bitch..[/say]")

		saynn("[say=pc]Tavi?[/say]")

		saynn("[say=tavi]Spreading her legs for the captain.. being his personal playtoy probably.[/say]")

		saynn("[say=pc]Tavi![/say]")

		saynn("She snaps out of it after you bark at her.")

		saynn("[say=tavi]I helped her around when she first arrived here. We became 'friends'. Kinda like you and me, you know..[/say]")

		saynn("[say=pc]You have a unique way of making friends for sure.[/say]")

		saynn("The feline chuckles softly.")

		saynn("[say=tavi]Yeah. But she enjoyed it, you know? She might look tough but she is very submissive on the inside. Just not very.. obedient.[/say]")

		saynn("[say=pc]Did you tell her to bring an apple too?[/say]")

		saynn("[say=tavi]Nah, her task was to get her pussy stuffed with cum.[/say]")

		saynn("You raise a brow.")

		saynn("[say=pc]And?[/say]")

		saynn("[say=tavi]The slut had a white trail behind her.[/say]")

		saynn("You both chuckle.")

		addButton("Continue", "Ask something else", "show_questions")
	if(state == "ask_nova"):
		saynn("[say=pc]You seem to have a lot of.. connections.[/say]")

		saynn("[say=tavi]That's what happens when you spend so much time here.[/say]")

		saynn("[say=pc]You and Nova..[/say]")

		saynn("Tavi blushes and tries to look away. But she can't hide her blush entirely, it glows green just like her spots.")

		saynn("[say=pc]She is not your mother, is she?[/say]")

		saynn("[say=tavi]No..[/say]")

		saynn("[say=pc]You don't wanna share?[/say]")

		saynn("[say=tavi]I tried to blackmail her, okay?[/say]")

		saynn("Tavi looks at you, her eyes are watery again.")

		saynn("[say=tavi]It didn't go as planned. Well, it did. But then it backfired.[/say]")

		saynn("[say=pc]And this is what she did to you as revenge?[/say]")

		saynn("Tavi's eyes avoid yours when the eye contact happens. She nods subtly. You feel like you shouldn't press further or she will cry again.")

		addButton("Continue", "Ask something else", "show_questions")
	if(state == "ask_next"):
		saynn("[say=pc]So.. What's next?[/say]")

		saynn("Tavi presses the back of her head against the cold wall. A few seconds pass.")

		saynn("[say=tavi]I.. I'm not sure.[/say]")

		saynn("Her answer.. it kinda annoys you. After everything you did for her. And she doesn't even know what she wants.")

		saynn("[say=pc]Well, what was the big plan then? Why are you doing this in the first place?[/say]")

		saynn("She gives you a questioning look.")

		saynn("[say=pc]Why are you trying to escape? What's the point of all of this?[/say]")

		saynn("[say=tavi]I have unfinished business, cutie.[/say]")

		saynn("[say=pc]What business? You think I don't deserve to know?[/say]")

		saynn("Tavi stares down at the floor. Thinking.")

		saynn("[say=tavi]It will take a while to explain, cutie.[/say]")

		saynn("[say=pc]Look around. We have all the time in the world.[/say]")

		saynn("Tavi lets the silence linger for a few more seconds. Until finally breaking it.")

		saynn("[say=tavi]You're right. Well.. Make yourself comfy. As much as you can. It's a long story, like I said. And it's not a pretty one.[/say]")

		addButton("Listen carefully", "Immerse yourself into it", "start_flashback")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ask_next"):
		processTime(20*60)

	if(_action == "start_flashback"):
		runScene("Ch4s2TaviFlashbackIntroScene")
		endScene()

	setState(_action)
