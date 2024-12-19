extends SceneBase

func _init():
	sceneID = "MirriRank5Scene"

func _run():
	if(state == ""):
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("Mirri purrs contentedly as her feline eyes remain glued to her laptop screen, staring at some kind of leaderboards.")

		saynn("[say=mirri]I am a rank 5 bitch now! It's official! Do you know what that means?[/say]")

		saynn("[say=pc]You're gonna be even more insufferable?[/say]")

		saynn("[say=mirri]C'mon, I'm not that bad.[/say]")

		saynn("Debatable.")

		saynn("[say=pc]For a crazy slaver girl with some serious case of daddy issues.. sure, you're not that bad.[/say]")

		saynn("Mirri huffs and flicks her tail, her sharp claws tapping idly against the laptop.")

		saynn("[say=mirri]Hey, I didn't ask to be born into this, okay? I'm just trying to do the best with what cards I've been dealt with. And let me tell you, it's been a rigged game since day one.[/say]")

		saynn("She is not wrong. From what you've heard, her upbringing was less than ideal.")

		saynn("[say=pc]Alright. So what does rank 5 mean?[/say]")

		saynn("[say=mirri]It means that rank 6 is next![/say]")

		saynn("She sticks her tongue out, her grin growing wider.")

		saynn("[say=pc]Your math checks out.[/say]")

		saynn("Mirri playfully smacks your shoulder.")

		saynn("[say=mirri]You dummy, the number is not important. Important part is.. there are currently no rank 6 slavers![/say]")

		saynn("Looks like selling all those AlphaCorp slaves is more profitable than you thought..")

		saynn("[say=pc]So you'd be the first?[/say]")

		saynn("[say=mirri]Well, not ever. Rank 6 slavers have existed, but it's like.. impossible to maintain. The requirements are crazy, most people burn out trying.[/say]")

		saynn("Sometimes you forget that you're talking about leaderboards for people traders.")

		saynn("[say=pc]And you feel like you can pull it off?[/say]")

		saynn("[say=mirri]I think WE can pull it off~. You love me, right? Because I totally love you, you silly AlphaCorp slave~.[/say]")

		saynn("Mirri brushes her half-naked hips against you.. a sign of affection.")

		saynn("[say=pc]Uh huh. Sure.[/say]")

		saynn("Mirri pouts dramatically.")

		saynn("[say=mirri]Aw, c'mon, don't break my heart. You don't want to do that. Woman's heart is very fragile, you know?[/say]")

		saynn("[say=pc]Pretty sure you're just manipulating me.[/say]")

		saynn("[say=mirri]Of course not! I'm just.. happy, you know? We're so close, I can almost taste it. One last push.. and I will be the best slaver in the whole galaxy. Dad will finally be proud.[/say]")

		saynn("Before you can respond, Luxe boldly steps into the room. He doesn't need any invitations, his piercing golden gaze settling on the two of you.")

		saynn("[say=pc]Speaking of.[/say]")

		saynn("[say=luxe]Everything is ready.[/say]")

		saynn("Mirri's face lights up as she hops to you and grabs you by the collar.")

		saynn("[say=mirri]Yay! I hope you didn't forget that we're having a family dinner.[/say]")

		saynn("[say=pc]How could I..[/say]")

		addButton("Follow", "Join their family dinner", "arrive_dinner")
	if(state == "arrive_dinner"):
		addCharacter("luxe")
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		aimCameraAndSetLocName("market_luxe")
		saynn("You trail behind Mirri and Luxe as they make their way to his office.")

		saynn("Things have definitely changed. Luxe's desk that once dominated the space has been pushed aside. In its place is a long wooden table, surrounded by Luxe's throne at one end and several modest chairs around. But the real surprise is what's on the table.")

		saynn("Food. Real food.")

		saynn("Your stomach growls at the sight: a juicy-looking roasted chicken.. thick stacks oozing with flavor.. fresh, vibrant salads that look more edible than anything you've seen in ages. You blink in disbelief, already salivating. Maybe being a Syndicate slaver isn't that bad..")

		saynn("[say=mirri]Wow, did you actually cook all this?[/say]")

		saynn("Mirri's tone is skeptical but also intrigued. Luxe shifts slightly, almost looking sheepish, a rare sight.")

		saynn("[say=luxe]I.. uh.. I gave it a shot. Things got a little heated and I did burn a few things.[/say]")

		saynn("Now that your initial hunger isn't clouding your vision, you notice the details.. burn marks on a couple of edges, a slightly bitter aroma hanging in the air. But, honestly, you'd still devour it all..")

		saynn("[say=mirri]Well, I think it's sweet. Thanks for the effort, dad![/say]")

		saynn("Mirri plops into a chair, grabbing a fork with the enthusiasm of someone who hasn't eaten anything decent in weeks. Luxe clears his throat, gesturing for you to sit as well.")

		saynn("[say=luxe]Yeah.. you are welcome. Let's begin before it gets cold.[/say]")

		addButton("Sit", "Begin feasting!", "begin_feast")
	if(state == "begin_feast"):
		playAnimation(StageScene.PawJobUnderTable, "start", {pc="luxe", npc="mirri"})
		saynn("You take a seat.. and waste no time, digging into that juicy-looking food, the aroma already making your head swim. And it all tastes even better than it looks.. just incredible.. marvelous..")

		saynn("[say=mirri]So.. why just us? Why not make it a proper gathering?[/say]")

		saynn("[say=luxe]We wouldn't all fit in a single room, you know that.[/say]")

		saynn("They do seem to be quite.. breeding-happy.. at least they used to be.")

		saynn("[say=luxe]And, well, everyone is busy. Missions and such.[/say]")

		saynn("You only catch their dialogue with a corner of your ear, pretty much your full attention is devoted to these treats of god.. You get horny just from biting into that juicy chicken.")

		saynn("[say=mirri]Oh yeah? I feel like there is something else.[/say]")

		saynn("Luxe's shoulders are stiffening slightly.")

		saynn("[say=luxe]I just.. wanted to spend some time with you. Don't think that's a bad thing.[/say]")

		saynn("[say=mirri]Of course not! You know, I say that I hate you sometimes. But I do like spending time with you. Wish we could do that more.[/say]")

		saynn("[say=luxe]Let's enjoy this current moment then. And see where we will go from there.[/say]")

		saynn("[say=mirri]Yeah, exactly. How are you doing, dad?[/say]")

		saynn("[say=luxe]I'm.. okay.[/say]")

		saynn("[say=mirri]Just okay? C'mon! I'm a curious cat, I'm allowed to pry a little.[/say]")

		saynn("Luxe leans back in his chair, his gaze directed somewhere into the distance.. before settling on Mirri.")

		saynn("[say=luxe]Being a father.. and one of the Syndicate's leaders.. It's a lot for an old man. That's all.[/say]")

		saynn("[say=mirri]You're not that old.[/say]")

		saynn("The more they talk, the more food they will leave for you on the table! This was a perfect plan from the beginning.")

		saynn("[say=luxe]I am pretty old, Mirri. And only getting older. Years weren't kind to me.[/say]")

		saynn("[say=mirri]Nu huh, you look great. I bet you'd find yourself a million new wifes if you wanted to. By the way, why don't you?[/say]")

		saynn("The air in the room shifts slightly, Luxe's expression tightens, his voice lowering.")

		saynn("[say=luxe]I just.. don't want to.[/say]")

		saynn("[say=mirri]Why not?[/say]")

		saynn("[say=luxe]I have no desire to find another woman, Mirri.[/say]")

		saynn("Mirri's eyes study him for a moment.. until she decides to push further.")

		saynn("[say=mirri]But why not?[/say]")

		saynn("[say=luxe]Okay. I got.. burned on it.[/say]")

		saynn("The pun lands poorly, and Luxe visibly cringes at his own words, his eyes closing briefly.")

		saynn("[say=mirri]Aw. Sorry.[/say]")

		saynn("[say=luxe]It's fine. I'd rather not talk about it.[/say]")

		saynn("He had no problems telling you that story.. but.. at the same time.. it's not exactly the best family dinner story.")

		saynn("[say=mirri]Okay. Then how about me? Do you want to ask me something, maybe?[/say]")

		saynn("Luxe hums softly.")

		saynn("[say=luxe]Well.. how are you doing, Mirri?[/say]")

		saynn("Mirri brightens immediately.")

		saynn("[say=mirri]Oh, I'm doing well! This puppy here..[/say]")

		saynn("She gestures at you with a sly grin.. while your mouth is full of tasty as fuck servings.")

		saynn("[say=mirri]..has helped me so much with my mission. I'm really glad that I decided against selling {pc.him}! {pc.He} {pc.isAre} helping with my mood too![/say]")

		saynn("Luxe nods slowly, his gaze flickering to you, then back to Mirri.")

		saynn("[say=luxe]I'm glad. Still.. you're not willing to share those coordinates, are you? Other family members could help with your mission.[/say]")

		saynn("Mirri's smile fades, replaced by a stubborn frown.")

		saynn("[say=mirri]Dad. We've been over this. The answer is no.[/say]")

		saynn("[say=luxe]Just in case.[/say]")

		saynn("[say=mirri]There is no other case. There is only my case, dad.[/say]")

		saynn("[say=luxe]Teamwork is a good thing.[/say]")

		saynn("[say=mirri]Yeah, I know. But I wanna prove myself, you know? Besides, others would just get in the way.. or worse, steal my glory.[/say]")

		saynn("Luxe doesn't respond right away, his piercing gaze lingering on you longer than feels comfortable. Then, as if remembering something, he nods slightly.")

		saynn("[say=mirri]I'm rank 5 slaver now, by the way! Officially![/say]")

		saynn("[say=luxe]That's.. an impressive feat. Good job. Reminds me of my youth.[/say]")

		saynn("Mirri blinks, momentarily stunned.")

		saynn("[say=mirri]Did you just say.. good job? Holy..[/say]")

		saynn("[say=luxe]Mirri..[/say]")

		saynn("[say=mirri]No, no, let me savor this moment. I fucking earned that good job.[/say]")

		saynn("[say=luxe]Mirri.[/say]")

		saynn("[say=mirri]My ba-a-ad. I will shut up..[/say]")

		saynn("They both continue eating their meals, the nagging silence settling in.. until Luxe decides to break it.")

		saynn("[say=luxe]Guess I have to.. prepare a gift for you. I'm afraid that I don't know you enough to pick a good one, Mirri.[/say]")

		saynn("Mirri's ears perk, her eyes shine brightly.")

		saynn("[say=mirri]Oh, really? I think I know something.. I doubt you will approve it though..[/say]")

		saynn("[say=luxe]Hm? Why not, shoot.[/say]")

		saynn("[say=mirri]How about.. a promise? That I will be the next head of Blacktail. You can start training me now, get me ready for the role.[/say]")

		saynn("Luxe leans forward and coughs, Mirri's words catching him off-guard.")

		saynn("[say=luxe]Hh..[/say]")

		saynn("[say=mirri]At rank 6.. I will be the best slaver in the galaxy.. so like.. you know.. I kinda deserve it, right?[/say]")

		saynn("Luxe's expression darkens slightly.")

		saynn("[say=luxe]That's a lot to ask, Mirri. A weak person would crumble under that responsibility.[/say]")

		saynn("[say=mirri]I'm not weak! And.. wasn't that how your father chose you? Because you were the best?[/say]")

		saynn("Luxe raises a brow, his gaze extremely serious and cold.")

		saynn("[say=luxe]How do you know that?[/say]")

		saynn("[say=mirri]Uh.. I have access to.. old records you know? My laptop is all the entertainment that I get..[/say]")

		saynn("Luxe's expression hardens even more.")

		saynn("[say=mirri]Used to get. I had a lot of time to browse through the history of all the slavers. It's very fascinating stuff, you know?[/say]")

		saynn("[say=luxe]You're not ready. And besides, this family doesn't need a new head anytime soon.[/say]")

		saynn("[say=mirri]You said that you're old though! It's your words.[/say]")

		saynn("Wolf's fur bristles slightly, his eyes narrowing.")

		saynn("[say=luxe]My body is.[/say]")

		saynn("Mirri squints, her tone shifting.")

		saynn("[say=mirri]Be honest. Is that because of how I look?[/say]")

		saynn("[say=luxe]Look? What are you talking about?[/say]")

		saynn("[say=mirri]Well, look at me. I'm a weird hybrid. I dress like a slut, look like a slut, sometimes act like a slut.. I don't have a cock, bulging out muscles and my tail isn't even black. That's why I don't fit for that role?[/say]")

		saynn("She is not wrong.")

		saynn("[say=luxe]How you look doesn't have anything to do with it.[/say]")

		saynn("Right.. Even you, a person who is still busy with biting, chewing and swallowing.. see that something fishy is going on here.")

		saynn("[say=mirri]Well what is it then?! Stop being vague with me. I'm not a dumb little girl, I can take it.[/say]")

		saynn("[say=luxe]No, Mirri, don't ruin this dinner.[/say]")

		saynn("Things are getting heated..")

		saynn("[say=mirri]I don't care about this dinner. I'm your daughter and you still refuse to call me so. I'm gonna be the best slaver and you ignored my accomplishments for so long. It hurts, you know..[/say]")

		saynn("[say=luxe]It's not so easy, Mirri.[/say]")

		saynn("Luxe is trying to stay calm and measured, you can see his hands slowly clenching into fists though..")

		saynn("Mirri stands up and leans towards her father, her verbal onslaught only getting more intense.. almost makes you stop eating..")

		saynn("[say=mirri]Mirri.. Mirri.. I fucking hate you, dad. I'm your daughter! I'm done playing games with you. I'm done trying to pretend that this is okay. I'm better than this. You're better than this.[/say]")

		saynn("[say=luxe]Mirri. Sit down. Now. Stop rushing things.[/say]")

		saynn("[say=mirri]I don't even know what real parental love feels like! How normal love feels.. You robbed me of all of that.[/say]")

		saynn("[say=luxe]I'm fucking trying, okay? Stop being so fucking annoying.[/say]")

		saynn("It gets warm in here.. but you still continue to eat as much delicious food as you can before they tear each other's throats.")

		saynn("[say=mirri]Finally, I guess I'm getting to the real Luxe now. I'm just annoying, is that it? I should shut the fuck up, dad?[/say]")

		saynn("[say=luxe]Right now, yes. Shut your mouth and listen. I'm trying to build trust between us and you're already destroying it.[/say]")

		saynn("Luxe's fur lights up, the tips dancing and swaying. But Mirri just keeps going at it..")

		saynn("[say=mirri]Oh, so it's all my fault, is it? Maybe you should recognize your daughter before wanting to build trust with her? Maybe you should stop being so fucking silent and vague all the time. Maybe you should acknowledge my successes rather than dismiss them?[/say]")

		saynn("[say=luxe]I said good job. It will take time, Mirri..[/say]")

		saynn("[say=mirri]A single good job is gonna fix the years of ignoring me, yeah sure. Way to go, dad. Way to fucking go.[/say]")

		addButton("Continue", "See what happens next", "luxe_feels_bad")
	if(state == "luxe_feels_bad"):
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc="luxe"})
		saynn("Luxe growls.. until a painful groan escapes from his lips. His hand shoots to his chest, his body twisting from clear discomfort. Without a word, he pushes himself up and strides towards his desk, his movements stiff and slow. Mirri stands up as well, her eyes follow his figure.")

		saynn("[say=mirri]Dad? Do you need help? I can help.[/say]")

		saynn("Luxe doesn't look back. Crouching by his desk, he unlocks and pulls open a drawer, retrieving a small pill bottle. He twists the cap off with a practiced motion and pops one of the pills dry, his breath hitching before he finally exhales.")

		saynn("[say=luxe]I got it..[/say]")

		saynn("Mirri lowers her gaze, her expression softens, her tail droops low, her ears go flat with her head, her shoulders sag.")

		saynn("[say=mirri]Thanks for dinner, Dad. It was.. really nice. And I mean that, I'm not being sarcastic or anything.[/say]")

		saynn("She sighs.")

		saynn("[say=mirri]Too bad I ruined it. I'm really sorry.[/say]")

		saynn("She sees Luxe's cold silent stare.. and clenches her fists.")

		saynn("[say=mirri]I will reach rank 6 soon and become the best slaver in the whole galaxy. And if that is not enough to show it to you that I'm a worthy Blacktail member, I don't know what will anymore.. I wanna give up..[/say]")

		saynn("And just like that, she runs off, her eyes looking incredibly sad.")

		saynn("The heavy silence that follows is almost unbearable. The room feels hollow.. A lot of the food is left uneaten.. so much waste.. but it looks like you have to choose..")

		addButton("Stay", "Stay with Luxe", "stay_with_luxe")
		addButton("Follow Mirri", "Follow Mirri", "follow_mirri")
	if(state == "stay_with_luxe"):
		removeCharacter("mirri")
		setFlag("SlaveAuctionModule.r5outcome", "luxe")
		GM.pc.setLocation("market_near_luxe")
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		saynn("You decide to stay with Luxe. He looks at the dinner table and sighs.")

		saynn("[say=luxe]I guess I'm not ready yet.[/say]")

		saynn("[say=pc]You have some time yet before she reaches rank 6. You have time to think it all through.[/say]")

		saynn("[say=luxe]Hm.[/say]")

		saynn("Both of you are just letting the dark silence flow through you. It's so quiet here without Mirri.")

		saynn("[say=luxe]I'm not sure it will help though. I don't know what will help.[/say]")

		saynn("[say=pc]You still can't accept her?[/say]")

		saynn("He shakes his head.")

		saynn("[say=pc]Why not?[/say]")

		saynn("His silent gaze says a lot.")

		saynn("[say=pc]Looks like you are battling your inner demons. If you don't like something about Mirri, you can try telling it to her. You can work it through together. I noticed that she is quite.. clingy. Is that the problem?[/say]")

		saynn("Luxe shrugs.")

		saynn("[say=luxe]Maybe.[/say]")

		saynn("[say=pc]It's not actually her looks, is it?[/say]")

		saynn("He throws his head back and closes his eyes.")

		saynn("[say=luxe]I don't know anymore. Maybe there is an obvious truth somewhere in my head.. and I just don't want to accept it.[/say]")

		saynn("[say=pc]Well, until you solve that mindfuck.. I doubt that you will stop fighting. It's either you, Mirri, or your perception of her, that are at fault.[/say]")

		saynn("[say=luxe]It won't be easy, I know that much. But, I guess, Blacktail managed to get through worse times before. Like when the father died.[/say]")

		saynn("You nod subtly.")

		saynn("[say=pc]Best of luck to you.[/say]")

		saynn("[say=luxe]Mhm.[/say]")

		saynn("You leave him with the task of cleaning up.. and just head out.")

		saynn("Things could've gone better.. but they also could've gone a lot worse.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "follow_mirri"):
		setFlag("SlaveAuctionModule.r5outcome", "mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		aimCameraAndSetLocName("market_intro")
		removeCharacter("luxe")
		GM.pc.setLocation("market_intro")
		saynn("Rather than staying with Luxe, you decide to follow Mirri, leaving the wolf alone with his thoughts.")

		saynn("You find the catgirl leaning over her laptop, her paws pressed into her desk. Her feline ears pick up on the noise of your steps.")

		saynn("[say=mirri]Didn't go so well, did it?[/say]")

		saynn("[say=pc]I mean.. you didn't have to be so.. demanding?[/say]")

		saynn("She lowers her gaze and shrugs.")

		saynn("[say=mirri]Well.. sorry.. I'm just very tired. I know.. it's very pathetic of me.. But I just want my dad to see me as a good girl for once..[/say]")

		saynn("[say=pc]Forcing him to say it doesn't seem like a good idea. It must come from his heart.[/say]")

		saynn("[say=mirri]What are my choices then.. Be the best? That's exactly what I'm trying to do already.[/say]")

		saynn("She is not wrong. Maybe her dad just doesn't have a heart.")

		saynn("[say=mirri]I feel like I know what's happening.. but something in me doesn't want to accept it..[/say]")

		saynn("Mirri pushes herself off of the desk and turns towards you.")

		saynn("[say=mirri]What is worse, a never-ending pain.. or a painful end?[/say]")

		addButton("Never-ending pain", "Suffering forever is obviously worse", "mirri_neverendpain")
		addButton("Painful end", "A painful end is obviously worse", "mirri_painfulend")
		addButton("Both", "They're both equally bad", "mirri_bothbad")
	if(state == "mirri_neverendpain"):
		saynn("[say=pc]Never-ending pain is obviously worse. You'd just rather die by that point.[/say]")

		saynn("Mirri hums, her stare looking somewhere past you.")

		saynn("[say=mirri]Maybe you're right, silly AlphaCorp slave..[/say]")

		saynn("Her tail and ears droop.")

		saynn("[say=mirri]But I still have hope that he will accept me.. I guess this last rank will be what decides it.[/say]")

		saynn("All or nothing, huh.")

		saynn("[say=pc]Not that much depends on you anymore.[/say]")

		saynn("[say=mirri]Yeah. I did my best.[/say]")

		saynn("She might have overdid her best by accident, wrapping around back to worst.")

		addButton("Continue", "See what happens next", "mirri_lastbit")
	if(state == "mirri_painfulend"):
		saynn("[say=pc]A painful end is worse. Any kind of end is worse.[/say]")

		saynn("[say=mirri]So you'd rather suffer forever?[/say]")

		saynn("You shrug.")

		saynn("[say=pc]I guess.[/say]")

		saynn("Mirri hums and stays silent for some time, her eyes looking past you somewhere.")

		saynn("[say=mirri]I thought so too. I thought I could get used to it.[/say]")

		saynn("She closes her eyes and sighs.")

		saynn("[say=mirri]Your opinion is valid though, silly AlphaCorp slave.[/say]")

		addButton("Continue", "See what happens next", "mirri_lastbit")
	if(state == "mirri_bothbad"):
		saynn("[say=pc]They're both bad. Best you can do is not get yourself into a situation where you have to choose between the two.[/say]")

		saynn("Mirri throws her head back and giggles.. her giggle slowly turning hysterical.")

		saynn("[say=mirri]You are cute, silly AlphaCorp slave.. I wish it would be so easy. But it's hard to control something that you can't control.[/say]")

		saynn("She is not wrong on that one.")

		saynn("[say=mirri]I'm a slaver.. but sometimes I feel like I'm a slave too..[/say]")

		saynn("Probably not a good feeling.")

		addButton("Continue", "See what happens next", "mirri_lastbit")
	if(state == "mirri_lastbit"):
		saynn("[say=mirri]You know.. I overheard the whole story about how I was.. conceived.[/say]")

		saynn("You raise a brow.")

		saynn("[say=pc]Really? How?[/say]")

		saynn("[say=mirri]I'm not just a slaver.. I'm also a spy, you know.[/say]")

		saynn("Her and her fancy gadgets.")

		saynn("[say=pc]You don't sound sad over it.[/say]")

		saynn("[say=mirri]Why would I be sad? It made me kinda happy. I already had suspicions that my mother was a slave. I was looking for her in the old records. Couldn't find her.. maybe Luxe's laptop has more access.[/say]")

		saynn("You don't remember Luxe saying that Mirri's mother is dead.. so she must still be alive.")

		saynn("[say=pc]You want to find your mother?[/say]")

		saynn("[say=mirri]Why not? But that's not why I'm happy. I'm happy.. because I'm Blacktail![/say]")

		saynn("Your concern turns into confusion.")

		saynn("[say=pc]Uhh. Didn't you already know that?[/say]")

		saynn("[say=mirri]Dad would never tell me if I was some random fucking kid that he decided to pick up and raise. But his words confirm it, I'm actually Blacktail, through and through.[/say]")

		saynn("That's one of her anxieties removed.")

		saynn("[say=pc]I guess you are.[/say]")

		saynn("[say=mirri]And now, I'm gonna show him that I'm the best of Blacktail.. I will need your help though.. I can't do it without you anymore.. Will you help me?[/say]")

		saynn("[say=pc]Hah. We went through so much, it would be a huge waste to stop now.[/say]")

		saynn("[say=mirri]You're right~. Thank you.[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Mirri walks up to you and purrs quietly into your ear.")

			saynn("[say=mirri]It would be a waste not to drain your balls in my mouth too.. you know..[/say]")

			saynn("That's very bold of her. One problem though.")

			saynn("[say=pc]I'm kinda.. you know.. caged.[/say]")

			saynn("She chuckles softly and licks your ear.")

			saynn("[say=mirri]That's okay.. I'm half-feline, you know..[/say]")

			saynn("You're not sure what she means by that.")

			saynn("[say=mirri]I will only ask for a similar favor back..[/say]")

			addButton("69", "Agree to some licking and sucking fun", "69_agree")
			addButton("Deny", "You'd rather not", "deny_69")
		elif (GM.pc.hasReachablePenis()):
			saynn("Mirri walks up to you and purrs quietly into your ear.")

			saynn("[say=mirri]It would be a waste not to drain your balls in my mouth too.. you know..[/say]")

			saynn("That's very bold of her. She lets her long feline tongue roll out.. the sight makes your heart pump the blood into your certain parts harder..")

			saynn("[say=mirri]I will only ask for a similar favor back..[/say]")

			saynn("Looks like someone is horny.")

			addButton("69", "Agree to some licking and sucking fun", "69_agree")
			addButton("Deny", "You'd rather not", "deny_69")
		elif (GM.pc.hasReachableVagina()):
			saynn("Mirri walks up to you and purrs quietly into your ear.")

			saynn("[say=mirri]It would be a waste not to let me lick your cute pussy.. you know..[/say]")

			saynn("That's very bold of her. She lets her long feline tongue roll out, making you feel warmth spreading throughout your body already..")

			saynn("[say=mirri]I will only ask for a similar favor back..[/say]")

			saynn("Looks like someone is horny.")

			addButton("69", "Agree to some licking and sucking fun", "69_agree")
			addButton("Deny", "You'd rather not", "deny_69")
		else:
			saynn("She nods and returns back to her laptop.")

			saynn("[say=mirri]Guess we both should catch and sell some slaves now.[/say]")

			addButton("Continue", "See what happens next", "endthescene")
	if(state == "deny_69"):
		saynn("[say=pc]I'm not in the mood.[/say]")

		saynn("[say=mirri]Aw.. I won't force you. You're not my slave after all~.[/say]")

		saynn("She nods and returns back to her laptop.")

		saynn("[say=mirri]Guess we both should catch and sell some slaves now.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "69_agree"):
		playAnimation(StageScene.Sex69, "tease", {pc="pc", npc="mirri", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("You nod.. and before you know.. Mirri grabs you by the collar and yanks you onto her bed, her movements quick and snappy, fitting for a good slaver.")

		saynn("Mirri positions herself above you, her feline tail swaying as she straddles your face, her stripped panties taking up your whole view. She pulls them aside, revealing her wet needy flower. Seeing it from so close makes your mouth water already..")

		if (GM.pc.isWearingChastityCage()):
			saynn("She leans forward, her soft paws find your chastity cage and wrap around it. Her clawed digits trace it lightly, sending shivers through you.. before her lips press a teasing kiss against the tip. The warmth of her mouth sends a jolt of pleasure through your body.. even with the cage in the way.")

		elif (GM.pc.hasReachablePenis()):
			saynn("She leans forward, her soft paws wrapping around your length.. before her long feline tongue flicks out, teasing the tip.")

		else:
			saynn("She leans forward, her soft paws spreading your legs more.. before her long feline tongue flicks out, teasing your {pc.pussyStretch} slit.")

		saynn("The moment your tongue meets her little cute clit, she lets out a low, satisfied purr that vibrates through her entire body.")

		saynn("[say=mirri]Good {pc.boy}.. keep going..[/say]")

		addButton("Continue", "See what happens next", "69_sex")
	if(state == "69_sex"):
		if (GM.pc.hasReachablePenis()):
			playAnimation(StageScene.Sex69, "FM", {pc="pc", npc="mirri", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		else:
			playAnimation(StageScene.Sex69, "FF", {pc="pc", npc="mirri", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		if (GM.pc.isWearingChastityCage()):
			saynn("Her praise is followed by taking your cage into her mouth, her lips wrapping around the metal. Even though the cage is in the way, her sharp feline tongue manages to slip under it and tease your poor locked drippy member.. the vibrations of her purring are making you squirm hard.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Her praise is followed by taking you deeper into her mouth, her lips sliding down your shaft with practiced ease. Her purring intensifies, sending delicious vibrations through you and making your cock ooze pre. She really knows how to work her magic..")

		else:
			saynn("Her praise is followed by slipping her tongue down your wet sex with practiced ease, its full length allows her to easily hit your hidden button. Her purring intensifies, sending delicious vibrations through you and making you squirm hard. She really knows how to work her magic..")

		saynn("You focus on her in turn, your hands gripping her hips to pull her closer as your tongue delves into her folds, spreading and licking them. Her taste is nothing short of intoxicating.. every flick of your tongue earns you a breathless moan or a twitch of her tail.")

		saynn("The room is filled with the wet, lewd sounds of both of your efforts, both of you strive to push the other closer to the edge.. almost like it's a race. Occasionally, she"+str(" releases your cock" if GM.pc.hasPenis() else " pulls away")+" just enough to gasp out some teasing remarks.")

		saynn("[say=mirri]That's all you've got, puppy? You're gonna have to try harder than that if you wanna keep up with me.[/say]")

		saynn("Her words only make you increase your onslaught. Mirri's moans quickly grow louder as you find the perfect spot, your tongue circling and stroking her sensitive clit with precision. She gasps, her hips grinding against your face as she loses herself in the sensation.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Her pace on you quickens, her hands gripping your thighs for leverage as she keeps flicking her tongue under your cage and teasing your cock as best as she can, occasionally switching to your balls and giving them some nuzzles and little licks too. That and her weaponized purring are overwhelming.. both of you are already getting close..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Her pace on you quickens, her hands gripping your thighs for leverage as she takes you as deep as she can, her tight throat enveloping your whole length as her nose lands onto your balls. The tightness of her throat walls combined with that weaponized purring is overwhelming.. both of you are already getting close..")

		else:
			saynn("Her pace on you quickens, her tongue lapping you up from the inside, swallowing any wetness while her lips play with your little bean. She is tongue-fucking your little need kitty and it feels amazing, how deep she reaches.. The skill of her tongue combined with that weaponized purring is overwhelming.. both of you are already getting close..")

		addButton("Continue", "See what happens next", "69_cum")
	if(state == "69_cum"):
		playAnimation(StageScene.Sex69, "tease", {pc="pc", npc="mirri", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		if (GM.pc.isWearingChastityCage()):
			saynn("And soon, Mirri lets out a muffled cry, her whole body shuddering as she reaches her climax. Her tongue pushes you over the edge as well, your {pc.penis} throbbing in her mouth while shooting weak ropes of {pc.cum}, one after another. She eagerly swallows every drop while you are busy swallowing her juices, the overstimulation made her pussy squirt all over your face..")

			saynn("After both of your orgasms are over, Mirri pulls her mouth off of your cage and purrs contentedly while licking her lips.")

			saynn("[say=mirri]Not bad for a soft {pc.boy}.[/say]")

			saynn("She nuzzles your chastity and licks the last bits of your seed off before getting off.")

		elif (GM.pc.hasReachablePenis()):
			saynn("And soon, Mirri lets out a muffled cry, her whole body shuddering as she reaches her climax. Her tight throat pushes you over the edge as well, your {pc.penis} throbbing in her mouth while shooting thick ropes of {pc.cum}, one after another. She eagerly swallows every drop while you are busy swallowing her juices, the overstimulation made her pussy squirt all over your face..")

			saynn("After both of your orgasms are over, Mirri pulls her mouth off of your cock and purrs contentedly while licking her lips.")

			saynn("[say=mirri]Not bad for a soft {pc.boy}.[/say]")

			saynn("She nuzzles your cock and licks the last bits of your seed off before getting off.")

		else:
			saynn("And soon, Mirri lets out a muffled cry, her whole body shuddering as she reaches her climax. Her rough tongue pushes you over the edge as well, your pussy pulsing all around her, your overstimulated g-spot makes you release a fountain of juices.. She eagerly swallows every drop while you are busy doing the same, your own tongue is making her sex gush all over your face..")

			saynn("After both of your orgasms are over, Mirri pulls away and purrs contentedly while licking her lips.")

			saynn("[say=mirri]Not bad for a soft {pc.boy}.[/say]")

			saynn("She nuzzles your crotch and licks the clit a few teasing times before getting off.")

		saynn("[say=mirri]Aw, my bed is wet now.[/say]")

		saynn("That's not your problem, is it?")

		saynn("[say=mirri]Catch me some more slaves or I will have to repurpose you as my pussy licker~.[/say]")

		saynn("Not the worst fate.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "arrive_dinner"):
		processTime(5*60)

	if(_action == "begin_feast"):
		processTime(10*60)
		GM.pc.addPain(-500)
		GM.pc.addStamina(500)
		GM.pc.addLust(10)

	if(_action == "luxe_feels_bad"):
		processTime(20*60)

	if(_action == "stay_with_luxe"):
		getModule("SlaveAuctionModule").addLuxeAffection(0.5)

	if(_action == "follow_mirri"):
		getModule("SlaveAuctionModule").addMirriAffection(0.3)

	if(_action == "69_sex"):
		processTime(5*60)

	if(_action == "69_cum"):
		processTime(3*60)
		if(GM.pc.hasPenis()):
			getCharacter("mirri").cummedInMouthBy("pc")
		else:
			getCharacter("mirri").cummedInMouthBy("pc", FluidSource.Vagina, 0.8)
			getCharacter("mirri").cummedOnBy("pc", FluidSource.Vagina, 0.2)
		GM.pc.cummedInMouthBy("mirri", FluidSource.Vagina, 0.8)
		GM.pc.cummedOnBy("mirri", FluidSource.Vagina, 0.2)
		GM.pc.orgasmFrom("mirri")

	setState(_action)
