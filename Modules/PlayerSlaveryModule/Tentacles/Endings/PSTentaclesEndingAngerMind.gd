extends SceneBase

func _init():
	sceneID = "PSTentaclesEndingAngerMind"

func _reactInit():
	addCharacter(GM.main.PS.getTentaclesCharID())

func resolveCustomCharacterName(_charID):
	if(_charID == "ten"):
		return GM.main.PS.getTentaclesCharID()
	if(_charID == "sci1"):
		return GM.main.PS.getScientist1CharID()
	if(_charID == "sci2"):
		return GM.main.PS.getScientist2CharID()

func _run():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(state == ""):
		_tentacles.doAnim("idle")
		aimCameraAndSetLocName("pstent_important")
		saynn("They made a huge mistake, trapping you here with those tentacles. And it's time to make them regret that decision.")

		saynn("You look around.. The door into your cell seems impenetrable. And even the window.. the one that the scientists were looking at you from.. you're fairly certain that breaking it would take way too long.")

		saynn("[say=pc]You have a plan perhaps? Something better than just trying to break the window?[/say]")

		_tentacles.talk("We do. Are you okay with murder?")
		saynn("They sure don't lack enthusiasm. Makes sense, you got these tentacles extremely riled up and angry.")

		saynn("[say=pc]If I have to.[/say]")

		saynn("You see one of the tentacle tips nodding. The others switch their direction to someone else.")

		saynn("One of the armored guards starts walking past your cell, squeezing his weapon tightly. He glances at the window to make sure you're still there.. but then just walking past.. a standard patrol.")

		saynn("But then he takes a different route. Rather than following the corridor, he heads towards your door.")

		saynn("[say=pc]Huh.[/say]")

		saynn("The guard approaches the control panel. He scans something.. and the door begins to unseal itself with a hiss.. and then it opens.")

		saynn("He steps inside, armored from toes to the tip of his head. You can't even see his eyes behind an advanced-looking helmet.")

		saynn("The tentacles don't move.. and don't strike. And so you do the same, seeing what will happen next.")

		saynn("The guard slowly approaches you.. and then offers you his plasma rifle, holding it out with both hands.")

		saynn("Why not, you take it. It's a bit heavy for your liking but what can you do?")

		saynn("[say=pc]Thanks.[/say]")

		saynn("The guard then reaches up with slow, deliberate movement and removes his helmet. His face is emotionless. You hold the handle of your rifle tighter when he suddenly draws his side-arm ballistic pistol from his holster.")

		saynn("But instead of aiming it at you or the tentacles, he presses the barrel to his head.. and pulls the trigger.")

		saynn("The gunshot echoes through the cell and the corridor. He crumples instantly, his body lifeless.")

		saynn("For one heartbeat, there is silence. You expected something like this.. but you didn't expect.. this.")

		saynn("Then the alarms scream to life. Red lights start strobing all around you. An intercom kicks in with urgent panic.")

		saynn("[say=sci1]What the.. Containment breach, we have a containment breach at cell 5! Code red, code red. All guards, the armory is unlocked, I order you to kill the specimen now. I repeat, shoot to kill![/say]")

		_tentacles.talk("We must move before they seal us here.")
		saynn("You nod.. and follow the tentacles as they squeeze through the opened door.")

		addButton("Continue", "See what happens next", "friendlyfire")
	if(state == "friendlyfire"):
		aimCameraAndSetLocName("pstent_entrance")
		saynn("You step foot into the corridor.. and watch as the door shuts behind you, the room begins to get filled with some kind of gas.. Luckily, you're not there anymore.")

		saynn("You're not out of the woods yet though as you begin to hear boots pounding against the floor.")

		saynn("Looking around.. there is nothing to hide behind.")

		_tentacles.talk("Use us as cover if you have to.")
		saynn("Guards appear from behind the corner, wearing the same armors and holding the same rifles. Bolts of glowing plasma begin wheezing past.")

		saynn("Suddenly, one of the guards dashes into the line of fire of his friends. They stop firing immediately.")

		saynn("[sayMale]What the fuck are you doing?! Get out of the way![/sayMale]")

		saynn("That same guard then raises his weapon on his comrades.. and pulls the trigger. The struck guard gasps as the plasma melts his chest plate, creating a hole deep into his flesh.")

		saynn("[sayMale]He is a traitor![/sayMale]")

		saynn("The rebellious guard gets gunned down fast.. leaving four out of six alive.")

		saynn("But before they finish pumping one of his own with plasma, another guard suddenly turns and starts firing at his own squad. Guns turn towards him.. but not all of them.. You can hear more shots.")

		saynn("[sayMale]WHO IS COMPROMISED?! AVOID FRIENDLY FIRE! a-AGH![/sayMale]")

		saynn("Panic erupts. The formation shatters. Nobody knows who is who anymore, guards shooting randomly at each other, leaving gaping burning holes in their armor.. and bodies.")

		saynn("A second wave of guards approaches from another corridor. They get utterly confused, seeing friendlies firing at friendlies.")

		saynn("[sayMale]Hold fire, hold fire, what the fuck is happening here?[/sayMale]")

		saynn("A fresh guard that was standing near him suddenly turns and shoots him. The self-inflicted cycle of carnage continues.")

		saynn("The corridor became a violent disco show.. with plasma shots flying everywhere.. guards screaming. The ones who try to run are quick to change their mind and start killing each other again.")

		saynn("[sayMale]IT'S IN OUR HEADS! IT'S IN OUR-[/sayMale]")

		_tentacles.talk("Silence.")
		saynn("A plasma shot takes him from behind, his head turning into an ugly charcoal.")

		saynn("Some of the shots hit the tentacles, making them spasm wildly. The impacts are leaving nasty sizzling wounds on the slick green surface.. You can feel the pain.. you share every emotion with them.")

		saynn("A single guard is left alive. He sprints away from the slaughter.. away from you two.")

		saynn("He makes it a few meters before stopping in his tracks. His body turns and faces you. He walks forward, step by step, until he stands amid all the bodies again. He looks at you.. raises his rifle to his own chin.. and melts his brains out.")

		saynn("The last guard has joined the pile.")

		saynn("[say=pc]That was.. brutal. Can you keep going?[/say]")

		_tentacles.talk("We have to.")
		saynn("You nod and let them take the lead.")

		addButton("Continue", "See what happens next", "show_stuff")
	if(state == "show_stuff"):
		aimCameraAndSetLocName("pstent_scientist_2")
		saynn("The tentacles proceed to explore the bio-lab on their own.. while you stay behind.")

		_tentacles.talk("We can feel the scientists trying to escape. They're in the docks, we can't reach them in time.")
		saynn("[say=pc]Okay. Continue clearing the lab, I will catch them.[/say]")

		saynn("You notice small colorful signs that are placed on the walls of each intersection. The ones that you were interested in.. say 'docks'.")

		saynn("You run. The tentacles were right.. As soon as you arrive, you see quick glimpses of the two scientists who were trying to board the escape pods.")

		saynn("A few shots from your plasma rifle has made them quickly reconsider. They stop trying to pry the airlocks open.. and instead run somewhere deeper into the bio-lab. Good enough for the first time using this rifle.")

		saynn("After that, you trace your steps back and find the monster. It's not hard to find.. You just have to follow the path of blood and destruction.")

		saynn("During your exploration, you find more reinforced windows.. a whole row of them, each leaving into a separate containment cell.. just like yours. There are.. things.. inside them. Some have humanoid shapes.. some are just nothing but twisted forms.")

		saynn("Security doors close in front of you.. but not for long. The tentacles are quick to reverse any obstacle that the guards try to create..")

		saynn("All the corridors look the same.. but eventually you do reach some kind of checkpoint.. with more guards defending it. You hide behind the corner and take blind shots with your rifle, distracting them.")

		saynn("[say=pc]Kill them all.[/say]")

		_tentacles.talk("With pleasure.")
		saynn("You hear more plasma shots, screams and loud thuds as the tentacles deal with the threats in a similar way.")

		saynn("Feeling a bit curious, you peek your head out and watch as the three last guards do a final standoff, aiming their guns at each other. And then.. after a single moment.. they're all dead.")

		_tentacles.talk("We're gaining on them.")
		saynn("[say=pc]Don't mindcontrol them unless they attack us.[/say]")

		_tentacles.talk("What would be the reason?")
		saynn("[say=pc]I wanna hear their begging.[/say]")

		_tentacles.talk("We will entertain your request.")
		addButton("Continue", "See what happens next", "pleading")
	if(state == "pleading"):
		addCharacter(GM.main.PS.getScientist1CharID())
		addCharacter(GM.main.PS.getScientist2CharID())
		aimCameraAndSetLocName("pstent_near_lastroom")
		saynn("At last, you reach some kind of room.. a room that has gone full lockdown mode, all of its doors and windows are sealed shut.")

		saynn("This.. certainly piques your interest.")

		_tentacles.talk("Should we?")
		saynn("You hum. Suddenly, a voice cries through an intercom.")

		saynn("[say=sci1]Wait! Wait-wait-wait! We can make a deal! There is no need for any more bloodshed![/say]")

		saynn("Looks like you have struck gold. You look around and see that one of the security cameras is nearby. It's watching you and your friend.")

		saynn("The initiative is on your side.. so you just stare at the camera silently, your head tilted ever so slightly to the side, your plasma rifle resting on your shoulder.")

		saynn("[say=sci1]There is a way out! An escape pod! We will let you take it! Just.. Just call them off![/say]")

		saynn("You continue to say nothing. Your expressionless face is enough of a statement.")

		_tentacles.talk("They're close enough for our reach.")
		saynn("You look at the tentacles and nod.")

		saynn("[say=pc]If you let us inside, we won't harm you. That's a promise.[/say]")

		saynn("Seconds later, you hear shuffling over the intercom.")

		saynn("[say=sci1]..hey, where the heck are you going.. get back here.[/say]")

		saynn("[say=sci2]Please.. I didn't.. I never wanted to.. I was just doing my.. please..[/say]")

		saynn("The girl's pleading.. It makes you sigh. Are you really gonna have to kill her too? Technically, you don't have to do it yourself.")

		saynn("[say=sci1]Don't you dare press that. I will fucking strangle you, I swear.[/say]")

		saynn("Seconds later, all of the doors and windows unseal themselves, inviting you in.")

		addButton("Continue", "See what happens next", "theTalk")
	if(state == "theTalk"):
		aimCameraAndSetLocName("pstent_lastroom")
		playAnimation(StageScene.Duo, "stand", {pc=GM.main.PS.getScientist1CharID(), npc=GM.main.PS.getScientist2CharID()})
		saynn("You and the tentacles step inside some kind of lab. There is lots of expensive-looking science equipment around.. a fridge.. a separate compartment with beds.. a bathroom.. and also a few computers. The sight reminded you of your own cell that you had here for some reason.")

		saynn("[say=pc]So that's how you live. Pretty miserable.[/say]")

		saynn("Both scientists are hiding under one of the tables. Pathetic really. Your tentacles see them too.. but you gesture to them to stay still and stay near the only way out of this room.")

		saynn("Slowly, you approach the table, making each step echo in their ears. You can hear them shuffling around in there. You are still holding your rifle.. just in case they try to do something stupid.")

		saynn("You knock on the table.")

		saynn("[say=pc]Up.[/say]")

		saynn("[say=sci1]Listen..[/say]")

		saynn("[say=pc]Up, I said.[/say]")

		saynn("The scientists scramble to get from under the table. The guy is holding something in your view.. a piece of paper.")

		saynn("[say=sci1]These are codes.. To launch the escape pod.. Let's talk about it, please.[/say]")

		_tentacles.talk("Complete lie.")
		saynn("Only you can hear the tentacles. The wolf looks.. scared. Even the girl is not shivering as much.")

		saynn("[say=pc]Leave them on the table.[/say]")

		saynn("He starts lowering the codes onto a flat surface of the table.. but then stops.")

		saynn("[say=sci1]Please.. Spare me at least.[/say]")

		_tentacles.talk("He wants to keep himself alive for as long as possible, in case a possibility to escape opens up.")
		saynn("[say=sci2]Hey.. uh-h.. um-m.. wait-t..[/say]")

		saynn("His thoughts and behaviour makes your blood boil, your hand tensing up around the handle of your weapon.")

		saynn("[say=sci1]If I destroy these, you will be stuck here forever.[/say]")

		_tentacles.talk("Another complete lie.")
		saynn("You decide to play his little game.")

		saynn("[say=pc]Just like you, no?[/say]")

		saynn("He stays quiet.")

		_tentacles.talk("He is thinking about his next move. He is ready to do anything just to survive.")
		saynn("Suddenly, he rips the paper into many pieces.")

		saynn("[say=sci1]Only I know the codes now! I will input them myself if you spare me! Only I can control the pod! If your.. thing.. wants blood, kill her! She is just as responsible as me![/say]")

		_tentacles.talk("His plan is to get into the escape pod before us and lock the airlock as fast as he can.")
		saynn("The other scientist looks frozen from shock.")

		_tentacles.talk("The female scientist.. feels complete regret.")
		saynn("It's easy to regret your decisions now that you're paying the price.")

		saynn("The whole room becomes almost silent.. only the heavy breathing and the shuffling of the tentacles can be heard.")

		saynn("[say=pc]Okay. Can you tell me one thing? Why? Why are you doing this? I'm not talking about throwing your colleague under a bus. I'm talking about.. this whole lab. Why do these things?[/say]")

		saynn("[say=sci1]You don't understand? We're helping people! I'm sorry but the math doesn't lie. The suffering of a single creature.. no matter how sentient.. is worth it if it can help the suffering of many others.[/say]")

		_tentacles.talk("He stopped caring about the suffering of people a long time ago. His current dream is to buy a space-yacht and a little castle on one of the rich planets.")
		saynn("[say=pc]Why do you care about helping people?[/say]")

		saynn("[say=sci1]Because? You rub my back, I rub yours. Not all of us got lucky but everyone deserves a chance for a good life, no?[/say]")

		_tentacles.talk("He thinks that only the rich and powerful should live a full life. The rest must serve. And if you can't serve, you must stop wasting the limited resources.")
		saynn("[say=pc]Everyone, huh? Except for the test-subjects of course?[/say]")

		saynn("[say=sci1]Listen, what else are we supposed to do? We gotta be able to test these things somehow. No one fucking cares about the slaughter houses that grow animals only to murder them in cold blood. We love meat more than we love animals. No one is gonna cry about a few test subjects dying. But the hope of their kid receiving a cure for cancer one day.. that's what keeps them going. That's what keeps us going.[/say]")

		_tentacles.talk("This lab was created to do secret government projects. Biological weapons, viruses, new drugs, helpful genetic mutations, anything that would help win wars and help extend the maximum lifespan of the higher-ups.")
		saynn("[say=pc]Very noble.[/say]")

		saynn("[say=sci1]I'm not famous, I'm clearly not doing it for fame. Credits? I get enough so I can live, that's all that I need really. I don't know how I can explain it.. I just care.. About all of us.[/say]")

		_tentacles.talk("He's been selling some of the mutated specimens and their.. parts.. on a blackmarket. He has a whole list of.. exotic collectors.. in his mind.")
		saynn("[say=sci1]I'm sorry you got caught in the middle of this. Some of the test subjects actually like being used as test subjects, we always look for those. But you're clearly not just a normal test subject. You're so much more than that. We can let you go, freely. You can take your.. uh.. plant.. as well. As a gift from us.[/say]")

		_tentacles.talk("He hopes to kill us so he can continue doing what he wants to do.")
		saynn("The girl is still just as shocked.")

		_tentacles.talk("The female scientist was told a completely different story by him. She was promised a different dream. We can sense a feeling of betrayal.. And yet, she is also scared of us. She might be holding something.. but we don't know what.")
		saynn("She should be scared indeed.")

		addButton("Continue", "See what happens next", "guy_dead")
	if(state == "guy_dead"):
		removeCharacter(GM.main.PS.getScientist1CharID())
		_tentacles.doAnim("idle", {pc=GM.main.PS.getScientist2CharID(), npcAction="defeat"})
		saynn("You look at the wolf.")

		saynn("[say=pc]You know.. Your story is nice.. and it almost adds up. Too bad my friend here can read minds.[/say]")

		saynn("[say=sci1]What? That's just impossible.[/say]")

		saynn("[say=pc]What color of a space-yacht would you want to get?[/say]")

		saynn("His eyes open wide.. and then he suddenly dashes towards the exit.. out of pure desperation.")

		saynn("He runs.. but then he stops.. his whole body just refusing to move.")

		saynn("[say=sci1]H-hey! What is happening..[/say]")

		saynn("The tentacles approach the guy.")

		_tentacles.talk("You hear us now, don't you?")
		saynn("[say=sci1]What the.. Demon! You're a fucking creature of hell! I always fucking knew it..[/say]")

		_tentacles.talk("What do you wanna say to us?")
		saynn("[say=sci1]Die! I hope you die! Both of you! I hope you get cut into a million pieces![/say]")

		saynn("His own hand.. rises.. and approaches his own neck. His digits lock around his throat and begin squeezing it.")

		_tentacles.talk("Are you scared of dying?")
		saynn("While that is happening.. and all the attention is focused on the guy.. the female scientist slowly approaches the tentacles from behind.. getting ready to pounce them.")

		saynn("[say=sci1]Khh.. f-fuck you..[/say]")

		_tentacles.talk("Yes, you are. Your mind is weak.. much weaker than the mind of any guard.")
		saynn("Suddenly, the girl dashes towards the tentacles, an injector in her paws. You raise your weapon and take aim.. fuck.. the tentacles are in the way..")

		saynn("A sound of whip cracking echoes around the lab.")

		_tentacles.talk("But yours.. you have promise.")
		saynn("You step back and see that one of the tentacles has caught the girl's wrist.. the injector is only a few inches away from the monster.")

		saynn("[say=sci2]H-huh?..[/say]")

		_tentacles.talk("You realized what our weakness was. You managed to conceal your thoughts.. impressive. We almost got erased.")
		saynn("Another tentacle reaches out and carefully fetches the injector from her paw.")

		_tentacles.talk("We will be taking that.. excuse us.")
		saynn("The stolen injector gets brought towards the wolf's neck.")

		saynn("[say=sci1]If you kill me.. kh.. You're only gonna prove that you're a fucking evil monster! You're only gonna prove that you should never have existed in the first place![/say]")

		_tentacles.talk("Good thing we won't be the one who is doing the killing.")
		saynn("The tentacle hands the injector to the wolf.. who takes it.. and injects the yellow subtly-glowing drug into his neck.")

		saynn("[say=sci1]NO! Agh.. F-fuck.. s-shit.. you.. stupid.. argh.. I hate you.. I hate all of you.. I.. hate..[/say]")

		saynn("He starts drooling uncontrollably.. and then he just collapses.")

		_tentacles.talk("His last thought was that of hate. Hate of his colleague who decided to buy you specifically on a slave auction.")
		saynn("[say=pc]Without me, he would be still on track for his own personal yacht.[/say]")

		saynn("The tentacles let go of the girl's wrist.. which makes her recoil back and fall onto her butt. She is sobbing.")

		saynn("[say=sci2]Just.. kill me too..[/say]")

		saynn("[say=pc]Why? It looks like you got lied to.[/say]")

		saynn("[say=sci2]I was.. but I saw the whole picture eventually. I haven't stopped him..[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("[say=sci2]Because I started to like this job.. I was really good at it. Please.. I'm only making this world worse.[/say]")

		_tentacles.talk("She is telling the truth. And she fully believes her words.")
		saynn("You look at her.. silently. Killing her seems pointless now. You got your revenge.")

		saynn("[say=pc]Looks like you have a lot of work ahead of you.[/say]")

		saynn("[say=sci2]What?[/say]")

		_tentacles.talk("To become a better person. You can start with self-reflection. We know a great quiet spot near one of the windows.")
		saynn("The cat blinks at both of you.")

		saynn("[say=pc]Stop doing dumb things and you will be fine.[/say]")

		saynn("She nods.. subtly.")

		saynn("Well.. it was time to leave.")

		addButton("Continue", "See what happens next", "docks")
	if(state == "docks"):
		removeCharacter(GM.main.PS.getScientist2CharID())
		aimCameraAndSetLocName("pstent_scientist_1")
		_tentacles.doAnim("idle")
		saynn("You head back into the docks.. but now with the tentacles.")

		saynn("Looks like there is only one escape pod left.. the one that has gotten stuck.")

		saynn("The tentacles help you by forcibly spreading the doors open.")

		saynn("The pod.. is clearly too small for the tentacles. There is only space for two normal-sized people.")

		saynn("[say=pc]Well.. fuck.[/say]")

		_tentacles.talk("It's okay, we knew about this.")
		saynn("[say=pc]You did? And you didn't tell me? We could have done something.[/say]")

		_tentacles.talk("We will be fine, don't worry about us. Our journey is only now beginning. Thank you for everything.")
		saynn("Suddenly, bolts of plasma start flying past you. The rest of the guards are here.")

		saynn("The tentacles push you into the pod and close it.. before turning around and proceeding to cause more chaos between them.")

		saynn("Looks like you won't get to say your goodbyes, the tentacles have gotten out of range. Oh well.. they probably know.")

		saynn("You take a seat.. find a big red button on the pod's main panel.. and press it.")

		addButton("Continue", "See what happens next", "in_space")
	if(state == "in_space"):
		removeCharacter(GM.main.PS.getTentaclesCharID())
		aimCameraAndSetLocName("pstent_escapepod")
		playAnimation(StageScene.Solo, "sit")
		saynn("You're drifting through space.. the fuel has long run-out. Your pod has a way of sending an SOS signal.. but that's about it.")

		saynn("Suddenly, your collar starts beeping.. faster and faster.. until it suddenly sends a shock so strong that you black out.")

		addButton("Continue", "See what happens next", "near_detective")
	if(state == "near_detective"):
		removeCharacter(GM.main.PS.getScientist1CharID())
		removeCharacter(GM.main.PS.getScientist2CharID())
		removeCharacter(_tentacles.getTentaclesCharID())
		addCharacter("intro_detective")
		playAnimation(StageScene.Solo, "sit")
		aimCameraAndSetLocName("intro_interogation")
		saynn("You wake up.. what feels like seconds later.. cuffed to a chair.")

		saynn("It's not the first time you've been in this place.")

		saynn("[say=intro_detective]Name is Jake, IIPF, threat assessment division.[/say]")

		saynn("[say=pc]Yeah, I remember you.[/say]")

		saynn("He raises a brow at you.")

		saynn("[say=pc]I've been naughty, I know.[/say]")

		saynn("He puts his glasses on and reads something off of an old-school wooden tablet.")

		saynn("[say=intro_detective]Let's see. You have a single case of felony escape. Hm. But it's a big one. Help me understand, how and why did it happen? You can start with the how.[/say]")

		saynn("Jake looks over his glasses at you, awaiting.")

		saynn("[say=pc]Do you wanna hear my story? How I was used as a test subject in an illegal bio-lab? And what happened next?[/say]")

		saynn("[say=intro_detective]My job is not to listen to fan fiction. It's to assess the level of risk. How likely is it that you're gonna try to pull this stunt again. So help me help you, will you?[/say]")

		saynn("You're not really sure what to say anymore. You can try to explain that you were held in a cell.. but he will probably not care. And telling him about what you did with the lab will probably put a few extra charges on you. Might as well try to play his game then.")

		saynn("[say=pc]This won't happen again, I can assure you.[/say]")

		saynn("Jake tilts his head ever slightly.. while you put your most innocent eyes.")

		saynn("[say=intro_detective]I see.[/say]")

		addButton("Continue", "See what happens next", "fastforward")
	if(state == "fastforward"):
		removeCharacter("intro_detective")
		GM.pc.setLocation(GM.pc.getCellLocation())
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("Next moment you know it.. you're being flown back to your concrete home.. first class, as usual.")

		saynn("The BDCC guards meet you and walk you to your cell.. where Risha is already waiting for you.")

		saynn("[say=risha]Here is your stupid crap.[/say]")

		saynn("[say=pc]What a warm welcome.[/say]")

		saynn("[say=risha]You know what's warm? My cock. Wanna welcome it?[/say]")

		saynn("Looks like you weren't gone long enough for her to start missing you.")

		saynn("[say=pc]I'm good.[/say]")

		saynn("[say=risha]No. You're a slut. C'mon, I ain't got all day.[/say]")

		saynn("You fetch your stupid crap off of her hands.. and watch her leave.")

		saynn("From one paradise to another.")

		addButton("Continue", "You had your fun", "doEndSlavery")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "fastforward"):
		processTime(60*42)

	if(_action == "doEndSlavery"):
		endScene()
		GM.main.endCurrentScene()
		GM.main.stopPlayerSlavery()
		GM.pc.setLocation(GM.pc.getCellLocation())
		return

	setState(_action)
