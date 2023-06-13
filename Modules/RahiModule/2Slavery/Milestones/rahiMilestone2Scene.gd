extends SceneBase

func _init():
	sceneID = "rahiMilestone2Scene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("As you step into Rahi's cell, you can't help but to catch hints of a.. strange smell? A quite sharp one at that. The feline is sitting on her bed, her paws moving the pillow and doing something to it.")

		saynn("[say=pc]Hey kitty, whatcha doing?[/say]")

		saynn("Your words startle the heck of Rahi, she almost hits the low ceiling that's above her bed. She turns her head towards you and offers you a nervous smile.")

		saynn("[say=rahi]Oh hi, {rahiMaster}.. Nothing, just.. stuff?[/say]")

		saynn("Huh. Kitty is being quite suspicious to say the least, one of her paws constantly resting on her pillow.. protecting.")

		saynn("As you step closer, kitty's ears lower themselves. And the scent.. the sharp scent gets stronger.")

		saynn("How do you wanna ask it?")

		addButton("Kind", "Ask Rahi kindly about what's going on", "ask_kind")
		addButton("Strict", "Demand the answer from Rahi", "ask_strict")
	if(state == "ask_kind"):
		saynn("[say=pc]So what's that smell, kitty?[/say]")

		saynn("Rahi scratches the back of her head with her free paw, her eyes jumping from spot to spot.")

		saynn("[say=rahi]What smell?..[/say]")

		saynn("You sigh.")

		saynn("[say=pc]Open your mouth and breathe at me.[/say]")

		saynn("She keeps her mouth shut and shakes her head instead.")

		saynn("[say=pc]Kitty.. Please. Do it for me.[/say]")

		saynn("The feline tilts her head down and just removes the pillow, uncovering a half-full bottle of whiskey. Her ears get even lower, kitty is clearly expecting a punishment.")

		saynn("[say=pc]What's this? How long have you been drinking it?[/say]")

		saynn("[say=rahi]Since day one..[/say]")

		saynn("Ooh-h. Kitty is looking guilty as heck. But as you reach for the bottle, the feline grabs your hand and stops you.")

		saynn("[say=pc]Kitty. You're not allowed to drink, how do you not understand it? You might die if you do that.[/say]")

		saynn("You slap her paw away and grab the bottle before storing it, taking away hopefully the last of her alcohol. Kitty's whiskers begin to.. shiver. Her eyes.. tearing up.. She looks so sad..")

		addButton("Continue", "See what happens next", "rahi_breakdown")
	if(state == "ask_strict"):
		saynn("[say=pc]Explain the smell now.[/say]")

		saynn("Rahi scratches the back of her head with her free paw, her eyes jumping from spot to spot. She is close to panicking.")

		saynn("[say=rahi]There is no smell, {rahiMaster}..[/say]")

		saynn("You sigh and reach for her ear before pulling on it, causing the kitty to hiss painfully. And while she does that, the scent gets stronger.")

		saynn("[say=pc]If you're not gonna explain, I will just assume the worst, kitty. And you won't like that. Unruly slaves will have very little say in what happens to them.[/say]")

		saynn("She lowers her head.. but keeps silent.")

		saynn("[say=rahi]It's nothing..[/say]")

		saynn("No it's not, you suddenly grab her pillow and take it away, uncovering a.. bottle. A half-finished bottle of whiskey. The feline huffs at you.")

		saynn("[say=pc]What is this? You've been lying to me all this time, cat? How long have you been drinking?[/say]")

		saynn("No response, kitty just tries to distract herself by stroking her tail. But you're not gonna let her do that, your hand slaps Rahi's face before you grab her by the collar and force her to look up at you.")

		saynn("[say=pc]How long. Have you been. Drinking. Slave.[/say]")

		saynn("Kitty gets even quieter for a bit. Her face.. mean.")

		saynn("[say=rahi]Since day one..[/say]")

		saynn("Wow. That almost makes you furious. Rahi tries to stop you but you grab the bottle and put it away, she has no reason to have it, any alcohol binges will kill her. After you do that, kitty's whiskers begin to.. shiver. Her eyes.. tearing up.. She looks so sad..")

		addButton("Continue", "See what happens next", "rahi_breakdown")
	if(state == "rahi_breakdown"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="shove"})
		saynn("But then she suddenly lashes out at you, clawed paws shoving you back and leaving some scratches. Rahi's watery eyes burn with passion. Mean kind of passion.")

		saynn("[say=rahi]Give it back.[/say]")

		saynn("Angry kitty bares fangs and growls at you, her paws threatening to leave more wounds.")

		saynn("[say=rahi]GIVE HER THE BOTTLE.[/say]")

		saynn("[say=pc]That's not what we agreed upon.[/say]")

		saynn("She lashes out at you again. You try to grab her paws but she manages to scratch your cheek, drawing some blood even. And she seems unphased by that.")

		saynn("[say=rahi]SCREW THE AGREEMENT! Just give it to her.. She failed everyone. Her father.. And mother.. Her whole family. She failed that doctor. She failed herself.. And now she has failed you too. WHO THE FUCK CARES ANYMORE?![/say]")

		saynn("She screams at the top of her lungs. Tears stream down her cheeks that she quickly swipes away.")

		saynn("[say=rahi]Or she is just gonna take it herself.[/say]")

		saynn("She lashes out at you again, her claws about to sink into your flesh.")

		addButton("Embrace", "Hug the kitty and let her scratch you", "do_embrace")
		addButton("Grab and spank", "Catch the feline and punish her for this act", "do_spank")
	if(state == "do_embrace"):
		playAnimation(StageScene.Hug, "hug", {npc="rahi"})
		setFlag("RahiModule.rahiMile2Embraced", true)
		saynn("Instead of trying to avoid or attack her back, you meet her with a warm tight hug, wrapping your hands around Rahi. She wasn't too amused by that, her paws leaving countless scratches and cuts on your skin. But you don't stop no matter how much she hurts you.")

		saynn("[say=pc]I care, kitty. I really do.[/say]")

		saynn("[say=rahi]WHY? WHAT'S THE POINT?! SHE IS WORTHLESS.[/say]")

		saynn("Kitty is letting her so much hatred on you, her paws leaving multiple bleeding scratch marks on your back.")

		saynn("[say=pc]I wanna prove that you're not.. Agh.. Just hear me out, kitty.[/say]")

		saynn("After doing so much exhausting violence, kitty finally starts to slow down. More tears begin to slide down her cheeks as you only hug her tighter.")

		saynn("[say=pc]You made mistakes, sure. I wanna help. I wanna know what mistakes made you feel worthless.[/say]")

		saynn("[say=rahi]But why..[/say]")

		saynn("[say=pc]Why? So we can deal with them. You've been trying to avoid your past memories. One bottle of whiskey at a time. I think it's time we change tactics?[/say]")

		saynn("[say=rahi]She's been trying to forget..[/say]")

		saynn("She lowers her paws, claws get retracted.")

		saynn("[say=pc]Using alcohol to cause amnesia? The most sticky memories will stay with you no matter what, kitty. You can't run away from yourself. Because your memories is who you are.[/say]")

		saynn("Kitty lowers her head, crying.")

		saynn("[say=pc]And you know what? I like you, kitty.[/say]")

		saynn("The feline stares at all the cuts and wounds that she caused to you.")

		saynn("[say=rahi]But she brought you so much pain..[/say]")

		saynn("[say=pc]Heh.. Pleasure without pain is worthless. The contrast. The balance. Sharing good and the bad. That's what makes us happy.[/say]")

		saynn("Kitty carefully observes your {pc.masc} chest. She then leans down and begins licking the most nasty cuts. It feels funny and weird, stings like hell too. Her rough tongue is picking up your blood.")

		saynn("[say=pc]I'd really prefer bandages, kitty..[/say]")

		saynn("[say=rahi]Oh.. of course..[/say]")

		saynn("Luckily there were some in that crate full of toys. Kitty quickly starts wrapping them around your chest and arms.")

		addButton("Continue", "See what happens next", "kitty_bandages_explains")
	if(state == "kitty_bandages_explains"):
		playAnimation(StageScene.SexStart, "start", {pc="rahi", npc="pc"})
		saynn("Kitty takes her time, wrapping the bandage around your chest to stop the worst of the bleedings.")

		saynn("About a minute of silence later.")

		saynn("[say=pc]Tell me about your family, kitty.[/say]")

		saynn("[say=rahi]Right now she only has a brother.. Her father and mother.. aren't alive anymore..[/say]")

		saynn("That's unfortunate. You're not even sure how should you word your next question.")

		saynn("[say=pc]Oh. Sorry to hear that. Ow. I'm sure your parents were good people.[/say]")

		saynn("[say=rahi]Sorry. She never knew her mother.. Father talked a lot about her.. How she was like..[/say]")

		saynn("She grabs another bandage and starts treating your arms too.")

		saynn("[say=pc]How come? Sorry if that's too personal, feel free to not say anything, kitty.[/say]")

		saynn("Rahi tilts her head down and sighs.")

		saynn("[say=rahi]She understands.. Her tribe.. before the town.. didn't have the best.. medicine? During her birth.. complications.. Father had to choose..[/say]")

		saynn("[say=pc]That's rough. You should know that it's not your fault.[/say]")

		saynn("She avoids any eye contact and just keeps treating you shoulder. Then she grabs some plasters and starts applying them to all the little cuts that she left around your body.")

		saynn("[say=rahi]Doesn't make it any easier.. Father would choose differently if he knew where his.. kitty.. would end up.[/say]")

		saynn("You put your hand on Rahi's shoulder.")

		saynn("[say=pc]Do you wanna talk about him?[/say]")

		saynn("Rahi finishes treating most of your wounds. She just proceeds to stroke her tail.")

		saynn("[say=rahi]Father was kind.. too kind. He was working.. a lot.. So her and her brother would be able to afford education.. Get off that snowy rock.. Find happiness.. That was his dream..[/say]")

		saynn("[say=pc]Seems like he was a good person.[/say]")

		saynn("Rahi nods.")

		saynn("[say=rahi]At some point the work got too much for him.. To the point of becoming paralyzed.. He refused to get treatment.. Because that would mean eternal debt.. No medicine got replaced with a very expensive AlphaCorp's one.. But he.. he even refused when she brought medications to him.. stolen ones..[/say]")

		saynn("Seems like kitty was doing her best to help her father. Even if that meant doing bad things.")

		saynn("[say=pc]You said that you failed him. Do you wanna talk about that?[/say]")

		saynn("Rahi stays silent for some time.")

		saynn("[say=rahi]No..[/say]")

		saynn("[say=pc]You should understand that we will have to talk about it at some point. You can't keep it inside you forever.[/say]")

		saynn("[say=rahi]She understands. Just.. Some other time.. okay?[/say]")

		saynn("Seems like you gotta ask her some other time. Still, she told you quite a lot. You get up and lean towards kitty to give her a small kiss on the cheek. Ow.. Your wounds just reminded you about their existence. For some reason you don't mind these ones.")

		saynn("[say=pc]Thank you, kitty. Please try to understand that your mother's death is not your fault. That's just life. And life likes playing unfair. No matter how good your intentions are, it will reward you with nothing but pain sometimes.[/say]")

		saynn("Rahi nods subtly and just sighs. You offer her another hug and then step out of her cell. To think about it all.")

		addButton("Continue", "That was something", "endthescene")
	if(state == "do_spank"):
		setFlag("RahiModule.rahiMile2Embraced", false)
		playAnimation(StageScene.Spanking, "fast", {npc="rahi"})
		saynn("You easily dodge Rahi's attack, the alcohol in her bloodstream made her motions slow and predictable. After that, you grab her by the most easily accessible part, her ponytail, and yank down, making the kitty trip and collapse. A loud painful hissing noise escapes her lips.")

		saynn("The sudden uncomfortable sensations seem to snap kitty out of her state of rage. Her eyes.. They are full of fear now.")

		saynn("[say=pc]Is that what you're gonna do? First you lie to me, then you try to attack me? That's not the kitty that I wanna see.[/say]")

		saynn("Time to show her the consequences of her actions, you pull her closer to the bed before sitting on it and dragging her over your lap. Your hand pulls down Rahi's shorts, exposing her round butt.")

		saynn("One of your hands keeps her pinned while the second one swiftly delivers a powerful smack on her ass, forcing a hiss from Rahi. Her fluffy tail quickly tries to protect her rear with itself.")

		saynn("[say=pc]Move. The tail. Away.[/say]")

		saynn("Kitty huffs and refuses to do that. So you smack her ass again with full power. And this time, Rahi's tail absorbed a big part of the impact, causing kitty to jerk to the side and let out a cry. Your hand quickly gets ready to do another smack.")

		saynn("[say=pc]Tail. Now.[/say]")

		saynn("Kitty finally decides to listen and moves the tail out of the way, giving you full access to her butt. So of course you use that opportunity to spank her unruly butt again, making it bounce slightly.")

		addButton("Count them", "Make kitty count the spanks", "make_kitty_count")
	if(state == "make_kitty_count"):
		saynn("[say=pc]Count them.[/say]")

		saynn("[say=rahi]..w-what?..[/say]")

		saynn("You raise your hand and quickly smack her dark buttcheeks again. This time you notice a slight tint appearing on them.")

		saynn("[say=rahi]Ah.. O-one..[/say]")

		saynn("You quickly raise your hand and spank Rahi again. This time even your palm begins to sting from the impact. Tears stream down Rahi's cheeks.")

		saynn("[say=rahi]T-two!.. S-she is..[/say]")

		saynn("You cut her off by smacking her poor butt again, making it more red. Kitty is squirming and panting on your lap, each impact makes her produce a noise of pain.")

		saynn("[say=rahi]T-three.. S-she is sorry-y..[/say]")

		saynn("[say=pc]Are you now?[/say]")

		saynn("You smack her ass again.")

		saynn("[say=rahi]F-four.. Y-yes..[/say]")

		saynn("[say=pc]Sorry for what?[/say]")

		saynn("Another slap sends her bruises butt bouncing. Kitty is wiggling a lot on your lap, her paws really want to rub her rear but she is too afraid to go against your orders.")

		saynn("[say=rahi]F-five.. Sorry for l-lying, {rahiMaster}..[/say]")

		saynn("[say=pc]That's right, slave. How can I trust you serving me if you can't even be honest with me?[/say]")

		saynn("You bring your hand down yet again, delivering another powerful smack on the girl's rear that looks quite red by this point, the feline won't be able to sit for a while.")

		saynn("[say=rahi]S-six!.. S-she is sorry for scratching you..[/say]")

		saynn("[say=pc]Oh yeah. You're allowed to hurt me only when I order you to do so, kitty.[/say]")

		saynn("You do two quick spanks in a row. After the last one, you keep your hand on her butt.")

		saynn("[say=rahi]S-seven.. E-eight.. She is sorry for d-drinking alcohol and disrespecting you..[/say]")

		saynn("[say=pc]Yeah, kitty. Consider these as rules. No lying, no attacking me, no drinking and no disrespecting. I want a well-behaving kitty, not a spoiled brat. That's easy enough for you to understand?[/say]")

		saynn("Rahi tilts her head down. She is still hissing sometimes.")

		saynn("[say=rahi]Yes, {rahiMaster}.. She is very sorry..[/say]")

		saynn("You sigh and begin to carefully rub the feline's red butt. Even that causes your kitty to squirm uncomfortably on your lap.")

		if (getModule("RahiModule").getSkillScore("rahiSkillMasochist") > 5):
			saynn("You do notice that Rahi's pussy is also incredibly wet. Seems like the masochism training is paying off.")

		saynn("[say=pc]I will guide you, train you. I will make the best kitty out of you. You won't have to worry about your past deeds or mistakes. But I need you to obey me. If you don't do that - I will have to apply more and more force. Just like I'm doing now.[/say]")

		saynn("Rahi nods quickly. You brush your digits over her private bits too, just as a hint that this could have been a reward instead of a punishment. The feline seems to understand you quite well though.")

		saynn("[say=rahi]It w-won't happen again..[/say]")

		saynn("[say=pc]I hope so.[/say]")

		saynn("You pull her shorts up and let kitty get off your lap. She stands still before you while her paws rub her butt.")

		saynn("[say=rahi]T-thank you..[/say]")

		saynn("You raise a brow, being somewhat surprised. Her words seem genuine.")

		saynn("[say=rahi]F-for.. for this.[/say]")

		saynn("[say=pc]I'm always happy to show kitty her place.[/say]")

		saynn("She nods.")

		saynn("Well, you think that you handled this situation pretty well.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "rahi_breakdown"):
		processTime(5*60)

	if(_action == "kitty_bandages_explains"):
		processTime(60)

	if(_action == "make_kitty_count"):
		processTime(5*60)

	setState(_action)

func getDevCommentary():
	return "You probably know that its REALLY FRICKING hard to get rid of an addiction. Addictions are poison that corrupt our every thought. You might understand it perfectly fine that Alcohol is bad for you in this condition.. But your head might still try to tell you 'but a little is fine', 'just one sip', 'it tastes so good, one gulp won't change anything'. Your brain is your worst enemy in this situation.\n\nSo.. how do you actually get rid of one? Get a better one x3. Kidding. Kinda. There are a few ways and doing something else less-harmful is one such solution, yes. Or you can somehow convince yourself that the alcohol is gross. Basically you gotta make that activity not-fun. Or focus on another activity that's more fun. Yeah, if you wanna get rid of alcohol addiction - do drugs.. KIDDING\n\nWhy am I writing this here? Basically just to explain that you can't just get rid of an addiction in one moment.. Rahi is gonna be affected by it for a looong time. But having a good company might help ^^"

func hasDevCommentary():
	return true
