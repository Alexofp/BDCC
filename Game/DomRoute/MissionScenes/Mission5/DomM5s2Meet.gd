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
		aimCameraAndSetLocName("mining_nearentrance")
		GM.pc.setLocation("mining_nearentrance")
		addCharacter("risha")
		playAnimation(StageScene.Duo, "dodge", {npc="risha", npcAction="kick"})
		saynn("When the bulky heavy doors screech open.. you're met with a wide knee kick! You manage to avoid it at the last moment.")

		saynn("It's her again.")

		saynn("[say=risha]Done hitting rocks already, huh? Well, I'm not done with you just yet.[/say]")

		saynn("[say=pc]You tucked your captain in and decided to come back for more?[/say]")

		saynn("She chuckles.")

		saynn("[say=risha]Captain went soft on you for whatever reason. I won't.[/say]")

		saynn("[say=pc]Maybe he likes me.[/say]")

		saynn("Risha spits to the side.")

		saynn("[say=risha]I like sluts too. The way their cries turn into moans after enough pounding.[/say]")

		saynn("[say=pc]Is that why you signed up for this job? Fucking sluts is all you care about?[/say]")

		saynn("She smiles.")

		saynn("[say=risha]It had some other benefits too. But smashing sluts won me over.[/say]")

		saynn("[say=pc]Shame if someone would turn you into one.[/say]")

		saynn("She grabs her stun baton and readies herself.")

		saynn("[say=risha]Ha. You fucking wish. Bring it on, whore.[/say]")

		saynn("Looks like it's a fight!")

		addButton("Fight", "Start the fight!", "do_start_fight")
	if(state == "lost_fight"):
		playAnimation(StageScene.GivingBirth, "idle")
		saynn("You lost the fight. Welp, what a shame.")

		saynn("Risha spends the next ten minutes bullying you. She pokes you with her stun baton a few times and also steps on you, allowing your face to meet with the cold, dirty floor.")

		saynn("But after that.. It looks like you are free to go. She got the anger out of her system.. while also damaging your self esteem in the process.")

		saynn("Oh well. Not the end of the world.")

		addButton("Get up", "Do get up", "lost_getup")
	if(state == "lost_getup"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You get up and swipe the dirt off of yourself and your outfit.")

		saynn("Probably best if you rest your bruises off.. Kait and Avy can wait.")

		saynn("Mission completed!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "won_fight"):
		playAnimation(StageScene.Duo, "stand", {npc="risha", npcAction="defeat"})
		saynn("You won! Risha hits the floor, defeated.")

		saynn("[say=risha]Not again! Ugh..[/say]")

		saynn("Her weapon rolls off to the side. She tries to reach for it.. but fails to do so.")

		saynn("You crouch near, catching eye contact with the bitchy lynx.")

		saynn("[say=pc]Maybe you like losing? Is that why you came back for me?[/say]")

		saynn("[say=risha]I am the Alpha of this prison. Fuck you.[/say]")

		saynn("[say=pc]But if I won, that means that I'm the Alpha now?[/say]")

		saynn("[say=risha]Um.. No.[/say]")

		saynn("She tilts her head and looks to the side, realizing the errors of her ways.")

		saynn("[say=pc]But I totally am.[/say]")

		saynn("[say=risha]Fuck you, that's not how it works![/say]")

		addButton("Leave", "Leave Risha be", "do_leave")
		addButton("Degrade", "Force Risha to act like a puppy", "do_degrade")
		addButtonWithChecks("BJ", "Make Risha blow you!", "do_bj", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Pussylick", "Make Risha eat you out!", "do_lick", [], [[ButtonChecks.HasReachableVagina]])
	if(state == "do_leave"):
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("As fun as it might be to torture her.. you have bigger fish to fry.")

		saynn("[say=pc]Get up, Alpha.[/say]")

		saynn("She gets up on all fours.. and starts crawling towards her weapon. You approach it faster and pick it up.")

		saynn("[say=risha]Hey! Give me my pain stick back.[/say]")

		saynn("[say=pc]It's your gift to me.[/say]")

		saynn("You make it spark to show that you know how to use it.")

		saynn("[say=risha]What? You fucker.[/say]")

		saynn("[say=pc]Now get the fuck out of my sight, Risha.[/say]")

		saynn("[say=risha]This ain't over, you know.[/say]")

		saynn("[say=pc]It sure ain't. Gonna beat your ass again the next time I see you.[/say]")

		saynn("She growls.. but makes herself leave in the end.")

		addButton("Continue", "See what happens next", "alone_missionend")
	if(state == "alone_missionend"):
		removeCharacter("risha")
		playAnimation(StageScene.Solo, "stand")
		aimCameraAndSetLocName("mining_nearentrance")
		GM.pc.setLocation("mining_nearentrance")
		saynn("You won. Good. Hopefully Risha learned her lesson.")

		saynn("Probably best if you rest your bruises off before you go after Alex Rynard.. Kait and Avy can wait.")

		saynn("Mission completed!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_degrade"):
		aimCameraAndSetLocName("mining_taviroom")
		addCharacter("risha", ["naked"])
		playAnimation(StageScene.SybianOral, "idle", {pc="risha", npc="pc", nosybian=true, bodyState={naked=true}})
		saynn("You grab Risha's stun baton and drag her heavy ass out of sight. It takes some time.. but you manage to rip off her armored plates and unzip her undersuit.")

		saynn("You're left panting after it all.. but at least Risha is now naked, on her knees before you.")

		saynn("[say=risha]Is that all you're got?[/say]")

		saynn("[say=pc]Now comes the fun part.[/say]")

		saynn("You press a button on the stun baton that makes it do scary blue sparks.")

		saynn("[say=pc]I want you to start barking.[/say]")

		saynn("She stares at you, her muzzle wrinkles.")

		saynn("[say=risha]What?[/say]")

		saynn("[say=pc]You heard me. Bark.[/say]")

		saynn("She frowns hard, her red eyes glaring at you.")

		saynn("[say=risha]I'm a lynx, you fucking freak. I don't fucking bark.[/say]")

		saynn("You press the baton against her thigh. The shock makes her yelp, her body jerking.")

		saynn("[say=risha]Ow! Fucker![/say]")

		saynn("She tries to catch the next attack.. but she only ends up shocking her paws. The electricity is making her hiss and grit her teeth, her whole body spasming in a derpy way.")

		saynn("[say=risha]Fuck! Okay, okay![/say]")

		saynn("She takes a breath.. and growls at you, showing her sharp fangs.")

		saynn("[say=pc]I'm waiting. Risha, you are not getting out of this without at least one bark.[/say]")

		saynn("She growls and then looks away.")

		saynn("[say=risha]..woof.[/say]")

		saynn("[say=pc]Louder.[/say]")

		saynn("[say=risha]FUCK YOU![/say]")

		saynn("You smack her huge tits with the baton, sending them to jiggle.. and also making Risha arch her back, a painful cry rushing out of her spasming lungs.")

		saynn("[say=risha]AGHHh..[/say]")

		saynn("[say=pc]I can keep going.[/say]")

		saynn("She is the one who is breathing heavily now, her growling is not so enthusiastic anymore.")

		saynn("[say=risha]Screw you.. woof.[/say]")

		saynn("[say=pc]What was that?[/say]")

		saynn("She grits her teeth more.")

		saynn("[say=risha]Woof![/say]")

		saynn("[say=pc]That's better. Now give me your paw. I wanna see a cute puppy.[/say]")

		saynn("She squints.")

		saynn("[say=risha]You can't be serious.[/say]")

		saynn("You raise the baton. Risha flinches instantly. Then slowly, reluctantly, she lifts one hand. You shake it for a moment.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("You give her a soft pat on the head. She takes it.")

		saynn("[say=risha]Really? I'm the best girl actually.[/say]")

		saynn("[say=pc]Best subby bitch, sure.[/say]")

		saynn("[say=risha]Nu huh. I'm Alpha.[/say]")

		saynn("[say=pc]Wag your tail for me, Alpha.[/say]")

		saynn("She glares at you again.")

		saynn("[say=risha]I don't have a tail to wag, you stupid. It's short, look at it![/say]")

		saynn("She indeed has a short tail.. but that's none of your problems. You poke her tits with the baton again, sending a painful impulse through them. Risha yelps, her whole body twitching.")

		saynn("[say=risha]Grrh.. fine..[/say]")

		addButton("Continue", "See what happens next", "risha_does_silly_beg")
	if(state == "risha_does_silly_beg"):
		playAnimation(StageScene.Beg, "beg", {pc="risha", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Risha starts wiggling her whole rear end, her short tail twitching back and forth. She is clumsy.. but still kinda cute.")

		saynn("[say=pc]Keep going. Bark.[/say]")

		saynn("[say=risha]Woof..[/say]")

		saynn("She keeps wiggling, her face gaining a red glow. Her cock is poking out of its sheath, despite everything. Or maybe it's because of everything.")

		saynn("[say=risha]This is stupid. You're stupid.[/say]")

		saynn("[say=pc]And yet you're doing it. Show me your puppy paws. Beg.[/say]")

		saynn("Spawning the sparks near her tits is enough for her to raise her paws and continue wiggling her rear.")

		saynn("[say=risha]..woof.. arf..[/say]")

		saynn("She looks at you with her most mean eyes possible. And yet she is doing the most silly thing possible. Cute.")

		addButton("Pat her", "Give her a pat", "silly_give_pat")
	if(state == "silly_give_pat"):
		playAnimation(StageScene.Beg, "pat", {pc="risha", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You reach out and pat her more. Much more this time. She flinches at first.. but then slowly relaxes into it. Her breathing calms down a bit.. her barbed cock is fully hard, a bead of pre hanging off of it.")

		saynn("[say=pc]Good. Good little bitch. So eager.[/say]")

		saynn("[say=risha]I hate you so much. Don't you dare tell anyone.[/say]")

		saynn("[say=pc]Maybe if you behave.[/say]")

		saynn("She growls.")

		saynn("You keep petting her. Risha's short tail wiggles again.")

		saynn("Enough silly stuff. You learn closer to her ear.")

		saynn("[say=pc]I'm keeping the stun baton. Now go the fuck away.[/say]")

		saynn("[say=risha]Really? Ugh..[/say]")

		saynn("She looks down at her sheath.")

		saynn("[say=pc]Your boner is not my problem. Scramble.[/say]")

		saynn("She picks up her armor pieces and the undersuit.. before leaving you be.")

		saynn("Finally, some peace.")

		addButton("Continue", "See what happens next", "alone_missionend")
	if(state == "do_bj"):
		aimCameraAndSetLocName("mining_taviroom")
		addCharacter("risha", ["naked"])
		playAnimation(StageScene.SybianOral, "idle", {pc="risha", npc="pc", nosybian=true, bodyState={naked=true}})
		saynn("You know just the thing that you can do with this bitch.")

		saynn("To start, you drag her heavy ass off to the side, away from any random passers. You pull her armored plates off and unzip her undersuit, leaving her naked on the floor.")

		saynn("[say=risha]If you do anything stupid, you're gonna regret it.[/say]")

		saynn("[say=pc]I wasn't the one who did a stupid thing. You came back.[/say]")

		saynn("You go through her things real quick. A ring gag.. perfect. You grab it.. as well as some chains and cuffs.")

		saynn("There are some crates here. They're filled with rocks and ore it seems.. impossible to move.. exactly what you need right now.")

		addButton("Crate", "Cuff Risha to one of the crates", "bj_make_helpless")
	if(state == "bj_make_helpless"):
		playAnimation(StageScene.SexOralTable, "tease", {pc="pc", npc="risha", bodyState={exposedCrotch=true, hard=true}, npcBodyState={naked=true}})
		saynn("It takes some time.. Risha is fucking heavy.. but you manage to pull her onto one of the crates. You grab her wrists and ankle.. and cuff them to the crate's many handles. The crate is big enough to support her body, only her head is hanging off of it.")

		saynn("She will obviously bite.. so you shove a ring gag into her mouth before she gets a chance to do so.")

		saynn("[say=risha]Fucking bitch![/say]")

		saynn("Then you expose your half-hard {pc.penis} and approach her. The shadow of your member shoots a shadow onto her mean face. She can see what you're gonna do, she growls and tries to bite.. but the metal ring doesn't give.")

		saynn("[say=pc]So fierce.[/say]")

		saynn("She glares from under you. So you give her a slap with your cock. Lovingly. The sudden fleshy impact confuses her for a second.")

		saynn("[say=pc]But still just a slut.[/say]")

		addButton("Continue", "See what happens next", "bj_in")
	if(state == "bj_in"):
		playAnimation(StageScene.SexOralTable, "suckinside", {pc="pc", npc="risha", bodyState={exposedCrotch=true, hard=true}, npcBodyState={naked=true}})
		saynn("You step closer, guiding your cock to her mouth. She tries to pull her head back but there is only so much she can do with all the chains and cuffs that are holding her. Her red eyes are burning with hate.")

		saynn("[say=pc]Fine. Alpha slut then.[/say]")

		saynn("You push in, letting the shaft of your member slide along her barbed tongue, the tip quickly meeting with the back of her mouth and going down her throat. She gags immediately, her throat clenching around you, tight and hot. Makes you groan.")

		saynn("[say=risha]Mmmphhh-![/say]")

		saynn("The crate cracks as she struggles, using her raw strength, trying to break free. But she only makes the cuffs dig into her wrists more. You pull back just enough to let her breathe, a thin string of saliva already connecting her lips to your cock.")

		saynn("[say=pc]That was just a start.[/say]")

		saynn("You push in again, deeper this time. Her gag reflex gets triggered hard. Her whole body jerks, her throat convulses around you. More saliva drips from the corners of her mouth this time, running down her face. You don't stop, you keep pushing until your crotch is pressed firmly against her snout.")

		saynn("She gags more.. violently. Her eyes start to water, her claws scraping against the crate. You hold her there for a moment, feeling her throat work, trying to push you out.")

		saynn("[say=pc]Fuck. What a tight bitch.[/say]")

		saynn("[say=risha]Mmmhhghh-..[/say]")

		addButton("Continue", "See what happens next", "bj_sex")
	if(state == "bj_sex"):
		playAnimation(StageScene.SexOralTable, "suck", {pc="pc", npc="risha", bodyState={exposedCrotch=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You pull back.. then thrust in again. The ring keeps her mouth open, giving you a perfect hole to use. You continue the rhythm, gradually speeding up. Each thrust makes her choke or gag, her throat making wet noises.")

		saynn("By now.. her own cock is out now. The barbed shaft is fully hard, poking out of its sheath, a bead of pre hanging from the tip.")

		saynn("[say=pc]Getting hard from this. You really are a slut.[/say]")

		saynn("Risha can only glare up at you, around your cock, her eyes still getting watery. She still tries to pull her head away.. so you put your hands around her neck to prevent that, keeping her still for you as you ravage this wet, tight throat.")

		addButton("Continue", "See what happens next", "bj_fast")
	if(state == "bj_fast"):
		playAnimation(StageScene.SexOralTable, "suckfast", {pc="pc", npc="risha", bodyState={exposedCrotch=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You speed up, fucking her throat harder. Her gag reflex is still triggering each time you ram it inside her, the bitch has zero control of it.. and it feels so good. You get a better grip on her neck and start really fucking her face.")

		saynn("[say=risha]Glk-.. glk-.. glk-..[/say]")

		saynn("Saliva is dripping everywhere, pooling beneath her head. She is a mess. A choking, gagging, drooling mess. Her cock is twitching with each your thrust. Your orgasm is approaching you fast..")

		saynn("[say=pc]Almost there. You gonna swallow, Alpha slut?[/say]")

		saynn("She tries to shake her head.")

		saynn("[say=pc]That's a yes. Got it.[/say]")

		addButton("Throatpie", "Cum down her throat", "bj_cum")
	if(state == "bj_cum"):
		playAnimation(StageScene.SexOralTable, "suckinside", {pc="pc", npc="risha", bodyState={exposedCrotch=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You thrust in deep one last time.. and stay there, letting Risha's clenching throat walls push you over the edge. You groan as your balls tense up, your {pc.penis} pulsing inside her.. before shooting thick strings of {pc.cum} straight down her mouth.")

		saynn("[say=pc]Swallow. Every drop.[/say]")

		saynn("Risha doesn't really have a choice. Her body is jerking.. but you don't pull out, keeping yourself buried, forcing her to take it. She gags around you, some seed finds its way back soon, shooting out of her nosestrills, adding to the mess.")

		saynn("You keep your cock there until you're done.. until you're sure she's taken all of it. By now, she begins to black out too.. good enough point to stop.")

		addButton("Continue", "See what happens next", "bj_after")
	if(state == "bj_after"):
		playAnimation(StageScene.SexOralTable, "tease", {pc="pc", npc="risha", bodyState={exposedCrotch=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("So you pull out. Slowly. A thick string of saliva and {pc.cum} stretches from Risha's lips to your tip. She instantly starts coughing, gasping, her chest rising and falling fast.")

		saynn("[say=pc]You're a bad cock sucker. But I've had my fun with you.[/say]")

		saynn("She glares.. but can't do anything against you wiping your cock on her cheek, smearing the mess into her fur.")

		saynn("Then you step back. Her cock is still mega hard, neglected, bobbing in the air. She is still chained to the crate, naked, messy. Might as well just leave her like that.")

		saynn("[say=pc]Someone will find you. I'm sure.[/say]")

		saynn("She growls and starts thrashing against the cuffs. You turn and walk away.")

		addButton("Continue", "See what happens next", "endthescene_rem_ringag")

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

	if(_action == "do_start_fight"):
		runScene("FightScene", ["risha", "secondDomFight"], "rishaFight")
		return

	if(_action == "lost_getup"):
		GM.main.MS.completeMission()

	if(_action == "do_leave"):
		addMessage("You got Risha's stunstick!")
		var theStunBaton = GlobalRegistry.createItem("StunBaton")
		theStunBaton.charges = 10 # yooo, special stun baton
		GM.pc.getInventory().addItem(theStunBaton)

	if(_action == "alone_missionend"):
		GM.main.MS.completeMission()

	if(_action == "silly_give_pat"):
		addMessage("You got Risha's stunstick!")
		var theStunBaton = GlobalRegistry.createItem("StunBaton")
		theStunBaton.charges = 10 # yooo, special stun baton
		GM.pc.getInventory().addItem(theStunBaton)

	if(_action == "bj_make_helpless"):
		processTime(5*60)
		putOn("risha", "ringgag")
		pullShortsDown("pc")

	if(_action == "bj_cum"):
		getCharacter("risha").cummedInMouthBy("pc")
		GM.pc.orgasmFrom("risha")

	if(_action == "endthescene_rem_ringag"):
		putOff("risha", "ringgag")
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "rishaFight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_fight")
			addExperienceToPlayer(50)
		else:
			setState("lost_fight")
			addExperienceToPlayer(5)
			processTime(60*10)
