extends SceneBase

var howManyTimes = 0
var toldFuckoff = false
var tookPills = false
var didDiag = false
var logoPressed = 0

func _init():
	sceneID = "AlexCh2s1Scene"

func _initScene(_args = []):
	addCharacter("alexrynard")
	howManyTimes = getFlag("AlexRynardModule.ch2SceneNum", 0)
	
	if(howManyTimes == 0):
		setState("time1")
		increaseFlag("AlexRynardModule.ch2SceneNum")
		return
	if(howManyTimes == 1):
		setState("time2")
		increaseFlag("AlexRynardModule.ch2SceneNum")
		return
	if(howManyTimes == 2):
		setState("time3")
		increaseFlag("AlexRynardModule.ch2SceneNum")
		return
	if(howManyTimes == 3):
		setState("time4")
		increaseFlag("AlexRynardModule.ch2SceneNum")
		return
	if(howManyTimes == 4):
		setState("time5")
		increaseFlag("AlexRynardModule.ch2SceneNum")
		return
	if(howManyTimes == 5):
		setState("time6")
		increaseFlag("AlexRynardModule.ch2SceneNum")
		return
	if(howManyTimes == 6):
		setState("time7")
		increaseFlag("AlexRynardModule.ch2SceneNum")
		return

func _run():
	if(state == ""):
		addCharacter("alexrynard")
	if(state == "time1"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Some time has passed since that time you tested Alex's prototype but the memories are still fresh.")

		saynn("Quietly, you take your spot near Alex and begin working on the pile of datapads. Batteries, screens, buttons, modules.. Batteries, screens, buttons, modules.. Alex is busy repairing too. He focuses on the most fucked up ones, salvaging what components he can.")

		saynn("It's boring and tedious work. So why not ask something? You wait for a good moment to do that when Alex is kneading his shoulder.")

		saynn("[say=pc]I'm curious.[/say]")

		saynn("He raises a brow.")

		saynn("[say=alexrynard]Curious?[/say]")

		saynn("[say=pc]Back then, you knew that I was fully obedient. I wouldn't have said no to anything.[/say]")

		saynn("He rests in his chair, putting the work away for now.")

		saynn("[say=alexrynard]Yeah, disagreeing with someone is a negative emotion I guess. Obvious in the hind-sight.[/say]")

		saynn("[say=pc]How hard was it to not take advantage of that?[/say]")

		saynn("Alex tilts his head, his brow raised as high as his orange forehead allows.")

		saynn("[say=alexrynard]It was.. easy? Yeah, you would have given me full consent while under the influence of my prototype. But that consent is worthless, it didn't actually come from you.[/say]")

		saynn("Consent, huh.")

		saynn("[say=pc]Consent matters that much to you?[/say]")

		saynn("He leans back, his hands resting behind his head.")

		saynn("[say=alexrynard]Yeah. Crazy, right?[/say]")

		saynn("[say=pc]Why crazy?[/say]")

		saynn("[say=alexrynard]I don't know. It's a whole station of thieves, murderers and sluts. But I'm worrying about some kind of consent. Makes me feel stupid. Like I should just give up and go fuck some free use whore. I would have been happier probably.[/say]")

		saynn("Could be why he decided to make the portal panties..")

		addButton("Not crazy", "Tell him that consent is good", "time1_notcrazy")
		addButton("Use me!", "Offer yourself as relief", "time1_useme")
	if(state == "time1_useme"):
		saynn("[say=pc]You can use me if you want. I consent~.[/say]")

		saynn("Alex sighs.")

		saynn("[say=alexrynard]You know how many inmates like that I saw? The ones who consent to anything? What am I supposed to do with that?[/say]")

		saynn("[say=pc]Have fun? They are offering their bodies for your pleasure.[/say]")

		saynn("[say=alexrynard]So? I don't even know their limits. They probably don't know it either. What they like, what they dislike.[/say]")

		saynn("He frowns.")

		saynn("[say=alexrynard]They think they are ready for everything. No. That's a stupid way of living, sorry. You MUST know your limits. You MUST respect them. Or you will end up feeling used and broken.[/say]")

		saynn("He throws his head back and looks at the ceiling silently for about ten seconds before finally breaking the silence.")

		saynn("[say=alexrynard]Listen. I can't offer you what others can. But if you still want to submit to me.. let me know. We can start by finding your limits together during some.. trust exercises.[/say]")

		saynn("Oh wow, is he really offering you that? He sounds and looks kinda vulnerable at the moment too, way different from how grumpy and mean he usually is.")

		saynn("[say=alexrynard]But not now. Let's finish this.[/say]")

		saynn("Fair enough.")

		addButton("Continue", "See what happens next", "time1_work")
	if(state == "time1_notcrazy"):
		saynn("[say=pc]It's not crazy. You have a point. Consent is a powerful thing.[/say]")

		saynn("For some reason, your hand wants to reach out and pat the foxy. But he prevents that, shaking it off.")

		saynn("[say=alexrynard]Not on this station.[/say]")

		saynn("Foxy leans back in his chair and stares up at the ceiling, his hands resting on the back of his head.")

		saynn("[say=alexrynard]Can't blame them. When you don't have much freedom, I guess it's quite easy to give away what bits you still have. No limits, no discussion, no 'no's', just.. use me any way you see fit. A true power fantasy.[/say]")

		saynn("He frowns.")

		saynn("[say=alexrynard]Sluts think they are ready for everything. No. That's a stupid way of living, sorry. You MUST know your limits. You MUST respect them. Or you will end up feeling used and broken. And not just feeling.[/say]")

		saynn("Foxy sighs and looks at you.")

		saynn("[say=alexrynard]I'm glad you agree though. Makes me think like I'm not alone.[/say]")

		saynn("[say=pc]Yeah..[/say]")

		saynn("Some time passes. Alex seems to be gathering strength to tell you something.")

		saynn("[say=alexrynard]Don't know how you keep enduring me. But if you want to see the real power of consent.. we can try to do some.. trust exercises. And find where your limits are.[/say]")

		saynn("Oh wow. Is he really offering you that?")

		addButton("Sure", "Agree to it", "time1_agreetoit")
		addButton("Not sure", "You're not so sure", "time1_notsosure")
	if(state == "time1_agreetoit"):
		saynn("[say=pc]Sure, I wouldn't mind doing something like that.[/say]")

		saynn("Alex stays quiet for a second. And then just nods.")

		saynn("[say=alexrynard]For now let's just focus on finishing this crap.[/say]")

		saynn("Fair enough.")

		addButton("Continue", "See what happens next", "time1_work")
	if(state == "time1_notsosure"):
		saynn("[say=pc]I'm not sure about that.[/say]")

		saynn("[say=alexrynard]Yeah, that is fair. I am asking for submission which might not be your thing. But the offer is there.[/say]")

		saynn("Alex stays quiet for a second.")

		saynn("[say=alexrynard]Let's just focus on finishing this crap.[/say]")

		saynn("Fair enough.")

		addButton("Continue", "See what happens next", "time1_work")
	if(state == "time1_work"):
		saynn("Time flies as you help Alex repair the devices. A few hours later Alex finally decides to take a break.")

		saynn("[say=alexrynard]Thanks for the help, here.[/say]")

		saynn("He gives you a work credit.")

		saynn("Nice.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time2"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Time for some work. You sit near Alex and do the usual preparations, gathering all the tools, before grabbing one of the broken datapads and proceeding to tinker with it.")

		saynn("You realize something.")

		saynn("[say=pc]Did you show your prototype to the captain?[/say]")

		saynn("[say=alexrynard]Nah. The guy is busy.[/say]")

		saynn("[say=pc]Why do you need to do that anyway?[/say]")

		saynn("Alex stops working for a second and looks at you.")

		saynn("[say=alexrynard]He deserves to know how I spend the station's resources.[/say]")

		saynn("[say=pc]That's fair.[/say]")

		saynn("He returns to working, poking some exposed wiring with the screwdriver.")

		saynn("[say=alexrynard]Most likely he will shelf my prototype again. But, perhaps, he will see something in this particular one.[/say]")

		saynn("[say=pc]What did he shelf?[/say]")

		saynn("Alex tilts his head slightly.")

		saynn("[say=alexrynard]Someone is asking a few too many questions.[/say]")

		saynn("Suddenly, he pokes the electric board in the wrong place, causing a short circuit. The electricity goes through his body, causing his muscles to tense up.")

		saynn("[say=alexrynard]Ah, Fuck![/say]")

		saynn("You would think that a little shock wouldn't have such an effect.. but Alex is grumbling a lot, his shaking paws holding onto the table tightly. He speaks through his teeth.")

		saynn("[say=alexrynard]That's why you always wear rubber gloves.. fuck..[/say]")

		saynn("He does his best not to show that he is in pain.. but he clearly is.")

		saynn("[say=pc]You need help? Should I bring someone?[/say]")

		saynn("[say=alexrynard]I'm fine.. Just need a small break. I will be back..[/say]")

		addButton("Continue", "See what happens next", "time2_alexfalls")
	if(state == "time2_alexfalls"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="defeat"})
		saynn("Alex uses the table to help himself up.. before promptly collapsing onto the floor.")

		saynn("[say=alexrynard]Argh..[/say]")

		saynn("Oh shit. That could be his heart. Better help him.")

		addButton("Help Alex", "Help him to get up", "time2_helpalex")
	if(state == "time2_helpalex"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="stand"})
		saynn("You rush to him and help get up to his feet. He tries to shove you back.. but you see his arms and legs shaking, ready to give up again.")

		saynn("[say=alexrynard]I told you I'm fine! I don't need help, let go.[/say]")

		saynn("[say=pc]You clearly do. We're going to the medbay right now.[/say]")

		saynn("[say=alexrynard]I will shock you to death if you do that. Bring me to the break room.[/say]")

		saynn("He makes a good point. It is closer anyway.")

		saynn("[say=pc]Fine. Not my problem if you decide to die on me.[/say]")

		saynn("[say=alexrynard]I won't, just do it..[/say]")

		addButton("Break room", "Bring Alex there", "time2_breakroom")
	if(state == "time2_breakroom"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="sit"})
		aimCameraAndSetLocName("eng_breakroom")
		GM.pc.setLocation("eng_breakroom")
		saynn("You help Alex to walk out of the public workshop and into the main corridor. He reaches for the code panel of the staff-only door.. and then hesitates.")

		saynn("[say=pc]Should I close my eyes?[/say]")

		saynn("[say=alexrynard]Whatever..[/say]")

		saynn("He enters the code while you are watching, opening the door. You quickly find the break room and bring Alex there, dropping him onto the sofa.")

		saynn("[say=alexrynard]Ah.. fuck..[/say]")

		saynn("[say=pc]Will you tell me what's wrong?[/say]")

		saynn("[say=alexrynard]It's nothing..[/say]")

		saynn("His attempts to play it cool only make you angrier.")

		saynn("[say=pc]Don't lie, you look like you're dying.[/say]")

		saynn("He leans back on the sofa, panting heavily.")

		saynn("[say=alexrynard]I got shocked, it happens. I just need some rest, okay? Get me some water.[/say]")

		saynn("He points at the vending machine.")

		addButton("Vending machine", "Grab a water bottle", "time2_waterbottle")
	if(state == "time2_waterbottle"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="sit", npcBodyState={underwear=true}})
		saynn("It takes some time to realize that this particular vending machine doesn't require credits to dispense items. Huh, but it still has a slot for credits. It was probably hacked by the engineers here. Greed wins over greed.")

		saynn("You turn around after grabbing a water bottle.. and see Alex shirtless. And yeah, the guy got some great physique. Apart from one obvious thing.")

		saynn("Alex's spine seems to be prosthetic. Not the whole thing. But the artificial metal part spans from his neck to the base of his tail at least. You can guess that something isn't right with it by the black marks on the back of his uniform. Alex is grunting too while trying to reach it with his hands. Not too successfully.")

		saynn("[say=alexrynard]What?[/say]")

		saynn("He grabs the bottle and empties half of it in one go.")

		saynn("[say=alexrynard]Thanks..[/say]")

		saynn("[say=pc]Don't mention it. Do you need anything else?[/say]")

		saynn("[say=alexrynard]I'm good.[/say]")

		saynn("[say=pc]I can help, you know.[/say]")

		saynn("[say=alexrynard]I told you. I'm good.[/say]")

		saynn("Back to his old self.. Like nothing has changed. Alex uses a little mirror with one hand while tinkering with his spine with another. Not the most elegant way to do it. But what do you know? He catches your drilling gaze and sighs.")

		saynn("[say=alexrynard]Do you agree that a prosthetic spine is a little bit more complicated than some datapad?[/say]")

		saynn("[say=pc]I do agree. But you can guide me through it.[/say]")

		saynn("Alex pokes his spine with the screwdriver in the wrong place and that causes sparks.")

		saynn("[say=alexrynard]Fuck! Excuse me for not trusting you with my life. Thank you, but I got it from here, trust me. You can go now, inmate.[/say]")

		saynn("He keeps talking about trust.. and yet, barely has any for you.")

		addButton("Leave", "He gave you an invitation to leave. Might as well", "time2_leave")
		addButton("Watch", "Stay and watch him to make sure he is alright", "time2_watch")
	if(state == "time2_leave"):
		aimCameraAndSetLocName("eng_bay_nearbreakroom")
		GM.pc.setLocation("eng_bay_nearbreakroom")
		playAnimation(StageScene.Solo, "stand")
		removeCharacter("alexrynard")
		saynn("Well, if he is so sure about himself.. then you should just listen and leave.")

		saynn("He is quiet as you step out of the room.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time2_watch"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit", npcBodyState={underwear=true}})
		saynn("Nope! If he thinks he can get rid of you so easily, he is clearly wrong. Days of watching him work were preparing you for this.")

		saynn("You drop your butt onto one of the comfy chairs.. and just proceed to watch Alex awkwardly try to reach his prosthetic spine.")

		saynn("[say=alexrynard]Really?[/say]")

		saynn("[say=pc]Yep.[/say]")

		saynn("He looks at you for a few seconds.. and then just returns to fixing himself. He knows better than to mess with you. And you know better than leaving a half-broken person alone with himself.")

		saynn("[say=pc]Wanna tell me how you got your spine messed up like that?[/say]")

		saynn("He sighs and grabs a remote from the tv before pressing a button on it. The small little screen starts displaying some AlphaCorp news about how many new planets are showing interest in joining the fight against Syndicate. Nothing new there..")

		saynn("[say=alexrynard]If you wanna be entertained, watch this.[/say]")

		saynn("Well.. it's better than nothing. Why not.")

		saynn("The news is full of cool shots of battles that are happening throughout the galaxy, both on some planets and in open space, between big ships. There is always information about how you can sign up to be a soldier at the bottom.")

		saynn("Alex breaks the silence first when the tv shows a shot of a big ass spaceship.")

		saynn("[say=alexrynard]Every boy's and girl's dream.[/say]")

		saynn("[say=pc]Girl's?[/say]")

		saynn("[say=alexrynard]Yeah?[/say]")

		saynn("[say=pc]Aren't wars exclusive for boys usually.[/say]")

		saynn("[say=alexrynard]Wars have been optimized for anyone a long time ago. Strength of your muscles doesn't matter much when you just need to pull a trigger of a recoilless energy weapon. You gotta be 'tough' though. This world has no space for weakness.[/say]")

		saynn("Makes sense.")

		saynn("Eventually, Alex manages to repair his spine to a somewhat acceptable condition. Even if he got shocked like twice while doing it alone.")

		saynn("[say=pc]You should really get that thing repaired properly.[/say]")

		saynn("[say=alexrynard]I'd rather spend that time on prototypes.[/say]")

		saynn("Well, looks like he will be fine. Might as well leave him alone now.")

		addButton("Leave", "See what happens next", "time2_leaveafterwatch")
	if(state == "time2_leaveafterwatch"):
		aimCameraAndSetLocName("eng_bay_nearbreakroom")
		GM.pc.setLocation("eng_bay_nearbreakroom")
		playAnimation(StageScene.Solo, "stand")
		removeCharacter("alexrynard")
		saynn("You begin to leave but Alex stops you for a second.")

		saynn("[say=alexrynard]Here, catch.[/say]")

		saynn("He throws a credit chip in your direction.")

		saynn("[say=alexrynard]2 credits for.. extra trouble.[/say]")

		saynn("That's something.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time3"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Might as well do some work and help Alex while you have time. You take a seat and begin helping him.")

		saynn("[say=pc]How is your back?[/say]")

		saynn("[say=alexrynard]It's still there.[/say]")

		saynn("Seeing how he seems to be able to work, his spine appears to work fine.")

		saynn("Minutes of silence later..")

		saynn("[say=pc]Might I ask what caused it?[/say]")

		saynn("[say=alexrynard]I really don't wanna talk about it.[/say]")

		saynn("Such a cold answer. Oh well, he will surely tell you at some point.")

		saynn("Foxy seems to feel bad about being rude to you. After some time, he decides to add to his previous words.")

		saynn("[say=alexrynard]I'd prefer if you pretended it didn't exist.[/say]")

		saynn("Not much better.. but it's something.")

		saynn("[say=alexrynard]How are you doing anyway?[/say]")

		saynn("Oh wow.")

		addButton("Well enough", "Tell him that you are alright", "time3_wellenough")
		addButton("Could be better", "Tell him that things could be better for sure", "time3_couldbebetter")
	if(state == "time3_wellenough"):
		saynn("[say=pc]I'm well enough, thank you.[/say]")

		saynn("He nods.")

		saynn("[say=alexrynard]If you want, we could try a different kind of trust exercise sometime. Test out some of the equipment we have here.[/say]")

		saynn("What a gentleman, offering and everything.")

		saynn("[say=pc]I will think about it.[/say]")

		saynn("Alex chuckles softly.")

		addButton("Continue", "See what happens next", "time3_caparrives")
	if(state == "time3_couldbebetter"):
		saynn("[say=pc]Could be better. Life could always be better.[/say]")

		saynn("He nods.. many times.")

		saynn("[say=alexrynard]Yeahhh, tell me about it. At least we're grinding through these datapads pretty well.[/say]")

		saynn("Yeah, the pile is not that intimidating anymore.")

		saynn("And the silence settles in.")

		saynn("[say=pc]Why are you asking anyway?[/say]")

		saynn("[say=alexrynard]If you want, we could try a different kind of trust exercise sometime. Test out some of the equipment we have here.[/say]")

		saynn("What a gentleman, offering and everything.")

		saynn("[say=pc]I will think about it.[/say]")

		saynn("Alex chuckles softly.")

		addButton("Continue", "See what happens next", "time3_caparrives")
	if(state == "time3_caparrives"):
		addCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {npc="captain", pc="alexrynard"})
		saynn("A few hours pass.. but then something happens. Alex's datapad pings a few times. He looks at it and his facial expression changes.")

		saynn("[say=alexrynard]Oh shit.[/say]")

		saynn("[say=pc]Huh?[/say]")

		saynn("[say=alexrynard]Captain is coming here.[/say]")

		saynn("It doesn't take long because literally seconds later Captain Wright arrives, accompanied by a few guards. Alex instantly puts his current broken datapad away and stands up.")

		saynn("[say=alexrynard]Welcome. You're.. pretty fast.[/say]")

		saynn("[say=captain]Thanks. I know we're both busy, I didn't want to waste time.[/say]")

		saynn("The captain raises a brow when he sees you holding the tools.")

		saynn("[say=captain]I see that you have found some help?[/say]")

		saynn("Alex looks at you and sighs.")

		saynn("[say=alexrynard]Well.. very limited kind of help.[/say]")

		saynn("Limited? That sounds kinda unfair. But you better stay quiet.")

		saynn("[say=captain]I understand. I reckon, you wanted to discuss some things?[/say]")

		saynn("[say=alexrynard]Yeah.[/say]")

		saynn("Captain smiles.")

		saynn("[say=captain]Let's do it.[/say]")

		saynn("You really feel like you should leave now. Alex does sneakily give you the credit chip though.")

		saynn("Maybe you can try to hang around and see what they will discuss..")

		addButton("Just leave", "They can talk about whatever they want", "time3_justleave")
		addButton("Eavesdrop", "Try to listen up on their conversation", "time3_eavesdrop")
	if(state == "time3_justleave"):
		removeCharacter("captain")
		removeCharacter("alexrynard")
		playAnimation(StageScene.Solo, "stand")
		GM.pc.setLocation("eng_bay_corridor")
		aimCameraAndSetLocName("eng_bay_corridor")
		saynn("Better leave them to it, who cares about what they will talk about.")

		saynn("At least you got paid for that.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time3_eavesdrop"):
		GM.pc.setLocation("eng_bay_corridor")
		playAnimation(StageScene.Duo, "sit", {npc="captain", pc="alexrynard", npcAction="sit"})
		saynn("You get up and leave them to it.. kinda. You get out of sight and use one of the walls as cover. Close enough to eavesdrop, far away not to get spotted.. hopefully.")

		saynn("[say=captain]Great little helper you got there.[/say]")

		saynn("[say=alexrynard]Yeah, {pc.he} offered to do some work for free. I give {pc.him} a very limited range of tasks. And I control each {pc.his} step.[/say]")

		saynn("Captain pats Alex on the back and then takes a seat. Your seat.")

		saynn("[say=captain]Don't worry about it, I understand, really. Help is always good. It's just that, you don't strike me as the kind that would trust someone random. Something made you change your view on that?[/say]")

		saynn("Alex joins him.")

		saynn("[say=alexrynard]Can't really tell you, cap. I guess that something about {pc.him} is different.[/say]")

		saynn("Captain nods and stays silent for some time, his eyes checking out the pile of broken datapads.. that has become quite small in fact.")

		saynn("[say=captain]That's good. My friendly advice is.. just be careful. Inmates become inmates for a reason, they all crossed the line at least once in their life already.[/say]")

		saynn("[say=alexrynard]I know. I got burned on that enough times already.[/say]")

		saynn("[say=captain]How is your back doing by the way?[/say]")

		saynn("Alex scratches behind the back of his head.")

		saynn("[say=alexrynard]Yeah, it's fine. It keeps breaking occasionally.[/say]")

		saynn("[say=captain]Well, that's my bad. We will find you a better one sometime.[/say]")

		saynn("[say=alexrynard]You don't have to. I appreciate what you did for me already.[/say]")

		saynn("Captain chuckles softly.")

		saynn("[say=captain]I just gave you a job.[/say]")

		saynn("[say=alexrynard]When no one else would have.[/say]")

		saynn("Captain shrugs.")

		saynn("[say=captain]I guess.. I guess I saw something in you. How is your prototyping going, you wanted to talk about that, right?[/say]")

		saynn("Alex nods and rummages through his pouches until he finds the prototype visor.")

		saynn("[say=alexrynard]That's the latest one. That inmate helped me to test it.[/say]")

		saynn("Captain observes it and nods.")

		saynn("[say=captain]Does it work?[/say]")

		saynn("[say=alexrynard]Not exactly how I designed it. The prototype does help against depression. But, apparently, blocking negative thoughts also leads to the lack of.. self-control.[/say]")

		saynn("Captain hums.")

		saynn("[say=captain]Might I hold it?[/say]")

		saynn("Alex hands the captain his prototype letting him observe it from even closer.")

		saynn("[say=captain]Interesting. It makes the person wearing it unable to control themself?[/say]")

		saynn("[say=alexrynard]Yeah, they begin to seek control from the outside, a sort of.. hypnotized state. I could try to fix that issue with some extra development. But I need more resources. So I thought, you could help me with that.[/say]")

		saynn("Captain scratches his chin before handing Alex the prototype back.")

		saynn("[say=captain]As much as I would love to help you, our current budgets are extremely tight already. We're barely afloat.[/say]")

		saynn("[say=alexrynard]You don't need to pay me anything extra. Listen, you don't have to pay me at all if it comes to it. I just need enough to order materials and parts.[/say]")

		saynn("Captain taps Alex on the shoulder a few times.")

		saynn("[say=captain]There will be time for greatness, trust me. There will be a time when I will be able to give you everything you need and more. But for now, sadly, we have to limit ourselves. Times are tough, I hope you can understand me.[/say]")

		saynn("Alex lowers his gaze.")

		saynn("[say=alexrynard]I do, captain.[/say]")

		saynn("[say=captain]What you made already is amazing. It feels like magic to me. You should be proud of yourself.[/say]")

		saynn("You peek your head out and see the captain standing up. He turns his head towards your wall. Oh shit. You pull away quickly.")

		saynn("[say=captain]As long as we do the right thing, the universe will find a way to reward us. But we gotta trust each other. Not that many good people left in the world.[/say]")

		saynn("Alex nods. Captain smiles.")

		saynn("[say=captain]See you around.[/say]")

		saynn("Captain and Alex shake hands. Time to leave..")

		addButton("Leave", "See what happens next", "endthescene")
	if(state == "time4"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Another day, another credit. Time to fix the rest of those datapads.. wait.. what are those.")

		saynn("There are 2 piles of broken things now. There are still broken datapads but now there are also.. broken shock remotes.")

		saynn("[say=pc]Wha..[/say]")

		saynn("[say=alexrynard]Yeah-h-h.[/say]")

		saynn("[say=pc]You are, for sure, being punished for something.[/say]")

		saynn("Alex shrugs.")

		saynn("[say=alexrynard]I don't have anything better to do anyway.[/say]")

		saynn("[say=pc]What about.. your prototypes?[/say]")

		saynn("He sighs. His silence tells a lot.")

		saynn("[say=pc]The captain canceled them?[/say]")

		saynn("[say=alexrynard]Station doesn't have much funds. That's why we are recycling what we can.[/say]")

		saynn("You slowly sit down.. and sigh as well.")

		saynn("[say=alexrynard]Want me to show how to repair these?[/say]")

		saynn("Why not, might as well.")

		addButton("Continue", "See what happens next", "time4_showrepair")
	if(state == "time4_showrepair"):
		saynn("And so you listen carefully while Alex explains how these work. He shows you that most of it is just for show, underneath the sturdy case there is just a small little board that has all buttons wired to.")

		saynn("He shows you that this particular one has a burned out bluespace crystal.")

		saynn("[say=alexrynard]Crystal is what transfers the data. You send power through it and it starts vibrating at a very specific frequency. But sending too much current will crack it.[/say]")

		saynn("[say=pc]Someone really went to town, shocking inmates.[/say]")

		saynn("[say=alexrynard]Probably. They can withstand a lot of heat but they're expensive. So we use small ones.[/say]")

		saynn("You nod.")

		saynn("[say=alexrynard]Bluespace allows us to transport power too. But the device still needs a battery to store it.[/say]")

		saynn("Time passes. Alex finishes his little lesson and lets you try fixing one.")

		saynn("Right.. the battery is not leaky. No obvious visual defects too. Time to disassemble it.")

		saynn("You reach the main board and see obvious corrosion. You look at Alex but he stays quiet, letting you fix it yourself.")

		saynn("Well, you should probably clean it off. You grab a little alcohol wipe and start trying to remove it.")

		saynn("Ouch! You accidentally short-circuit the main button, causing the board to send a signal to your collar. Your hands are shaking from the electricity that is coursing through your body!")

		saynn("It's a small shock.. but since the button circuit is still complete, the board keeps sending that shock to your collar.")

		saynn("Alex sees how much discomfort this brings and quickly removes the battery from the device that was still in it.")

		saynn("[say=alexrynard]That's why you follow my instructions.[/say]")

		saynn("Oh well. You pant softly and rub your neck.")

		saynn("[say=pc]Thanks..[/say]")

		saynn("[say=alexrynard]Uh huh.[/say]")

		addButton("Continue", "See what happens next", "workend_check")
	if(state == "toolate"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="sit"})
		saynn("Many hours pass. Station's lighting begins to dim, signaling that it is very late.")

		saynn("[say=alexrynard]That's the end of my shift.[/say]")

		saynn("He hands you a chip.")

		saynn("[say=alexrynard]Thanks. If you want, we can do something now.[/say]")

		saynn("He is probably talking about the trust exercises.")

		addButton("Just leave", "It's fine", "endthescene")
		addButton("Trust exercises", "Might as well get a little bit kinky", "start_trust")
	if(state == "aftersomefixing"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="sit"})
		saynn("Many hours pass. The two piles of broken devices got a bit smaller. Which is great!")

		saynn("[say=alexrynard]Time for a break.[/say]")

		saynn("You and him put your current work away for now.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time5"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Datapads and shock remotes won't fix themselves. So might as well get a few of them fixed.")

		saynn("You can't help but notice that Alex looks a bit sad today. More sad than usual.")

		saynn("[say=pc]Everything is okay?[/say]")

		saynn("[say=alexrynard]Yeah.[/say]")

		saynn("[say=pc]You don't look okay.[/say]")

		saynn("[say=alexrynard]Just thinking.[/say]")

		saynn("Sometimes you just can't escape those moods it seems.")

		saynn("Probably better not to bug him with more questions, focussing is easier when you don't have distractions.")

		addButton("Continue", "See what happens next", "workend_check")
	if(state == "time6"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("So much time has passed. So many devices were repaired. And yet, the two tiles are still huge. You feel like you begin to slip into the same state as Alex. A state where staring at a wall is more interesting than actual work.")

		saynn("The initial enthusiasm is gone.. replaced by the monotony of work.. When will it end?")

		saynn("[say=pc]What are the chances that these are the last of them?[/say]")

		saynn("Alex shrugs.")

		saynn("[say=alexrynard]Pretty low.[/say]")

		saynn("[say=pc]Then.. Why are we doing this?[/say]")

		saynn("[say=alexrynard]Saving costs for the station.[/say]")

		saynn("[say=pc]Wouldn't working on new prototypes bring outside funding?[/say]")

		saynn("He shrugs again.")

		saynn("[say=alexrynard]The captain knows what to do. He knows how to manage risks.[/say]")

		saynn("[say=pc]Does he?[/say]")

		saynn("[say=alexrynard]Better than I do.[/say]")

		saynn("[say=pc]So you trust him?[/say]")

		saynn("He shrugs for the third time.")

		saynn("[say=alexrynard]Gotta trust someone else if you can't trust yourself.[/say]")

		saynn("Now you both have something to think about.")

		addButton("Continue", "See what happens next", "workend_check")
	if(state == "time7"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Time to test your patience again. Even though the piles of devices do decrease, you feel like you're putting in way too much effort for this. Even though you're doing everything right, it's hard not to feel like you're burning out..")

		saynn("Even if you complete this batch one day, do you even know what your reward is?")

		saynn("Yeah, you do.. You will get to fix more devices when they bring them in. Thrilling.")

		saynn("Alex is probably feeling the same way, he is just not showing it.")

		saynn("You were about to flip the table.. metaphorically.. when you suddenly hear a female voice.")

		saynn("[say=eliza]Um. Hey there. Don't know exactly who to talk to here.[/say]")

		addButton("Continue", "See what happens next", "time7_eliza")
	if(state == "time7_eliza"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="eliza"})
		saynn("Alex looks up and sees a feline doctor standing near.")

		saynn("[say=alexrynard]What's up?[/say]")

		saynn("[say=eliza]I'm doctor Quinn. I'm not sure if we ever met.[/say]")

		saynn("[say=alexrynard]Probably not.[/say]")

		saynn("You cough a few times, making Alex snap out of his thinking mood.")

		saynn("[say=alexrynard]Alex Rynard. What can I do for you, doctor Quinn?[/say]")

		saynn("[say=eliza]Oh, we're sharing first names too, huh~. I'm Eliza. And I need.. some help.[/say]")

		saynn("Alex puts his work away and stands up. You help to put his tools away too.")

		saynn("[say=alexrynard]By help you mean.. repairs? Because..[/say]")

		saynn("Eliza is quick to cut him off.")

		saynn("[say=eliza]I know what you are gonna say. Blah-blah-blah, go through the official channels, blah.[/say]")

		saynn("Alex tilts his head.")

		saynn("[say=alexrynard]Yeah, that's what they are for. Create a new task and someone's gonna get it repaired.[/say]")

		saynn("Eliza boldly closes the distance, her feline paws carefully fix the collar of his orange uniform.")

		saynn("[say=eliza]What if we don't though.. Just hear me out.. It's probably something small and silly.. like, some nurse probably flicked a wrong switch.. I really-really-really don't wanna wait multiple weeks to get it fixed..[/say]")

		saynn("Alex sighs.. and then starts to subtly shake his head.")

		saynn("[say=alexrynard]Procedures are there for a reason, doctor Quinn.[/say]")

		saynn("[say=eliza]Fuck the procedures. Is what you are doing really that much more interesting? If you're worrying about the reward, we can talk about it, I'm not against.. offering something.[/say]")

		saynn("Eliza bites her lip playfully. But that only makes Alex sigh again. He looks at you.. he sees your eyes full of hope. You feel like you shouldn't intervene though.")

		saynn("[say=alexrynard]I'm very sorry, doctor Quinn. File a new task and someone will look at it very soon. Just set the priority to high.[/say]")

		saynn("Quinn pouts for a second.. and then nods before turning away, preparing to leave. Alex begins to sit back down.. Eliza looks back over her shoulder.")

		saynn("[say=eliza]..I think it was your machine. RynardOS, wasn't it?[/say]")

		saynn("Alex raises a brow.")

		saynn("[say=alexrynard]How did you..[/say]")

		saynn("Eliza turns around again and smiles.")

		saynn("[say=eliza]I tapped on the AlphaCorp logo in the 'about' menu. A cute jumping foxy appears if you do that many times. That's your work, right~?[/say]")

		saynn("[say=alexrynard]Yeah, I added a little easter egg.. But still, how did you..[/say]")

		saynn("Eliza chuckles.")

		saynn("[say=eliza]Work is so-o-o-o boring sometimes. You probably know what I'm talking about. I stumbled upon it randomly, I promise~.[/say]")

		saynn("Now you're kinda curious about what that machine is..")

		saynn("[say=eliza]So-o.. if you think someone else should take a look at that machine, okay..[/say]")

		saynn("Now it's Alex's turn to cut Eliza off.")

		saynn("[say=alexrynard]I will do it.[/say]")

		saynn("Eliza smiles and nods-nods many times.")

		saynn("Alex looks at you. You fully expect him to tie you up and leave you here or something.. But.. Alex nods you to follow. Ohh! Exciting!")

		saynn("You quickly put away all of the unfinished work and tools.")

		saynn("[say=eliza]Oh, you have an apprentice?[/say]")

		saynn("[say=alexrynard]More like a helper.[/say]")

		saynn("Eliza tilts her head and smiles while looking at you.")

		addButton("Follow", "See where the life brings you", "time7_lift")
	if(state == "time7_lift"):
		aimCameraAndSetLocName("mining_elevator")
		saynn("You follow Alex and Eliza to the lift. She presses the 'MD' button and soon the doors close followed by an annoying screech as the whole room begins moving.")

		saynn("Foxy stands still.. but Eliza doesn't. She leans against one of the walls.")

		saynn("[say=eliza]I think I know why you added that easter egg~.[/say]")

		saynn("[say=alexrynard]A lot of developers add little hidden things like that. Just for fun.[/say]")

		saynn("Eliza is so smug, she can barely control it.")

		saynn("[say=eliza]Nah-h~. I think I know exactly why you did it, you little sly fox~.[/say]")

		saynn("Alex looks at her, his expression is slightly confused.")

		saynn("[say=alexrynard]And why?[/say]")

		saynn("Eliza bites her lip.")

		saynn("[say=eliza]I'm not gonna tell you~. I think you don't even realize why you did it yourself.[/say]")

		saynn("[say=alexrynard]And I think you should stop tampering with expensive equipment, doctor Quinn.[/say]")

		saynn("[say=eliza]Make me~.[/say]")

		saynn("So bold. Eliza is so cheeky that Alex can't help but to stay quiet.")

		saynn("[say=eliza]Aw. Listen, you're asking a curious cat to stop being curious. That is just not happening.[/say]")

		saynn("[say=alexrynard]There are ways.[/say]")

		saynn("Eliza bites her lip. A lot of biting is happening lately..")

		saynn("[say=eliza]Ohh~. I trust you, sly foxy.[/say]")

		saynn("The lift's doors finally open. Time to go.")

		addButton("Continue", "See what happens next", "time7_in_lobby")
	if(state == "time7_in_lobby"):
		aimCameraAndSetLocName("med_lobby_start")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("You three enter the medical lobby. Bright lights, sterile white lights, nurses everywhere.")

		saynn("Alex and Eliza walk up to the counter and begin chatting about something. You were meant to follow when..")

		saynn("[say=avy]Pss-st. You.[/say]")

		saynn("A foxy with a dark fur swiftly walks up to you, her voice quiet.")

		saynn("[say=avy]Steal something while you're there.[/say]")

		saynn("Huh?")

		saynn("[say=pc]What?[/say]")

		saynn("[say=avy]Anything. Meds, tools, drugs, random syringes.[/say]")

		addButton("Fuck off", "Tell that foxy to fuck off", "time7_avy_fuckoff")
		addButton("Why", "Ask why should you do it", "time7_avy_why")
	if(state == "time7_avy_fuckoff"):
		saynn("You're not planning to betray Alex today.")

		saynn("[say=pc]Fuck off, I'm not gonna do that.[/say]")

		saynn("The dark foxy rolls her eyes.")

		saynn("[say=avy]Really? You would rather be their bitch? Whatever, your loss.[/say]")

		saynn("Eliza finally opens the staff-only door. Better follow her.")

		addButton("Follow", "See where the life brings you", "time7_nearmachine")
	if(state == "time7_avy_why"):
		saynn("[say=pc]And why would I do that?[/say]")

		saynn("The dark foxy flashes a credits chip before your eyes.")

		saynn("[say=avy]I will pay you twenty creds for something good.[/say]")

		saynn("[say=pc]I will think about it.[/say]")

		saynn("Eliza finally opens the staff-only door. Better follow her.")

		addButton("Follow", "See where the life brings you", "time7_nearmachine")
	if(state == "time7_nearmachine"):
		aimCameraAndSetLocName("med_milkingroom")
		removeCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", pc="alexrynard"})
		saynn("You follow Eliza and Alex through the clean corridor until she reaches one of the doors. When it opens up, you see a huge open space divided into multiple.. stalls.. each one having some special equipment. Equipment designed to extract various fluids from you..")

		saynn("[say=alexrynard]Cozy.[/say]")

		saynn("[say=eliza]You've never been here? It's a very relaxing experience, you should try it. It can help to take the edge off~.[/say]")

		saynn("[say=alexrynard]I'm sure it can.[/say]")

		saynn("Milking is not why you came here so Eliza brings you into one of the secluded sections.. The lighting here is way dimmer. The equipment.. quite specialized too.")

		saynn("In the middle of the room there is a special table that is attached to a computer. The table also has all sorts of.. manipulators.. some being pretty lewd. Everything looks extremely clean, you can hear a quiet squeak when dragging your finger over the surfaces.")

		saynn("[say=eliza]There it is. Your creation. And it doesn't turn on anymore, sadly.[/say]")

		saynn("Alex nods and tries the obvious, pressing the power on button a few times. No reaction.")

		saynn("[say=alexrynard]What were you doing with it when it broke?[/say]")

		saynn("Eliza scratches her nose and starts to hum.")

		saynn("[say=eliza]Um.. well.. we were just using it as normal.[/say]")

		saynn("[say=alexrynard]Define 'normal'.[/say]")

		saynn("[say=eliza]Well-l-l.. You want the whole process described? With all the.. juicy.. details~?[/say]")

		saynn("Alex sighs and shakes his head. He grabs a screwdriver and looks at the panels. But before unscrewing anything, he looks at you.")

		saynn("[say=alexrynard]Hey. The computer should be plugged into the wall somewhere. Check the plug, tug on it a bit, you know the drill.[/say]")

		saynn("Seems easy enough.")

		addButton("Plug", "Go look for it", "time7_plug")
	if(state == "time7_plug"):
		playAnimation(StageScene.Solo, "stand")
		saynn("There aren't any obvious wires coming from the computer.. but that makes sense. Otherwise they would be a tripping hazard. But that also means that you have to search for that plug.")

		saynn("You follow the perimeter of this little secluded space. There are drawers, tables and equipment placed around the walls so you have to move each one to see if the plug is behind it.")

		saynn("Huh. Behind one of the drawers you find something interesting, a few pill bottles covered in multiple levels of dust. They must have rolled there by accident a long time ago.")

		addButton("Ignore", "Better not touch them", "time7_pills_ignore")
		addButton("Take them", "Free pills!", "time7_get_pills")
		addButton("Let Eliza know", "Maybe these are important", "time7_let_eliza_know")
	if(state == "time7_pills_ignore"):
		saynn("Yeah, who knows, maybe these pills expired a few years ago and now they're poisonous. So you just put the drawer back and continue searching.")

		saynn("Eventually you do find a plug! It's plugged into a unique-looking socket on the wall, wires from it instantly go under the floor tiles.")

		saynn("[say=pc]I think I found it.[/say]")

		saynn("[say=alexrynard]Go ahead, worst case we turn off someone's life support.[/say]")

		saynn("Eliza chuckles.")

		saynn("[say=eliza]It should be fine.[/say]")

		saynn("And so you disconnect the plug.. wait a few seconds.. and plug it back in, making sure it's sealed tightly.")

		saynn("[say=pc]Done.[/say]")

		saynn("Alex tries to turn on the computer again.. but nothing happens.")

		saynn("[say=alexrynard]Right. I guess I have to look at the internals.[/say]")

		addButton("Continue", "See what happens next", "time7_alexfixes_the_thing")
	if(state == "time7_get_pills"):
		saynn("No one will miss these for sure. So why not use this opportunity.")

		saynn("You sneakily grab the dusty pill bottles and store them away before putting the drawer back where it was.")

		saynn("Then you just continue searching. Eventually you do find a plug! It's plugged into a unique-looking socket on the wall, wires from it instantly go under the floor tiles.")

		saynn("[say=pc]I think I found it.[/say]")

		saynn("[say=alexrynard]Go ahead, worst case we turn off someone's life support.[/say]")

		saynn("Eliza chuckles.")

		saynn("[say=eliza]It should be fine.[/say]")

		saynn("And so you disconnect the plug.. wait a few seconds.. and plug it back in, making sure it's sealed tightly.")

		saynn("[say=pc]Done.[/say]")

		saynn("Alex tries to turn on the computer again.. but nothing happens.")

		saynn("[say=alexrynard]Right. I guess I have to look at the internals.[/say]")

		addButton("Continue", "See what happens next", "time7_alexfixes_the_thing")
	if(state == "time7_let_eliza_know"):
		saynn("Better ask the doctor, maybe these are some important pills that were missing.")

		saynn("[say=pc]Uh.. There are some old pill bottles here. So old that they are covered with dust. But they still have something inside.[/say]")

		saynn("Eliza hums.")

		saynn("[say=eliza]Really? Nice find, thank you. Throw them into the trash bin.[/say]")

		saynn("[say=pc]But why? What if they're not expired yet.[/say]")

		saynn("Eliza shrugs.")

		saynn("[say=eliza]I do like experimenting. But in this particular situation, better safe than sorry. They are probably written off already anyway.[/say]")

		saynn("You grab them and approach the trash bin.")

		addButton("Throw pills out", "Dispose of the old pills", "time7_let_eliza_know_dispose")
		addButton("Pretend to", "Pretend that you are throwing them out but actually keep them instead", "time7_let_eliza_know_pretend")
	if(state == "time7_let_eliza_know_dispose"):
		if (!tookPills):
			saynn("Oh well, better get rid of them then.")

			saynn("You throw out the pill bottles and then you just continue searching.")

		else:
			saynn("You can't forgive such a wasteful approach. So instead of obeying and throwing the pills out, you just pretend to, keeping the pills to yourself.")

			saynn("After that, you just continue searching.")

		saynn("Eventually you do find a plug! It's plugged into a unique-looking socket on the wall, wires from it instantly go under the floor tiles.")

		saynn("[say=pc]I think I found it.[/say]")

		saynn("[say=alexrynard]Go ahead, worst case we turn off someone's life support.[/say]")

		saynn("Eliza chuckles.")

		saynn("[say=eliza]It should be fine.[/say]")

		saynn("And so you disconnect the plug.. wait a few seconds.. and plug it back in, making sure it's sealed tightly.")

		saynn("[say=pc]Done.[/say]")

		saynn("Alex tries to turn on the computer again.. but nothing happens.")

		saynn("[say=alexrynard]Right. I guess I have to look at the internals.[/say]")

		addButton("Continue", "See what happens next", "time7_alexfixes_the_thing")
	if(state == "time7_alexfixes_the_thing"):
		playAnimation(StageScene.Solo, "kneel", {pc="alexrynard"})
		saynn("You return to Alex and just watch him try to fix his own machine.")

		saynn("He uses the screwdriver to remove one of the panels, exposing the wiring. He unplugs some of the wires, giving him access to the motherboard.")

		saynn("[say=alexrynard]Why.. is this scent.[/say]")

		saynn("Yeah, you can feel it too. Hard to pin-point what it smells like in there..")

		saynn("Eliza suddenly begins to avoid any eye contact for some reason, she rubs her snout more and coughs a few times.")

		saynn("[say=eliza]Khm.. khm..[/say]")

		saynn("Alex unscrews more things.. and then takes out the whole board.")

		saynn("And as he does it.. drops of some.. white fluid.. begin dripping off of it.")

		saynn("[say=alexrynard]The heck is this.[/say]")

		saynn("[say=eliza]Khm..[/say]")

		saynn("[say=pc]It's not very thick. So it's probably.. milk?[/say]")

		saynn("[say=alexrynard]Why is there milk in the computer?[/say]")

		saynn("Eliza blushes softly.")

		saynn("[say=eliza]Listen.. stuff gets intense sometimes, this machine is really good.[/say]")

		saynn("Alex rolls his eyes and sighs.")

		saynn("[say=alexrynard]I see. Well, it busted a few capacitors here and there.[/say]")

		saynn("[say=eliza]Oh.. does that mean it's fully broken?..[/say]")

		saynn("[say=alexrynard]Nah, I have enough spare ones. Just gotta replace them. Will take some time.[/say]")

		saynn("Alex looks at you.")

		saynn("[say=alexrynard]I really don't want to put this board anywhere. I hold it and you solder the capacitors, okay?[/say]")

		saynn("Seems easy enough..")

		addButton("Help Alex", "Help Alex with the board", "time7_alexfixes_the_thing_actually")
	if(state == "time7_alexfixes_the_thing_actually"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="kneel"})
		saynn("And so you grab the required tool and then begin to heat up the old busted capacitors near the base, enough to melt the metal there. Then you swiftly replace them with new ones before melting their bases too, soldering them into the right places.")

		saynn("All the while Alex is just sitting on his knees, holding the wet board, his hands get covered in that milk.")

		saynn("[say=eliza]Why can't you wash it..[/say]")

		saynn("[say=alexrynard]The board? That will destroy even more components. There is not much.. milk.. left, better to just let it dry.[/say]")

		saynn("After you're done, Alex puts the board back into the computer and connects all the wiring back.")

		saynn("[say=alexrynard]Alright. You can turn it on while I go wash my hands..[/say]")

		addButton("Computer", "Look at the screen", "time7_computer")
	if(state == "time7_computer"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You stand in front of the computer screen.")

		saynn("The computer doesn't seem to be turned on.")

		addButton("Power button", "Turn on the computer", "time7_computer_power")
	if(state == "time7_computer_power"):
		saynn("You press on the power button.. and the computer actually begins to boot this time.")

		saynn("[say=eliza]Yay, it works![/say]")

		saynn("[say=alexrynard]Test it more.[/say]")

		saynn("The screen presents you with a few options.")

		addDisabledButton("Procedures", "No patient is found on the table")
		addButton("Scan for patients", "Make the machine scan for patients", "time7_computer_patients")
		addButton("Self-Diagnostic", "Make the machine check itself", "time7_computer_doselfdiag")
		addButton("About", "Check the about menu", "time7_computer_aboutmenu")
		if (didDiag):
			addButton("Enough testing", "The machine clearly works", "time7_computer_tested_works")
	if(state == "time7_computer_doselfdiag"):
		saynn("You press the self-diagnostic button on the screen. The machine suddenly kicks into action, all its manipulators moving and rotating, displaying their full range of motion.")

		saynn("The table itself angles itself differently too. There is even a different screen above it that displays some test information.")

		saynn("After some time, the computer beeps happily and displays a 'Self-Diagnostic complete, no problems found.' message.")

		saynn("[say=pc]Looks like everything works.[/say]")

		saynn("[say=alexrynard]Good.[/say]")

		addButton("Continue", "See what happens next", "time7_computer_mainmenu")
	if(state == "time7_computer_mainmenu"):
		playAnimation(StageScene.Solo, "stand")
		saynn("What button do you wanna press on the computer screen?")

		addDisabledButton("Procedures", "No patient is found on the table")
		addButton("Scan for patients", "Make the machine scan for patients", "time7_computer_patients")
		addButton("Self-Diagnostic", "Make the machine check itself", "time7_computer_doselfdiag")
		addButton("About", "Check the about menu", "time7_computer_aboutmenu")
		if (didDiag):
			addButton("Enough testing", "The machine clearly works", "time7_computer_tested_works")
	if(state == "time7_computer_aboutmenu"):
		saynn("You press the 'About' button.")

		saynn("The screen refreshes and shows the info about this machine along with the AlphaCorp logo.")

		saynn("- - - - - - -")

		saynn("Multi-purpose Medical Table - Model X-9")

		saynn("Running on the official AlphaOS kernel.")

		saynn("The Model X-9 integrates state-of-the-art healing protocols, unparalleled bio-monitoring technologies, and big focus on safety to redefine the future of healthcare.")

		saynn("Developed in-house by AlphaCorp Technologies. Any attempt to reverse engineer, replicate, or distribute AlphaCorp's proprietary medical advancements will lead to immediate legal actions.Unauthorized modifications are strictly prohibited and subject to legal action as well.")

		saynn("- - - - - - -")

		saynn("Seems kinda.. strange.")

		addButton("Back", "Never mind", "time7_computer_mainmenu")
		addButton("Logo", "Press on the logo", "time7_computer_presslogo")
	if(state == "time7_computer_presslogo"):
		saynn("You press on the AlphaCorp logo.. but nothing happened this time.")

		addButton("Continue", "See what happens next", "time7_computer_aboutmenu")
	if(state == "time7_computer_easteregg"):
		saynn("You press on the AlphaCorp logo again.. and something happens. The screen suddenly starts displaying jumping foxies.")

		saynn("[console speed=10][font=res://Fonts/smallconsolefont.tres]"+Util.readFile("res://Images/asciiporn/alexrynardquest/fox.txt").replace("\\","\\\\")+"[/font][/console]")

		saynn("Seems like a cute little easter egg.")

		addButton("Continue", "See what happens next", "time7_computer_mainmenu")
	if(state == "time7_computer_patients"):
		saynn("The computer displays you a list of 'patients' that it has found nearby and can currently reach.")

		addButton("Alex Rynard", "Grab this patient", "time7_computer_grab_alex")
		addButton("Eliza Quinn", "Grab this patient", "time7_computer_grab_eliza")
		addButton(GM.pc.getName(), "Grab this patient", "time7_computer_grab_pc")
		addButton("Never mind", "You changed your mind", "time7_computer_mainmenu")
	if(state == "time7_computer_grab_alex"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {pc="alexrynard", noDildos=true})
		saynn("The machine kicks into action as you make your selection. Its manipulators suddenly grab Alex before forcibly bringing him onto the table. He tries to get his wrists and ankles free but fails.")

		saynn("[say=alexrynard]Hey! That is so not funny.[/say]")

		saynn("[say=eliza]I think it is pretty funny..[/say]")

		saynn("Alex sighs.")

		saynn("[say=eliza]But we shouldn't torture the poor foxy.[/say]")

		saynn("Oh well.")

		addButton("Continue", "See what happens next", "time7_computer_mainmenu")
	if(state == "time7_computer_grab_eliza"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {pc="eliza", noDildos=true})
		saynn("The machine kicks into action as you make your selection. Its manipulators suddenly grab the doctor before forcibly bringing her onto the table.")

		saynn("[say=eliza]Ohh! Kinky.[/say]")

		saynn("She suddenly realizes that the machine doesn't let her close her legs, putting her underwear on display.")

		saynn("[say=eliza]Don't look..[/say]")

		saynn("Alex sighs.")

		saynn("[say=alexrynard]Put her down, we didn't come here for that.[/say]")

		saynn("[say=eliza]Aw.[/say]")

		addButton("Continue", "See what happens next", "time7_computer_mainmenu")
	if(state == "time7_computer_grab_pc"):
		playAnimation(StageScene.BDSMMachineAltFuck, "tease", {pc="pc", noDildos=true})
		saynn("The machine kicks into action as you make your selection. Its manipulators suddenly grab YOU before forcibly bringing you onto the table.")

		saynn("Oops. Now you can't even put yourself down even if you wanted to. Eliza giggles seeing you in that helpless position.")

		saynn("[say=eliza]I remember getting stuck like that. Was pretty funny. At first.[/say]")

		saynn("[say=alexrynard]Should we just leave {pc.him} like that? To teach a lesson.[/say]")

		saynn("[say=eliza]And what would we do~?[/say]")

		saynn("Alex sees the doctor's hungry stare.. and presses the button to release you.")

		addButton("Continue", "See what happens next", "time7_computer_mainmenu")
	if(state == "time7_computer_tested_works"):
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="eliza"})
		saynn("[say=alexrynard]Looks like we're done here.[/say]")

		saynn("Eliza smiles and then gasps.")

		saynn("[say=eliza]I know how to reward you, hold on.[/say]")

		saynn("She rushes out of the room, leaving you and Alex alone for some time.")

		saynn("[say=alexrynard]Oh no.[/say]")

		saynn("[say=pc]Why the oh no.[/say]")

		saynn("[say=alexrynard]I have no idea what to expect from her by this point.[/say]")

		saynn("You chuckle.")

		saynn("[say=pc]Relax. Can't be that bad.[/say]")

		saynn("Eliza soon returns, holding.. two ice-creams in her paws. She hands one to you and one to Alex.")

		saynn("[say=eliza]Here, thank you so much![/say]")

		saynn("[say=alexrynard]Ice-cream?[/say]")

		saynn("She nods-nods and smiles.")

		saynn("[say=eliza]It's super tasty, trust me![/say]")

		saynn("Alex inspects the cone from up close.. and then just sighs.")

		saynn("[say=alexrynard]Right. Thanks. We will be going now.[/say]")

		saynn("You both understand that it's probably best not to ask too many questions now.")

		saynn("[say=eliza]Oh. And if you want.. you can use this room now. It's your machine after all, Alex Rynard~.[/say]")

		saynn("He hums and then gives you a glance.")

		saynn("[say=alexrynard]I might just hold you to that offer, doctor Quinn.[/say]")

		saynn("The feline doctor purrs softly and then proceeds to show you two the way out.")

		addButton("Continue", "See what happens next", "time7_after_fix_computer")
	if(state == "time7_after_fix_computer"):
		removeCharacter("eliza")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		aimCameraAndSetLocName("med_lobby_start")
		saynn("You and Alex return back to the medical lobby. He presses the button that calls the lift.. which is taking its sweet time now.")

		saynn("Suddenly, some inmate pulls you away from Alex so he wouldn't hear her words.")

		saynn("[say=avy]So? Did you get anything?[/say]")

		saynn("Alex notices your sneaky conversation. But he doesn't intervene.")

		if (tookPills):
			addButton("Give pills", "Give Avy the old pill bottles", "time7_after_give_pills")
			addButton("No", "Lie to Avy", "time7_after_no_give_pills")
		else:
			addDisabledButton("Give pills", "You didn't steal anything")
			addButton("No", "Tell Avy that you didn't take anything", "time7_after_didntstealpills")
	if(state == "time7_after_give_pills"):
		saynn("[say=pc]Here, now go away.[/say]")

		saynn("You sneakily hand her the old pill bottles that you took.")

		saynn("The dark foxy quickly checks them.. and then hands you a chip.")

		saynn("[say=avy]Good {pc.boy}. This will do.[/say]")

		saynn("And just like that, you return to Alex..")

		addButton("Continue", "See what happens next", "time7_after_in_lift")
	if(state == "time7_after_no_give_pills"):
		saynn("[say=pc]No, fuck off.[/say]")

		saynn("The dark foxy grabs you by the collar with a tight grip.")

		saynn("[say=avy]I know that you stole something, I can fucking smell it.[/say]")

		saynn("She pulls you closer.")

		saynn("[say=avy]And if you don't want everyone to know, better just give me what I want.[/say]")

		addButton("Give pills", "Give Avy the old pill bottles", "time7_after_give_pills")
		addButton("Fuck off", "You're not giving her anything!", "time7_after_fuckoffwithpills")
	if(state == "time7_after_fuckoffwithpills"):
		playAnimation(StageScene.Duo, "shove", {npc="avy", npcAction="hurt"})
		saynn("You shove the inmate back.")

		saynn("[say=pc]I told you, fuck off.[/say]")

		saynn("She squints and bares her teeth.. but then just walks away.")

		saynn("[say=avy]Pathetic.[/say]")

		saynn("You managed to keep the stolen pills!")

		addButton("Continue", "See what happens next", "time7_after_in_lift")
	if(state == "time7_after_didntstealpills"):
		saynn("[say=pc]No, fuck off.[/say]")

		saynn("The dark foxy leans in super close and then audibly sniffs you.")

		saynn("[say=avy]Huh. Yeah. You didn't steal anything. What a staff bitch. Pathetic.[/say]")

		saynn("And just like that, she leaves you alone.")

		addButton("Continue", "See what happens next", "time7_after_in_lift")
	if(state == "time7_after_in_lift"):
		removeCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		aimCameraAndSetLocName("med_elevator")
		saynn("You and Alex enter the lift. He presses the button and, with an annoying screech, the giant metal room begins to move. The ice-creams are still in your hands.")

		saynn("[say=pc]Back to the work?[/say]")

		saynn("[say=alexrynard]You know.. I think we earned a small rest.[/say]")

		saynn("Sounds good.")

		saynn("[say=alexrynard]Worst case, I tell them the task took longer than we thought.[/say]")

		saynn("[say=pc]You'd dare to lie like that?[/say]")

		saynn("He smiles.")

		saynn("[say=alexrynard]Who cares.[/say]")

		saynn("Looks like Alex is not against being mischievous occasionally. Or maybe he is just sick of the repairs like you are.")

		addButton("Continue", "See what happens next", "time7_resting_near_water")
	if(state == "time7_resting_near_water"):
		aimCameraAndSetLocName("yard_waterfall")
		GM.pc.setLocation("yard_waterfall")
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Alex brings you to a secluded spot in the yard, the one with the constantly running waterfall.")

		saynn("He sits down on one of the benches and just.. relaxes.. occasionally licking the ice cream.")

		saynn("You do the same, taking a seat nearby.")

		saynn("[say=pc]Tired?[/say]")

		saynn("[say=alexrynard]Always.[/say]")

		saynn("Both of you watch the water. The noise is quite calming. Sadly, it's not enough to pull you or Alex away completely. You can just feel the anxiety coming through Alex's sighs.")

		saynn("At least the ice cream tastes kinda nice.")

		addButton("Continue", "See what happens next", "time7_resting_questions")
	if(state == "time7_resting_questions"):
		saynn("After thinking about it for some time, a little idea comes into your mind.")

		saynn("[say=pc]You need parts and materials for your prototypes, right?[/say]")

		saynn("Alex raises a brow at you.")

		saynn("[say=alexrynard]Sure?[/say]")

		saynn("[say=pc]Why don't you use the ones from the disassembled datapads and shock remotes?[/say]")

		saynn("The foxy tilts his head.")

		saynn("[say=alexrynard]That'd.. that'd be stealing AlphaCorp property.[/say]")

		saynn("[say=pc]How about this. Who cares?[/say]")

		saynn("Alex squints.")

		saynn("[say=alexrynard]Listen, that's a wrong thing to do.[/say]")

		saynn("[say=pc]You don't seem to be against doing wrong things for the right cause.[/say]")

		saynn("He rolls his eyes.")

		saynn("[say=alexrynard]Captain would be against that.[/say]")

		saynn("[say=pc]The captain is probably the reason why you are depressed all the time. He gives you all that monotonous work to distract you from working on your prototypes. Haven't you noticed that already?[/say]")

		saynn("Alex frowns.. and bares his sharp teeth for a second. He looks quite annoyed after your words.")

		saynn("But after a few seconds, he calms down.. and sighs again.")

		saynn("[say=alexrynard]Of course I noticed.. a long time ago.[/say]")

		saynn("[say=pc]Then why do you keep doing it?[/say]")

		saynn("Alex stares at the waterfall again.")

		saynn("[say=alexrynard]Because there are reasons, okay? It's a long story.[/say]")

		saynn("You look around. The whole prison.. is so quiet. Might as well try to figure out what that story is.")

		saynn("[say=pc]We got time.[/say]")

		saynn("Alex stays silent for some time, enjoying his ice cream. You do too.")

		saynn("[say=alexrynard]..do you really wanna hear it?[/say]")

		addButton("Sure", "Listen to his story", "time7_resting_start_backstory")
		addButton("It's fine", "It's fine. He clearly doesn't want to share", "time7_resting_skip_backstory")
	if(state == "time7_resting_skip_backstory"):
		saynn("[say=pc]It's fine if you don't wanna share.[/say]")

		saynn("He sighs.")

		saynn("[say=alexrynard]One of my prototypes broke my spine. I was dumb and reckless. Cap was the one who paid for my prosthetic and the operation. Without him.. I wouldn't be here for sure.. I'd be forever glued to a wheelchair.[/say]")

		saynn("He finishes eating his ice-cream.")

		saynn("[say=alexrynard]That's the short story.[/say]")

		saynn("Makes sense.")

		saynn("[say=pc]I see..[/say]")

		saynn("[say=alexrynard]You don't owe him anything, you can leave me to finish fixing the broken datapads alone. Whatever is left should be the last batch.[/say]")

		saynn("[say=pc]What if it's not?[/say]")

		saynn("He shrugs.")

		saynn("[say=alexrynard]Then I will have to chat with the captain about that.[/say]")

		saynn("Alex stands up, his posture straight.")

		saynn("[say=alexrynard]I still have no idea why you decided to help me. But thank you.[/say]")

		saynn("And just like that, he walks away, leaving you alone with your thoughts.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "time1_notcrazy"):
		processTime(30*60)

	if(_action == "time1_useme"):
		processTime(30*60)

	if(_action == "time1_work"):
		processTime(6*60*60)
		GM.pc.addCredits(1)
		addMessage("1 credit added to you")

	if(_action == "time1_agreetoit"):
		addMessage("Trust Exercise 1 is now available")

	if(_action == "time1_notsosure"):
		addMessage("Trust Exercise 1 is now available")

	if(_action == "time2_alexfalls"):
		processTime(30*60)

	if(_action == "time2_helpalex"):
		processTime(2*60)

	if(_action == "time2_breakroom"):
		processTime(5*60)
		setFlag("AlexRynardModule.ch2CanEnterEngineering", true)
		addMessage("You learned the code to the Engineering block")

	if(_action == "time2_waterbottle"):
		processTime(3*60)

	if(_action == "time2_leave"):
		setFlag("AlexRynardModule.ch2StayedWhenSpineBorked", false)
		GM.pc.addCredits(1)
		addMessage("You received 1 credit")

	if(_action == "time2_watch"):
		processTime(60*60*2)
		setFlag("AlexRynardModule.ch2StayedWhenSpineBorked", true)

	if(_action == "time2_leaveafterwatch"):
		GM.pc.addCredits(2)

	if(_action == "time3_wellenough"):
		processTime(30*60)
		addMessage("Trust Exercise 2 is unlocked")

	if(_action == "time3_couldbebetter"):
		processTime(30*60)
		addMessage("Trust Exercise 2 is unlocked")

	if(_action == "time3_caparrives"):
		processTime(60*60*3)
		GM.pc.addCredits(1)

	if(_action == "time3_justleave"):
		setFlag("AlexRynardModule.ch2EavesdroppedCaptain", false)
		increaseFlag("PortalPantiesModule.Alex_BusyDays")

	if(_action == "time3_eavesdrop"):
		setFlag("AlexRynardModule.ch2EavesdroppedCaptain", true)
		increaseFlag("PortalPantiesModule.Alex_BusyDays")

	if(_action == "time4_showrepair"):
		processTime(60*60*3)
		GM.pc.addCredits(1)

	if(_action == "workend_check"):
		processTime(RNG.randi_range(6,9) * 60 * 60)
		GM.pc.addCredits(1)
		
		if(GM.main.isVeryLate()):
			setState("toolate")
		else:
			setState("aftersomefixing")
		return

	if(_action == "start_trust"):
		endScene()
		runScene("AlexTrustExercisesMenuScene")
		return

	if(_action == "time7_eliza"):
		processTime(10*60)

	if(_action == "time7_lift"):
		processTime(5*60)

	if(_action == "time7_in_lobby"):
		processTime(3*60)

	if(_action == "time7_avy_fuckoff"):
		toldFuckoff = true

	if(_action == "time7_nearmachine"):
		processTime(3*60)

	if(_action == "time7_get_pills"):
		tookPills = true

	if(_action == "time7_let_eliza_know_pretend"):
		tookPills = true
		setState("time7_let_eliza_know_dispose")
		return

	if(_action == "time7_computer_doselfdiag"):
		didDiag = true

	if(_action == "time7_computer_tested_works"):
		addExperienceToPlayer(300)
		addMessage("Trust Exercise 3 is unlocked")

	if(_action == "time7_computer_presslogo"):
		logoPressed += 1
		if(logoPressed > 4):
			logoPressed = 0
			setState("time7_computer_easteregg")
			return

	if(_action == "time7_after_give_pills"):
		GM.pc.addCredits(20)
		addMessage("You received 20 credits!")

	if(_action == "time7_after_fuckoffwithpills"):
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		addMessage("You managed to recover 3x painkillers")

	if(_action == "time7_resting_near_water"):
		processTime(30*60)
		GM.pc.addStamina(100)
		GM.pc.addPain(-100)

	if(_action == "time7_resting_start_backstory"):
		endScene()
		setFlag("AlexRynardModule.ch2SkippedBackstory", false)
		runScene("AlexCh2s2BackstoryScene")
		return

	if(_action == "time7_resting_skip_backstory"):
		setFlag("AlexRynardModule.ch2SkippedBackstory", true)

	setState(_action)

func saveData():
	var data = .saveData()

	data["howManyTimes"] = howManyTimes
	data["toldFuckoff"] = toldFuckoff
	data["tookPills"] = tookPills
	data["didDiag"] = didDiag
	data["logoPressed"] = logoPressed

	return data

func loadData(data):
	.loadData(data)

	howManyTimes = SAVE.loadVar(data, "howManyTimes", 0)
	toldFuckoff = SAVE.loadVar(data, "toldFuckoff", false)
	tookPills = SAVE.loadVar(data, "tookPills", false)
	didDiag = SAVE.loadVar(data, "didDiag", false)
	logoPressed = SAVE.loadVar(data, "logoPressed", 0)
