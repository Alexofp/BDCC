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
		aimCameraAndSetLocName("alexf_bar")
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
		aimCameraAndSetLocName("alexf_hangar")
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
		aimCameraAndSetLocName("alexf_apart")
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
		aimCameraAndSetLocName("alexf_hangar")
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
		aimCameraAndSetLocName("alexf_apart")
		playAnimation(StageScene.Sleeping, "sleep", {pc="alexrynardy", bodyState={underwear=true}})
		removeCharacter("lin_alex")
		addCharacter("sen_alex")
		saynn("You find your way back to your apartment.")

		saynn("[say=alexrynard]Any alerts today?..[/say]")

		saynn("[say=sen_alex]Only one, Sir. It was pizza delivery. I guided them to the fridge.[/say]")

		saynn("[say=alexrynard]Uh huh.. Good..[/say]")

		saynn("You drop onto your bed.. and turn off instantly.")

		saynn("[say=sen_alex]Good night, Sir.[/say]")

		addButton("Sleep", "See what the next day brings you", "alex_next_day_after_fixing_the_bug")
	if(state == "alex_next_day_after_fixing_the_bug"):
		aimCameraAndSetLocName("alexf_hangar")
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
		aimCameraAndSetLocName("alexf_apart")
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
		aimCameraAndSetLocName("alexf_bossroom")
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

		saynn("[say=lin_alex]Alex.. I'm.. sorry..[/say]")

		saynn("[say=alexrynard]If you want to stay - stay. I won't judge you. But I can't work here anymore.[/say]")

		saynn("She nods softly.. And gives you a small kiss on the lips.. before she stops holding you.")

		saynn("[say=boss_alex]Grow some balls already. Why are you still such a beta?[/say]")

		saynn("You decide not to entertain him with a response and just shut the door.")

		addButton("Apartment", "Return back to your place", "in_appartment_after_rekt")
	if(state == "in_appartment_after_rekt"):
		aimCameraAndSetLocName("alexf_apart")
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

		saynn("[say=alexrynard]I think I know what we're gonna do. Show me the blueprints for the Exosuit project. Hide the armor, leave just the exoskeleton.[/say]")

		saynn("[say=sen_alex]Yes, Sir![/say]")

		saynn("A blue hologram of your old unfinished idea gets projected onto the table. There was never much need for one so you kinda just lost motivation while working on it. But now times are different..")

		saynn("[say=alexrynard]Right. I think I was smaller back then, it would need to be scaled. We would also need to leave some space for extra electronics.[/say]")

		saynn("You stare at your old project for a while longer.")

		saynn("[say=alexrynard]Electronics..[/say]")

		saynn("You look around and notice a tv in the corner that you barely use.")

		saynn("[say=alexrynard]That's a start.[/say]")

		saynn("And so you began working on it. Disassembling the tv gave you some required parts and materials.. but obviously not nearly enough. The rest you would have to buy.")

		saynn("[say=alexrynard]How much are we looking at, Sentinel?[/say]")

		saynn("[say=sen_alex]Based on the edits that you have proposed.. about 5 thousand credits, Sir.[/say]")

		saynn("You shake your head.")

		saynn("[say=alexrynard]This is gonna drain my soul and my account, huh? Alright, start taking loans. As much as the system allows.[/say]")

		saynn("[say=sen_alex]May I suggest disassembling me, Sir? That might cover some of it.[/say]")

		saynn("[say=alexrynard]Listen, I appreciate the self-sacrifice gesture but that's the last thing that I would do. I need you more than ever to not go insane. Take loans and get me more parts.[/say]")

		saynn("[say=sen_alex]Of course. Yes, Sir.[/say]")

		addButton("Continue", "See what happens next", "alex_makes_some_of_suit")
	if(state == "alex_makes_some_of_suit"):
		saynn("Days begin to fly past. Wake up, work for 14 hours, eat something, go back to sleep. Your efficiency was at your best when you were at your worst.")

		saynn("After a few days.. you already had something. A bunch of flat metal rods that go over your arm, forearm, hand and each finger. Each piece is connected by a series of motors. Theoretically, if powered correctly, this would allow you to pick up heavier objects.")

		saynn("Someone is knocking at your door..")

		addButton("Door", "Check who it is", "lin_checks_on_alex")
	if(state == "lin_checks_on_alex"):
		addCharacter("lin_alex")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npc="lin_alex"})
		saynn("Your hands are all greasy so you quickly wipe them against your uniform. Who cares at this point..")

		saynn("You open the door.. and see Lin.")

		saynn("[say=lin_alex]Hey, Al..[/say]")

		saynn("[say=alexrynard]Hey Lin, what's up?[/say]")

		saynn("She looks behind your shoulder and notices that your apartment now looks more than a workshop rather than a place to live in.")

		saynn("[say=lin_alex]I was gonna ask if you wanted to hang out together. But looks like.. you're busy. You're gonna enter the Expo alone?[/say]")

		saynn("[say=alexrynard]Yeah, that's the plan. Sorry we don't see each other much. I will have more time after the Expo, we could totally catch up then.[/say]")

		saynn("She nods subtly.. and then lowers her gaze.")

		saynn("[say=lin_alex]May I come in?..[/say]")

		saynn("[say=alexrynard]Um.. sure. Just try not to touch anything or you will get dirty.[/say]")

		saynn("You step aside, allowing Lin to step into your apartment. She looks around.. obviously noticing the lack of furniture.")

		saynn("[say=lin_alex]How do you sleep?[/say]")

		saynn("[say=alexrynard]On the floor. I still have the mattress and the blanket, enough for me.[/say]")

		saynn("[say=lin_alex]Your back is not gonna like that..[/say]")

		saynn("She looks around more. Obviously her gaze gets attracted to your current prototype sitting on the workbench. The blue hologram is still visible.")

		saynn("[say=lin_alex]Looks like a.. skeleton.[/say]")

		saynn("[say=alexrynard]Yeah, it's an exoskeleton, goes over your body, makes you stronger.[/say]")

		saynn("[say=lin_alex]Think that's gonna be enough?[/say]")

		saynn("[say=alexrynard]We will see. I'm not gonna ask you to sabotage the engine, don't worry. Couldn't care less about that thing anymore.[/say]")

		saynn("She turns around to face you.. and then lowers her gaze again.")

		saynn("[say=lin_alex]Yeah.. about that.. I think the boss wants to show it warping twice at the Expo, away and back..[/say]")

		saynn("[say=alexrynard]Is he.. fucking serious? That wasn't a requirement when we were building it.[/say]")

		saynn("That's annoying. The guy probably doesn't even understand how dangerous that tech is.")

		saynn("[say=lin_alex]Yeah.. I tried to tell him.. But he wants to make sure we win..[/say]")

		saynn("And this is your chance to make sure they don't. You promised not to sabotage the engine.. but you never promised to help either. It would be so easy to not say anything and up your chances of winning ten times..")

		saynn("You rub your face and growl silently into your hands. Fuck.")

		saynn("So easy.. But easy is not for you..")

		saynn("[say=alexrynard]Listen. First of all, make sure the engine has cooled down for at least half a minute before each warp, add this check in code. That's still not gonna be enough to not shatter the bluespace crystal so you will have to replace the cooling system with a better one. Don't worry, it should be doable even while the engine is installed onto a spaceship, the team can get it done.[/say]")

		saynn("She listens carefully to your words.. and then nods.")

		saynn("[say=lin_alex]Thank you, Al.. You didn't have to do that. I'm sorry for..[/say]")

		saynn("[say=alexrynard]It's okay, I understand, quit being sorry.[/say]")

		saynn("She reaches her paws out to hug you carefully.. and then leaves a little kiss on your lips. You kiss her back, way longer this time, your tongues doing a little dance in her mouth.")

		saynn("[say=lin_alex]I think I'm gonna.. leave you to it. If you ever need something, let me know.[/say]")

		saynn("[say=alexrynard]Take care, Lin.[/say]")

		saynn("She nods again.. and nuzzles your cheek more before stepping out of the room, Sentinel opening the door for her.")

		saynn("Right, time to focus.")

		addButton("Work", "Try to finish the prototype", "alex_tries_to_finish_the_prototype")
	if(state == "alex_tries_to_finish_the_prototype"):
		removeCharacter("lin_alex")
		playAnimation(StageScene.Solo, "stand", {pc="alexrynardy"})
		saynn("After a week of working on the project non-stop, you now have something. The whole skeleton is now mostly completed. There is even a space for the board that will do all the required calculations for the whole unit. You just need to source it somewhere.. better motors and sensors would be nice too.")

		saynn("You look around the workshop. Everything that you could realistically disassemble.. got disassembled already. Even the fridge.")

		saynn("[say=alexrynard]Can we order what's left for the project, Sentinel?[/say]")

		saynn("[say=sen_alex]I was unable to get any more loans approved. I'm sorry, Sir.[/say]")

		saynn("You're not poor.. you're way below zero now. And all you have.. a frame of a dream. This can't end like this.")

		saynn("[say=sen_alex]May I suggest disassembling me again, Sir?[/say]")

		saynn("Never. Your enthusiasm is long gone.. but that doesn't mean you can start sacrificing friends to achieve your goal.")

		saynn("[say=alexrynard]You will play your part in this project, don't worry. Just not like an organ donor.[/say]")

		saynn("[say=sen_alex]Of course, Sir. I'm afraid I'm out of options then.[/say]")

		saynn("Think, Alex, think. There must be something. Maybe your mind got too intoxicated from working with tech for so long.")

		saynn("[say=alexrynard]I will go on a little walk, and breathe some air.[/say]")

		saynn("[say=sen_alex]Good idea, Sir.[/say]")

		addButton("Walk", "Go for a walk", "alex_walks_around")
	if(state == "alex_walks_around"):
		aimCameraAndSetLocName("alexf_randomcor")
		removeCharacter("sen_alex")
		playAnimation(StageScene.Solo, "walk", {pc="alexrynardy"})
		saynn("You exit your apartment and look around. The whole world looks so different now. But you just can't focus on anything else anymore.. only on your project.")

		saynn("You follow the corridors of the station, stare at the vast open space through some windows.. but the anxiety just doesn't go away.")

		saynn("Your eyes spot one of the trash bins.. No.. surely you won't lower yourself to that level. People do like to throw out broken tech though. Why repair when you can just order a new shiny one.")

		saynn("You walk past it.. your eyes notice a shiny metal glint that is produced by some object in that bin.. You feel like you won't be able to sleep if you don't at least check it..")

		saynn("Fuck it, you look around to make sure no one is looking and then start rummaging through it, searching for anything useful. The glint turned out to be just some packaging.. but you won't give up that easily.")

		saynn("[say=captain]Hey.[/say]")

		saynn("Oh shit.")

		addButton("Play it cool", "Panic!", "alex_approached_by_cap_again")
	if(state == "alex_approached_by_cap_again"):
		addCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npc="captain"})
		saynn("It's best to pretend that you just accidentally dropped something and are now looking for it.. yes.")

		saynn("[say=alexrynard]Sorry, I lost a damn..[/say]")

		saynn("You turn around and realize that the figure looks quite.. familiar.")

		saynn("[say=alexrynard]Wait, I remember you. Mister Wright, wasn't it?[/say]")

		saynn("He nods. You pull your hands out of the trash bin and just dry them against your dirty uniform. Better get it cleaned soon.. but who cares.")

		saynn("[say=captain]Life's been rough?[/say]")

		saynn("[say=alexrynard]It's that obvious?[/say]")

		saynn("[say=captain]My offer still stands.[/say]")

		saynn("Give up everything? Now? Fuck.. Maybe it's time to give up? But something about going with this guy rubs you the wrong way.")

		saynn("[say=alexrynard]Is that why are you still here? To test how much you can lowball me?[/say]")

		saynn("[say=captain]I just wanted to look at the Expo. See what kind of projects people are working on. I heard that you had to quit your team?[/say]")

		saynn("[say=alexrynard]And who told you that?[/say]")

		saynn("You talk so aggressively without even realizing it..")

		saynn("[say=captain]Some guy at the bar was happy he fired some 'beta'. Whatever that means.[/say]")

		saynn("[say=alexrynard]And you instantly thought of me, huh?[/say]")

		saynn("To be fair, you don't exactly look like an alpha at this moment. But he just never saw you in bed yet.")

		saynn("[say=captain]I don't think he is right. The guy was.. quite dumb. Listen, I want to give you something.[/say]")

		saynn("He tries to hand you a chip.. A chip with credits. A lot of credits. Enough to cover the expenses that are left. Feels too good to be true..")

		saynn("[say=alexrynard]Are you buying me? I'm still too busy to work for you. Even if I wanted to. No hard feelings.[/say]")

		saynn("[say=captain]Take it, no strings attached. Use these credits any way you see fit, they're yours.[/say]")

		saynn("Oh fuck. If the guy wants to throw credits around, that's just not your problem anymore. You hungrily snatch the chip and quickly put it away.")

		saynn("[say=alexrynard]Listen, I appreciate it, really. But even if I win, I sure as hell won't go working for you then, hope you understand that.[/say]")

		saynn("[say=captain]Of course, that's okay. See you around, Alex.[/say]")

		saynn("What? That's it? No gotcha? You can't believe it but the guy is indeed just leaving now.")

		saynn("[say=alexrynard]Wait. Why are you doing this?[/say]")

		saynn("[say=captain]I just want to see some real competition at the Expo. Other projects are nothing compared to the engine. But I think you might have a chance at beating your own creation. You just need some help.[/say]")

		saynn("And just like that.. He leaves..")

		saynn("You look at the chip.. your hands shake.. such a familiar feeling.")

		addButton("Work", "Time to do some work", "alex_has_credits_time_to_work")
	if(state == "alex_has_credits_time_to_work"):
		aimCameraAndSetLocName("alexf_apart")
		addCharacter("sen_alex")
		removeCharacter("captain")
		playAnimation(StageScene.Solo, "stand", {pc="alexrynardy"})
		saynn("You register the credits to your account and then rush back to your apartment.")

		saynn("[say=alexrynard]Sentinel, order everything! I found the credits.[/say]")

		saynn("[say=sen_alex]Welcome back, Sir. Right away.[/say]")

		saynn("It was truly enough for everything. At some point you begin to feel like this project might actually see the light of day.. that it might actually succeed.")

		saynn("Still, it was a lot of work, finishing the frame, assembling, coding. Too much work for one month. Strangely, you don't feel it weighing you down anymore. It's like you don't care.")

		saynn("Your testing was just putting the thing on a few times and seeing if it even functions at all. The motors do seem to give you extra strength. Which is something. The secret ingredient is still yet to be added. But it must be added last.")

		saynn("You carefully place all of the pieces of the finished exoskeleton onto the workbench. It's not pretty.. there is no armor that these things usually come with. But you don't need armor when you have the brains.")

		saynn("You haven't slept in days.. You have lost sense of time completely.")

		saynn("[say=alexrynard]When is the Expo, Sentinel?[/say]")

		saynn("[say=sen_alex]Tomorrow, Sir. In exactly 12 hours.[/say]")

		saynn("Time flies..")

		saynn("[say=alexrynard]Set an alarm so I don't oversleep.[/say]")

		saynn("[say=sen_alex]Yes, Sir.[/say]")

		saynn("You hear someone knocking on the door.")

		saynn("[say=sen_alex]It's Lin, Sir.[/say]")

		saynn("[say=alexrynard]Just let her in.[/say]")

		addButton("Lin", "See what's up with her", "lin_walksin_after_all")
	if(state == "lin_walksin_after_all"):
		addCharacter("lin_alex")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npc="lin_alex"})
		saynn("The door opens and Lin slowly walks in. She looks around the room, probably still impressed by how much you managed to transform it.")

		saynn("[say=lin_alex]Hey, Al, wanted to check on you..[/say]")

		saynn("[say=alexrynard]I'm still alive. And I finished my Expo entry even.[/say]")

		saynn("[say=lin_alex]Our team is ready too..[/say]")

		saynn("She looks at the workbench, seeing your prototype.")

		saynn("[say=alexrynard]Well, let the best project win, huh?[/say]")

		saynn("[say=lin_alex]Yeah..[/say]")

		saynn("She looks at you next.")

		saynn("[say=lin_alex]Wow.. You changed so much.[/say]")

		saynn("You rub your chin.")

		saynn("[say=alexrynard]Yeah, I think I aged like twenty years in the last few weeks.[/say]")

		saynn("[say=lin_alex]Your hair has grown so much too.. May I?[/say]")

		saynn("[say=alexrynard]Sure.[/say]")

		saynn("She reaches her paws out, gently caressing your cheeks and carefully bringing all the loose hair strands behind your head. Then she uses a spare rubber band to form a nice ponytail.")

		addButton("Continue", "See how it looks", "alex_gets_ponytail")
	if(state == "alex_gets_ponytail"):
		playAnimation(StageScene.Hug, "hug", {pc="alexrynard", npc="lin_alex"})
		saynn("Her touch still feels so nice.. makes you feel calmer.. the noise in your head clearing up just from her being near.")

		saynn("[say=alexrynard]Thanks. I can actually see how pretty you are now.[/say]")

		saynn("She giggles and then hugs you.")

		saynn("[say=lin_alex]And you look and feel very manly~.[/say]")

		saynn("Lin nuzzles your cheeks, her paws exploring your body.")

		saynn("[say=alexrynard]Someone's horny, huh~?[/say]")

		saynn("One of your hands slides down to her crotch.. and feels how warm it is.")

		saynn("[say=lin_alex]Yes, Sir~.[/say]")

		saynn("[say=alexrynard]Ohh, are you trying to be a good girl for me?[/say]")

		saynn("She leans super close, your noses colliding, her lusty eyes looking directly into yours.")

		saynn("[say=lin_alex]I am such a bad girl, you can't even imagine it~.[/say]")

		saynn("[say=alexrynard]Hands behind your back, bad girl.[/say]")

		saynn("Now she leans in close to your ear.")

		saynn("[say=lin_alex]Make me~.[/say]")

		addButton("Make her", "Sounds like an invitation", "alex_makes_lin")
	if(state == "alex_makes_lin"):
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="lin_alex", npcBodyState={underwear=true}})
		saynn("Lin raises her chin high as you get a grasp on her neck, her bratty eyes follow your other hand as you begin to strip her uniform.")

		saynn("[say=lin_alex]I could stop you at any point..[/say]")

		saynn("[say=alexrynard]And yet..[/say]")

		saynn("After the clothes are on the floor, you gently wrench her arms behind her back and then tie them up together with some left-over wire.")

		saynn("[say=alexrynard]..you'd rather submit to me.[/say]")

		saynn("She smiles, testing your make-shift restraints.")

		saynn("[say=alexrynard]On your knees, girl.[/say]")

		saynn("Lin stands still, your order seems to be ignored.")

		addButton("Spank", "Punish her for disobeying", "spank_lin_for_brat")
	if(state == "spank_lin_for_brat"):
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npcAction="hurt", npc="lin_alex", npcBodyState={underwear=true}})
		saynn("You wait a solid five seconds to give the brat enough time to consider her actions.. But after that.. all bets are off.")

		saynn("Lin gasps softly as your hand finds her neck again before the second one delivers a smack on her cute butt, causing the foxy to stifle out a moan.")

		saynn("[say=alexrynard]Either I see you sitting on the floor.. or you're not sitting at all for a while.[/say]")

		saynn("[say=lin_alex]Make me.[/say]")

		saynn("Her butt receives another smack, making it jiggle slightly.")

		saynn("[say=lin_alex]Harder.[/say]")

		saynn("Another three spanks in a row.. Lin's butt begins to glow red.")

		saynn("[say=lin_alex]Nh-h.. Harder still. Make it sting like hell..[/say]")

		saynn("You don't recall her being such a masochist.")

		saynn("Lin sees your confused stare and offers a little smile.")

		saynn("[say=lin_alex]I want you to hurt me, Sir. Like a bad girl that I am..[/say]")

		saynn("It did feel kinda good to let all that stored tension out through the spanks.. She is asking for it too..")

		addButton("Hurt her", "Be rough with Lin", "do_be_rough_with_lin")
		addButton("Cuddle her", "Be very soft with Lin", "do_be_soft_with_lin")
	if(state == "do_be_soft_with_lin"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="lin_alex", bodyState={underwear=true}, npcBodyState={underwear=true}})
		saynn("[say=alexrynard]I'm not gonna hurt you, silly.[/say]")

		saynn("Lin lowers her gaze.")

		saynn("[say=lin_alex]Why not..[/say]")

		saynn("You wrap your arms around her and gently pull her in for some warm cuddles instead, your cheek brushing against hers.")

		saynn("[say=alexrynard]Because it feels wrong.[/say]")

		saynn("[say=lin_alex]But I'm.. bad..[/say]")

		saynn("Your hands gently caress her curves.")

		saynn("[say=alexrynard]No you're not. You're doing what you think is the best. Sometimes you have no choice.[/say]")

		saynn("[say=lin_alex]I'm just so.. tired..[/say]")

		saynn("Is that tears?")

		saynn("[say=alexrynard]The Expo is gonna be over soon. We will have so much time to spend together.[/say]")

		saynn("You cover her neck and shoulders with kisses all around. Sadly it only makes the girl's tears stream down her cheeks more.")

		saynn("[say=lin_alex]H-h.. yeah..[/say]")

		saynn("You just hum a little melody into her ear and cuddle Lin.")

		saynn("To be fair, you're extremely tired too. Your eyes really want to close..")

		saynn("Your brain decides that it's time to sleep..")

		addButton("Sleep", "Sleep while embracing Lin", "do_sleep_with_lin")
	if(state == "do_be_rough_with_lin"):
		playAnimation(StageScene.Choking, "tease", {pc="alexrynard", npc="lin_alex", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("[say=alexrynard]Alright, little slut. You asked for it.[/say]")

		saynn("Suddenly, you pin Lin against one of the walls of your apartment, making her gasp. You steal that gasp by increasing pressure on her throat, your other hand quickly stripping your uniform and exposing your cock that is already peeking out of its sheath.")

		saynn("Lin bites her lip.. the girl isn't even hiding it anymore.")

		saynn("[say=alexrynard]Such a dirty whore. You're wet down there already, aren't you?[/say]")

		saynn("[say=lin_alex]Yes..[/say]")

		saynn("You obsessively yank her panties off her, exposing her soaking wet flower. Flower, that you are quick to slap.")

		saynn("[say=lin_alex]Nh-h~.. More..[/say]")

		saynn("[say=alexrynard]Shut up, I'm not doing this for your entertainment. You lost your rights when you decided to disobey me.[/say]")

		saynn("Another pussy slap makes Lin arch her back and produce a painful cry of passion.")

		saynn("[say=lin_alex]I'm sorry.. This slut is yours to punish..[/say]")

		saynn("You grab one of her legs and raise it high, already aligning your hard cock with that bruised cunt. Feels so good to not be a beta for once.")

		addButton("Fuck her", "Time for some action", "do_fuck_lin_rough")
	if(state == "do_fuck_lin_rough"):
		playAnimation(StageScene.Choking, "sex", {pc="alexrynard", npc="lin_alex", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("One rough motion of your hips causes your cock to spread that pussy wide. The slut instantly clenches as you ram your whole length inside.. So tight. Lin tries to moan.. but that's when your hand starts choking her for real.")

		saynn("[say=lin_alex]Nh-h..[/say]")

		saynn("[say=alexrynard]Stupid little bitch.[/say]")

		saynn("She nods subtly, her eyes full of lust no matter how much you degrade her. And choking her only makes her pussy grip your cock more.")

		saynn("You start fucking her, raw, your motions rough. Her body struggles to withstand such an onslaught, her legs shaking. Such a helpless pray she is.")

		saynn("[say=alexrynard]Worthless. Completely. Just a fucktoy, nothing more.[/say]")

		saynn("You're not holding back anymore.. After such a stressful month it only makes sense to let all your stored tension out on someone.. and Lin seems to want the opposite.. good for her.")

		saynn("[say=lin_alex]Ah-h-h..[/say]")

		saynn("Noises of your cock slapping against her bruised pussy folds are complemented by an occasional moan slipping past her lips. You're giving her some air to breathe, you're not a monster.")

		saynn("The knot at the base of your cock is inflating.. making it hard to fit it inside that slutty cunt anymore.. Looks like you will have to apply more force.")

		addButton("Knot Lin", "Breed that slut", "do_knot_lin_rough")
	if(state == "do_knot_lin_rough"):
		playAnimation(StageScene.Choking, "inside", {pc="alexrynard", npc="lin_alex", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true}})
		saynn("Just when Lin begins to get weaker from the lack of air, you wake her up by suddenly shoving your whole length down her cunt, your member breaking into her needy womb, creating a visible bump on her belly.")

		saynn("[say=lin_alex]F-fu-uck-k~..[/say]")

		saynn("She throws her head back and moans passionately, tears streaming down her cheeks, her whole body is shivering, your inner walls gripping your cock extremely tight.")

		saynn("The bitch is so cumming so hard, your own orgasm draws near. And you welcome it, grunting manly while your throbbing cock starts filling her babymaker full of your seed.")

		saynn("[say=alexrynard]Your only purpose is being a breeding bitch.[/say]")

		saynn("[say=lin_alex]Yes-s..[/say]")

		saynn("The knot holds your cum inside her, making the bump on her belly bigger.")

		saynn("Now you're forced to stay like that for some time. The slut is clearly loving it, even if she is crying. Looks like you're not the only one with a baggage of stored emotions.")

		saynn("You relax the grip on her neck, letting Lin breathe normally.")

		saynn("[say=alexrynard]You're okay?[/say]")

		saynn("[say=lin_alex]Thank you.. I think I am.. I don't feel any worse than I did before.[/say]")

		saynn("Might as well try to get into a better position now.")

		addButton("Floor", "Lie down on the floor", "do_lay_down_after_breed")
	if(state == "do_lay_down_after_breed"):
		playAnimation(StageScene.Sleeping, "sleep", {pc="alexrynard", npc="lin_alex", bodyState={underwear=true}, npcBodyState={exposedCrotch=true}})
		saynn("You wait for the knot to deflate enough and then yank it out, causing Lin's used pussy to start dripping your cum onto the floor. Who cares, the whole apartment is a mess anyway.")

		saynn("[say=lin_alex]Ah..[/say]")

		saynn("After that, you bring her to your little sleeping spot and pull her over you, like a blanket.")

		saynn("Her tears keep making you think like you did something very wrong.. but you're way too tired to reflect on that.")

		addButton("Sleep", "Sleep while embracing Lin", "do_sleep_with_lin")
	if(state == "do_sleep_with_lin"):
		playAnimation(StageScene.Sleeping, "sleep", {pc="alexrynard", bodyState={underwear=true}})
		removeCharacter("lin_alex")
		saynn("[say=sen_alex]Beep beep beep beep.[/say]")

		saynn("[say=alexrynard]I'm up.. up..[/say]")

		saynn("The sleep has ended faster than it began. Oh shit, the Expo is in one hour.")

		saynn("Lin is nowhere to be seen. Makes sense, she has to prepare too.")

		addButton("Shower", "Take a quick shower", "alex_prepares_before_expo")
	if(state == "alex_prepares_before_expo"):
		playAnimation(StageScene.Solo, "stand", {pc="alexrynard"})
		saynn("You take a quick shower and put on your usual uniform. It looks unusually clean, did Lin do that?")

		saynn("You walk up to the bench and start preparing the prototype too.")

		saynn("[say=sen_alex]Sir, there is one alarm.[/say]")

		saynn("[say=alexrynard]Huh? A pizza guy? Whatever, I don't have time to eat.[/say]")

		saynn("[say=sen_alex]No, Sir. It's something else.[/say]")

		saynn("[say=alexrynard]Fine, tell me.[/say]")

		saynn("[say=sen_alex]There is a problem with that, Sir. I'm not sure what the alarm is.[/say]")

		saynn("You tilt your head at the camera that the Sentinel is seeing the world through.")

		saynn("[say=alexrynard]Did the star radiation flip the wrong bit in you?[/say]")

		saynn("[say=sen_alex]I'm really not sure, Sir..[/say]")

		saynn("You shrug. His alarm clock module worked so he can't be that broken.")

		saynn("[say=alexrynard]Whatever, we will deal with that later. Right now I need you for something else.[/say]")

		saynn("[say=sen_alex]Yes, Sir.[/say]")

		saynn("You quickly do the last preparations and then store your prototype in a big bag.")

		saynn("Time to do this.")

		addButton("Expo", "Attend the annual AlphaTech Expo", "alex_attends_expo")
	if(state == "alex_attends_expo"):
		aimCameraAndSetLocName("alexf_expo")
		removeCharacter("sen_alex")
		addCharacter("boss_alex")
		addCharacter("lin_alex")
		addCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="boss_alex"})
		saynn("The Expo is happening in a big hangar. Not the one that you used to work in, a much bigger one, giving all the participants plenty of space to showcase their contraption.")

		saynn("And wow, it's getting very crowded already. People all around the galaxy seem to be interested in seeing what the young minds of this generation came up with this time.")

		saynn("You quickly find your exhibition booth and prepare your showcase. You don't have any fancy fliers or ads for your project.. But hopefully a good project will beat lack of marketing.")

		saynn("A man wearing an official white uniform begins to speak to the public.")

		saynn("[sayMale]Welcome, ladies and gentlemen, to the annual AlphaTech Expo. I'm proud to announce that today we have more than ten beautiful projects out on display, ready to be showcased. But only one of them will go home today with the main prize: Unlimited Project funding, courtesy of AlphaCorp. That's right, AlphaCorp promises to pay any project-related expenses, helping you turn your one-off prototype into a serial production![/sayMale]")

		saynn("People are clapping. You notice Mister Wright standing in the second row.")

		saynn("[sayMale]We have three judges, each one will rank each project on a variety of factors. Remember that the size of a project doesn't matter, what matters are the three core principles: Efficiency, Durability, Simplicity. Innovation is good.. but what is it if your tech can't be easily replicated or costs too much to repair?[/sayMale]")

		saynn("Well, that gives you at least some hope.. You look at the booth of your ex-boss.. It's huge because they had to find space for the whole spaceship. Flashy ads, big words, smug faces. Only Lin looks down at the floor.")

		saynn("[sayMale]The order of projects will be decided by drawing cards with numbers. I ask our participants to approach us now. As for everyone else, feel free to explore the exhibits! The judges will start their work shortly. Thank you for being part of the AlphaTech Expo, where dreams become reality![/sayMale]")

		saynn("You run into your ex-boss as you begin to approach the table with the cards.")

		saynn("[say=boss_alex]Didn't think I'd see you here.[/say]")

		saynn("You want to walk past but he blocks the path.")

		saynn("[say=boss_alex]Is that what you came up with? Assemble your own metal cage kit?[/say]")

		saynn("He points at the table with the pieces of your exoskeleton carefully placed on.")

		saynn("[say=alexrynard]Let me through.[/say]")

		saynn("[say=boss_alex]Or what? Gonna cry?[/say]")

		saynn("Starting a fist-fight here is not a good idea. But in the absence of any good ones.. you decide to punch the fucker in the jaw anyway. He grunts and recoils back.")

		saynn("[say=boss_alex]Argh! H-hey! You hit me! He hit me![/say]")

		saynn("His own team members are pulling him away after that. At least your boys still respect you.")

		saynn("You drew a number.. nine. Pretty much last. It will be hard to impress the judges after all the other projects.")

		saynn("Your ex-boss drew a number.. two. Fucker is lucky, you can give him that.")

		saynn("Well, all you can do is wait for your turn now.")

		addButton("Wait", "Wait until it's your turn to showcase the project", "engine_showcase")
	if(state == "engine_showcase"):
		playAnimation(StageScene.Duo, "stand", {pc="boss_alex", npc="lin_alex"})
		saynn("Everyone's eyes and ears are glued to that spaceship though, it's hard to ignore it when it's their turn to showcase their project.")

		saynn("[say=boss_alex]Welcome! As you might already know, with the discovery of Bluespace, many scientists rushed to try to find a use for it. And I'm happy to announce that me and my team successfully harnessed the power of a bluespace crystal to create an entirely new type of engine. Something that was Never done before![/say]")

		saynn("The guy is a lying piece of shit. But his 'team' is not so fast to point out that you also had a huge part in it. Whatever. Lin is staying quiet too, avoiding eye contact.")

		saynn("The three judges carefully inspect all the promo material. One of them has a few questions.")

		saynn("[sayMale]New type of engine? How much faster is it than the current FTL-capable solutions? Don't get me wrong, it's great to explore these kinds of things. But new is not always better, hope you can understand what I mean.[/sayMale]")

		saynn("[say=boss_alex]It's.. much faster! It's way faster than any FTL engine.[/say]")

		saynn("You are ready to facepalm, he didn't even try to understand how it works.")

		saynn("[sayMale]Faster than faster than light engines?[/sayMale]")

		saynn("[say=lin_alex]It's.. it's actually instant.. Bluespace warping is instant..[/say]")

		saynn("The boss is quick to grab Lin and pull her closer to the judges.")

		saynn("[say=boss_alex]This is Lin, our Bluespace expert. She knows Everything about it. Thanks to her, this dream became a reality.[/say]")

		saynn("[say=lin_alex]It wasn't me, it's..[/say]")

		saynn("The boss is quick to cut her off.")

		saynn("[say=boss_alex]Yes, it's our whole team, of course. Lin is being shy but she is right, remove any one person from our team and this project wouldn't be possible. But, thanks to my leadership skills, I'm proud to tell you all that we had zero problems developing this engine.[/say]")

		saynn("You start to regret that you didn't shatter his jaw when you could have. The judges inspect the spaceship from a far. There are little fences that prevent people from getting too close to it.")

		saynn("[sayMale]Very interesting. FTL warping might sometimes take hours of time. If your claims are true, this might be truly groundbreaking. But I find your words hard to believe.[/sayMale]")

		saynn("[say=boss_alex]Oh, you don't have to trust my words, you can just trust your eyes. I'm a little hungry, I really could use a good pizza right now. I'm probably not alone, right?[/say]")

		saynn("He smiles and then shows a thumbs up to the person who is inside the spaceship.")

		saynn("Seconds later, the spaceship's little vertical-thrust engines suddenly kick in. The ship slowly takes off while the crowd gasps.")

		saynn("[sayMale]What are you doing?[/sayMale]")

		saynn("[say=boss_alex]It's just a demo, don't worry.[/say]")

		saynn("There are plenty of reasons to worry. You did many tests.. but you never had a chance to test it mounted on a spaceship..")

		saynn("The ship carefully phases through the thick hardlight barrier that keeps the air from escaping, positions itself just right.. and then starts to warp..")

		saynn("Soon, the space just before the spaceship gets torn apart, spawning an incredibly-looking blue glowing rift. If you look inside it.. you just see.. waterfalls of energy.")

		saynn("The ship carefully flies into it.. before disappearing completely.. and leaving people speechless. You can't help but to whisper something.")

		saynn("[say=alexrynard]It's.. working. So beautiful..[/say]")

		saynn("A few seconds pass. The boss nudges Lin and whispers to her.")

		saynn("[say=boss_alex]That's supposed to happen, right? We're looking kinda bad right now.[/say]")

		saynn("She just nods back. Both, you and her, know that it was a bad idea to try to push this engine so hard.")

		saynn("And yet, exactly after thirty seconds, another bluespace rift opens in the exact same place before the same exact spaceship flies out of it, facing the other direction now.")

		saynn("People are clapping furiously while the ship lands. It's pilot walks out with a pizza box in his hands. He opens it and shows it to the public.")

		saynn("[say=boss_alex]See? Right out of the oven, the cheese didn't even have enough time to melt.[/say]")

		saynn("He offers each judge a slice, they happily take it after they are done clapping their hands too.")

		saynn("Throughout all of this.. you can't help but to think how big of a waste this is. Using such advanced technology.. just to order pizza. You probably would have done the same though, having instant pizza is kinda nice.")

		saynn("That one is gonna be hard to top..")

		saynn("Eventually, the judges move on to other projects. But none of them come even remotely to that one.")

		saynn("Now it's your turn..")

		addButton("Showcase", "Present the judges your project", "alex_showcases_project")
	if(state == "alex_showcases_project"):
		playAnimation(StageScene.Solo, "stand", {pc="alexrynard"})
		saynn("All the pieces of the exoskeleton are still on the table. You didn't really prepare any speeches. Time to wing it.")

		saynn("[say=alexrynard]Um.. welcome everyone. Gonna be honest, my project is not as big as that fancy spaceship. But I'm pretty sure mine is more useful. Hopefully by the end of my little presentation, you will see why.[/say]")

		saynn("The judges look at the disassembled pieces lying on the table, most of them are confused.")

		saynn("[sayMale]Well, tell us about your project.[/sayMale]")

		saynn("[say=alexrynard]Right.. What you see here on the table is an exoskeleton. I called my project..[/say]")

		saynn("Oh shit.. What would be a good name.. Right.")

		saynn("[say=alexrynard]Sentinel-X mark Zero.[/say]")

		saynn("[sayMale]So it's just an exoskeleton? Looks pretty bare for an exoskeleton.[/sayMale]")

		saynn("[say=alexrynard]Well, let me show you how easy it is to put it on.[/say]")

		addButton("Wear it", "Wear your exoskeleton", "alex_wears_exosuit")
	if(state == "alex_wears_exosuit"):
		playAnimation(StageScene.Solo, "stand", {pc="alexrynard"})
		saynn("You grab one of the pieces off the table and then just press it against your wrist. And, seconds later, it just latches onto it, using motors and pistons to expand itself onto your whole arm before fastening itself tight.")

		saynn("Some of the public is already kinda impressed.")

		saynn("[say=alexrynard]As you can see, incredibly easy to put on.[/say]")

		saynn("You place the second piece against your other wrist.. until it does the same, expanding itself onto your whole other arm, using metal supports that don't restrict your range of motions at all. After that, you flex your arms, causing all the little powerful motors to whirl audibly.")

		saynn("[say=alexrynard]With just these two pieces, I am now the strongest person in the world.[/say]")

		saynn("You didn't prepare anything heavy.. so you just lift the table by its corner.. with two fingers. It sure looks unnatural.")

		saynn("[sayMale]That's interesting, for sure. But I think the market already has similar products.[/sayMale]")

		saynn("[say=alexrynard]Fair. This one is completely modular though. Attaching or swapping tools, armor, and weaponry is effortless. Let me put the rest on.[/say]")

		saynn("You grab the main piece and press it against your chest. Seconds later, the piece grabs onto your chest and begins constructing a rigid frame around it. Then, it finds your arm modules and connects to them, forming one whole exosuit. After it, come the leg pieces that also attach themselves to the chest piece automatically.")

		saynn("[say=alexrynard]See. Less than a minute. And now I can do this.[/say]")

		saynn("You jump.. super high. Higher than the heads of the judges that are watching you. And yet, your landing was incredibly soft, the motors in your leg pieces spreading the impact over a long time.")

		saynn("[sayMale]Huh. I don't think soldiers jump very often.[/sayMale]")

		saynn("[say=alexrynard]Planets have different gravity. My exoskeleton would allow you to wear better armor than you otherwise could have. Jumping is just a bonus.[/say]")

		saynn("[sayMale]You didn't bring any to show us?[/sayMale]")

		saynn("Wow, they're so needy.")

		saynn("[say=alexrynard]I will be honest, I just didn't have any time. Due to some.. life problems.. I only had 2 weeks to make my prototype. But as you can see, it's incredibly light, uses very simple parts and materials, doesn't take long to assemble and is extremely modular while also being fairly durable.[/say]")

		saynn("[sayMale]Right.. That is very fair. Anyone have any questions?[/sayMale]")

		saynn("You are wondering if you should do it now or..")

		saynn("But then your ex-boss takes the first row.")

		saynn("[say=boss_alex]How is it powered? I bet it works for less than an hour.[/say]")

		saynn("Of course he knows where to poke.")

		saynn("[say=alexrynard]Just a simple battery. I didn't have access to any bluespace crystals. With them I would be able to expand this exoskeleton's battery time to pretty much forever.[/say]")

		saynn("[sayMale]You made a lot of claims here, Mister.. Rynard. I hope you will forgive me if I don't trust everything that was said but not shown.[/sayMale]")

		saynn("It's probably time..")

		saynn("[say=alexrynard]Want me to show how easy it is to charge it?[/say]")

		saynn("[sayMale]Um.. Sure?[/sayMale]")

		saynn("Now or never.")

		addButton("Continue", "See what happens next", "alex_impresses_judges")
	if(state == "alex_impresses_judges"):
		addCharacter("sen_alex")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="sen_alex"})
		saynn("You whisper something to the exoskeleton.. and it just kinda.. opens up, allowing you to step out of it while the frame itself continues to stand on its own.")

		saynn("[sayMale]It just uses motors to freeze itself, right? Nice trick.[/sayMale]")

		saynn("You smile and approach the nearest power socket. Everyone is slightly confused.")

		saynn("[say=alexrynard]Come to me, Sentinel.[/say]")

		saynn("[say=sen_alex]Yes, Sir![/say]")

		saynn("Your exoskeleton says that before closing up and just casually approaching you.. while there is no one inside it.")

		saynn("[say=alexrynard]I want to charge you.[/say]")

		saynn("The exoskeleton retracts its plug and hands it to you, allowing you to insert it into the wall's socket.")

		saynn("[say=sen_alex]Charge is at 69%, going up. I'm gonna be charged in 2 minutes, Sir.[/say]")

		saynn("[say=alexrynard]Good. Unplug yourself when it's done.[/say]")

		saynn("Everyone's jaw is.. dropped.")

		saynn("[sayMale]Wait-wait-wait, it can walk on its own? And talk?[/sayMale]")

		saynn("You pretend to be surprised by everyone's surprised expressions.")

		saynn("[say=alexrynard]Yeah? It uses a very powerful but simple neural network that can utilize any of the exoskeleton's functions. Including walking and talking, yes. If the person inside is injured, it can just bring them to safety on its own. Or it can also just hold a weapon and fight completely on its own or as a squad member.[/say]")

		saynn("[sayMale]Those claims would have to be tested as well.. But after seeing this.. huh. This might be the next combat tech revolution that we're seeing..[/sayMale]")

		saynn("Your smile becomes even wider. Obviously, your ex-boss looks furious.. Sentinel carefully unplugs itself after he's been charged and just stands by your side.")

		saynn("[say=sen_alex]I'm ready, Sir.[/say]")

		saynn("The judges look truly impressed. Looks like your presentation has had the right effect.")

		saynn("[say=alexrynard]Well, this is where my demo ends. If you want more..[/say]")

		saynn("[say=boss_alex]Bullshit! I call bullshit![/say]")

		saynn("Huh? Your ex-boss leaves the crowd and kicks your exoskeleton, causing it to recoil back a few meters, its light frame hitting the table and causing some sparks..")

		saynn("[say=boss_alex]I bet it will break under any significant load.[/say]")

		saynn("The exoskeleton quickly recovers after that strike. It just approaches you again and stands still like nothing happened. You wanna punch him again so much.. but you can't just do it..")

		saynn("[say=alexrynard]You wanna try to fight me in it?[/say]")

		saynn("The boss realizes that he might have gone a little too far..")

		saynn("[say=boss_alex]Um.. Armwrestling is fine. I bet it will just snap.[/say]")

		saynn("You shrug.")

		saynn("[say=alexrynard]Sure, let's do it.[/say]")

		saynn("Your exoskeleton opens up, allowing you to step into it before closing up tightly. Looks like nothing broke after that hit. Good.")

		addButton("Armwrestling", "Time to teach your ex-boss a lesson", "alex_armwrestles_boss")
	if(state == "alex_armwrestles_boss"):
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="boss_alex"})
		saynn("And so you take the opposite spots around the table. Boss glares at you, clearly mad.")

		saynn("You and him place your elbows on the solid surface.. and grab each other's hands. The public is watching with anticipation, your eyes do manage to find Mister Wright in the crowd too, looks like he is interested in this match. Only Lin is standing a fair distance away.")

		saynn("[say=boss_alex]Three.. Two.. One.. Go![/say]")

		saynn("You decide to play with him a little bit and just keep your arm still. Your ex-boss tries to move it.. but all he can accomplish is to make the motors in your exoskeleton whirl slightly louder.")

		saynn("You smile. Finally the fucker is being humiliated in front of everyone.")

		saynn("[say=boss_alex]C'mon! Fucking.. Shit..[/say]")

		saynn("[say=alexrynard]Having trouble, boss?[/say]")

		saynn("[say=boss_alex]Fuck you..[/say]")

		saynn("He changes tactics and tries his best to purposely damage something in your exoskeleton. Such a loser.")

		saynn("[say=alexrynard]Sentinel, please try not to break his arm.[/say]")

		saynn("[say=sen_alex]Um.. yes, Sir.[/say]")

		saynn("With one effortless motion, your exoskeleton helps you to bring his hand onto the table. You're not sure what the guy even thought would happen. But you're glad that it happened.")

		saynn("[say=boss_alex]Argh![/say]")

		addButton("Continue", "See what happens next", "bad_stuff_starts")
	if(state == "bad_stuff_starts"):
		playAnimation(StageScene.Solo, "stand", {pc="alexrynard"})
		saynn("You take one step back and flex your exoskeleton's muscles again, making the motors whirl louder. The public seems to be amazed.")

		saynn("[say=sen_alex]Um.. something is wrong, Sir..[/say]")

		saynn("Sentinel is talking to you directly..")

		saynn("[say=alexrynard]Huh?[/say]")

		saynn("[say=sen_alex]I can't seem to.. Something is..[/say]")

		saynn("You realize that the motors.. don't disengage. Shit, something is indeed broken.")

		saynn("[say=alexrynard]Just lower the power, you have full control.[/say]")

		saynn("[say=sen_alex]I don't.. something.. losing..[/say]")

		saynn("You can't move.. can't even reach any manual controls.")

		saynn("Your eyes notice Lin standing alone.. her parted lips shivering..")

		saynn("[say=sen_alex]Alex.. I'm.. sorry..[/say]")

		saynn("It echoes in your mind.")

		saynn("[say=lin_alex]..sorry.. sorry..[/say]")

		saynn("This isn't good.. There must be a way to stop this.")

		saynn("Time slows down to a crawl. Moments later, you hear your own exoskeleton hitting your spine like a truck..")

		saynn("Yes, you don't even feel it.. you just hear the motors snapping your back in half, shattering all the bones like they're made out of plastic.")

		saynn("The world looks so strange upside-down..")

		saynn("A gut wrenching scream finally leaves you..")

		addButton("Continue", "See how you die next", "see_what_suit_does")
	if(state == "see_what_suit_does"):
		playAnimation(StageScene.Solo, "firepistol", {pc="sen_alex"})
		saynn("The suit opens up, dropping your broken body onto the floor. It hurts so much.. that you don't feel it..")

		saynn("[say=alexrynard]Hhh-h..[/say]")

		saynn("Your exoskeleton continues to stand..")

		saynn("[sayMale]Oh fuck! Don't just stand there, we need medics, now! We got an incident![/sayMale]")

		saynn("One hell of an incident..")

		saynn("What happens next is a blur.. Your exoskeleton suddenly closes up again and then rushes towards the nearest guard, stealing his energy gun with one swift motion. After that.. It starts shooting.")

		saynn("[sayMale]Gun it down, gun it down![/sayMale]")

		saynn("People are panicking.. everyone is stepping over each other's toes trying to get away from the killing machine.. killing machine that you have somehow created..")

		addButton("Continue", "See what kind of madness happens next", "sentinel_kills_lin")
	if(state == "sentinel_kills_lin"):
		removeCharacter("lin_alex")
		removeCharacter("sen_alex")
		playAnimation(StageScene.GivingBirth, "idle", {pc="alexrynard"})
		saynn("Fuck.. it's aiming at Lin.. She is in shock.. You try to yell something.. anything.. but the bone fragments of your spine have shredded your lungs.. stealing your breath and voice.")

		saynn("[say=alexrynard]N-n..h-hh..[/say]")

		saynn("Sentinel pulls the trigger..")

		saynn("Lin gasps as the laser shot pierces her chest.. right where her heart is. She looks at you with her shaky eyes.. before looking at her wound. A few lonely tears stream down her cheeks.. before she collapses.. No, why her..")

		saynn("Next, rouge Sentinel aims the gun at you.. Please.. Do it.. before getting shot by the other guards. They come closer and wreck it completely..")

		saynn("Vision quickly starts getting blurry, giving you zero time to comprehend what just happened.. you can't breathe.. which means.. you're dying fast anyway..")

		saynn("The world is getting darker and darker.. Eyes begin to close.")

		addButton("Continue", "Time to see what's waiting outside..", "alex_gets_saved")
	if(state == "alex_gets_saved"):
		removeCharacter("captain")
		removeCharacter("boss_alex")
		aimCameraAndSetLocName("alexf_medical")
		playAnimation(StageScene.Sleeping, "sleep", {pc="alexrynard", bodyState={naked=true}})
		saynn("It hurts so much.. everything but the body. You hear beeping.. so familiar..")

		saynn("You slowly open your eyes.. the bright sterile light hits your eyes. You're in a medical bed, connected to some equipment, including a pulse monitor.. beep.. beep..")

		saynn("You seem to be alive.. even if not exactly happy about it. Maybe Lin survived too? Lin!")

		saynn("You try to sit down.. but it proves to be quite tricky.. It's like your muscles are not listening to you.. wait.. That can't be right.")

		saynn("You.. don't feel your legs at all.. Beep. Beep. Beep. You try to pinch them.. nope. Can't move them, can't feel them, nothing.")

		saynn("[say=alexrynard]Fuck..[/say]")

		saynn("BEep. BeEP. Beeep.")

		saynn("In fact, you don't feel anything below your chest. You begin to realize what happened..")

		saynn("[say=alexrynard]No.. NO! FUCK![/say]")

		saynn("BEEP. BEEP. BEEP.")

		saynn("You don't believe it. That can't be right.")

		saynn("You try to get off the bed.. but quickly realize that one of your wrists is cuffed to the bed.. with police cuffs.. fuck..")

		saynn("The nurse rushes in after hearing you rattling the chain and being angry. She instantly presses you back into the pillow.")

		saynn("[sayFemale]Don't move. Try to calm down. Please.[/sayFemale]")

		saynn("[say=alexrynard]LIN! Where is she? IS SHE OKAY?![/say]")

		saynn("[sayFemale]Calm down! Try to breathe! We will tell you everything.[/sayFemale]")

		saynn("BEEP-BE-BEEP-BE-BE-BEEP!")

		saynn("No-no-no, fuck all of you. Where is Lin? You keep resisting so much that the nurse has no other option but to stab your shoulder with some syringe.")

		saynn("BEEP-BEEP. BEEP. BEep.. BeEP.. Beep. Beep.. Beep..")

		saynn("Your brain receives lots of chemicals that calm it down fast.. You just stop caring about it all.. Yeah, who cares.")

		saynn("Nurse takes a step back.. while you just look at her.")

		saynn("[sayFemale]You've been in a medical coma for ten days. The surgeon had to rebuild your whole spine piece by piece, stitch your organs. Unfortunately, your spinal cord nerves have suffered extreme damage and won't be able to heal on their own.[/sayFemale]")

		saynn("Great.. Just.. Perfect..")

		saynn("[sayFemale]Not all is lost. There is a possibility of installing a prosthetic spinal cord.. But.. unfortunately, that is not covered by the AMI. Best we can offer for now is a.. wheelchair.[/sayFemale]")

		saynn("Considering how much loans you have.. You already know that you're fucked..")

		saynn("You try as hard as you can to say something but only manage to produce a single word.")

		saynn("[say=alexrynard]Lin?[/say]")

		saynn("The nurse lowers her gaze.")

		saynn("[sayFemale]Unfortunately..[/sayFemale]")

		saynn("No..")

		saynn("The nurse is saying something but you don't hear anything anymore. All you hear is.. noise.")

		saynn("Your gaze defocuses. You drop your head onto the pillow and just stare at the same spot.")

		saynn("Nothing..")

		saynn("You feel nothing..")

		saynn("Can't think about anything..")

		saynn("You just keep staring at the ceiling.")

		saynn("No..")

		saynn("No..")

		saynn("No..")

		addButton("Continue", "Who cares..", "jack_comesin")
	if(state == "jack_comesin"):
		addCharacter("intro_detective")
		saynn("At least an eternity passes.. or maybe just a few hours.. who cares..")

		saynn("A person walks into your room. A wolf that is wearing some black pants and white shirt, clearly not a nurse.")

		saynn("He grabs one of the chairs and sits near your bed.")

		saynn("[say=intro_detective]Hello, Alex. Name is Jake, IIPF, threat assessment division. If you want something, let me know.[/say]")

		saynn("You don't react in any way. But Jake waits for a few seconds, just in case.")

		saynn("[say=intro_detective]You probably noticed the cuffs by now. They're there to keep you safe. May I ask some questions?[/say]")

		saynn("He stares at you, his eyes kind. Yours are empty.")

		saynn("[say=intro_detective]Can you help me try to figure out what happened on that day? We can start unraveling this from any point, as brief or as detailed as you want.[/say]")

		saynn("No words leave your mouth. Your muscles don't even think about flexing. Jake sighs.")

		saynn("[say=intro_detective]I know, it's a lot. I really want to help you. But I can't do that without you. All you have to do is say something.[/say]")

		saynn("Suddenly, you look him straight into the eyes.")

		saynn("[say=alexrynard]Do you have a gun?[/say]")

		saynn("He tilts his head slightly. His fake kind expression goes away, replaced by an annoyed one.")

		saynn("Jake steps out of your room and starts talking with some nurse about committing you somewhere..")

		saynn("After that, you're alone.")

		saynn("The drug's effect has disappeared by now. But nothing changed.")

		addButton("Continue", "See what happens next..", "captain_arrives_to_alex")
	if(state == "captain_arrives_to_alex"):
		removeCharacter("intro_detective")
		addCharacter("captain")
		playAnimation(StageScene.Solo, "stand", {pc="captain"})
		saynn("Some time has passed.")

		saynn("A nurse walks into your room. Followed by.. Mister Wright.")

		saynn("[sayFemale]There he is. He doesn't talk much.. at all.[/sayFemale]")

		saynn("[say=captain]Thank you, means a lot.[/say]")

		saynn("He sits near your bed. The nurse leaves.")

		saynn("Did he come to collect your debt to him too?")

		saynn("He doesn't say anything to you. Which means you don't have to answer.")

		saynn("Looks like that's where your story ends.. and another one starts.")

		addButton("Snap out of it", "Start looking at the world through your own eyes again", "story_end")
	if(state == "story_end"):
		removeCharacter("captain")
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		aimCameraAndSetLocName("yard_waterfall")
		GM.pc.setLocation("yard_waterfall")
		saynn("You blink many times.. and suddenly see the prison again.")

		saynn("[say=alexrynard]That's kind of it.. He paid for my prosthetic spine. Gave me a job. Now I'm here. It's not that bad.[/say]")

		saynn("He rubs his neck.")

		saynn("[say=alexrynard]I was wearing a collar for a few years.. you know.. since I'm still a convict myself. The thing was awful, I helped to make it at least somewhat tolerable, added a soft inner trim.[/say]")

		saynn("He looks at you. His eyes.. still as empty.")

		saynn("[say=alexrynard]Life is a strange thing, huh? Hard to predict what will happen next.[/say]")

		addButton("Yes", "Life is weird", "after_yes")
		addButton("No", "Everything has a reason", "after_no")
		addButton("Not your fault", "Tell Alex that all of that wasn't his fault", "after_notyour")
	if(state == "after_yes"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("[say=pc]Yeah, life will find ways to screw us over no matter what. We can only do our best and hope.[/say]")

		saynn("[say=alexrynard]I thought I did my best. But I was at my worst.[/say]")

		saynn("He sighs.")

		saynn("[say=alexrynard]You can leave me to finish fixing the broken datapads alone. Whatever is left should be the last batch.[/say]")

		saynn("[say=pc]What if it's not?[/say]")

		saynn("He shrugs.")

		saynn("[say=alexrynard]Then I will have to chat with the captain about that.[/say]")

		saynn("Alex stands up, his posture straight.")

		saynn("[say=alexrynard]Sorry about the long story, didn't think it'd be that long, it's just a single flash in my head. I still have no idea why you decided to help me. But thank you.[/say]")

		saynn("And just like that, he walks away, leaving you alone with your thoughts.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "after_no"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("[say=pc]Everything that happens usually has a reason. Maybe it had to happen that way.[/say]")

		saynn("[say=alexrynard]Maybe.. Everything makes sense in a hindsight, that is true.[/say]")

		saynn("Hard to find reasons for why life would break this foxy.. Even in a hindsight.")

		saynn("[say=alexrynard]You can leave me to finish fixing the broken datapads alone. Whatever is left should be the last batch.[/say]")

		saynn("[say=pc]What if it's not?[/say]")

		saynn("He shrugs.")

		saynn("[say=alexrynard]Then I will have to chat with the captain about that.[/say]")

		saynn("Alex stands up, his posture straight.")

		saynn("[say=alexrynard]Sorry about the long story, didn't think it'd be that long, it's just a single flash in my head. I still have no idea why you decided to help me. But thank you.[/say]")

		saynn("And just like that, he walks away, leaving you alone with your thoughts.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "after_notyour"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("[say=pc]Whatever happened back then, it wasn't your fault.[/say]")

		saynn("[say=alexrynard]I moved on, don't worry about it. There are no tears left to cry. I gotta be strong.[/say]")

		saynn("He sighs.")

		saynn("[say=alexrynard]You can leave me to finish fixing the broken datapads alone. Whatever is left should be the last batch.[/say]")

		saynn("[say=pc]What if it's not?[/say]")

		saynn("He shrugs.")

		saynn("[say=alexrynard]Then I will have to chat with the captain about that.[/say]")

		saynn("Alex stands up, his posture straight.")

		saynn("[say=alexrynard]Sorry about the long story, didn't think it'd be that long, it's just a single flash in my head. I still have no idea why you decided to help me. But thank you.[/say]")

		saynn("And just like that, he walks away, leaving you alone with your thoughts.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "alex_makes_lin"):
		getCharacter("lin_alex").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ZiptiesWrist"))

	if(_action == "do_sleep_with_lin"):
		getCharacter("lin_alex").removeAllRestraints()

	if(_action == "alex_wears_exosuit"):
		getCharacter("alexrynard").getInventory().equipItem(GlobalRegistry.createItem("AlexExoskeleton"))

	if(_action == "alex_impresses_judges"):
		getCharacter("alexrynard").resetEquipment()

	if(_action == "alex_armwrestles_boss"):
		getCharacter("alexrynard").getInventory().equipItem(GlobalRegistry.createItem("AlexExoskeleton"))

	if(_action == "sentinel_kills_lin"):
		getCharacter("alexrynard").resetEquipment()

	setState(_action)
