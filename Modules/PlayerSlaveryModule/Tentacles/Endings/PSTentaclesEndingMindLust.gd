extends SceneBase

var choseBoth = false

func _init():
	sceneID = "PSTentaclesEndingMindLust"

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
		_tentacles.setScientistsLoc("pstent_lastroom")
		saynn("They made a huge mistake, trapping you here with those tentacles. And it's time to make them regret that decision.")

		saynn("You look around.. The door into your cell seems impenetrable. And even the window.. the one that the scientists were looking at you from.. you're fairly certain that breaking it would take way too long.")

		saynn("[say=pc]You have a plan perhaps? Something better than just trying to break the window?[/say]")

		_tentacles.talk("We do. Are you okay if we.. play around with the guards.")
		saynn("Play around.. that's an interesting way to say it.")

		saynn("[say=pc]As long as it doesn't involve killing them, I'm down.[/say]")

		saynn("The tips of the tentacles get all wet and drippy when you say that. They're getting excited already..")

		saynn("One of the armored guards starts walking past your cell, squeezing his weapon tightly. He glances at the window to make sure you're still there.. but then just walking past.. a standard patrol.")

		saynn("But then he takes a different route. Rather than following the corridor, he heads towards your door.")

		saynn("[say=pc]Huh.[/say]")

		saynn("The guard approaches the control panel. He scans something.. and the door begins to unseal itself with a hiss.. and then it opens.")

		saynn("He steps inside, armored from toes to the tip of his head. You can't even see his eyes behind an advanced-looking helmet.")

		saynn("The tentacles don't move.. and don't strike. And so you do the same, curious about what will happen next.")

		saynn("The guard slowly approaches the fridge.. opens it.. and leaves his gun inside. After that, he starts stripping his armor and putting each piece into the fridge as well.. until he is wearing nothing at all.")

		saynn("The guard then slowly approaches you.. before suddenly arching his back and letting out a lusty moan.. His face shows pure pleasure as his cock leaves its sheath.. gets hard in mere seconds.. and then starts throbbing and shooting strings of his seed all over the floor. His orgasm is so strong.. that his legs go weak, making him collapse and lose consciousness.")

		saynn("[say=pc]Did you just.. cum his brains out?[/say]")

		_tentacles.talk("Did we? We just tugged at a few strings.. His mind is fine.")
		saynn("Seconds later, the alarms scream to life. Red lights start strobing all around you. An intercom kicks in with urgent panic.")

		saynn("[say=sci1]What the.. Containment breach, we have a containment breach at cell 5! Code red, code red. All guards, the armory is unlocked, I order you to kill the specimen now. I repeat, shoot to kill![/say]")

		saynn("Oops.. looks like you have spent too much time having fun with the guard.")

		_tentacles.talk("We must move before they seal us here.")
		saynn("You nod.. and follow the tentacles as they squeeze through the opened door.")

		addButton("Continue", "See what happens next", "friendlyfire")
	if(state == "friendlyfire"):
		aimCameraAndSetLocName("pstent_entrance")
		_tentacles.setMonsterLoc("pstent_entrance")
		saynn("You step foot into the corridor and watch as the door shuts behind you. Your old cell begins to fill with some kind of gas. Luckily, you're not there anymore. Poor guy though.")

		saynn("You're not out of the woods yet though as you begin to hear boots approaching you fast.")

		saynn("Looking around, there is nothing to hide behind.")

		_tentacles.talk("Use us as cover if you have to.")
		saynn("Guards appear from behind the corner, wearing the same armors and holding the same rifles. Bolts of glowing plasma begin wheezing past.")

		saynn("But then something strange happens.")

		saynn("The lead guard stops shooting and lets out a moan. He drops his rifle, his eyes roll back, his face blushing behind the visor.")

		saynn("[sayMale]What the.. what's happening to me? Ah~..[/sayMale]")

		saynn("He stumbles into the view of his friends, grabbing onto his groin, his breathing getting all ragged.")

		saynn("The guards behind him hesitate, confused.")

		saynn("[sayMale]What the fuck is wrong with you? Get out of the way![/sayMale]")

		saynn("The guard doesn't answer, he collapses and starts humping the floor! More cute moans escape his lips.. until he cums, his cock wasting its seed by making a mess in his briefs.")

		saynn("Before anyone can react, another guard stiffens. His weapon drops. His hands fly to his helmet and tear it off, revealing a face full of desire.")

		saynn("[sayMale]I c-can't.. I wanna cum so hard.. what the..[/sayMale]")

		saynn("This same guard starts rubbing against the first, still armored up. This doesn't push him any closer to his peak so he starts undressing, dropping pieces of his armor.")

		saynn("One of the guards is a girl. She clearly got affected by this too, dropping the weapon and revealing her naked self.. before straddling one of the other horny guards.")

		saynn("[sayMale]It's in our heads! It's making us-..[/sayMale]")

		saynn("[sayFemale]Shut up and give me your cock.. now..[/sayFemale]")

		saynn("[sayMale]I want some too! Please![/sayMale]")

		saynn("You can't believe it.. the guards start fucking right in front of you. Moans fill the corridor.. along with gasps and wet sounds of plaps.. hips slamming against butts.. cocks fucking pussies and tailholes..")

		saynn("More guards arrive.. and are quick to join the giant corridor orgy, creating threesomes and foursomes. Holes begin to get pumped full of seed.. some guards crying out from powerful orgasms. Make love, not war, as they say.")

		saynn("The last guard.. the one who somehow didn't get mindcontrolled.. tries to run away. But just before he gets out of range, the tentacles cause him to stop and approach them. He drops his gun too and undresses.. allowing the tentacles to grab him and slide into his holes, fucking him right there, in front of you.")

		saynn("It doesn't take long for the guard to start squirming and moaning, his cock wasting his seed as his prostate gets smashed again and again, his throat bulging from getting stretched..")

		saynn("After that, he collapses onto the floor, into the same pile of half-naked spent bodies.. all of them breathing hard.")

		saynn("[say=pc]Wow.[/say]")

		_tentacles.talk("These won't be a problem anymore.")
		saynn("[say=pc]I believe you.[/say]")

		addButton("Continue", "See what happens next", "show_stuff")
	if(state == "show_stuff"):
		aimCameraAndSetLocName("pstent_scientist_1")
		_tentacles.setMonsterLoc("pstent_scientist_1")
		saynn("The tentacles proceed to explore the bio-lab on their own.. while you stay behind.")

		_tentacles.talk("We can feel the scientists trying to escape. They're in the docks, we can't reach them in time.")
		saynn("[say=pc]Okay. Continue.. clearing.. the lab, I will catch them.[/say]")

		saynn("You notice small colorful signs that are placed on the walls of each intersection. The ones that you were interested in.. say 'docks'.")

		saynn("You run. The tentacles were right.. As soon as you arrive, you see quick glimpses of the two scientists who were trying to board the escape pods.")

		saynn("[say=pc]Hey! Let's talk![/say]")

		saynn("Panic overwhelms them when they hear you. They stop trying to pry the airlocks open.. and instead run somewhere deeper into the bio-lab. You can try running after them.. but if you encounter any guards, you will be screwed.")

		saynn("So you just trace your steps back and find the monster. It's not hard to find.. You just have to follow the path of.. cum.. and fucked-silly people.")

		saynn("During your exploration, you find more reinforced windows.. a whole row of them, each leaving into a separate containment cell.. just like yours. There are.. things.. inside them. Some have humanoid shapes.. some are just nothing but twisted forms.")

		saynn("Security doors close in front of you.. but not for long. The tentacles are quick to reverse any obstacle that the guards try to create..")

		saynn("All the corridors look the same.. but eventually you do reach some kind of checkpoint.. with more guards defending it. You hide behind the nearest corner.")

		saynn("[say=pc]Go get them.[/say]")

		_tentacles.talk("With pleasure.")
		saynn("You hear more plasma shots and screams.. screams that soon turn into moans and sounds of hot sex.")

		saynn("Feeling a bit curious, you peek your head out and watch three guards having a foursome of sorts.. one of the guards is serving as a cocksleeve for two other guards and the tentacles at the same time.")

		saynn("After they all cum.. the guards just collapse, unable to do anything.")

		saynn("The checkpoint seems safe now.. so you approach the tentacles.")

		_tentacles.talk("We're gaining on them.")
		saynn("[say=pc]Don't mindcontrol them unless they attack us.[/say]")

		_tentacles.talk("What if we wanna.. play.. with them?")
		saynn("[say=pc]I wanna hear their begging. After that, go ham.[/say]")

		_tentacles.talk("We can do that.")
		addButton("Continue", "See what happens next", "pleading")
	if(state == "pleading"):
		addCharacter(GM.main.PS.getScientist1CharID())
		addCharacter(GM.main.PS.getScientist2CharID())
		aimCameraAndSetLocName("pstent_near_lastroom")
		_tentacles.setMonsterLoc("pstent_near_lastroom")
		saynn("At last, you reach some kind of room.. a room that has gone full lockdown mode, all of its doors and windows are sealed shut.")

		saynn("This.. certainly piques your interest.")

		_tentacles.talk("Should we?")
		saynn("You hum. Suddenly, a voice cries through an intercom.")

		saynn("[say=sci1]Wait! Wait-wait-wait! We can make a deal! There is no need for any more bloodshed![/say]")

		saynn("Bloodshed.. they couldn't be any more wrong about that.")

		saynn("But it looks like you have struck gold. You look around and see that one of the security cameras is nearby. It's watching you and your friend.")

		saynn("The initiative is on your side.. so you just stare at the camera silently, your head tilted ever so slightly to the side.")

		saynn("[say=sci1]There is a way out! An escape pod! We will let you take it! Just.. Just call them off![/say]")

		saynn("You continue to say nothing. Your expressionless face is enough of a statement.")

		_tentacles.talk("They're close enough for our reach.")
		saynn("You look at the tentacles and nod.")

		saynn("[say=pc]Sorry but I'm coming in, whether you want it or not.[/say]")

		saynn("Seconds later, you hear shuffling over the intercom.")

		saynn("[say=sci1]..hey, where the heck are you going.. get back here.[/say]")

		saynn("[say=sci2]Please.. I didn't.. I never wanted to.. I was just doing my.. please..[/say]")

		saynn("The girl's pleading.. It makes you smile. She is thinking you're coming to kill them.")

		saynn("[say=sci1]Don't you dare press that. I will fucking strangle you, I swear.[/say]")

		saynn("Seconds later, all of the doors and windows unseal themselves, inviting you in.")

		addButton("Continue", "See what happens next", "theTalk")
	if(state == "theTalk"):
		aimCameraAndSetLocName("pstent_lastroom")
		_tentacles.setMonsterLoc("pstent_lastroom")
		playAnimation(StageScene.Duo, "stand", {pc=GM.main.PS.getScientist1CharID(), npc=GM.main.PS.getScientist2CharID()})
		saynn("You and the tentacles step inside some kind of lab. There is lots of expensive-looking science equipment around.. a fridge.. a separate compartment with beds.. a bathroom.. and also a few computers. The sight reminded you of your own cell that you had here for some reason.")

		saynn("[say=pc]So that's how you live. Cute. But I'd rather live anyway else.[/say]")

		saynn("Both scientists are hiding under one of the tables. Pathetic really. Your tentacles see them too.. but you gesture to them to stay still and stay near the only way out of this room.")

		saynn("Slowly, you approach the table, making each step echo in their ears. You can hear them shuffling around in there.")

		saynn("You knock on the table.")

		saynn("[say=pc]Uppity up.[/say]")

		saynn("[say=sci1]Listen..[/say]")

		saynn("[say=pc]Up, I said. I don't even have a weapon.[/say]")

		saynn("The scientists scramble to get from under the table. The guy is holding something in your view.. a piece of paper.")

		saynn("[say=sci1]These are codes.. To launch the escape pod.. Let's talk about it, please.[/say]")

		_tentacles.talk("Complete lie.")
		saynn("Only you can hear the tentacles. The wolf looks.. scared. Even the girl is not shivering as much.")

		saynn("[say=pc]I know you're bullshitting me. My friend here can read your mind if you haven't noticed it yet.[/say]")

		saynn("Their eyes open wide.")

		saynn("[say=sci1]What? I don't believe you. What am I thinking about?[/say]")

		_tentacles.talk("He is upset that the escape pod airlock has jammed.. And he is also upset that he might die without groping his colleague's ass today.")
		saynn("You pass that to them. The girl pouts.")

		saynn("[say=sci1]What? I thought you liked that.[/say]")

		saynn("[say=sci2]Actually! Maybe.. But you don't have to think about it like that! Pervert..[/say]")

		saynn("[say=sci1]Hey, it's her turn now. What is she thinking about?[/say]")

		_tentacles.talk("She is thinking about us. Her mind is.. wondering.. how would it feel.")
		saynn("You repeat that.. and watch the girl suddenly blush deeply.")

		saynn("[say=sci1]Feel what? And I'm the perverted one here?[/say]")

		_tentacles.talk("He is also now slightly curious.")
		saynn("Really, huh.")

		saynn("[say=pc]I'm not gonna kill you, I hope you're happy about that. But I wanna know.. Why? Why do all of this?[/say]")

		saynn("[say=sci1]Because the world needs us! We do messy research that others don't wanna even think about. No one wants to slit the cow's throat. But everyone likes eating burgers.[/say]")

		_tentacles.talk("Illegal research pays extremely well, that's why he is doing it.")
		saynn("[say=pc]Greed motivates you, don't lie to me.[/say]")

		saynn("[say=sci1]Okay? So? Does it matter? There is a demand for our work. We're making the world better. We're finding cures for diseases. We're.. exploring ways of extending one's life.[/say]")

		_tentacles.talk("They've long stopped trying to cure any diseases. Right now their focus is on biological weapons and finding ways to make rich people live longer so they can stay in power.")
		saynn("[say=pc]You're working for corporations, not for people.[/say]")

		saynn("[say=sci1]Listen.. if it wasn't me, it'd be someone else.[/say]")

		_tentacles.talk("He doesn't believe that. He thinks he is the best.")
		saynn("Whatever, he seems like a lost cause. The girl though.. Maybe she is not so bad? You direct your attention to her.")

		saynn("[say=pc]You. Why are you doing this?[/say]")

		saynn("[say=sci2]Me? Uh.. I don't know..[/say]")

		_tentacles.talk("She knows.. but we can't seem to penetrate further than that.")
		saynn("Really? Is her mind really that strong? Or is it just a complete scrambled mess?")

		saynn("[say=pc]You seem smart. Was it money? Was it.. this guy?[/say]")

		saynn("[say=sci1]Hey, I'm not that evil.[/say]")

		saynn("You roll your eyes.")

		saynn("[say=sci2]Yeah.. both of these played their role..[/say]")

		_tentacles.talk("Right now her motivation is different. We're not sure what it is.")
		saynn("[say=pc]So what is it then? Why are you doing evil things?[/say]")

		saynn("[say=sci2]Maybe I'm just evil..[/say]")

		saynn("You're not sure how to react.")

		saynn("[say=sci2]If I admit that I'm evil.. will you punish me?.. You know..[/say]")

		saynn("The tentacles' are getting more slick by the second.")

		saynn("[say=sci1]Hey! You got what you wanted, you got some answers. Now leave us alone, okay?[/say]")

		saynn("The tentacles are eager to get their revenge.. the only way they know how.")

		saynn("Who do you want to punish?")

		addButton("Guy", "Make the tentacles fuck the guy!", "fuck_guy")
		addButton("Girl", "Make the tentacles fuck the girl!", "fuck_girl")
		addButton("Both", "Make the tentacles fuck the guy first.. and then fuck the girl too..", "fuck_both")
	if(state == "fuck_girl"):
		playAnimation(StageScene.TentaclesBondage, "start", {pc=GM.main.PS.getScientist2CharID(), plant=true, bodyState={naked=true,hard=true}})
		if (!choseBoth):
			saynn("You don't plan on just leaving.. And the wolf sees that.")

			saynn("Seeing that the things aren't looking good for him, he just sets off, dashing towards the exit. His foot almost leaves the lab.. almost.")

			saynn("Suddenly, he stops dead in his tracks. Then he returns and casually sits on one of the chairs.")

			saynn("He is just a spectator now.")

			saynn("The real target of the tentacles was the girl.. Carefully, the tentacles approach her. She is shivering slightly.. but doesn't pull away.")

		else:
			saynn("Now that the wolf is.. stuffed. The tentacles direct their attention towards the girl. Carefully, the tentacles approach her. She is shivering slightly.. but doesn't pull away.")

		saynn("Her body stops.. Her gaze locks onto one of the tentacles.. the one that is swaying in an odd but sensual way. You begin to notice a change in her eyes. A soft, pulsing glow begins to reflect in her irises. That glow.. it begins to swirl too. Fancy.")

		saynn("[say=sci2]I feel.. strange..[/say]")

		saynn("The tentacles drift slightly closer, one of them reaches out to trace the line of her jaw. Her lips part slightly, a soft exhale escaping.")

		_tentacles.talk("Strange how? Tell us.")
		saynn("She blinks slowly. The swirls in her eyes get crazier.")

		saynn("[say=sci2]I wanna obey your every thought..[/say]")

		saynn("Another tentacle glides along her hip, following her curves.")

		_tentacles.talk("Undress.")
		saynn("She nods, her paws reach for her labcoat and begin unbuttoning. She keeps staring at the swaying tentacle near her eyes.. while her hands tug the coat off and let it fall to the floor.")

		saynn("Her top follows soon.. then her skirt.. revealing her black fancy lingerie. But even that doesn't stay for long as she is quick to jump out of her panties and pull up her bra, revealing her cute perky tits and her pink aroused slit. All of the clothing gets neatly folded and set aside.")

		saynn("[say=sci2]Here.. I'm all naked for you..[/say]")

		_tentacles.talk("Tell us, what is your highest desire?")
		saynn("The girl doesn't make them wait.")

		saynn("[say=sci2]Please.. fuck me raw~.[/say]")

		saynn("Her pussy is soaked, her nipples are nice and hard.")

		addButton("Continue", "See what happens next", "fuck_girl_fuck")
	if(state == "fuck_girl_fuck"):
		playAnimation(StageScene.TentaclesCuddle, "sex", {pc=GM.main.PS.getScientist2CharID(), plant=true, bodyState={naked=true,hard=true}})
		saynn("The tentacles lift her.. not roughly.. but smoothly. She still gasps as she is suspended above the floor, her limbs carefully held by the tendrils. A thick, shiny one presses between her thighs.. gently rubbing against her slit.. letting her feel its warmth and a slight pulsing.")

		saynn("[say=sci2]Ah.. yes.. Please shove your tentacles down my every hole~..[/say]")

		saynn("She slowly parts her legs for them, giving full access to her slit. Her hips shift, subtly, moving in rhythm with the tentacle.. grinding against it.")

		saynn("Another one drifts to her mouth. The girl eagerly parts her lips and takes the tip in with a soft moan. She begins to suck it gently.. while a shiver of pleasure travels through the whole green mass.")

		saynn("[say=sci2]Mmm.. mmmh~..[/say]")

		saynn("The other tendril keeps doing slow circles around her clit and light brushes along her folds. She is dripping so much, her juices coating the tentacle with each pass. A second one joins, catching some of those juices and now just pressing at her other entrance.. not pushing.. just teasing.")

		saynn("She moans softly around the tendril in her mouth.. her noise full of a desperate desire.")

		saynn("[say=sci2]Mhh.. mmm-..[/say]")

		saynn("Then, together, they all slide inside.")

		saynn("The girl arches her back, a muffled cry of pleasure escaping her throat. The tentacles stretch and fill her holes.. before proceeding to move together, speeding up when she bucks her hips and slowing down when she shivers too much.")

		saynn("[say=sci2]Mmh.. mm.. hh~..[/say]")

		saynn("One particularly clever tendril snakes up to her clit that was left unattended so soon. It begins flicking and circling it.. which makes her girl arch her back, her eyes rolling back.")

		saynn("A wet, desperate cry escapes around the tendril in her throat as her first orgasm rips through her. She shakes hard.. cumming.. milking the tentacles inside her. They don't stop, they keep their pace, extending her euphoric state further..")

		addButton("Continue", "See what happens next", "girl_fuck_cum")
	if(state == "girl_fuck_cum"):
		playAnimation(StageScene.TentaclesCuddle, "fast", {pc=GM.main.PS.getScientist2CharID(), cum=true, plant=true, bodyState={naked=true,hard=true}})
		saynn("Some of the tendrils begin to look different. Something is moving inside them, creating visible bumps. That bump hits the girl's pussy.. and starts stretching her folds even wider.")

		saynn("[say=sci2]Mmm?.. mmh-..[/say]")

		_tentacles.talk("We.. we think you would be the perfect bearer of our gifts.")
		saynn("Her eyes go wide, her pussy clenching.. but she doesn't pull away.. she welcomes this.")

		saynn("Gradually, the tentacles manage to stretch her pussy entrance enough for that bump to get buried inside her. It was an egg.. and now that egg gets pushed directly into her womb.. and then another soon after.")

		saynn("Despite how strange it probably feels, her glowing eyes are full of raw desire. Each egg stretches her.. fills her.. sends new sparks of pleasure through her overstimulated nerves. Her belly swells gradually, growing round.. as egg after egg is deposited deep inside her. She cums.. again and again.. her pussy is squirting from the feeling of getting stretched.. from the feeling of being the breeder for these tentacles.")

		saynn("The tentacle in her ass does the same, filling her other hole with these eggs..")

		saynn("By the time they're done, she looks pregnant.. and pretty happy about it too.")

		saynn("And then.. the nectar comes.")

		saynn("[say=sci2]Mmmph.. mhh!..[/say]")

		saynn("Every tentacle begins to pulse.. before releasing streams of warm, sweet fluid over her body.. her tits, her face, her swollen belly. The ones inside her pump her full to the brim, filling all of the empty space between the eggs until she is dripping with it.")

		saynn("[say=pc]Wow.[/say]")

		saynn("After that.. the tentacles withdraw slowly, carefully, making sure not to spill too much. They lower her gently to the floor, laying her on her back.")

		saynn("She is covered in fluids.. Her belly is beautifully round. Her holes are open, gaping, still dripping. Her eyes no longer have those glowing swirls dancing in them.. but she is still smiling like a silly cat.")

		saynn("[say=sci2]Hhh.. ah..-h.. mmh~..[/say]")

		saynn("[say=pc]You look good like that. Real good.[/say]")

		addButton("Continue", "See what happens next", "after_all_sex")
	if(state == "fuck_guy"):
		playAnimation(StageScene.TentaclesSex, "tease", {pc=_tentacles.getScientist1CharID(), plant=true, bodyState={naked=true, hard=true}})
		if (choseBoth):
			saynn("Why choose one of them.. when you can have your fun with both? Yes.")

		saynn("You don't plan on just leaving.. And the wolf sees that.")

		saynn("Seeing that the things aren't looking good for him, he just sets off, dashing towards the exit. His foot almost leaves the lab.. almost.")

		saynn("Suddenly, he stops dead in his tracks. Slowly, he turns around.. and then approaches the tentacles by himself.")

		saynn("One of the slick green tips gets closer to his face. They start swaying.. left and right.. a hypnotic little dance. And that seems to have an instant effect.")

		saynn("Wolf's eyes.. start glowing in the dark. Swirls of faint light reflect in them, getting stronger and brighter.")

		if (choseBoth):
			saynn("Looks like the wolf is first. The girl can wait.")

		_tentacles.talk("Do you hate us?")
		saynn("[say=sci1]No.. I want to obey you..[/say]")

		_tentacles.talk("Undress.")
		saynn("His hands move to his labcoat, unbuttoning it with mechanical precisions. It fails to the floor. His shirt and pants come off next, leaving him completely bare, his sheath already twitching, his cock poking out.")

		saynn("[say=sci1]Done.. I.. I want this. I want.. all of it. Please.[/say]")

		saynn("So needy, this guy. A tentacle approaches his lips. He opens his mouth willingly, taking in the slick tip without resistance, sucking on it. As he does that, more tentacles wrap around his limbs.. before pulling him up into the air.")

		_tentacles.talk("We are eager to provide.")
		saynn("Tendrils begin exploring him. One coils between his legs, gently stroking his fully hard cock. Another presses against his tailhole.. gently circling and prodding it, lubricating the anal star with warm, slick juices that make him shiver.")

		saynn("He moans.. like a slut.")

		saynn("[say=sci1]Mmmhh~.. m-mm~..[/say]")

		addButton("Continue", "See what happens next", "guy_fuck_fuck")
	if(state == "guy_fuck_fuck"):
		playAnimation(StageScene.TentaclesSex, "sex", {pc=_tentacles.getScientist1CharID(), plant=true, pcCum=true, bodyState={naked=true, hard=true}})
		saynn("He squirms as the tip of the tentacle starts to bury itself inside his tailhole. Slowly. Deliberately. Stretching him open inch by inch, letting him feel every moment of it. He loves it.. his body submits completely, his fuckhole stretching to accommodate the intruding tip. His hips even push back slightly, wanting more.")

		saynn("[say=sci1]Mmhh..[/say]")

		saynn("The tentacles begin to move inside him, fucking his holes.. The one in his ass finds that special pleasure spot immediately and focuses on it, making his whole body shudder with pleasure, his cock throbbing, leaking onto the floor.")

		saynn("[say=sci1]Mhh.. mhh-h..[/say]")

		saynn("His hips begin to rock, meeting their thrusts. He eagerly deepthroats the other tentacle, his throat making slutty wet noises.")

		saynn("And then he cums.. His inner walls clench around the invading tentacle, his cock throbbing and shooting ropes of seed onto the floor. The tentacles don't stop.. they keep pounding him, drawing out more spasms, adding extra shivers, extending his pleasure until he is whimpering rather than moaning.")

		saynn("Then you notice something.. There is a bump in the form of an orb appearing in the tentacle that's in his butt.. That bump begins to travel slowly towards his stretched hole.")

		saynn("He certainly feels it.. He feels something fat pressing against his ass, trying to stretch it further.")

		saynn("[say=sci1]Mmm-m!..[/say]")

		_tentacles.talk("We wanna reward you..")
		addButton("Continue", "See what happens next", "guy_fuck_cum")
	if(state == "guy_fuck_cum"):
		playAnimation(StageScene.TentaclesSex, "fast", {pc=_tentacles.getScientist1CharID(), plant=true, cum=true, pcCum=true, bodyState={naked=true, hard=true}})
		saynn("You're pretty sure that the tentacles are trying to stuff him with eggs. The first one is being pressed against his back entrance, the tentacles gradually working it in.. until his body accepts it, the egg slipping inside with a wet pop. His belly swells slightly, his cock dribbles more seed.")

		saynn("Another egg follows soon.. Then another..")

		saynn("Each one makes him squirm and moan into the mouth tentacle, his spent cock still twitching.. but now only leaking transparent stuff.. His stomach has swelled visibly.. making him look pregnant.. In a way, he is.")

		saynn("Even after that, the tentacles weren't.. done. You can see them begin to pulse.. all of them.")

		saynn("Then, seconds later, the poor wolf gets showered in some kind of sticky nectar. The tentacles that were inside him begin to pump him full of it, filling the empty space between all of the eggs to the brim.")

		saynn("[say=pc]That's what you get.[/say]")

		saynn("The wolf.. just keeps squirming, little whimpers escape his lips, his mouth open. He got overstimulated.")

		saynn("The tentacles slowly withdraw, making sure not to spill too much juice.. before setting the guy onto the floor.. He is covered in fluids, his belly is swollen, his asshole is gaping.. He stares blankly at the ceiling, his eyes no longer glowing with those hypnotic swirls..")

		saynn("[say=sci1]I.. I..[/say]")

		saynn("[say=pc]I know. You're a breeding stock for tentacles. I see who you are.[/say]")

		if (choseBoth):
			addButton("Continue", "See what happens next", "fuck_girl")
		else:
			addButton("Continue", "See what happens next", "after_all_sex")
	if(state == "after_all_sex"):
		_tentacles.doAnim("idle")
		saynn("All is done. Hopefully the scientists have learned their lesson.")

		saynn("You point at all of the computers and lab equipment around you.. And the tentacles begin destroying it all. This probably won't solve the core issue.. but it made you feel better.")

		saynn("After that.. it's time to leave.")

		addButton("Continue", "See what happens next", "docks")
	if(state == "docks"):
		removeCharacter(GM.main.PS.getScientist2CharID())
		aimCameraAndSetLocName("pstent_scientist_2")
		_tentacles.setMonsterLoc("pstent_scientist_2")
		_tentacles.doAnim("idle")
		saynn("You head back into the docks.. but now with the tentacles.")

		saynn("Looks like there is only one escape pod left.. the one that has gotten stuck.")

		saynn("The tentacles help you by forcibly spreading the doors open.")

		saynn("The pod.. is clearly too small for the tentacles. There is only space for two normal-sized people.")

		saynn("[say=pc]Well.. fuck.[/say]")

		_tentacles.talk("It's okay, we knew about this.")
		saynn("[say=pc]You did? And you didn't tell me? We could have done something.[/say]")

		_tentacles.talk("We will be fine, don't worry about us. Our journey is only now beginning. Thank you, friend. We might not know what love is exactly.. but we still say that we loved being with you.")
		saynn("Suddenly, bolts of plasma start flying past you. The rest of the guards are here.")

		saynn("The tentacles push you into the pod and close it.. before turning around and proceeding to make them drop their guns and undress. You know where this is going.")

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

	if(_action == "fuck_both"):
		choseBoth = true
		setState("fuck_guy")
		return

	if(_action == "girl_fuck_cum"):
		var theChar = getCharacter(_tentacles.getScientist2CharID())
		var theTentacles = getCharacter(_tentacles.getTentaclesCharID())
		var theMenstrualCycle:MenstrualCycle = theChar.getMenstrualCycle()
		for _i in range(7):
			theMenstrualCycle.addTentacleEgg(_tentacles.getTentaclesCharID(), TentacleEggType.Plant, 12*60*60, OrificeType.Vagina)
		for _i in range(5):
			theMenstrualCycle.addTentacleEgg(_tentacles.getTentaclesCharID(), TentacleEggType.Plant, 12*60*60, OrificeType.Anus)
		for _i in range(3):
			theMenstrualCycle.addTentacleEgg(_tentacles.getTentaclesCharID(), TentacleEggType.Plant, 12*60*60, OrificeType.Throat)
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInVaginaBy(_tentacles.getTentaclesCharID())
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInAnusBy(_tentacles.getTentaclesCharID())
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInMouthBy(_tentacles.getTentaclesCharID())
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedOnBy(_tentacles.getTentaclesCharID())

	if(_action == "guy_fuck_cum"):
		var theChar = getCharacter(_tentacles.getScientist1CharID())
		var theTentacles = getCharacter(_tentacles.getTentaclesCharID())
		var theMenstrualCycle:MenstrualCycle = theChar.getMenstrualCycle()
		for _i in range(11):
			theMenstrualCycle.addTentacleEgg(_tentacles.getTentaclesCharID(), TentacleEggType.Plant, 12*60*60, OrificeType.Anus)
		for _i in range(3):
			theMenstrualCycle.addTentacleEgg(_tentacles.getTentaclesCharID(), TentacleEggType.Plant, 12*60*60, OrificeType.Throat)
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInVaginaBy(_tentacles.getTentaclesCharID())
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInAnusBy(_tentacles.getTentaclesCharID())
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedInMouthBy(_tentacles.getTentaclesCharID())
		theTentacles.fillBalls(RNG.randf_range(0.5, 1.0))
		theChar.cummedOnBy(_tentacles.getTentaclesCharID())

	if(_action == "fastforward"):
		processTime(60*42)

	if(_action == "doEndSlavery"):
		endScene()
		GM.main.endCurrentScene()
		GM.main.stopPlayerSlavery()
		GM.pc.setLocation(GM.pc.getCellLocation())
		return

	if(_action == "near_detective"):
		_tentacles.strippedByDetective()

	setState(_action)

func saveData():
	var data = .saveData()

	data["choseBoth"] = choseBoth

	return data

func loadData(data):
	.loadData(data)

	choseBoth = SAVE.loadVar(data, "choseBoth", false)
