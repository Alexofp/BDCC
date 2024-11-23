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

		saynn("[say=mirri]Well, not ever. Rank 6 slavers exist, but it's like.. impossible to maintain. The requirements are crazy, most people burn out trying.[/say]")

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
		saynn("You follow Mirri and Luxe back into his office.")

		saynn("Things have changed, for sure. The desk was pushed out of the way. In its place.. a long wooden table surrounded by Luxe's throne and a few chairs. On a table.. some actual food.. wow. Is that chicken? Meat stakes? Even the salads look so tasty after whatever you got used to eating. You can't stop yourself from drooling already.")

		saynn("[say=mirri]Wow, did you cook all of that?[/say]")

		saynn("[say=luxe]I.. uh.. I tried. Got a little heated and burned a few things.[/say]")

		saynn("Now that the hunger stops clouding your vision.. you do notice quite a few burn marks.. but man.. you'd eat it all anyway.")

		saynn("[say=mirri]I appreciate the efforts, dad![/say]")

		saynn("[say=luxe]Yeah.. you are welcome. Let's not let it all get cold and begin.[/say]")

		addButton("Sit", "Begin feasting!", "begin_feast")
	if(state == "begin_feast"):
		saynn("[say=mirri]Why did you only invite us, dad?[/say]")

		saynn("[say=luxe]Well, everyone is busy. Missions and such.[/say]")

		saynn("[say=mirri]Oh yeah? I feel like there is something else.[/say]")

		saynn("[say=luxe]I just.. wanted to spend some time with you. Is that bad?[/say]")

		saynn("[say=mirri]Of course not! You know, I say that I hate you sometimes. But I do like spending time with you. Wish we could do that more.[/say]")

		saynn("[say=luxe]Let's enjoy this current moment then.[/say]")

		saynn("[say=mirri]Yeah, exactly. How are you doing, dad?[/say]")

		saynn("[say=luxe]I'm.. okay.[/say]")

		saynn("[say=mirri]Just okay? C'mon![/say]")

		saynn("[say=luxe]Being a father is a lot of work. I have to be a father and a Syndicate leader. I'm okay, Mirri. You don't want to hear the ramblings of an old man.[/say]")

		saynn("[say=mirri]You're not that old.[/say]")

		saynn("[say=luxe]I am pretty old, Mirri.[/say]")

		saynn("[say=mirri]Nu huh, you look great. I bet you'd find yourself a million new wifes if you wanted to. Why don't you?[/say]")

		saynn("[say=luxe]I just.. don't want to.[/say]")

		saynn("[say=mirri]Why not?[/say]")

		saynn("[say=luxe]I have no desire to find another woman, Mirri.[/say]")

		saynn("[say=mirri]But why not?[/say]")

		saynn("[say=luxe]I guess I got.. burned on it.[/say]")

		saynn("He realizes the awful pun that came out of his mouth way too late and just cringes, his eyes closed.")

		saynn("[say=mirri]Aw. Sorry.[/say]")

		saynn("[say=luxe]Yeah. I'd rather not talk about it.[/say]")

		saynn("He had no problems telling you that story.. but.. at the same time.. it's not exactly the best family dinner story.")

		saynn("[say=mirri]Do you want to ask me something, maybe?[/say]")

		saynn("[say=luxe]Well.. how are you doing, Mirri?[/say]")

		saynn("[say=mirri]Oh, I'm doing well! This puppy here has helped me so much with my mission. I'm really glad that I decided against selling {pc.him}! {pc.He} {pc.isAre} helping with my mood too![/say]")

		saynn("[say=luxe]I'm glad. Guess.. you still don't want to share the coords? Other Blacktail family members can help you.[/say]")

		saynn("[say=mirri]Are you really still asking that? No.[/say]")

		saynn("[say=luxe]Just in case.[/say]")

		saynn("[say=mirri]There is no other case. There is only my case, dad.[/say]")

		saynn("[say=luxe]Teamwork is a good thing.[/say]")

		saynn("[say=mirri]Yeah, I know. But I wanna prove myself, you know? Others would just get in the way and steal the glory.[/say]")

		saynn("Luxe stares at you, his silent gaze lingering on your features for way too long.")

		saynn("[say=mirri]I'm rank 5 slaver now, by the way![/say]")

		saynn("[say=luxe]That's.. an impressive feat. Good job. Reminds me of my youth.[/say]")

		saynn("[say=mirri]Good job? Did you just say good job? Holy..[/say]")

		saynn("[say=luxe]Mirri..[/say]")

		saynn("[say=mirri]Mirri? Am I just Mirri to you?[/say]")

		saynn("[say=luxe]Mirri.[/say]")

		saynn("[say=mirri]My ba-a-ad. Syndicate wasn't built in a day.[/say]")

		saynn("[say=luxe]Guess I have to.. prepare a gift for you. I'm afraid that I don't know you enough to pick a good one, Mirri.[/say]")

		saynn("[say=mirri]Ohh.. I think I know something.. I doubt you will approve it though..[/say]")

		saynn("[say=luxe]Hm? Why not, shoot.[/say]")

		saynn("[say=mirri]How about.. a promise that I will be the next head of Blacktail! You can start training me already about how I should handle things..[/say]")

		saynn("[say=luxe]Hh..[/say]")

		saynn("[say=mirri]At rank 6.. I will be the best slaver in the galaxy.. so like.. you know.. I kinda deserve it, right?[/say]")

		saynn("[say=luxe]I don't know, Mirri. It's a lot. A weak person would just crumble under the amount of responsibility and hard decisions.[/say]")

		saynn("[say=mirri]I'm not weak! And.. wasn't that how your father chose you? Because you were the best?[/say]")

		saynn("[say=luxe]How do you know that?[/say]")

		saynn("[say=mirri]Uh.. I have access to.. old records you know? My laptop is all the entertainment that I get..[/say]")

		saynn("[say=mirri]Used to get. I had a lot of time to browse through the history of all the slavers. It's very fascinating stuff, you know?[/say]")

		saynn("[say=luxe]Mirri, I told you, it's too much for someone like you. And besides, this family doesn't need a new head and won't need it for a while.[/say]")

		saynn("[say=mirri]You said that you're old though! It's your words.[/say]")

		saynn("[say=luxe]My body is.[/say]")

		saynn("[say=mirri]Be honest. Is that because of how I look?[/say]")

		saynn("[say=luxe]Look? What are you talking about?[/say]")

		saynn("[say=mirri]Well, look at me. I'm a weird hybrid. I dress like a slut, look like a slut, sometimes act like a slut.. I don't have a cock, bulging out muscles and my tail isn't even black. That's why I don't fit for that role?[/say]")

		saynn("[say=luxe]How you look doesn't have anything to do with it.[/say]")

		saynn("[say=mirri]Well what is it then?! Tell me already, stop being vague with me. I'm not a dumb little girl, I can take it.[/say]")

		saynn("[say=luxe]No, Mirri, don't ruin this dinner.[/say]")

		saynn("[say=mirri]I don't care about this dinner. I need you to recognize me, dad. I need you to accept me, please. I'm yours. I'm your daughter. Can you give me that at least?[/say]")

		saynn("[say=luxe]It's not so easy, Mirri.[/say]")

		saynn("[say=mirri]Mirri.. Mirri.. I fucking hate you, dad. I'm your daughter! I'm done playing games with you. I'm done trying to pretend that this is okay. I'm better than this. You're better than this.[/say]")

		saynn("[say=luxe]Mirri. Sit down. Now. Stop rushing things.[/say]")

		saynn("[say=mirri]I don't even know what real parental love feels like! How normal love feels.. You robbed me of all of that.[/say]")

		saynn("[say=luxe]I'm fucking trying, okay? Stop being so fucking annoying.[/say]")

		saynn("[say=mirri]Finally, I guess I'm getting to the real Luxe now. I'm just annoying, is that it? I should shut the fuck up, dad?[/say]")

		saynn("[say=luxe]Right now, yes. Shut your mouth and listen. I'm trying to build trust between us and you're already destroying it.[/say]")

		saynn("[say=mirri]Oh, so it's all my fault, is it? Maybe you should recognize your daughter before wanting to build trust with her? Maybe you should stop being so fucking silent and vague all the time. Maybe you should acknowledge my successes rather than dismiss them?[/say]")

		saynn("[say=luxe]I said good job. It will take time, Mirri..[/say]")

		saynn("[say=mirri]A single good job is gonna to fix the years of ignoring me, yeah sure. Way to go, dad. Way to fucking go.[/say]")

		saynn("[say=mirri]Do you need help with that, dad?[/say]")

		saynn("[say=luxe]I got it..[/say]")

		saynn("[say=mirri]Thank you, dad. It was a great dinner, I'm not even fucking being sarcastic. Too bad I fucking ruined everything again, I guess. Always my fault.[/say]")

		saynn("[say=mirri]I will reach rank 6 soon and become the best slaver in the whole galaxy. And if that is not enough to show it to you that I'm a worthy Blacktail member, I don't know what will anymore. GRRrrh..[/say]")

		addButton("Stay", "Stay with Luxe", "stay_with_luxe")
		addButton("Follow Mirri", "Follow Mirri", "follow_mirri")
	if(state == "stay_with_luxe"):
		saynn("[say=luxe]I guess I'm not ready yet.[/say]")

		saynn("[say=pc]You have some time yet before she reaches rank 6. Time to think it all through.[/say]")

		saynn("[say=luxe]Mhm.[/say]")

	if(state == "follow_mirri"):
		saynn("[say=mirri]You know.. I overheard the whole story about how I was.. conceived.[/say]")

		saynn("[say=pc]Really? How?[/say]")

		saynn("[say=mirri]I'm not just a slaver.. I'm also a spy, you know.[/say]")

		saynn("[say=pc]You don't sound sad over it.[/say]")

		saynn("[say=mirri]Why would I be sad? It made me kinda happy. I already had suspicions that my mother was a slave. I was looking for her in the old records. Couldn't find her.. maybe Luxe's laptop has more access.[/say]")

		saynn("[say=pc]You want to find your mother?[/say]")

		saynn("[say=mirri]Why not? But that's not why I'm happy. I'm happy.. because I'm Blacktail![/say]")

		saynn("[say=pc]Uhh. Didn't you already know that?[/say]")

		saynn("[say=mirri]Dad would never tell me if I was some random fucking kid that he decided to pick up and raise. But his words confirm it, I'm actually Blacktail, through and through![/say]")

		saynn("That's one of her anxieties removed.")

		saynn("[say=pc]I guess you are.[/say]")

		saynn("[say=mirri]And now, I'm gonna show him that I'm the best of Blacktail.. I will need your help though.. I can't do it without you anymore.. Will you help me?[/say]")

		saynn("[say=pc]Hah. We went through so much, it would be a huge waste to stop now.[/say]")

		saynn("[say=mirri]You're right~. Thank you.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "arrive_dinner"):
		processTime(5*60)

	setState(_action)
