extends SceneBase

func _init():
	sceneID = "DomM5s2Meet"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		addCharacter("kait")
		saynn("You run into Kait suddenly. She is standing near the end of the corridor, her arms crossed.")

		saynn("[say=pc]Kait? Didn't we agree to meet down at the workshop?[/say]")

		saynn("Her ears twitch.")

		saynn("[say=kait]Yeah. I'm just making sure. I will catch up with you.[/say]")

		saynn("[say=pc]What are you doing exactly?[/say]")

		saynn("She pouts at the question, her claws digging into her arms.")

		saynn("[say=kait]Nothing! Just making sure Avy doesn't slack off somewhere again![/say]")

		saynn("[say=pc]She didn't last time. She saved you.[/say]")

		saynn("Your words make her roll her eyes.")

		saynn("[say=kait]You saved me.[/say]")

		saynn("[say=pc]We both did.[/say]")

		saynn("She shakes her head, her shoulders getting all tense. She leans in close to you and gets quieter.")

		saynn("[say=kait]I'm sure she had something to do with the ambush in the first place. I can feel it.[/say]")

		saynn("[say=pc]Don't be weird, Kait.[/say]")

		saynn("Ans and Avy both catch up with you. Looks like they were talking about something. Just like you.")

		saynn("[say=kait]Finally![/say]")

		saynn("[say=avy]What's the hold up? Move your butts![/say]")

		saynn("Might as well stick together then.")

		addButton("Continue", "See what happens next", "walk_to_elevator")
	if(state == "walk_to_elevator"):
		aimCameraAndSetLocName("hall_elevator")
		addCharacter("avy")
		addCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {pc="kait", npc="avy"})
		saynn("You walk through the main hall and enter the elevator together. The doors slide shut with an annoying metal noise. Kait stands in the corner, arms still crossed, watching Avy who just leans against the wall like she owns it.")

		saynn("[say=announcer]It's rare for me to be out here.[/say]")

		saynn("[say=pc]Don't you have a cell?[/say]")

		saynn("[say=announcer]I do. I rarely use it.[/say]")

		saynn("[say=pc]I didn't see a bed in your office.[/say]")

		saynn("Avy offers a small shrug.")

		saynn("[say=announcer]I sleep on the floor. About as comfy as the beds that they're giving us.[/say]")

		saynn("[say=avy]My back hurts just hearing about that.[/say]")

		saynn("[say=announcer]You get used to it. You get used to anything. That's called adapting.[/say]")

		saynn("Finally, the elevator arrives at the mineshaft floor.")

		addButton("Continue", "See what happens next", "sudden_cap")
	if(state == "sudden_cap"):
		addCharacter("captain")
		addCharacter("risha")
		aimCameraAndSetLocName("mining_elevator")
		playAnimation(StageScene.Duo, "stand", {npc="captain"})
		saynn("The doors open.. revealing two figures.. two very familiar figures.")

		saynn("The captain. And his guard, Risha.")

		saynn("Your gazes meet. All four of you freeze up completely. Kait's tail goes stiff. Avy pushes away from the wall.")

		saynn("The captain is the first one to speak, his voice calm and casual.")

		saynn("[say=captain]Hey there, inmates. Mind stepping out for us?[/say]")

		saynn("Risha smirks beside him, her hand resting on her weapon. She eyes each of you like a piece of meat.")

		saynn("[say=risha]Yeah, free the space, you sluts.[/say]")

		saynn("[say=avy]Who are you calling sluts?[/say]")

		saynn("Avy tries to step forward but Ans is quick to block the path with his cane.")

		saynn("[say=announcer]Chill, Avy. No need for this.[/say]")

		saynn("Indeed, there is no reason to be hostile right now. You step out of the elevator. The captain inspects you all with mild interest.")

		saynn("[say=captain]All heading to the mines, I assume?[/say]")

		saynn("Ans shrugs, looking calm.")

		saynn("[say=announcer]Something like that. Can't talk for everyone here.[/say]")

		saynn("[say=captain]I suggest the workshop. A much better way of spending your time. Easier on your mind, saves your health too.[/say]")

		saynn("[say=announcer]Will keep that in mind.[/say]")

		saynn("The captain nods, already turning away.")

		saynn("[say=captain]Well then. I won't hold you for much longer. Carry on, inmates.[/say]")

		addButton("Continue", "See what happens next", "risha_sudden")
	if(state == "risha_sudden"):
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("The captain was stepping inside the elevator.. but then Risha stops him.. while glaring at you. Her hand is still on her weapon.")

		saynn("[say=risha]Wait. That's the bitch that was snooping around on the upper floors.[/say]")

		saynn("This stops the captain and makes him put his attention towards you again.")

		saynn("[say=captain]Oh yeah? Now I'm curious. What were you doing there, inmate?[/say]")

		saynn("The tension is rising fast. Everyone is looking at you. There is no real good explanation for it, is there?")

		addButton("Got lost", "Say that you got lost", "cap_say_got_lost")
		addButton("A way out", "Say that you were looking for a way out of this prison", "cap_say_way_out")
	if(state == "cap_say_got_lost"):
		playAnimation(StageScene.Duo, "stand", {npc="captain"})
		saynn("[say=pc]I've got lost.[/say]")

		saynn("He raises a brow. His eyes narrow slightly, studying you.")

		saynn("[say=captain]You leave a trail of beat up guards each time you get lost?[/say]")

		saynn("[say=pc]Not my problem that they're all such pushovers.[/say]")

		saynn("He chuckles, his expression softens.")

		saynn("[say=captain]Indeed. Maybe I should hire better ones.[/say]")

		saynn("Risha didn't like that one.")

		saynn("[say=risha]Hey![/say]")

		saynn("[say=captain]You're fine, Risha.[/say]")

		saynn("[say=risha]That bitch was snooping around, doing whatever, throwing punches, and you're just gonna let {pc.him} walk?[/say]")

		saynn("The captain does a hand waving gesture.")

		saynn("[say=captain]Yeah. Because if you can't win with all the advantages that you have, it's on you. There is only so much I can do to help, you know.[/say]")

		saynn("He offers Risha a kind smile.")

		saynn("[say=risha]Pff. Whatever.[/say]")

		saynn("The captain looks at you again.")

		saynn("[say=captain]The bigger the crime, the bigger the punishment. Don't forget that.[/say]")

		saynn("They just leave after that. The captain steps into the elevator, and Risha follows, shooting one last glare over her shoulder. The doors slide shut.")

		addButton("Continue", "See what happens next", "after_cap")
	if(state == "cap_say_way_out"):
		playAnimation(StageScene.Duo, "stand", {npc="captain"})
		saynn("[say=pc]Looking for a way out.[/say]")

		saynn("He chuckles, his expression softens.")

		saynn("[say=captain]And how did it go? Found one?[/say]")

		saynn("[say=pc]Take a guess.[/say]")

		saynn("He tilts his head, inspecting you further. His smirk doesn't fade.")

		saynn("[say=captain]Hah. Who knows, maybe you did. But then you decided to stay.[/say]")

		saynn("[say=pc]Why would I want to stay here?[/say]")

		saynn("[say=captain]You'd be surprised, inmate. I don't call this place a paradise for no reason.[/say]")

		saynn("A paradise. What a joke.")

		saynn("[say=pc]Sure.[/say]")

		saynn("[say=captain]Just be careful next time. The bigger the crime, the bigger the punishment.[/say]")

		saynn("Risha growls suddenly.")

		saynn("[say=risha]That bitch was snooping around, trying to find a way to escape, and you're just gonna let {pc.him} walk?[/say]")

		saynn("The captain doesn't even look at her. He keeps his eyes on you.")

		saynn("[say=captain]Yeah. Because there is no way to escape. Simple as that.[/say]")

		saynn("That's a bold statement.")

		saynn("[say=risha]Right. Pff.[/say]")

		saynn("They just leave after that. The captain steps into the elevator, and Risha follows, shooting one last glare over her shoulder. The doors slide shut.")

		addButton("Continue", "See what happens next", "after_cap")
	if(state == "after_cap"):
		aimCameraAndSetLocName("mining_nearentrance")
		removeCharacter("captain")
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {pc="kait", npc="announcer"})
		saynn("[say=kait]What the fuck was that?[/say]")

		saynn("Kait's tail wags behind her, annoyed. She paces near the elevator doors back and forth.")

		saynn("[say=announcer]We've run into the captain. He seemed.. kind.[/say]")

		saynn("[say=kait]He thinks he is better than us. It's not fucking kindness. It's.. I don't know.. feeling of superiority. Having power over all of us makes him all smug and shit.[/say]")

		saynn("[say=announcer]Not sure if I agree, Kait. He seems to genuinely care.[/say]")

		saynn("Ans shrugs, his expression calm.")

		saynn("[say=avy]Who gives a fuck, he is not suspicious of us, that's all that matters.[/say]")

		saynn("[say=announcer]True. Let's just go take a look at our foxy already. He has orange fur, two square marks on each cheek. Should be easy enough to spot.[/say]")

		addButton("Continue", "See what happens next", "in_workshop")
	if(state == "in_workshop"):
		aimCameraAndSetLocName("eng_workshop")
		playAnimation(StageScene.Duo, "stand", {npc="announcer"})
		saynn("You enter the workshop itself.")

		saynn("A bunch of workbenches are littered around the space, all have a different purpose. There are no guards here.. but there are quite a few engineers present. Too many for you to just fight without consequences. The air smells of oil and hot metal. Sparks fly from one of the tools in the corner.")

		saynn("Kait sticks close to the walls, her eyes darting around. Avy leans against a wall and lazily looks around. Ans focuses on a single person.")

		saynn("Orange foxy.. you see him too now.. With black marks on his muzzle.. the description checks out. He is standing behind one of the workbenches, working on something, barely paying any attention.")

		saynn("[say=announcer]Time to make my move. You all stay out of sight.[/say]")

		saynn("[say=kait]You got this.[/say]")

		saynn("[say=avy]Break a leg.[/say]")

		saynn("Ans inhales deeply, fidgets his cane a bit.. and starts walking towards the guy.")

		addButton("Continue", "See what happens next", "ans_approach_alex")
	if(state == "ans_approach_alex"):
		playAnimation(StageScene.Duo, "stand", {pc="announcer", npc="alexrynard"})
		addCharacter("alexrynard")
		saynn("Ans approaches the busy foxy. His cane clicks softly against the concrete floor.. but Alex doesn't look up from his work.")

		saynn("[say=announcer]Hey there. Just wanna say, I always admire the sight of a passionate crafter.[/say]")

		saynn("Alex doesn't even turn his head. His hands keep working on some circuit board.")

		saynn("[say=alexrynard]Save your compliments.[/say]")

		saynn("Ans stands a respectful distance away, both hands resting on his cane.")

		saynn("[say=announcer]My bad. Sometimes I forget that not everybody here is an extraverted narcissist with an ego problem.[/say]")

		saynn("Foxy shrugs subtly, his eyes directed down at the unfinished prototype.")

		saynn("[say=alexrynard]I can tell that you want something. My answer is gonna be no.[/say]")

		saynn("[say=announcer]Very fair. You saw right through me, indeed. It's just.. I'm an old man. I have this cane here..[/say]")

		saynn("Ans presents his mic-cane. He lifts it slightly, tilting it so the light catches the chrome. And that actually makes Alex turn his head for once, his eyes narrow. He doesn't say anything though.")

		saynn("[say=announcer]The attached microphone has been getting a little noisy. Not looking for free labor, I have the credits. But I won't bug you any longer, I can try my luck with the other engineers.[/say]")

		saynn("Ans moves the cane away and leans on it, already turning around so he can leave.")

		saynn("[say=alexrynard]Stop. Let me take a look.[/say]")

		saynn("Ans pauses mid-step.. then returns back.")

		saynn("[say=announcer]Of course.[/say]")

		saynn("Ans hands his cane to Alex. The foxy does a quick examination with his eyes from all angles, his gaze sharp. Then he grabs a screwdriver and begins disassembling it.")

		saynn("[say=alexrynard]Right. Give me a few minutes.[/say]")

		saynn("[say=announcer]Will forty credits be enough? I know that audio tech often needs a special touch. I'm ready to pay extra.[/say]")

		saynn("Alex shakes his head. He takes off the metal cover, exposing some wires and green boards. There is some kind of glass tube in the middle that covers more electronics. He quickly goes through it all.")

		saynn("[say=alexrynard]Save your creds, old man.[/say]")

		saynn("[say=announcer]Appreciate it. Really.[/say]")

		saynn("Foxy pulls out a multimeter and starts poking the electric board in different places. The device beeps softly. He quickly narrows the search area down to a single component.")

		saynn("[say=alexrynard]One of the capacitors is leaking. I will switch it for a better one.[/say]")

		saynn("[say=announcer]This cane might be older than me, can you believe that?[/say]")

		saynn("The engineer nods, already reaching for a small locked drawer of parts.")

		saynn("[say=alexrynard]A lot of the things here are old and slowly breaking down. AlphaCorp has better places to waste its capital on.[/say]")

		saynn("Alex uses a soldering iron to remove the busted capacitor and replace it with a new one. He uses a magnifier glass to see better.")

		saynn("[say=announcer]Like wars.[/say]")

		saynn("[say=alexrynard]Like wars.[/say]")

		saynn("He seems to be mostly done. He tests the same spot using the multimeter and seems satisfied-enough.")

		saynn("[say=announcer]Can I ask you something?[/say]")

		saynn("Foxy's voice is just as cold.")

		saynn("[say=alexrynard]No. But you can try.[/say]")

		saynn("Alex puts the current tools away and reaches for the screwdriver again.")

		saynn("[say=announcer]If you had a chance to go against AlphaCorp, would you go for it?[/say]")

		saynn("Foxy stops for a second.. to give one glaring look to Ans.")

		saynn("[say=alexrynard]Good joke. No. I'm just a single fox.[/say]")

		saynn("[say=announcer]You might not be alone, you know. Some people here share the same views.[/say]")

		saynn("Foxy's brows do a small bounce.")

		saynn("[say=alexrynard]Many things are being shared here. I don't wanna become one of them.[/say]")

		saynn("[say=announcer]You don't understand.[/say]")

		saynn("The screwdriver lands on the bench with a loud stomp, Alex is quick to respond.")

		saynn("[say=alexrynard]I do. I understand what you're offering. My answer is the same.[/say]")

		saynn("Ans reacts with a calm response.")

		saynn("[say=announcer]My offer is special. Once in a lifetime.[/say]")

		saynn("[say=alexrynard]Listen. I did some very bad stuff. I deserve to be where I am. I was a prisoner here before. I don't wanna become one again. I'm done doing risky shit. I just wanna live my life. In peace. Alone is fine.[/say]")

		saynn("Foxy's breathing has a growly aftertone to it now. He keeps eye contact with Ans, his brows furrowed.")

		saynn("Looks like the words haven't moved him even slightly.")

		saynn("[say=announcer]I'm sorry for wasting your time.[/say]")

		saynn("[say=alexrynard]You're good. If the mic starts breaking down again, bring it straight to me. I see that it has some custom shit tucked in. Want me to check that too? Might take a minute.[/say]")

		saynn("[say=announcer]No need to, it's just a voice processing unit, autotune and all that. Appreciate it.[/say]")

		saynn("Alex quickly screws the metal cover back, completing the repair.")

		saynn("[say=alexrynard]Mhm.[/say]")

		saynn("He hands Ans the cane and returns to his prototype.")

		saynn("It was time to leave.. but Ans is refusing, staying near him for an uncomfortable amount of time. So much that he got the foxy's attention again.")

		saynn("[say=announcer]I.. I wanted to say..[/say]")

		saynn("[say=alexrynard]What?[/say]")

		saynn("He sounds annoyed now.")

		saynn("[say=announcer]Nothing. I will let you be.[/say]")

		saynn("Ans returns to you.")

		addButton("Continue", "See what happens next", "ans_back_after_fail")
	if(state == "ans_back_after_fail"):
		aimCameraAndSetLocName("mining_near_eng")
		removeCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="announcer"})
		saynn("You step out of the workshop as to not attract any extra attention.")

		saynn("[say=avy]Not even your smooth voice is enough to drill though this deaf wall, Ans.[/say]")

		saynn("[say=announcer]I don't know, Avy. At least I gave it a fair shot.[/say]")

		saynn("[say=kait]It's okay. We didn't get busted, all is good. He doesn't want to do it the easy way. That's fine.[/say]")

		saynn("[say=avy]He is a staffer, we just gotta break him and be done with it.[/say]")

		saynn("[say=announcer]That.. you will have to do without me. Don't go too rough on him, alright?[/say]")

		saynn("[say=kait]Depends on how much choice he will leave to us.[/say]")

		saynn("[say=avy]I guess we might as well bring the other sluts onto this one. Rahi and the blue one.[/say]")

		saynn("[say=kait]You think we can't beat up a single depressed engi? I thought you're strong, Avy.[/say]")

		saynn("[say=avy]Open your eyes, pipsqueak. He is not alone. You can take many cocks at once but even you would crumble from such a giant gangbang.[/say]")

		saynn("[say=announcer]Avy is right. Make a plan.[/say]")

		saynn("[say=kait]Grr-r.. Fine, let's go gather them up.[/say]")

		addButton("Continue", "See what happens next", "they_leave")
	if(state == "they_leave"):
		setCharacters([])
		playAnimation(StageScene.Solo, "stand")
		saynn("They let you be. You stay and swim in your thoughts for a minute.")

		saynn("Maybe there is something you can do. A plan is brewing. But it will have to wait. You did enough for now, might as well go back to your cell and rest.")

		saynn("You approach the elevator.. and press the call button. Something rotten in the air.")

		addButton("Continue", "See what happens next", "sudden_risha")
	if(state == "sudden_risha"):
		aimCameraAndSetLocName("mining_elevator")
		addCharacter("risha")
		playAnimation(StageScene.Duo, "dodge", {npc="risha", npcAction="kick"})
		saynn("When the bulky heavy doors screech open.. you're met with a wide knee kick! You manage to avoid it at the last moment.")

		saynn("It's her again.")

		saynn("[say=risha]Done hitting rocks already, huh? Well, I'm not done with you just yet.[/say]")

		saynn("[say=pc]You tucked your captain in and decided to come back for more?[/say]")

		saynn("[say=risha]Captain went soft on you for whatever reason. I won't.[/say]")

		saynn("[say=pc]Maybe he likes me.[/say]")

		saynn("[say=risha]I like sluts too. The way their cries turn into moans after enough pounding.[/say]")

		saynn("[say=pc]Is that why you signed up for this job? Fucking sluts is all you care about?[/say]")

		saynn("[say=risha]It had some other benefits too. But smashing sluts won me over.[/say]")

		saynn("[say=pc]Shame if someone would turn you into one.[/say]")

		saynn("[say=risha]Ha. You fucking wish. Bring it on, whore.[/say]")

		saynn("Looks like it's a fight!")

		addButton("Fight", "Start the fight!", "do_start_fight")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "walk_to_elevator"):
		processTime(5*60)

	if(_action == "ans_back_after_fail"):
		processTime(5*60)

	if(_action == "they_leave"):
		processTime(120)

	setState(_action)
