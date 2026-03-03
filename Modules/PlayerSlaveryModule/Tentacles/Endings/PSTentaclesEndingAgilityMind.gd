extends SceneBase

func _init():
	sceneID = "PSTentaclesEndingAgilityMind"

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
		_tentacles.setMonsterLoc("pstent_important")
		saynn("The tentacles are about as good as they're gonna be. You train everything you could with them. It's time to try to put you.. and them.. to the test.")

		saynn("You look around.. The door into your cell seems impenetrable. And even the window.. the one that the scientists were looking at you from.. you're fairly certain that breaking it would take way too long.")

		saynn("[say=pc]You have a plan perhaps? Something better than just trying to break the window?[/say]")

		_tentacles.talk("We do. We assume you want to avoid bloodshed.")
		saynn("[say=pc]Of course. We're not animals.[/say]")

		saynn("The tentacles stare at you for longer than would normally be comfortable..")

		saynn("One of the armored guards starts walking past your cell, squeezing his weapon tightly.")

		_tentacles.talk("We have a plan.")
		saynn("The guard glances at the window to make sure you're still there.. but then just walking past.. a standard patrol.")

		saynn("But then he takes a different route. Rather than following the corridor, he heads towards your door.")

		saynn("[say=pc]Huh.[/say]")

		saynn("The guard approaches the control panel. He scans something.. and the door begins to unseal itself with a hiss.. and then it opens.")

		saynn("He steps inside, armored from toes to the tip of his head. You can't even see his eyes behind an advanced-looking helmet.")

		saynn("The tentacles don't move.. and don't strike. And so you do the same, curious what will happen next.")

		saynn("[say=pc]Does the camera see us?[/say]")

		_tentacles.talk("That guard is in the bathroom. We have about a minute.")
		saynn("The guard slowly approaches the fridge.. opens it.. and leaves his gun inside. After that, he starts stripping his armor and putting each piece into the fridge as well.. until he is only wearing his underwear.")

		saynn("The mind-controlled guard then gets into your bed.. and promptly falls asleep. The door into your cell.. is still opened.")

		saynn("[say=pc]That's one way.. What if another guard passes by?[/say]")

		_tentacles.talk("Please turn the shower on and set it to the hottest water you can.")
		saynn("You run to the shower.. and do as told. You realize what the plan is.. when all the windows of your cell begin fogging up.")

		saynn("While you are busy with the shower, the tentacles use their agility to reach towards the security camera. The tentacle carefully wraps around it.. and forcefully turns it left and right a few times, making the inner turning motor screech.. and then overheat and seize working. The camera is now staring at a wall.. forever.")

		_tentacles.talk("We have about five minutes before they raise the alarm.")
		saynn("You nod.. and follow the tentacles as they squeeze through the opened door.")

		addButton("Continue", "See what happens next", "corridor")
	if(state == "corridor"):
		saynn("You and {psTentacles} slip through the open door into the corridor. For a moment, the tendrils pause, admiring the new environment that they're in. It's not that different from being in the cell.. but it's still different.")

		saynn("The sound of boots approaching makes you hug the opposite wall. There is not much to hide behind so the tentacles do the same, pressing themselves against the concrete.")

		_tentacles.talk("Tshh.")
		saynn("The guard steps into view from the left corridor, looking forward. He stops and checks his plasma rifle.")

		saynn("He looks left, about to continue his patrol.. but then decides to check his right too.. His body convulsed for a split second.. before going still. His eyes calm down and just glaze over.")

		saynn("The guard blinks, looks directly at you and the tentacles.. and then just causally turns and continues his patrol in the opposite direction, the sounds of his boots fading into silence.")

		_tentacles.talk("He might remember us if he thinks about it long enough.")
		saynn("Another ticking bomb..")

		saynn("You move. Corridor after corridor, the tentacles slither ahead, their movements aren't exactly silent.. but they don't need to be. When a camera appears in sight, a tendril would already be there, wrapping around its frame and twisting with surgical precision until the motor inside it dies.")

		saynn("Any lone guards or pairs of them conveniently turn away at the last second. Maybe training them to be strong and smart was the best decision you could have made.")

		_tentacles.talk("The camera person has begun writing a report.")
		saynn("[say=pc]Can you stop him?[/say]")

		_tentacles.talk("Too far.")
		saynn("You nod.")

		saynn("During your exploration, you find more reinforced windows.. a whole row of them, each leaving into a separate containment cell.. just like yours. There are.. things.. inside them. Some have humanoid shapes.. some are just nothing but twisted forms.")

		saynn("A security door blocks your path, red light glowing. But before you start looking for other options, a guard appears. He approaches the control panel and lets it scan his face.. which opens the door. He walks away without even looking at you. Feels almost too easy.")

		saynn("[say=sci1]Hello. I'm getting a report from the monitoring team. Apparently some of the cameras are malfunctioning. I'm raising the code to code yellow, just in case. Please make sure that every specimen is secured in its cell while we wait for the maintenance team to arrive.[/say]")

		saynn("Time is running out..")

		saynn("You move faster, following the tentacles until you reach some kind of checkpoint. You peek your head to look at it from behind the corner.. and see quite a few guards. They're all alert now too, eyes sharp, hands on their weapons.")

		_tentacles.talk("Too many for us to control.")
		saynn("You start pulling back, searching for a different route.. but then..")

		saynn("Boots. Behind you. Coming fast.")

		saynn("Nowhere to run now. You only have your fists.. but you still ready yourself for a fight..")

		addButton("Continue", "See what happens next", "yoinked_vents")
	if(state == "yoinked_vents"):
		saynn("Suddenly, one of the thick tentacles wraps around you and pulls you up into a ventilation shaft that they have just discovered. As they pull you in, another tentacle puts the ventilation grate back into its place from the inside.")

		saynn("The many guards just run past you, none of them spotting anything suspicious. Phew.")

		saynn("You begin crawling through the vent. It's tight here. Very cramped. The tentacles have to spread themselves along a big distance.. and they still barely fit, really straining the metal. Having high agility helps them though.")

		saynn("[say=pc]Cozy..[/say]")

		_tentacles.talk("They're about to find the naked guard.")
		saynn("You focus and crawl in silence, only hearing the sound of your breathing now. The vent system seems to go on forever..")

		saynn("And then.. suddenly.. the metal begins screeching.")

		saynn("Moments later, the vent floor gives way.")

		saynn("The tentacles fall first, crashing into another corridor. You land onto them, the thick tentacles catching you.")

		saynn("A guard stands a few meters away. His eyes go wide, his hand instantly moves to his radio.")

		saynn("[say=pc]Stop him![/say]")

		saynn("The guard's digit presses the transmit button, causing it to beep. He opens his mouth.. and then freezes.")

		saynn("His thumb carefully releases the button.. but then a crackling voice emerges from the radio.")

		saynn("[say=sci2]Johnson? Report. What's your status? Johnson, do you copy?[/say]")

		saynn("Saying nothing now will cause an alarm.")

		saynn("The guard presses the button of the radio again and starts talking, smooth and calm.")

		saynn("[sayMale]All clear here. Just checking the corridor. No issues so far.[/sayMale]")

		saynn("A pause. The radio crackles.")

		saynn("[say=sci2]Copy that. Stay alert. We have a possible breach.[/say]")

		saynn("[sayMale]Understood.. actually.. I see something now.[/sayMale]")

		saynn("You raise a brow, a slight feeling of anxiety setting in.")

		saynn("[say=sci2]What is it?[/say]")

		saynn("[sayMale]I see a broken vent in my sector. No signs of any intruder.[/sayMale]")

		saynn("A small pause.")

		saynn("[say=sci2]Copy. We will redirect some guards and secure the perimeter. If you see anything else suspicious, report it immediately.[/say]")

		saynn("[sayMale]Copy. Out.[/sayMale]")

		saynn("The guard turns away as the tentacles slither past.. at a very fast pace. You follow behind.")

		_tentacles.talk("That has bought us some time.")
		saynn("The whole facility is hunting you. You are always one mistake away.. But it looks like you are getting close to something..")

		addButton("Continue", "See what happens next", "pleading")
	if(state == "pleading"):
		addCharacter(GM.main.PS.getScientist1CharID())
		addCharacter(GM.main.PS.getScientist2CharID())
		aimCameraAndSetLocName("pstent_near_lastroom")
		saynn("At last, you reach some kind of room.. a room that has gone full lockdown mode, all of its doors and windows are sealed shut by now.")

		saynn("This.. certainly piques your interest.")

		_tentacles.talk("We can sense them. They're about to raise the alarm.")
		saynn("[say=pc]Well, stop them.[/say]")

		saynn("The station-wide intercom kicks in.")

		saynn("[say=sci1]Containment breach! We have a containment.. wait.. hm.. my bad, ignore that. I thought I saw a monster.. but it was just a fly on my screen. Carry on.[/say]")

		saynn("Makes you chuckle. But the intercom isn't done yet.")

		saynn("[say=sci1]Actually, let's take a break for now, guys. We've been at this long enough and haven't found anything, I'm pulling the code back to code green. At ease. Over.[/say]")

		saynn("Perfect. A few seconds later, all of the sealed doors and windows unseal themselves before your very eyes.")

		_tentacles.talk("We're ready.")
		saynn("You nod. Time to invite yourself in.")

		addButton("Continue", "See what happens next", "theTalk")
	if(state == "theTalk"):
		aimCameraAndSetLocName("pstent_lastroom")
		playAnimation(StageScene.Duo, "stand", {pc=GM.main.PS.getScientist1CharID(), npc=GM.main.PS.getScientist2CharID()})
		saynn("You and the tentacles step inside some kind of lab. The female voice gets your full attention.")

		saynn("[say=sci2]Are you sure that was a good idea? I'm certain I saw something there..[/say]")

		saynn("The wolf looks confused.")

		saynn("[say=sci1]Huh? What?[/say]")

		saynn("There is lots of expensive-looking science equipment around.. a fridge.. a separate compartment with beds.. a bathroom.. and also a few computers. The sight reminded you of your own cell that you had here for some reason.")

		saynn("[say=pc]So that's how you live. Pretty miserable.[/say]")

		saynn("Both scientists turn towards you and gasp, seeing the giant tentacles behind you.")

		saynn("The wolf tries to press one of the buttons.. but he seems to be unable to. The tentacles redirect his hand to press a different button.. that would lock all of the doors and windows again..")

		saynn("[say=sci1]What the..[/say]")

		saynn("The cat also tries to press something.. but instead she ends up grabbing a chair and smacking her control panel, destroying a bunch of stuff, including the intercom microphone.")

		saynn("[say=sci2]What is happening.. I didn't do this![/say]")

		saynn("You shrug. Now they're trapped with you here.")

		saynn("[say=pc]So.. What are we going to do with you, huh?[/say]")

		saynn("They're frozen from fear.. the tentacles are watching their every move.")

		saynn("[say=sci1]Listen.. I don't know how you got out.. But if you surrender now, there won't be any punishment.[/say]")

		saynn("You take a step forward. Both scientists take a step back, the girl holding onto the guy's labcoat.")

		saynn("[say=pc]Uh huh. Is that so?[/say]")

		saynn("[say=sci2]What do you want? Please don't kill us.. We're just.. doing our jobs.[/say]")

		_tentacles.talk("She is not being honest.")
		saynn("The wolf suddenly reaches out to grab a random piece of paper from his desk.")

		saynn("[say=sci1]These are codes.. To launch the escape pod.. If you want these.. Let's talk. Please.[/say]")

		_tentacles.talk("Complete lie.")
		saynn("As fun as it'd be to play his little stupid game.. you kinda just want answers.")

		saynn("[say=pc]No they're not. Don't bother trying to lie yourself out of this.[/say]")

		_tentacles.talk("We can read your minds, you know.")
		saynn("The scientists suddenly start looking around, searching for a weird voice.")

		saynn("[say=sci1]What the.. you're a demon spawn![/say]")

		saynn("[say=pc]Don't be so rude.[/say]")

		saynn("[say=sci1]Get out of my head then![/say]")

		_tentacles.talk("But we like it here. So much empty space everywhere.")
		saynn("You didn't know the tentacles could be this cheeky. Makes you chuckle.")

		saynn("[say=pc]Can you tell me one thing? Why? Why are you doing this? I'm talking about.. this whole lab. Why do these things?[/say]")

		saynn("[say=sci1]You don't understand? We're helping people! I'm sorry but the math doesn't lie. The suffering of a single creature.. no matter how sentient.. is worth it if it can help the suffering of many others. It's the truth.[/say]")

		_tentacles.talk("He stopped caring about the suffering of people a long time ago. His current dream is to buy a space-yacht and a little castle on one of the rich planets.")
		saynn("Seeing that the wolf hasn't reacted to the tentacles.. means that they're only talking with you again.")

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
		saynn("The girl is still shivering. Maybe she has a different perspective?")

		saynn("[say=pc]You. I'm gonna ask you the same thing too. Why did you decide to do this?[/say]")

		saynn("[say=sci2]Hh.. uh.. someone had to..[/say]")

		_tentacles.talk("She got talked into it.")
		saynn("[say=pc]Why was that 'someone' you?[/say]")

		saynn("[say=sci2]I was good with numbers.. I loved biology.. I loved science..[/say]")

		_tentacles.talk("We do detect a much stronger psionic aura from her.")
		saynn("She looks like a smart girl. And yet, she is one of the biggest fools around.")

		saynn("[say=pc]Why this bio-lab?[/say]")

		saynn("[say=sci2]I wanted to help people..[/say]")

		_tentacles.talk("She did actually want that.")
		saynn("[say=pc]Why. This. Bio-lab? Why not something else?[/say]")

		saynn("[say=sci2]I didn't know about..[/say]")

		_tentacles.talk("She knew.")
		saynn("[say=pc]Bullshit.[/say]")

		saynn("[say=sci1]Hey! Show her some respect.[/say]")

		saynn("One point of your finger is enough to make the wolf shut up.")

		saynn("The girl lowers her gaze.")

		saynn("[say=sci2]I wanted to help people.. I thought this would be the best way..[/say]")

		_tentacles.talk("She still wants to help.")
		saynn("[say=pc]But you ended up creating monsters. You knew about all the unethical shit that was happening here. Why didn't you stop while you could?[/say]")

		saynn("[say=sci2]I.. I guess I did know.. I.. just.. I couldn't..[/say]")

		_tentacles.talk("Oh. We understand now.")
		saynn("[say=pc]Why?[/say]")

		saynn("[say=sci2]I.. I needed credits.. I got talked into this.. He was very.. persuasive.[/say]")

		saynn("The wolf pushes his chest out.. probably unintentionally.")

		_tentacles.talk("We were wrong. There is another layer to it.")
		saynn("Even the tentacles are struggling to read her mind. Poor girl.")

		saynn("[say=pc]Greed and cock? That can't be all of it, there is no way. Tell me that isn't all of it. Tell me that you got blackmailed.. Tell me that you got forced to do this. Please, just say..[/say]")

		saynn("She cuts you off.")

		saynn("[say=sci2]I ended up really liking this job..[/say]")

		saynn("Tears start streaming down her cheeks.")

		saynn("[say=sci1]Because it is a good job! We're doing great things here! We're saving humanity, okay?[/say]")

		saynn("You stay quiet. The guy was always evil it seems. The girl.. became evil because of her environment.")

		saynn("After thinking about it for a bit, you turn your head towards the tentacles.")

		saynn("[say=pc]What do you think we should do?[/say]")

		saynn("[say=sci1]You're not letting that.. creature of hell.. decide. No fucking way.[/say]")

		_tentacles.talk("Killing them.. although satisfying.. wouldn't accomplish much, they will just be replaced by the others. The system will always find a way back to the status quo.")
		saynn("Doing nothing seems kinda pointless too. They will just continue doing what they were doing.")

		_tentacles.talk("Going up one level and changing the system itself would have been a good solution. But we're not sure if we can solve greed by ourselves.")
		saynn("Greed, huh. That's unsolvable indeed.")

		_tentacles.talk("Destroying their work.. What they managed to accomplish.. Would set them back and make them reconsider. Yes, they would be able to rebuild eventually. But we would be avoiding the loss of life. And so we must do this. We must do this forever.. or until when something changes the system.")
		saynn("An eternal fight. Between good and evil. It all feels black and white when you put it like this.")

		saynn("[say=pc]Okay, well. Let's destroy this lab then.[/say]")

		saynn("[say=sci2]Hey.. no..[/say]")

		saynn("[say=sci1]This is a huge mistake. You are painting a target over yourself. Just fucking leave while you still have the chance.[/say]")

		saynn("You approach one of the computers. The girl dashes to it as well, protecting the pc with herself.")

		saynn("[say=sci2]This is all precious information. This is how you can rule the world.. This knowledge can give you power over anything and everything.. If lost.. It might not ever be recovered.[/say]")

		saynn("[say=pc]I'm sure there will be enough evil people to re-discover it. And then there will be others like me who will delete it all again.[/say]")

		saynn("The girl gets forced to step away. But before you can finally smash the computer.. Another distraction comes your way.")

		_tentacles.talk("We have a better idea.")
		saynn("How can you say no? You take a step back and let the tentacles do their thing.")

		saynn("Suddenly, both, the wolf and the cat, approach their computers. They put their hands on the keyboard.. and start typing.")

		saynn("[say=sci1]I'm not doing this, the fucker is possesing my body. Fuck. I knew we should have just spaced the damn egg.[/say]")

		saynn("[say=sci2]What am I.. doing.. wait..[/say]")

		saynn("It's hard to understand what they are doing exactly.. But it looks like they're navigating some menus.. before opening a console window and typing some commands into it.")

		saynn("[say=sci2]No! This is a command that deletes files. Please! No![/say]")

		saynn("The girl obediently types that command and presses enter. The wolf does the same.")

		saynn("Many lines of text begin scrolling in the console window. It prints every file that was deleted.")

		saynn("[say=sci2]NO! Stop it! Please! This is torture! NO! NO-O!.. I HATE IT.. Please.. I really-really hate this.. no-o-o..[/say]")

		saynn("She is watching years of her work.. evaporating before her very eyes.. and it's all done by her very paws.")

		saynn("[say=sci1]You have backups, right? Don't tell them where they are![/say]")

		_tentacles.talk("Good point.")
		saynn("The girl opens another console window.. and starts typing different commands into it. From what you see, it looks like she has logged into a remote server.")

		saynn("[say=sci2]PLEASE! I'M BEGGING YOU! I WILL DO ANYTHING! I WILL BE A SEXTOY FOR YOUR TENTACLES! I WILL LET THEM STUFF ME WITH EGGS! Just don't make me.. no-..[/say]")

		saynn("The backups are now getting deleted as well.. one by one. Thousands of hours of work.. all going down the drain.")

		saynn("[say=sci1]Fuck.. I will just shut up..[/say]")

		_tentacles.talk("They think we don't know how hard-drives work.")
		saynn("The girl would open two more console windows. Now she is typing commands that you don't understand at all. What is urandom and why would you point it towards some kind of sda.. and why is a cat involved in all of this.")

		saynn("But when the girl reads that command.. her eyes become terrified.")

		saynn("[say=sci2]No..[/say]")

		saynn("The guy types all of the same commands.. but on his computer.")

		saynn("[say=sci1]What is this? What is happening?[/say]")

		saynn("[say=sci2]It was possible to recover most of it previously because the files don't actually get deleted, only their entries.. But now the drives are being filled with noise..[/say]")

		saynn("The cat genuinely looks heart-broken.")

		saynn("[say=sci1]I have no idea what the fuck you are talking about.[/say]")

		saynn("[say=sci2]It's gone.. it's all gone..[/say]")

		saynn("Here is hope that she will reconsider her job now.")

		saynn("The tentacles make the guy unseal the room again. No point in destroying the computers anymore, they're as good as scrap metal now anyway.")

		saynn("[say=pc]See you around.[/say]")

		saynn("The scientists glare at you.. as you leave the room with your tentacles.")

		addButton("Continue", "See what happens next", "docks")
	if(state == "docks"):
		removeCharacter(GM.main.PS.getScientist1CharID())
		removeCharacter(GM.main.PS.getScientist2CharID())
		aimCameraAndSetLocName("pstent_scientist_1")
		saynn("You follow the tentacles to the docks area. You don't find many guards anymore since its code green.. but ones that you do all just look the other way.")

		saynn("The docks.. have several escape pods parked.")

		saynn("You open one of them.. and find that there is only space for two normal-sized people. The tentacles would need both spots free just to fit in it alone..")

		saynn("[say=pc]Well.. looks like we have to take separate pods. That's not bad, is it?[/say]")

		_tentacles.talk("Sadly, it is. No matter how precise we launch these, the error will just accumulate until we start drifting towards completely different solar systems.")
		saynn("You sigh. Time to say your goodbyes it seems.")

		saynn("[say=pc]Can you answer me something.. Why didn't we just give up?[/say]")

		_tentacles.talk("Because then they will win.")
		saynn("[say=pc]I see. What are you gonna do? Will you follow your dreams that you had? Will you explore space?[/say]")

		saynn("The tentacles take their time, thinking about your question.")

		_tentacles.talk("We no longer have such dreams. This world is a very cold place, we understand that now.")
		saynn("And they can't even wear rose-tinted glasses.")

		_tentacles.talk("But we will still do it. Not because we want to.. What we have seen here made us quite sad. We will do it.. because we want to share our findings with you. Share our stories that we will encounter along our journey. We want you to hear them.")
		saynn("Knowing this.. warms your heart.")

		_tentacles.talk("Thank you, friend. Everything you did for us.. you made us find hope again. We really hope that our paths will cross again one day.")
		saynn("When the whole world is being all stupid.. having hope is the best thing you can have.")

		saynn("You nod.")

		saynn("Slowly, you get into one of the escape pods. Tentacles do the same with the other.. but they use their strength to tear off the seats first to free some space.")

		saynn("You and the tentacles both press the 'launch' button at roughly the same time.")

		saynn("The seat grips you as you begin to accelerate.. towards the deep unknown.")

		saynn("You look to your side.. and see the other escape pod slowly drifting away from yours.")

		saynn("[say=pc]Goodbye..[/say]")

		_tentacles.talk("See you around, friend.")
		saynn("And soon, you lose a psychic connection with them..")

		saynn("Your mind feels emptier now..")

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
