extends SceneBase

func _init():
	sceneID = "AlexCh2s2BackstoryScene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("[say=pc]I do.[/say]")

		saynn("Alex leans back, a quiet metal clang can be heard when he rests against the stiff bench.")

		saynn("[say=alexrynard]Well.. I was young. Very-very young.[/say]")

		saynn("He starts telling you his story.. and you can't help but to get immersed into it..")

		addButton("Continue", "See what happens to Alex", "start_story")
	if(state == "start_story"):
		removeCharacter("alexrynard")
		addCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npc="captain"})
		saynn("[say=alexrynard]Listen, the only reason why I'm here is because it's my break, Mister Wright.[/say]")

		saynn("[say=captain]Of course, I won't take up much of your time. But I think you'd be very interested in my little proposal. Shall we?[/say]")

		saynn("He offers to take seats behind the table.")

		saynn("[say=alexrynard]Sure, make it quick.[/say]")

		addButton("Take a seat", "Talk with him", "sit_behind_table")
	if(state == "sit_behind_table"):
		playAnimation(StageScene.Duo, "sit", {pc="alexrynardy", npcAction="sit", npc="captain"})
		saynn("You and Mr. Wright are sitting opposite each other. A waitress approaches you two.")

		saynn("[sayFemale]Are you guys ready to order?[/sayFemale]")

		saynn("[say=captain]Yeah, I wouldn't mind a cup of coffee.[/say]")

		saynn("The waitress looks at you.")

		saynn("[sayFemale]What about you, Alex? The usual?[/sayFemale]")

		saynn("You place your lunchbox onto the table.")

		saynn("[say=alexrynard]Yeah, I'm good.[/say]")

		saynn("[say=captain]Scratch that, give us 2 coffee cups please.[/say]")

		saynn("[sayFemale]Oh, sure. Two coffees coming right up.[/sayFemale]")

		saynn("Waitress swiftly leaves with the order. You open the lunchbox and grab a piece of pizza from it.")

		saynn("[say=alexrynard]Hope you don't mind. I'm hungry as fuck.[/say]")

		saynn("Mister Wright nods.")

		saynn("[say=captain]I'm thinking of starting a little initiative. I was given an opportunity. An opportunity to change the world. I don't want to waste it. I think we share that in common.[/say]")

		saynn("[say=alexrynard]Yeah, sure. But what does your opportunity have to do with me?[/say]")

		saynn("You take a big bite, your thoughts are focused completely elsewhere at the moment.")

		saynn("[say=captain]I need people. There will be a lot of work. Engineering work especially. We're talking big, space station big.[/say]")

		saynn("[say=alexrynard]Uh huh.[/say]")

		saynn("The waitress returns with 2 coffees and a shiny smile.")

		saynn("[say=captain]Thank you.[/say]")

		saynn("[sayFemale]If you need anything else, let me know~.[/sayFemale]")

		saynn("[say=captain]Of course.[/say]")

		saynn("Mister Wright sips some of the coffee.")

		saynn("[say=captain]I can't share all of the details. Corporation secrets. But I think I can offer a better pay then whatever you're earning currently. We can talk numbers if you want.[/say]")

		saynn("You take another good bite and top it off with a gulp of free coffee. At least you got something out of this.")

		saynn("[say=alexrynard]Listen, I'm truly sorry. But I'm so fucking busy currently, you can't even imagine it. Whatever you can offer me is nothing compared to what I might get here.[/say]")

		saynn("He listens carefully and nods, his expression neutral.")

		saynn("[say=captain]You're talking about the AlphaTech Expo?[/say]")

		saynn("[say=alexrynard]Yeah, man. First place will get unlimited funding for their project. Can you imagine it? Can you offer me more than infinity?[/say]")

		saynn("He sighs.")

		saynn("[say=captain]I can't. My offer comes with less risks though. And work that you would enjoy. I know that words won't change your mind. But I suggest you consider my offer anyway.[/say]")

		saynn("You quickly finish eating your pizza slice and drink as much coffee as your mouth can endure.")

		saynn("[say=alexrynard]I'm working on my dream already, you won't be able to top that.[/say]")

		saynn("You stand up, preparing to leave.")

		saynn("[say=captain]That's true. Well, if you ever change your mind..[/say]")

		saynn("He offers you his business card. But you just ignore it.")

		saynn("[say=alexrynard]Yeah, never.[/say]")

		addButton("Continue", "See what happens next", "alex_intro_engine")
	if(state == "alex_intro_engine"):
		removeCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npc="lin_alex"})
		addCharacter("lin_alex")
		saynn("You swiftly exit the station's canteen and follow the many tight corridors back to your current workplace, an old spaceship hangar that was remodeled into a big workshop.")

		saynn("In the middle of it.. it's heart.. a half-disassembled rocket engine. Around it.. your team. Everyone seems to be working. Good.")

		saynn("[say=alexrynard]Alright, I'm back. How are we doing? Is everything ready for a test-run?[/say]")

		saynn("[say=lin_alex]Yeah, the boys are doing some finishing touches. How did your meeting go?[/say]")

		saynn("Lin tilts her head ever so slightly, her sly foxy eyes staring at you.")

		saynn("[say=alexrynard]The guy wanted me to stop doing what I'm doing and go work for him. He is crazy.[/say]")

		saynn("She chuckles softly.")

		saynn("[say=lin_alex]Maybe we are the crazy ones and just don't see it?[/say]")

		saynn("[say=alexrynard]We got the purest sample. And we got the Expo happening in less than a month. This is a once in a lifetime opportunity.[/say]")

		saynn("She sees your raw passion.. and admires it.")

		saynn("[say=lin_alex]You're right. Just.. don't overwork yourself, Al. Don't forget what really matters. Also..[/say]")

		saynn("She reaches her paw and caresses your cheek, her digit then slides over your lips.")

		saynn("[say=lin_alex]You got something there. Some piece of meat, heh.[/say]")

		saynn("[say=alexrynard]Thanks.[/say]")

		saynn("[say=lin_alex]Don't mention it..[/say]")

		saynn("Her eyes focus on someone behind you.")

		saynn("[say=lin_alex]I think the boss wants to see you.[/say]")

		addButton("Boss", "Have a chat with your boss", "chat_boss")
	if(state == "chat_boss"):
		addCharacter("boss_alex")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npc="boss_alex"})
		saynn("You turn around. And there he is indeed, the one who is paying for your dream. Surprisingly young for how rich he is.")

		saynn("[say=alexrynard]What's up?[/say]")

		saynn("[say=boss_alex]How's the engine doing?[/say]")

		saynn("You take a look at your team. They seem to be ready to do a test-run. You nod, allowing them to proceed.")

		saynn("[say=alexrynard]Look for yourself.[/say]")

		saynn("Lin waits until everyone else steps away to a safe distance before pressing a button on her laptop. And very soon, the engine begins to spool up, blue flames illuminating the whole hangar.")

		saynn("[say=boss_alex]Nice.[/say]")

		saynn("[say=alexrynard]We're doing some initial tests, so far everything works as you can see. We don't dare to try bluespace warping yet but luckily that's not required for now.[/say]")

		saynn("[say=boss_alex]Oh yeah, about that. I decided that it's best if we demo the full capabilities of the engine at the Expo. Which means that we will have to install it onto a spaceship too.[/say]")

		saynn("Huh? Millions of thoughts suddenly rush through your mind, millions of calculations, none of them adding up..")

		saynn("[say=alexrynard]Wait. Are you serious?[/say]")

		saynn("[say=boss_alex]Something's wrong?[/say]")

		saynn("[say=alexrynard]Do you understand that it's unsafe to warp? The crystal might shatter if we don't get the allocated current just right. And then.. installing my.. our.. engine on a ship will take at least 2 weeks.[/say]")

		saynn("He listens to that and nods. That makes you.. angry.")

		saynn("[say=alexrynard]Why are you nodding? There is less than a month left before the Expo.[/say]")

		saynn("[say=boss_alex]I truly don't care about the logistics of all of this. But if we show it warp, there will be a higher chance of us securing the funding. Just once would be fine for the demo. I hope I don't need to explain to you that this whole project depends on if we get funding or not. Even second place is not gonna cut it.[/say]")

		saynn("You growl.")

		saynn("[say=alexrynard]You're insane. You want me to ship an untested prototype. And obviously I'm gonna be the one to blame if anything goes wrong.[/say]")

		saynn("Your boss smiles.")

		saynn("[say=boss_alex]If you're too weak for this, just bail now.[/say]")

		saynn("[say=alexrynard]I got bills to pay.[/say]")

		saynn("Your boss walks up to confused Lin, his digit booping her on the nose.")

		saynn("[say=boss_alex]Cute.[/say]")

		saynn("He looks at you.")

		saynn("[say=boss_alex]Stop being such a beta, Alex. See you around.[/say]")

		saynn("And after saying that, he just leaves.")

		saynn("[say=alexrynard]Who did you call beta..[/say]")

		addButton("Continue", "See what happens next", "boss_left")
	if(state == "boss_left"):
		removeCharacter("boss_alex")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npc="lin_alex"})
		saynn("Lin slowly approaches you.")

		saynn("[say=lin_alex]Change of plans?[/say]")

		saynn("You stay quiet, your fists clenching. The whole hangar is still illuminated by a blue light coming from the engine's exhaust. At least the thing is working already. All it needs is some testing..")

		saynn("[say=alexrynard]No.. nothing is changing. We will make sure the engine works by the time we have to ship it. Can you tell the boys that we will have to work extra hours? And on weekends too. Just for now.[/say]")

		saynn("Lin nods understandably.")

		saynn("[say=lin_alex]I will go let them know.[/say]")

		saynn("Lin heads off towards your team members.")

		addButton("Continue", "See what happens next", "alex_thinks")
	if(state == "alex_thinks"):
		removeCharacter("lin_alex")
		playAnimation(StageScene.Solo, "stand", {pc="alexrynardy"})
		saynn("You cross your arms.. and just start to think.")

		saynn("Quitting now is not an option. Not when you're so close.")

		saynn("But showcasing an unfinished product.. is dangerous.. to say the last.")

		saynn("You will just have to work harder.. the reward is surely worth it.")

		saynn("Your eyes track Lin. Some of your team is clearly annoyed with your decision. And some just nod. At least some of them understand.")

		saynn("The laptop shows which automated test the engine is currently doing. But then, you hear the laptop beep angrily. A large red 'TEST FAILED' line can be seen on it. The engine begins to shut down.")

		saynn("[say=alexrynard]Fuck..[/say]")

		saynn("At least nothing has exploded.")

		addButton("Laptop", "See what's up", "test_failed_laptop")
	if(state == "test_failed_laptop"):
		addCharacter("lin_alex")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npcAction="sit", npc="lin_alex"})
		saynn("You call Lin and stand by her side as you begin to figure out what happened.")

		saynn("[say=lin_alex]Huh. Memory got corrupted, I'm getting garbage in a few registers.[/say]")

		saynn("You sigh.")

		saynn("[say=alexrynard]Why did we decide that giving everything a CPU is a good idea.[/say]")

		saynn("She shrugs.")

		saynn("[say=alexrynard]You think it's a hardware issue? Maybe one of the memory sticks got busted?[/say]")

		saynn("[say=lin_alex]I'm not sure yet. Nothing really points to that, could be a software issue too..[/say]")

		saynn("Right. That's exactly what we need right now.")

		saynn("[say=alexrynard]Let's see if it will happen again.[/say]")

		saynn("Lin nods and starts the automated tests again.")

		saynn("It takes time.. a lot of time. And of course.. this time.. all tests pass. The bluespace engine successfully went through all of its stages.")

		saynn("[say=lin_alex]So it was a fluke.. That's.. good.. right?[/say]")

		saynn("[say=alexrynard]It's not.. it's really not.. I'd rather see it fail every time..[/say]")

		saynn("[say=lin_alex]What do we do?[/say]")

		saynn("You think about it more.")

		saynn("[say=alexrynard]There is no time to waste. Keep running the tests. Try to figure out what's causing that on the software side. Me and the rest of the team will be poking the hardware.[/say]")

		saynn("[say=lin_alex]Okay, sounds good.[/say]")

		addButton("Continue", "See what happens next", "start_hardware_poke")
	if(state == "start_hardware_poke"):
		saynn("And so.. you and your whole team spends the next many hours trying to figure out the cause of that problem.")

		saynn("Sometimes, the engine completes the tests flawlessly.. and sometimes, it breaks on the first one. Who knows why..")

		saynn("Time flies.. no matter what you do, nothing has changed. You only realized how late it was when everyone began leaving..")

		saynn("[say=lin_alex]It's late, Al. We can continue tomorrow.[/say]")

		saynn("[say=alexrynard]I will stay for now. But you should go.[/say]")

		saynn("[say=lin_alex]I will stay too then..[/say]")

		saynn("[say=alexrynard]No. Save your energy. I order you to go.[/say]")

		saynn("Lin stays quiet for some time.. And then nods before leaving you alone.")

		addButton("Engine", "Try to fix it", "alex_tries_to_fix_engine_alone")
	if(state == "alex_tries_to_fix_engine_alone"):
		removeCharacter("lin_alex")
		playAnimation(StageScene.Solo, "stand", {pc="alexrynardy"})
		saynn("And so.. you are left alone with your dream.")

		saynn("Time to do some magic.")

		saynn("You begin taking off parts from the engine and testing them one by one. Some components look suspicious.. but nothing too bad.")

		saynn("Even just replacing a few parts takes hours when you have to run those tests all the time..")

		saynn("At some point you just can't do it anymore.. Your eyes begin to close on their own.")

		saynn("Maybe the thing should have just exploded..")

		addButton("Go sleep", "Whatever", "alex_goes_back_home")
	if(state == "alex_goes_back_home"):
		# (( AimCamera here
		playAnimation(StageScene.Sleeping, "sleep", {pc="alexrynardy", bodyState={underwear=true}})
		saynn("You're not sure how.. but you manage to get back to your apartment. A small room with a bed, tv, fridge and an access to a bathroom. Enough to not die.")

		saynn("At least it has a somewhat nice view. But who cares about open space now..")

		saynn("You step in.. drop your clothes onto the floor.. and then drop yourself onto the bed..")

		saynn("Your ears pick up on a familiar robotic voice.. but you will deal with it tomorrow..")

		addButton("Sleep", "Good night", "alex_sleeps_first_time")
	if(state == "alex_sleeps_first_time"):
		playAnimation(StageScene.Solo, "stand", {pc="alexrynardy", bodyState={underwear=true}})
		saynn("You sleep for what feels like centuries.. but it's actually just a few hours.")

		addCharacter("sen_alex")
		saynn("[say=sen_alex]Beep boop. Beep boop.[/say]")

		saynn("You rub your face.")

		saynn("[say=alexrynard]I'm waking up, you can stop beeping..[/say]")

		saynn("[say=sen_alex]Are you okay, sir?[/say]")

		saynn("[say=alexrynard]No.. Yes..[/say]")

		saynn("[say=sen_alex]I thought so. So I took the liberty of ordering pizza for you.[/say]")

		saynn("You open your eyes.. everything is still blurry. Your hands are dirty from tinkering with the engine so much.. Fuck.. Your face is dirty too.")

		saynn("[say=alexrynard]What time is it..[/say]")

		saynn("[say=sen_alex]Eight o'clock, sir.[/say]")

		saynn("[say=alexrynard]I only have time for the shower.[/say]")

		saynn("[say=sen_alex]Something is wrong, sir?[/say]")

		saynn("[say=alexrynard]Don't worry about it.[/say]")

		saynn("You take a quick shower.")

		saynn("[say=sen_alex]I will tell them to put the pizza into the fridge, sir.[/say]")

		saynn("[say=alexrynard]Sure, I will eat some during my break.. Any alerts? I kinda dozed off yesterday.[/say]")

		saynn("[say=sen_alex]No sir, my sensors didn't detect anything unusual.[/say]")

		saynn("[say=alexrynard]Okay. I will be back late today. And tomorrow..[/say]")

		saynn("You quickly dry your fur and put on your clothes.")

		saynn("Time to do this.")

		addButton("Engine", "Work on your dream", "alex_starts_crunching")
	if(state == "alex_starts_crunching"):
		# (( AimCamera Here
		removeCharacter("sen_alex")
		addCharacter("lin_alex")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npcAction="sit", npc="lin_alex"})
		saynn("You return to the workshop. The heart of it is still there, waiting to be fixed.")

		saynn("Lin joins you soon too, yawning and stretching.")

		saynn("[say=lin_alex]Morning, Al.[/say]")

		saynn("[say=alexrynard]Try to track down the bug.[/say]")

		saynn("[say=lin_alex]Yeah, I know.[/say]")

		saynn("And so the grind begins. You carefully replace each part of the engine, no matter how little.. while Lin is working with the code and running tests.")

		saynn("After a few successful runs, you almost began to hope. But nah, the issue is still there, the fifth run proved it. And it's still just as random.")

		saynn("[say=lin_alex]I looked through most of the functions, I have no idea what would be causing that.[/say]")

		saynn("[say=alexrynard]Look through all of them.[/say]")

		saynn("[say=lin_alex]Okay..[/say]")

		saynn("Time flies. You didn't even realize that you and Lin had skipped the break. But you don't even feel hunger while you're in this.. flow.. state. You sure feel yourself getting angrier though.")

		saynn("And why would you not get mad? You spent the whole day. And you still haven't tracked the problem down.")

		saynn("[say=lin_alex]It's late, Al..[/say]")

		saynn("[say=alexrynard]Then go away.[/say]")

		saynn("Lin lowers her gaze.")

		saynn("[say=lin_alex]Listen.. it's not worth it.. killing yourself over this.[/say]")

		saynn("For some reason her words made you even more angry. But luckily, you caught yourself from lashing out at her.")

		saynn("[say=alexrynard]No one is dying, I'm fine. But I need my engine to work properly. The Expo is only a month away, it's worth it to push yourself. Just for now.[/say]")

		saynn("Lin clenches her fists.")

		saynn("[say=lin_alex]Then I'm staying too. You can't stop me.[/say]")

		saynn("Her tone cools you down.")

		saynn("[say=alexrynard]Alright.. Alright. Let's try to be efficient then.[/say]")

		addButton("Continue", "See what happens next", "alex_and_lin_crunch")
	if(state == "alex_and_lin_crunch"):
		saynn("And so the next few days fly by like a single second. You wake up, spend the whole day trying to track down that problem, go to bed, completely exhausted.")

		saynn("[say=boss_alex]Why the fuck haven't you shipped the damn thing already. Are you all really that incompetent?[/say]")

		saynn("It was hard not to scream at your boss when he occasionally comes in to check on the progress. But what you were doing.. it was the right thing. There is no way you're demoing that engine while its memory might randomly corrupt itself.")

		saynn("Time was running out. It feels like you rebuilt the whole engine from scratch multiple times by now. You know where every screw should be, what each wire does. The constant blue light haunts you in your dreams..")

		saynn("[say=lin_alex]Um.. I think.. Could this be it?[/say]")

		saynn("You climb from under the engine and rub your exhausted eyes. The black bags under them might as well be another tattoo on your cheeks by now.")

		saynn("[say=alexrynard]Let's see.[/say]")

		saynn("[say=lin_alex]I was replacing part of the functions with placeholders. Then, if there was no bug anymore, I divided it even further and was checking just part of the part.[/say]")

		saynn("[say=alexrynard]Binary search. Smart.[/say]")

		saynn("She nods and points at the screen.")

		saynn("[say=lin_alex]I tracked it down to this line of code.[/say]")

		saynn("You look at it. Yeah, the code had an obvious 'off by one' error, making it so the bad memory was read and modified. But only sometimes..")

		saynn("[say=alexrynard]Yeah.. this is it, yeah.. fuck me.. You're smart.[/say]")

		saynn("You can't believe your eyes. Your legs wanna give up so you hold onto the table.")

		saynn("[say=lin_alex]I.. It was me who wrote this function.[/say]")

		saynn("You look at her. You look at the reason behind so much pain and suffering..")

		saynn("[say=alexrynard]That's.. okay. It happens. There was no malice. Just an honest mistake.[/say]")

		saynn("You rub your face. You can't believe it.")

		saynn("[say=lin_alex]I will run the tests now.[/say]")

		saynn("You nod.. silently. You want to scream.. but you just have to endure it..")

		saynn("And, of course, all the tests were green. And then again. You checked multiple times. And each time.. everything was working perfectly.")

		saynn("[say=alexrynard]I think we can ship it now..[/say]")

		saynn("[say=lin_alex]I will let the boss know..[/say]")

		saynn("She looks at the clock.")

		saynn("[say=lin_alex]..tomorrow.[/say]")

		saynn("You tap on her shoulder.")

		saynn("[say=alexrynard]Go sleep. I'd offer you to stop by my apartment for some cold pizza. But it's clearly not the time..[/say]")

		saynn("You clearly could use a bed too. She offers you a little smile.")

		saynn("[say=lin_alex]Oh, I love cold pizza. But I will do as you say, Al..[/say]")

		saynn("Lin stands up.. and leans towards you to leave a little kiss on your lips.. before walking away.")

		saynn("[say=lin_alex]See you..[/say]")

		addButton("Bed", "Find it", "alex_fixed_bug_sleep")
	if(state == "alex_fixed_bug_sleep"):
		# (( AimCamera Here
		playAnimation(StageScene.Sleeping, "sleep", {pc="alexrynardy", bodyState={underwear=true}})
		removeCharacter("lin_alex")
		addCharacter("sen_alex")
		saynn("You find your way back to your apartment.")

		saynn("[say=alexrynard]Any alerts today?..[/say]")

		saynn("[say=sen_alex]Only one, Sir. It was pizza delivery. I guided them the fridge.[/say]")

		saynn("[say=alexrynard]Uh huh.. Good..[/say]")

		saynn("You drop onto your bed.. and turn off instantly.")

		saynn("[say=sen_alex]Good night, Sir.[/say]")

		addButton("Sleep", "See what the next day brings you", "alex_next_day_after_fixing_the_bug")
	if(state == "alex_next_day_after_fixing_the_bug"):
		# (( Aim camera here
		playAnimation(StageScene.Solo, "stand", {pc="alexrynardy"})
		removeCharacter("sen_alex")
		saynn("New day. Exactly two weeks before the Expo. Your team begins to prepare the engine to be installed into the spaceship. While you just watch, making sure everything goes smoothly.. Finally.. Some rest..")

		saynn("[say=boss_alex]Hey there. Good job. You pulled through.[/say]")

		saynn("It's him.")

		addButton("Boss", "Talk with him", "boss_asks_who")
	if(state == "boss_asks_who"):
		addCharacter("boss_alex")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npc="boss_alex"})
		saynn("[say=alexrynard]Thanks.[/say]")

		saynn("Your boss leans against one of the hangar walls.")

		saynn("[say=boss_alex]I've received the bonus for what you did. I want you to help me spread it over the whole team. Shoot me an email when you can.[/say]")

		saynn("Credits.. finally. Maybe having some actual money will help to heal all the wounds.. and make it worth it.")

		saynn("[say=alexrynard]Sure, I will.[/say]")

		saynn("[say=boss_alex]No rush on that one. By the way, who was responsible for that last delay? Lin didn't tell me, she said it was better if I asked you.[/say]")

		saynn("He asked it so casually. But you're pretty sure he is not being casual at the moment.")

		saynn("[say=alexrynard]Huh? It doesn't matter, trust me.[/say]")

		saynn("[say=boss_alex]Yeah.. but.. Still. Shouldn't the boss know?[/say]")

		saynn("[say=alexrynard]It was just an honest mistake. Again, you will have to trust me.[/say]")

		saynn("His fake kind expression goes away.")

		saynn("[say=boss_alex]Alright. If you say so. You have two weeks of rest now before the Expo, enjoy.[/say]")

		saynn("And so he leaves you alone.")

		addButton("Work", "Do some work", "alex_writes_good_email")
	if(state == "alex_writes_good_email"):
		removeCharacter("boss_alex")
		addCharacter("lin_alex")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npc="lin_alex"})
		saynn("You do some work. Then you spend some time writing that email. Obviously, since you're the team lead, it only makes sense that you receive slightly more.")

		saynn("Lin caused that mistake.. but she also fixed it, so it shouldn't affect her pay. Apart from that, she wrote the main bulk of the engine's firmware. A very impressive feat.")

		saynn("Rest of the team.. is pretty average. Some did better, some did worse. You tried to make it fair.")

		saynn("You press the 'send' button.")

		saynn("[say=lin_alex]Hey, Al. Feels weird to stop working at normal hours again. How are you feeling?[/say]")

		saynn("Lin scratches the back of her head.")

		saynn("[say=alexrynard]Better. Way better. I didn't tell the boss about you, don't worry.[/say]")

		saynn("[say=lin_alex]You could have if you wanted to.. but.. thank you. I kinda need all the credits I can get at the moment.[/say]")

		saynn("[say=alexrynard]Don't we all?[/say]")

		saynn("She leans closer to you again.. her paw sliding up over your arm.")

		saynn("[say=lin_alex]About that cold pizza..[/say]")

		saynn("Her eyes stare at your lips.")

		saynn("[say=lin_alex]Can I get a taste?[/say]")

		addButton("Kiss Lin", "You two clearly want it", "start_passion")
	if(state == "start_passion"):
		# (( AimCamera
		playAnimation(StageScene.Hug, "kiss", {pc="alexrynardy", npc="lin_alex", bodyState={underwear=true}, npcBodyState={underwear=true}})
		saynn("The next moments become a blur of emotions. Your hands explore her body, hers explore your. Your lips brushing against each other as you exchange the many passionate kisses.")

		saynn("Somehow you end up in your apartment. She unbuttons your shirt, you pull down her pants. Your lips leave many little kisses on her neck and shoulders.. little bites too. So much tension.. Too much.")

		saynn("Sentinel detects what's happening.. and decides to stay quiet.. just like you coded it.")

		addButton("Bed", "You two clearly want it", "start_lovemaking")
	if(state == "start_lovemaking"):
		playAnimation(StageScene.SexMissionary, "sex", {pc = "alexrynardy", npc="lin_alex", bodyState={naked=true,hard=true}, npcBodyState={naked=true,hard=true}})
		saynn("What follows after a night full of passionate lovemaking. The rest of the clothing is tossed aside, naked bodies rubbing against each other. You feel her scent.. incredible.")

		saynn("[say=lin_alex]Take me..[/say]")

		saynn("Your hands carefully guide Lin onto the bed and then position yourself between her legs. You're already hard so all you have to do is slide inside, stealing her moan with another kiss.")

		saynn("Her velvet inner walls welcome your length eagerly.. but you don't push it, allowing Lin to get used to it, instead just making out with her, taking it slow and steady.")

		saynn("Lin's eyes.. are shining with trust, a permission for you to start picking up pace. Her whole body is shivering as you explore her every inch of the body, your member sliding inside that slick tunnel, kissing the natural barricade already.")

		saynn("[say=lin_alex]I'm.. ah..[/say]")

		saynn("It's easy to feel that an orgasm has overwhelmed her, her inner walls gripping your member tightly. You slow down a bit, letting her catch her breath.")

		addButton("Continue", "See what happens next", "continue_lovemaking")
	if(state == "continue_lovemaking"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="lin_alex", pc="alexrynardy", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("The night is long.. giving the lovers plenty of time to let all their tension out.")

		saynn("Lin straddles you, she carefully positions herself over your member. Your hands are holding hers, fingers intertwined, as she lowers herself, her slick flower spreading and accepting you.")

		saynn("[say=lin_alex]Ah.. feels so good..[/say]")

		saynn("She starts riding you.. at her comfortable pace. The view of her modest breasts bobbing up and down is incredible. Lin bites her lip and throws her head back, moaning passionately.")

		saynn("Soon, the knot of your members starts to inflate with blood, making fitting that part impossible no matter how Lin tries. Her attempts sure bring you a lot of pleasure though, you feel yourself getting close..")

		saynn("[say=alexrynard]Lin.. I'm..[/say]")

		saynn("[say=lin_alex]Please..[/say]")

		saynn("You don't need many words to understand each other. Lin keeps riding you, pushing you way past your point of no return. You grunt as your twitching member starts to throb inside her, your seed flooding her womb.")

		addButton("Continue", "See what happens next", "after_sex_with_lin")
	if(state == "after_sex_with_lin"):
		playAnimation(StageScene.Sleeping, "sleep", {pc="alexrynardy", npc="lin_alex", bodyState={underwear=true}, npcBodyState={underwear=true}})
		saynn("Exhausted.. but satisfied.. you finally stop. The room smells of raw passionate sex while you sleep. Your bed is not the biggest.. but your body provides enough space and warmth for a comfy nap.")

		addButton("Continue", "See what happens next", "cold_pizza_finally")
	if(state == "cold_pizza_finally"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynardy", npc="lin_alex", bodyState={underwear=true}, npcBodyState={underwear=true}})
		addCharacter("sen_alex")
		saynn("You open your eyes.. and notice Lin sneaking to your fridge. As she tries to open it, a new voice makes her jump..")

		saynn("[say=sen_alex]Beep boop! Access denied![/say]")

		saynn("[say=lin_alex]Oh? A talking fridge?[/say]")

		saynn("You can't help but to giggle.")

		saynn("[say=alexrynard]This is Sentinel, my automated security system. But he also controls the fridge, yes.[/say]")

		saynn("[say=lin_alex]So like a smart home? That's pretty cool.[/say]")

		saynn("[say=alexrynard]Yeah, but I made him myself since I'm sick of expensive solutions. Sentinel, this is Lin, my co-worker. Give her access.[/say]")

		saynn("[say=sen_alex]Beep boop! Yes, Sir![/say]")

		saynn("The fridge opens, letting Lin take a few slices of pizza. After that, she approaches the bed and cuddles up to you, offering you one.")

		saynn("[say=alexrynard]Thanks.[/say]")

		saynn("[say=lin_alex]Yes Sir, huh~? Should I call you Sir too, Sir~?[/say]")

		saynn("[say=alexrynard]Oh, please. But only after I gag you.[/say]")

		saynn("[say=lin_alex]Sounds good. Wait, how am I gonna eat cold pizza then?[/say]")

		saynn("You shrug and rest one arm on her chest while the second one holds the pizza slice.")

		saynn("Time flies while you two are together.")

		saynn("[say=lin_alex]We should probably go to work, huh..[/say]")

		saynn("This is such a nice moment, why end it..")

		saynn("[say=alexrynard]The boys can handle it..[/say]")

		saynn("[say=lin_alex]It's your engine we're talking about.[/say]")

		saynn("[say=alexrynard]Fine.. you're right. Let's start preparing.[/say]")

		saynn("[say=lin_alex]Yes, Sir~.[/say]")

		saynn("For some reason you can't stop your eyes from rolling.")

		addButton("Continue", "See what happens next", "alex_and_lin_prepare")
	if(state == "alex_and_lin_prepare"):
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npc="lin_alex"})
		saynn("You lazily get out of bed, get a quick shower together, wash your teeth, put on your clothes..")

		saynn("[say=sen_alex]Sir, I detected a change in your credit account.[/say]")

		saynn("[say=alexrynard]That must be the bonus. How much?[/say]")

		saynn("[say=sen_alex]250 credits, sir.[/say]")

		saynn("That's.. way less than you expected.. to say the least. Rent alone costs you more.")

		saynn("[say=alexrynard]Um.. that must be a mistake. Lin?[/say]")

		saynn("She checks her account using her datapad.")

		saynn("[say=lin_alex]I received a thousand..[/say]")

		saynn("You rub your chin.")

		saynn("[say=alexrynard]The asshole forgot a zero.[/say]")

		saynn("[say=lin_alex]Better check with him, Al..[/say]")

		saynn("Yeah.. Why should you take your work seriously if your boss can't even count.")

		addButton("Boss", "Go have a chat", "chat_with_boss_mad")
	if(state == "chat_with_boss_mad"):
		# (( AimCamera here
		removeCharacter("sen_alex")
		addCharacter("boss_alex")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npc="boss_alex"})
		saynn("You storm the office of your boss. Lin stands by the exit.")

		saynn("[say=alexrynard]You made a mistake with my bonus.[/say]")

		saynn("Your boss.. slowly gets up from his comfy chair and then approaches you.")

		saynn("[say=boss_alex]There was no mistake, Alex.[/say]")

		saynn("Huh?")

		saynn("[say=alexrynard]What the fuck do you mean. I'm the team lead. The engine was shipped on time.[/say]")

		saynn("You sound quite annoyed.. but your boss has the same neutral tone.")

		saynn("[say=boss_alex]You see, you decided not to tell me who caused that bug. So I can only assume that it was you. If no one is at fault, you're at fault.[/say]")

		saynn("[say=alexrynard]Are you serious? Are you really being serious right now? I told you that it's not important.[/say]")

		saynn("[say=boss_alex]It's important to me, Alex. What happens in my hangar is very important to me. Deal with it.[/say]")

		saynn("You clench your fists. Lin looks like she wants to tell something.. but you shake your head at her.")

		saynn("Then you look at your boss and sigh.")

		saynn("[say=alexrynard]You really think this will inspire me to work better?[/say]")

		saynn("[say=boss_alex]Yeah. Just do better next time, Alex. And then we won't have this problem.[/say]")

		saynn("No.. you can't just let this keep happening.. You did so much.. You did everything right.. And this is what you get? 'Do better'? Blood is boiling in your veins. You really want to punch him.. but you probably shouldn't.")

		saynn("There is a better way.")

		saynn("[say=alexrynard]I quit.[/say]")

		saynn("[say=lin_alex]Alex..[/say]")

		saynn("[say=boss_alex]Really? When we are less than two weeks away from getting the first prize at that Expo. And getting unlimited funds? I haven't seen a decision more stupid than that, Alex.[/say]")

		saynn("You turn around and start walking away.")

		saynn("[say=alexrynard]Who said that you will be the ones getting the first place?[/say]")

		saynn("Your boss.. ex-boss.. frowns.")

		saynn("[say=boss_alex]Good fucking luck to you then. No one is irreplaceable.[/say]")

		addButton("Continue", "See what happens next", "lin_kinda_betrays_alex")
	if(state == "lin_kinda_betrays_alex"):
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npc="lin_alex"})
		saynn("Lin stops you before you can walk out.")

		saynn("[say=lin_alex]Alex.. I'm.. sorry.[/say]")

		saynn("[say=alexrynard]If you want to stay - stay. I won't judge you. But I can't work here anymore.[/say]")

		saynn("She nods softly.. And gives you a small kiss on the lips.. before she stops holding you.")

		saynn("[say=boss_alex]Grow some balls already. Why are you still such a beta?[/say]")

		saynn("You decide not to entertain him with a response and just shut the door.")

		addButton("Apartment", "Return back to your place", "in_appartment_after_rekt")
	if(state == "in_appartment_after_rekt"):
		# (( AimCamera here
		removeCharacter("lin_alex")
		removeCharacter("boss_alex")
		addCharacter("sen_alex")
		playAnimation(StageScene.Solo, "stand", {pc="alexrynardy"})
		saynn("You return back to your apartment. You enter it. And then just proceed to stand near the entrance.")

		saynn("Your hands are shaking a little. You got roughly two weeks left on your rent. Which means that you only have one chance..")

		saynn("So much noise in your head.. Better focus.")

		saynn("[say=alexrynard]Sentinel?[/say]")

		saynn("[say=sen_alex]Welcome back, Sir. There are no alerts or notifications. What can I do for you?[/say]")

		saynn("[say=alexrynard]Let's explore the 'Unfinished projects' folder.[/say]")

		saynn("You take a spot in the middle of your apartment. When you're living alone, your place quickly becomes a mess no matter how little you have.")

		saynn("[say=sen_alex]Of course, Sir. Want me to list all of them?[/say]")

		saynn("[say=alexrynard]One by one. We got less than two weeks to make something better than a bluespace engine.[/say]")

		saynn("[say=sen_alex]That will be extremely tough, Sir.[/say]")

		saynn("[say=alexrynard]I know. That's why we gotta start with some optimization.[/say]")

		saynn("Time to do some renovating..")

		addButton("Continue", "See what happens next", "alex_dissasembles_furniture")
	if(state == "alex_dissasembles_furniture"):
		saynn("And so you pull the blanket, pillows and the mattress off your bed, leaving just the wooden frame. But even that is not enough, you begin to disassemble the frame too, making sure not to break anything.")

		saynn("[say=sen_alex]First project is.. Solar-powered water purifier.[/say]")

		saynn("[say=alexrynard]Way too simple.[/say]")

		saynn("[say=sen_alex]Of course. What about.. A multi-purpose medical table with support for custom tools.[/say]")

		saynn("[say=alexrynard]Too complicated. I like that direction more though.[/say]")

		saynn("Your mind is exploring ideas while your hands are using the acquired wood to start assembling a table.. a workbench to be precise.")

		saynn("[say=sen_alex]A visor capable of manipulating neuron structures without direct stimulation.[/say]")

		saynn("[say=alexrynard]Hmm.. I still don't have access to microscopic cameras.[/say]")

		saynn("[say=sen_alex]Miniature linked portal devices.[/say]")

		saynn("[say=alexrynard]..and especially anything that involves bluespace. What I need is something that does a lot with very little.[/say]")

		saynn("While the computer thinks, you quickly finish assembling your bed into a somewhat sturdy workbench.. It's simple.. but better than nothing. You place it against the wall, giving you plenty of space. A lamp goes on it. All the trash goes out.")

		saynn("[say=sen_alex]What about your Exosuit project, Sir.[/say]")

		saynn("[say=alexrynard]Exosuit.. That is.. doable.. theoretically. I can probably even get enough parts for one. Just the frame will be enough, no need for armor. But.. It needs to be special. More than just an exosuit.[/say]")

		saynn("You swipe the dust off of the workbench.")

		saynn("[say=alexrynard]It needs.. some kind of killer feature, you know?[/say]")

		saynn("[say=sen_alex]If you're struggling to come up with something, try combining some of your projects together, Sir.[/say]")

		saynn("Obviously Sentinel wasn't designed to come up with creative ideas for you. But he is doing his best. Maybe there is something in his words.. You stare at the camera that he sees the world through.")

		saynn("[say=alexrynard]Killer feature.. Combining.. Hmm..[/say]")

		saynn("And then it hits ya.")

		saynn("[say=alexrynard]I think I know. Show me the blueprints for the Exosuit project.[/say]")

		saynn("[say=sen_alex]Yes, Sir![/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
