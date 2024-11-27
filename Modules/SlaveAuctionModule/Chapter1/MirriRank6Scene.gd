extends SceneBase

func _init():
	sceneID = "MirriRank6Scene"

func _run():
	if(state == ""):
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("Time has come. Mirri is staring at her laptop, her name proudly displayed at the top of the list.")

		saynn("The catgirl just stares at it.. at the pixels that spell out Mirri Blacktail.")

		saynn("[say=mirri]I am now the best..[/say]")

		saynn("She doesn't sound entirely happy about it.")

		saynn("[say=mirri]Huh.. that's pretty cool. Look.. so many Blacktails in the list.. and I am above all of them..[/say]")

		saynn("[say=pc]How do you feel about it?[/say]")

		saynn("She shrugs, her tail wagging behind her at a slow rate.")

		saynn("[say=mirri]I don't know.. Depends on what father thinks about it.[/say]")

		saynn("[say=pc]I suggest you don't have high expectations.[/say]")

		saynn("Her feline eyes squint while gazing at you.")

		saynn("[say=mirri]Why not?[/say]")

		saynn("[say=pc]Then you won't be disappointed.[/say]")

		saynn("Mirri lowers her chin and stays quiet.")

		saynn("[say=mirri]It can't get worse than this. Surely.[/say]")

		saynn("She shrugs it off and grabs her laptop.. a proof of her legitimacy.. before heading towards the corridor.")

		saynn("[say=pc]I'm sure it can.[/say]")

		saynn("[say=mirri]I didn't ask your fucking opinion.[/say]")

		saynn("She is still very much a bitch huh.")

		saynn("You get a feeling that a storm is brewing..")

		addButton("Follow", "See what happens next", "in_office")
	if(state == "in_office"):
		aimCameraAndSetLocName("market_luxe")
		addCharacter("luxe")
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc="luxe", npcAction="sit"})
		saynn("Mirri walks into Luxe's office uninvited, proudly putting some sway of her hips into every step.")

		saynn("[say=mirri]Hi dad.[/say]")

		saynn("You step inside as well and find yourself a quiet corner to take up. These two don't mix together well, you learned that much.")

		saynn("Luxe was in the process of reading some documents. He takes his time, finishing the page, before putting it aside and looking at his daughter.")

		saynn("[say=luxe]Mirri.[/say]")

		saynn("His tone is cold, neutral.. just like his expression. Mirri's lips twitch.")

		saynn("[say=mirri]Have you.. seen it yet?[/say]")

		saynn("[say=luxe]Seen what?[/say]")

		saynn("[say=mirri]You can't be serious..[/say]")

		saynn("[say=luxe]I very much am, I can't read your mind.[/say]")

		saynn("Mirri opens her laptop and shows the leaderboards to Luxe.")

		saynn("[say=mirri]Read this then.[/say]")

		saynn("The wolf skims through the list and nods subtly.")

		saynn("[say=luxe]Most impressive, Mirri. Your training paid off.[/say]")

		saynn("Mirri nods and just stares at Luxe, waiting for his next words. Luxe stares back.")

		saynn("Seconds begin to run.. with no words exchanged. Mirri is stubborn, waiting for Luxe to say what she wants to hear.. And Luxe is just calm, his eyes barely show any emotion.")

		saynn("Finally, Mirri breaks.")

		saynn("[say=mirri]So.[/say]")

		saynn("[say=luxe]So?[/say]")

		saynn("She rolls her eyes.")

		saynn("[say=mirri]Make me your apprentice. I earned it. And I am Blacktail.[/say]")

		saynn("Luxe tilts his head slightly, his slightly opened jaw shifts left and right, his sharp teeth gently brushing against each other.")

		saynn("[say=luxe]So this is what it's about?[/say]")

		saynn("[say=mirri]Yeah? I obviously can't get you to accept me as your daughter. So, at least make me your apprentice. All the conditions are met, I should be allowed to become the next family head.[/say]")

		saynn("Luxe hears Mirri out.. and then sighs.")

		saynn("[say=luxe]There are no such conditions, Mirri. You imagined them.[/say]")

		saynn("Mirri furrows her brows.")

		saynn("[say=luxe]And besides.. You didn't exactly do it alone, did you?[/say]")

		saynn("[say=mirri]Pff.. Now you're just looking for excuses.[/say]")

		addButton("Continue", "See what happens next", "luxe_stands")
	if(state == "luxe_stands"):
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc="luxe", npcAction="stand"})
		saynn("Luxe gets up from his throne and leaves his desk, getting close to Mirri, his cold stare directed at you.")

		saynn("[say=luxe]Am I? As much I see, {pc.he} deserves to be number one in that list as much as you do. If not more.[/say]")

		saynn("Mirri looks back at you and frowns more.")

		saynn("[say=mirri]{pc.He} {pc.isAre} just my helper puppy, okay? I could have sold {pc.him} easily. But now {pc.he} works for me, it's only fair.[/say]")

		saynn("[say=luxe]Wonder how {pc.he} {pc.verb('feel')} about it.[/say]")

		saynn("[say=mirri]You are just trying to muddle up the water.[/say]")

		saynn("[say=luxe]I feel like I'm making it nice and clear. You are not gonna be my apprentice. And you are not gonna be the head of this family.[/say]")

		saynn("Mirri clenches her fists, his mean eyes twitching.")

		saynn("[say=mirri]Why? Because my fur is not all black? Because I'm annoying?[/say]")

		saynn("[say=luxe]No.[/say]")

		saynn("[say=mirri]Because you never wanted me, right?[/say]")

		saynn("Luxe becomes quiet after those words. Mirri sees the reaction and closes her eyes, her expression softens.")

		saynn("[say=mirri]But I'm here, dad.. I'm a real person. You can't just get rid of me, can't just pretend that I don't exist. You have to accept me.. You know how much it hurts..[/say]")

		saynn("A lonely tear slides down her cheek.. a tear that Luxe ignores. The wolf stands still like a wall, his fur barely even glowing.")

		saynn("[say=mirri]You see what I went through? How much shit I did? Why don't you just.. Why don't you just call your daughter.. And I will stop.. I will stop being an annoying bitch, I promise.. I just wanna be loved, Dad.. at least a little bit..[/say]")

		saynn("Mirri opens her sad eyes and looks at Luxe. Still, there is no reaction from him.. which makes Mirri cry more.")

		saynn("[say=mirri]..I hate you, dad..[/say]")

		saynn("[say=luxe]I hate you too.[/say]")

		saynn("Mirri's eyes go wide. That was certainly unexpected.")

		saynn("[say=mirri]Wh-.. what?[/say]")

		saynn("Luxe is emotionless.")

		saynn("[say=mirri]What did you say?..[/say]")

		saynn("[say=luxe]I hate you, Mirri.[/say]")

		saynn("Mirri's legs are trembling, she is shaking her head more and more.")

		saynn("[say=mirri]You did not j-just say that, dad..[/say]")

		saynn("[say=luxe]You wanted the truth. That's the truth. I can't stand you. I'd be fine if you never existed.[/say]")

		saynn("More tears begin streaming down her cheeks, the poor girl is shivering, her ears going flat with her head, her tail wrapping around her leg.")

		saynn("[say=mirri]Don't s-say that.. p-please.. why are you saying t-that..[/say]")

		saynn("Suddenly, Luxe starts shouting.")

		saynn("[say=luxe]BECAUSE YOU ARE A MISTAKE.[/say]")

		saynn("[say=mirri]N-nno..[/say]")

		saynn("[say=luxe]YOU ARE A LIVING PROOF THAT I AM WEAK. I HATE YOU MORE THAN ANYTHING.[/say]")

		saynn("His golden fur tips begin dancing, sending little embers into the air.. But Luxe is quick to catch himself and lower his voice down to just an intimidating one.")

		saynn("[say=luxe]And I want you gone.[/say]")

		saynn("Mirri covers her eyes with her paws, quietly sobbing into them.")

		saynn("The atmosphere in the room is.. can only be described as miserable..")

		addButton("Continue", "See what happens next", "mirri_mans_up")
	if(state == "mirri_mans_up"):
		playAnimation(StageScene.Duo, ["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"], {pc="mirri", npc="luxe"})
		saynn("But after rubbing her red eyes for a bit, she manages to contain her emotions and stop crying.")

		saynn("Her sad expression turns mean as she pulls her gun out and aims it at her father. Something inside her clearly snapped..")

		saynn("[say=mirri]Well.. no point in humiliating myself any longer. Guess you made it easy for me, thanks for that.[/say]")

		saynn("Even at a gunpoint, Luxe shows very little emotion.")

		saynn("[say=luxe]You're gonna shoot me?[/say]")

		saynn("He takes one step forward.. Mirri cocks her gun.")

		saynn("[say=mirri]Not a single step more.. you fucker..[/say]")

		saynn("Time to pick your side.")

		addButton("Join Mirri", "Side with Mirri and go against Luxe together", "join_mirri")
		addButton("Join Luxe", "Side with Luxe and go against Mirri together", "join_luxe")
		if (true):
			addButton("Middle ground", "Block the path for them both", "block_path")
		else:
			addDisabledButton("Middle", "Either Mirri or Luxe don't trust you enough..")
	if(state == "block_path"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri", npcAction=["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"]})
		saynn("Rather than picking a side.. you decide to not do that.")

		saynn("You know that they hate each other by this point.. but they don't hate you. You stand in the middle of them and raise your hands, blocking Mirri's ability to aim at her dad.")

		saynn("[say=mirri]What the fuck are you doing?[/say]")

		saynn("[say=pc]I want us to talk. Peacefully.[/say]")

		saynn("[say=mirri]That time is long gone, soft {pc.boy}.. Things are never gonna be the same.[/say]")

		saynn("Mirri takes a step to the side.. you do the same, still protecting Luxe from her and her from Luxe.")

		saynn("[say=pc]You will have to kill me first, Mirri.[/say]")

		saynn("[say=mirri]You.. I fucking hate you..[/say]")

		saynn("She sounds.. annoyed.. for sure. Heartbroken even. She quickly swipes the old tears from her cheek, you notice her paws shaking a little. If she was gonna shoot, she would do it already.")

		saynn("But you are still walking on an edge..")

		saynn("[say=pc]I know you do. But hear me out.[/say]")

		saynn("You turn towards Luxe.")

		saynn("[say=pc]Luxe. You want Mirri gone. But does that involve killing her?[/say]")

		saynn("He retracts into himself, his face still barely showing any emotion.")

		saynn("The silence makes you get more and more nervous. Until he finally shakes his head.")

		saynn("[say=luxe]No.[/say]")

		saynn("Alright.. That is something.")

		saynn("[say=luxe]Selling her to slavery would be fine by me.[/say]")

		saynn("[say=mirri]REALLY?![/say]")

		saynn("This family is a total mess.. Better to defuse the situation quickly.")

		saynn("[say=pc]Wait. Wait. Alright, hold that thought, Luxe.[/say]")

		saynn("You turn back towards Mirri, her feline eyes show little sparks of confusion in a huge sea of anger.")

		saynn("[say=pc]Mirri. Do you want to kill your father?[/say]")

		saynn("Her arms tremble. Her expression turns mean again after your last word.")

		saynn("[say=mirri]Father? What kind of father is that, hating his own daughter so much he wants to sell her off.. Of course I wanna murder such a dick dad.. I'd rather have no dad than him..[/say]")

		saynn("You get a feeling that there is something there that you can latch onto..")

		saynn("[say=pc]Alright, scratch that. Do you want to kill Luxe?[/say]")

		saynn("[say=mirri]What? How is that any different?[/say]")

		saynn("[say=pc]Forget that he is your father for a second. Do you still want to murder him?[/say]")

		saynn("Mirri stays quiet, thinking. Her lips tremble as she starts speaking again.")

		saynn("[say=mirri]..He is a dick. Huge fucking dick. And I fucking hate him..[/say]")

		saynn("You can see her eyes watering up again, she is barely keeping herself from becoming a total mess.")

		saynn("[say=mirri]But if he wasn't my father.. I have no fucking idea.. I've killed for less..[/say]")

		saynn("Nothing is gonna be the same, you learned that much. Time to work with what you're got.")

		saynn("Mirri is still aiming her gun at you. Makes it a little hard to talk and think.")

		saynn("[say=mirri]What are you implying anyway?[/say]")

		saynn("[say=pc]Can you lower your gun first? For me?[/say]")

		saynn("It takes her some time.. but she does lower her piece, letting you breathe easier.")

		saynn("[say=pc]Thank you. Maybe there is space.. for a compromise?[/say]")

		saynn("[say=mirri]Compromise? Why don't I just compromise his life and move on with mine. You heard what he said, he wants to turn me into a slave and sell me.[/say]")

		saynn("[say=luxe]You will not walk out of here alive.[/say]")

		saynn("Mirri looks past you.")

		saynn("[say=mirri]Really? You think so?[/say]")

		saynn("Things are getting heated again.")

		saynn("[say=pc]Stop. Both of you. Mirri. I have another question.[/say]")

		saynn("[say=mirri]Make it quick..[/say]")

		saynn("[say=pc]Do you like being Blacktail?[/say]")

		saynn("[say=mirri]What?[/say]")

		saynn("[say=pc]You are Mirri Blacktail. But do you like being a part of this family?[/say]")

		saynn("Mirri sighs.")

		saynn("[say=mirri]Since we're sharing hurtful truths here.. I.. I fucking don't. I hate politics and this family is all about politics. I hate how everyone treats me.. I hate that I have to keep my room clean.. I hate my dad.. goes without saying..[/say]")

		saynn("Wow. Alright. Honestly is exactly what you needed. You get a feeling that a subtle approach will work best here. But it will require you to commit..")

		saynn("Time to commit.")

		saynn("[say=pc]Mirri. Luxe. I think there is a solution here. But you both have to realize it yourself. I will step back and let you handle it yourself, okay? Like adults.[/say]")

		saynn("This is scary. But you can't tell them what to do. They have to get to the solution on their own. The only problem that you notice.. is that Mirri keeps calling Luxe dad despite saying that she hates him.. this might screw everything..")

		addButton("Step back", "See what happens..", "middle_back")
	if(state == "middle_back"):
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc="luxe"})
		saynn("Slowly, you get out of their way, one little step at a time.")

		saynn("Mirri and Luxe quickly establish eye contact with each other. Luxe is his usual self, spotting a cold stare. And Mirri is frowning, her paw still squeezing the handle of her twelve point seven semi-automatic.")

		saynn("Wolf's eyes explore the catgirl's face features. The tension seems to be rising.. but no words are exchanged.")

		saynn("[say=mirri]I k-know that I've been a bad daughter. I've been so annoying.[/say]")

		saynn("[say=luxe]I understand why, Mirri. My behaviour played a role in that.[/say]")

		saynn("[say=mirri]You hated me all this time.. but you were just hiding it.. for me, I guess..[/say]")

		saynn("[say=luxe]I said that I hate you. And it's true. But there is nothing you could have done to change this.[/say]")

		saynn("Mirri inhales and exhales, trying to keep herself composed.")

		saynn("[say=mirri]It still hurts to hear that.. But I guess I understand.. I'm a mistake, like you said..[/say]")

		saynn("[say=luxe]You are my mistake, Mirri. My weakness. And I'm not allowed to have weaknesses.[/say]")

		saynn("Luxe says all of that with such a cold voice. Even you can't pick up on a single note of affection in his tone. Mirri lowers her gaze and nods subtly but understandably.")

		saynn("[say=luxe]My soul is rotten to the core. But that's who I am.[/say]")

		saynn("At least he understands it. Mirri's lips twitch, she blinks many times, struggling to keep her tough girl look.")

		saynn("[say=mirri]Can you.. I mean.. do you.. d-do you want to.. disown me, dad?..[/say]")

		saynn("She looks at him with her sad eyes. Luxe nods. Decision was made..")

		saynn("[say=mirri]Well.. t-that's good.. that is.. I n-never liked b-being Blacktail anyway.. My tail isn't even black, haha.. I'm f-fine with being.. just Mirri..[/say]")

		saynn("She closes her eyes and steadies her shaky breathing.")

		saynn("[say=mirri]So t-that.. settles it.. Guess I g-gotta start.. packing things..[/say]")

		saynn("[say=luxe]You can stay here until you find a good place. You can still sell slaves too if you need to earn credits.[/say]")

		saynn("[say=mirri]Oh.. okay.. that makes things easier.. Thank you, da.. Luxe.[/say]")

		saynn("So weird to hear her say his name. It's probably just as weird for her.")

		saynn("[say=mirri]Guess I will go now..[/say]")

		saynn("[say=luxe]I'm sorry I lashed out at you, Mirri. That was very rude of me.[/say]")

		saynn("Mirri shrugs.")

		saynn("[say=mirri]Well.. Sorry I almost shot you, Luxe.. Oh yeah.. I kinda.. stole your pills.[/say]")

		saynn("She throws him the pill bottle.")

		saynn("[say=mirri]I suggest you change the password on your drawer..[/say]")

		saynn("Luxe stars at the pills.. and then at her.")

		saynn("[say=luxe]Plan B, huh. You were always a smart girl, Mirri.[/say]")

		saynn("Mirri is shaking a bit, her tears keep wanting to escape..")

		saynn("[say=mirri]I knew that I would never bring myself to shoot you.. Take care, Luxe.. Stay a strong leader..[/say]")

		saynn("[say=luxe]Follow your dreams, Mirri. You're free to go.[/say]")

		saynn("She chuckles softly.. gives you and Luxe a last glance each.. and then steps out.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_office"):
		processTime(3*60)

	if(_action == "luxe_stands"):
		processTime(5*60)

	if(_action == "mirri_mans_up"):
		processTime(3*60)

	if(_action == "middle_back"):
		processTime(3*60)

	setState(_action)
