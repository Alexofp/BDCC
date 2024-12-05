extends SceneBase

var lostAtLeastOnce = false
var creditsToGive = 0

func _init():
	sceneID = "MirriRank6Scene"

func _run():
	if(state == ""):
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("The time has come. Mirri sits cross-legged on the edge of her desk, laptop placed in her lap. Her blue eyes are fixed on the screen, unblinking.. while her name blinks at the very top of the leaderboard:")

		saynn("1. [b]Mirri Blacktail[/b]")

		saynn("For a moment, she doesn't move. Doesn't react. She just stares at those glowing pixels as if expecting them to betray her and vanish at any second. Her ears twitch faintly, her tail curling behind her.")

		saynn("[say=mirri]I am at the top now. The best.[/say]")

		saynn("She doesn't sound entirely happy about it. It's more of an observation rather than celebration.")

		saynn("[say=mirri]Huh.. that's pretty cool. Look at all those Blacktails.. below me. I'm above them all.[/say]")

		saynn("She lets out a soft chuckle.. but there is no real joy in it.")

		saynn("[say=pc]How do you feel about it?[/say]")

		saynn("She shrugs, her tail swaying in slow, lazy arcs.")

		saynn("[say=mirri]I don't know yet.. Depends on what father thinks about it.[/say]")

		saynn("[say=pc]I wouldn't set your hopes too high.[/say]")

		saynn("Her head snaps towards you, her blue eyes narrowing down to sharp slits.")

		saynn("[say=mirri]And why not?[/say]")

		saynn("[say=pc]Then you won't be disappointed.[/say]")

		saynn("Mirri lowers her chin and stays quiet. Her lips curl into a tight line.")

		saynn("[say=mirri]He can't ignore this. Not anymore. Not when I've beaten them all.[/say]")

		saynn("After a moment, she pushes her laptop closed, her claws scraping lightly against the casing.")

		saynn("[say=mirri]It can't get worse than this. Surely.[/say]")

		saynn("She stands, gripping the machine like it's a trophy, a proof of her victory.")

		saynn("[say=pc]I'm sure it can.[/say]")

		saynn("The flick of her tail sharpens, and she turns her glare back to you.")

		saynn("[say=mirri]I didn't ask your fucking opinion.[/say]")

		saynn("She is still very much a bitch huh. Mirri heads for the door.")

		saynn("A storm is brewing.. you can feel it in the air.")

		addButton("Follow", "See what happens next", "in_office")
	if(state == "in_office"):
		aimCameraAndSetLocName("market_luxe")
		addCharacter("luxe")
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc="luxe", npcAction="sit"})
		saynn("Mirri walks into Luxe's office uninvited, putting some sway of her hips into every step.")

		saynn("[say=mirri]Hi dad.[/say]")

		saynn("You step inside as well and find yourself a quiet corner to take up. These two don't mix together well, you learned that much.")

		saynn("Luxe sits behind his desk, a stack of documents spread before him. He doesn't even glance up, finishing the page he's reading before calmly setting it aside. His eyes finally lift to meet his daughter's.")

		saynn("[say=luxe]Mirri.[/say]")

		saynn("His voice is neutral, cold, like the air in the room dropped a few degrees. His expression matches it, detached and unreadable. Mirri's lips twitch, her tail swaying with irritation.")

		saynn("[say=mirri]Have you seen it yet?[/say]")

		saynn("[say=luxe]Seen what?[/say]")

		saynn("[say=mirri]You can't be serious..[/say]")

		saynn("[say=luxe]I very much am, I can't read your mind.[/say]")

		saynn("Mirri exhales sharply.. before opening her laptop and angling it toward Luxe. Her fingers are tapping impatiently.")

		saynn("[say=mirri]Then read this.[/say]")

		saynn("Luxe leans forward slightly, his eyes scanning the leaderboard displayed on the screen. His brows lift ever so slightly, the only indication of acknowledgment, before he leans back in his chair.")

		saynn("[say=luxe]Impressive, Mirri. Your training paid off.[/say]")

		saynn("Mirri nods, her gaze locking on Luxe. She doesn't sit, doesn't relax.. she just stares, waiting for something more. Luxe stares back, his face an unreadable mask.")

		saynn("Seconds stretch uncomfortable long.")

		saynn("The silence finally cracks as Mirri's patience gives out.")

		saynn("[say=mirri]So?[/say]")

		saynn("Luxe tilts his head, one ear flicking slightly.")

		saynn("[say=luxe]So?[/say]")

		saynn("She rolls her eyes.")

		saynn("[say=mirri]Don't play dumb. Make me your apprentice. I've earned it. And I am Blacktail.[/say]")

		saynn("Luxe's jaw shifts slightly, his sharp teeth clicking faintly as they graze against one another. He tilts his head the other way, his expression still extremely calm.")

		saynn("[say=luxe]So that's what this is about.[/say]")

		saynn("[say=mirri]Yeah? You've made it painfully clear you're never going to accept me as your daughter. So fine.. make me your apprentice. I've checked all the boxes. I deserve to be the next family head and you know it.[/say]")

		saynn("Luxe listens, his eyes narrowing slightly as she speaks. He lets the silence hang just a moment too long before producing a sigh.")

		saynn("[say=luxe]There are no boxes to check, Mirri. No rules. No guarantees.[/say]")

		saynn("Mirri furrows her brows, her tail flicking sharply behind her.")

		saynn("[say=luxe]And besides.. You didn't exactly do it alone, did you?[/say]")

		saynn("[say=mirri]Of, for fuck's sake.. Now you're just looking for excuses.[/say]")

		addButton("Continue", "See what happens next", "luxe_stands")
	if(state == "luxe_stands"):
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc="luxe", npcAction="stand"})
		saynn("Luxe rises from his throne, moving away from his desk with slow, deliberate steps. His imposing figure looms closer to Mirri, though his piercing, ice-cold stare is directed at you.")

		saynn("[say=luxe]Am I? As much I see, {pc.he} deserves to be number one in that list as much as you do. If not more.[/say]")

		saynn("Mirri glares at you, her frown deepening, her tail swishing from irritation.")

		saynn("[say=mirri]{pc.He} {pc.isAre} just my helper puppy, okay? A tool. I could've sold {pc.him} anytime I wanted, but I didn't. {pc.He} {pc.verb('work')} for me.[/say]")

		saynn("Luxe's gaze flicks back to her, unrelenting.")

		saynn("[say=luxe]Wonder how {pc.he} {pc.verb('feel')} about it.[/say]")

		saynn("[say=mirri]You are just trying to muddle up the water.[/say]")

		saynn("[say=luxe]I feel like I'm making it nice and clear. You are not gonna be my apprentice. And you are not gonna be the head of this family.[/say]")

		saynn("Mirri stiffens and clenches her fists, his mean eyes twitching. Her ears flattening.")

		saynn("[say=mirri]Why? Because my fur is not all black? Because I'm annoying?[/say]")

		saynn("[say=luxe]No.[/say]")

		saynn("[say=mirri]Because you never wanted me, right?[/say]")

		saynn("Her words cut the air like a knife. Luxe's silence that comes after says a lot, heavy and damning.")

		saynn("Mirri watches his reaction.. a lack of one.. and exhales shakily, her shoulders dropping, her voice softening. Her eyes close..")

		saynn("[say=mirri]But I'm here, dad.. I'm real, I exist. You can't just pretend I don't. You can't just wish me away. Do you have any idea how much it hurts?[/say]")

		saynn("Her voice cracks as a single tear slides down her cheek. Luxe doesn't move, doesn't react.. His expression remains as unyielding as a stone wall, his glowing fur dim and still.")

		saynn("[say=mirri]Look at me.. You see what I went through?.. How much shit I did? Why can't you just.. Just call me your daughter?[/say]")

		saynn("Her voice breaks entirely, trembling with raw emotion.")

		saynn("[say=mirri]And I will stop.. I will stop being an annoying bitch, I promise. I just.. I just want to be loved, Dad.. even just a little bit..[/say]")

		saynn("She opens her tear-streaked eyes, her gaze searching Luxe's face for any hint of warmth, any sign of connection. But all she finds is emptiness.")

		saynn("[say=mirri]..I hate you, dad..[/say]")

		saynn("[say=luxe]I hate you too.[/say]")

		saynn("Mirri's entire body freezes, her wide eyes locking on him, disbelief flooding her expression.")

		saynn("[say=mirri]Wh-.. what? What did you say?..[/say]")

		saynn("Luxe's tone remains flat, emotionless.")

		saynn("[say=luxe]I hate you, Mirri.[/say]")

		saynn("Mirri's legs are trembling, she is shaking her head more and more.")

		saynn("[say=mirri]You did not j-just say that, dad..[/say]")

		saynn("[say=luxe]You wanted the truth. That's the truth. I can't stand you. I'd be perfectly fine if you never existed.[/say]")

		saynn("Tears stream down her cheeks now, her shivering becoming uncontrollable. Her ears press flat against her head, her tail curling tightly around her leg.")

		saynn("[say=mirri]Don't s-say that.. p-please.. why are you saying t-that..[/say]")

		saynn("Suddenly, Luxe starts shouting.")

		saynn("[say=luxe]BECAUSE YOU ARE A MISTAKE.[/say]")

		saynn("[say=mirri]N-nno..[/say]")

		saynn("[say=luxe]YOU ARE A LIVING PROOF OF MY FAILURE. MY WEAKNESS. I HATE YOU MORE THAN ANYTHING.[/say]")

		saynn("His golden fur tips instantly come to life, tiny embers dancing in the air near them. His claws dig into his calms as he makes himself stop, lowering his voice in an instant.. but even at a quiet growl, his words cut just as deep.")

		saynn("[say=luxe]And I want you gone.[/say]")

		saynn("Mirri crumples, covering her face with her hands as her sobs echo softly through the room. The air is thick, oppressive. It feels as though all light has been sucked out.. leaving only a suffocating sense of misery.")

		addButton("Continue", "See what happens next", "mirri_mans_up")
	if(state == "mirri_mans_up"):
		playAnimation(StageScene.Duo, ["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"], {pc="mirri", npc="luxe"})
		aimCameraAndSetLocName("market_luxe")
		addCharacter("luxe")
		addCharacter("mirri")
		saynn("Mirri rubs at her tear-streaked face, her hands trembling as she wipes away the evidence of her emotions. Slowly, her sobs subside, and her breathing events out.")

		saynn("But something in her eyes shifts.. The sadness hardens, turning into something that is much darker. With a deliberation motion, she pulls her gun out and raises it, aiming directly at Luxe.")

		saynn("[say=mirri]Well.. no point in humiliating myself any longer. Guess you made it easy for me. Thanks for that, dad.[/say]")

		saynn("Luxe's expression barely flickers, even with a weapon pointed at him.")

		saynn("[say=luxe]You're gonna shoot me?[/say]")

		saynn("He takes one step forward, his tone calm but edged with something dangerous. Mirri's hand tightens on the gun, and with a sharp click, she cocks it.")

		saynn("[say=mirri]Not a single step more.. you fucker.. I swear.. I will do it..[/say]")

		saynn("Time to pick your side.")

		addButton("Join Mirri", "Side with Mirri and go against Luxe together", "join_mirri")
		addButton("Join Luxe", "Side with Luxe and go against Mirri together", "join_luxe")
		if (getModule("SlaveAuctionModule").getMirriAffection() >= 1.0 && getModule("SlaveAuctionModule").getLuxeAffection() >= 1.0):
			addButton("Middle ground", "(Full affection with Mirri and Luxe) Block the path for them both", "block_path")
		else:
			addDisabledButton("Third option", "Either Mirri or Luxe don't trust you enough..")
	if(state == "block_path"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri", npcAction=["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"]})
		saynn("Rather than picking a side.. you decide to not do that.")

		saynn("You know that they hate each other by this point.. but they don't hate you. You stand between them and raise your hands. Mirri's gun remains aimed, but you block her line of fire, positioning yourself as a barrier.")

		saynn("[say=mirri]What the fuck are you doing?[/say]")

		saynn("[say=pc]I want us to talk. Peacefully.[/say]")

		saynn("[say=mirri]That time is long gone, soft {pc.boy}.. Things are never gonna be the same.[/say]")

		saynn("Mirri takes a step to the side.. you do the same, keeping yourself between her and Luxe.")

		saynn("[say=pc]You will have to kill me first, Mirri.[/say]")

		saynn("[say=mirri]You.. I fucking hate you sometimes..[/say]")

		saynn("She sounds.. annoyed.. for sure. Heartbroken even. She quickly swipes the old tears from her cheek, you notice her paws shaking a little. If she was gonna shoot, she would do it already.")

		saynn("But you are still walking on an edge..")

		saynn("[say=pc]I know you do. But hear me out.[/say]")

		saynn("You turn towards Luxe.")

		saynn("[say=pc]Luxe. You want Mirri gone. But does that involve killing her?[/say]")

		saynn("The silence that follows is suffocating, his expression just as unreadable. For a moment, you wonder if he will even dignify the question with an answer. Finally, he speaks.")

		saynn("[say=luxe]No.[/say]")

		saynn("Alright.. That is something. A small wave of relief washes over you.")

		saynn("[say=luxe]Selling her off would suffice.[/say]")

		saynn("[say=mirri]REALLY?![/say]")

		saynn("This family is a total mess.. Better to defuse the situation quickly.")

		saynn("[say=pc]Wait. Wait. Alright, hold that thought, Luxe.[/say]")

		saynn("You turn back towards Mirri, her feline eyes show little sparks of confusion in a huge sea of anger.")

		saynn("[say=pc]Mirri. Do you want to kill your father?[/say]")

		saynn("Her arms tremble. Her expression turns mean again after your last word.")

		saynn("[say=mirri]Father? What kind of father is that, hating his own daughter so much he wants to sell her off into slavery.. Of course I wanna murder such a dick dad.. I'd rather have no dad than him..[/say]")

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

		saynn("Mirri stares at you.. then shakes her head with a bitter laugh.")

		saynn("[say=mirri]Since we're sharing hurtful truths here.. I.. I fucking don't. I hate politics and this family is all about politics. I hate how everyone treats me.. I hate that I have to keep my room clean.. I hate my dad.. goes without saying..[/say]")

		saynn("Wow. Alright. Honestly is exactly what you needed. You get a feeling that a subtle approach will work best here. But it will require you to commit..")

		saynn("Time to commit.")

		saynn("[say=pc]Mirri. Luxe. I think there is a solution here. But you both have to realize it yourself. I will step back and let you handle it yourself, okay? Like adults.[/say]")

		saynn("This is scary. But you can't tell them what to do. They have to get to the solution on their own. The only problem that you notice.. is that Mirri keeps calling Luxe dad despite saying that she hates him.. this might screw everything..")

		addButton("Step back", "See what happens..", "middle_back")
	if(state == "middle_back"):
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc="luxe"})
		saynn("Slowly, you get out of their way, one little step at a time.")

		saynn("Their eyes lock.. Luxe's unyielding and cold, Mirri's filled with a fragile, trembling fire. Her paw tightens around the grip of her weapon, though her arms are heavy, her posture broken.")

		saynn("Wolf's eyes explore the catgirl's face features. The tension seems to be rising.. but no words are exchanged.")

		saynn("Finally, it's Mirri who speaks, her voice unsteady, cracking at the edges.")

		saynn("[say=mirri]I k-know that I've been a bad daughter. I've been so annoying.[/say]")

		saynn("Her words hang in the air, vulnerable and raw. Luxe's replay is calm, measured.")

		saynn("[say=luxe]I understand why, Mirri. My behaviour played a role in that.[/say]")

		saynn("Mirri's lips twitch as she looks away, ears flat against her head.")

		saynn("[say=mirri]You hated me, didn't you? This whole time.. Even when you pretended you didn't.. just for my sake..[/say]")

		saynn("[say=luxe]I said that I hate you. And it's true. But it was never something you could have changed.[/say]")

		saynn("Mirri inhales and exhales, trying to keep herself composed.. refusing to let herself break.")

		saynn("[say=mirri]It still hurts to hear that.. it hurts so much.. But I get it. I.. I'm a mistake.. You said it. You're right..[/say]")

		saynn("[say=luxe]You are my mistake. My weakness. And I'm not allowed to have weaknesses, Mirri.[/say]")

		saynn("His words cut, precise and merciless. Even you flinch at the chill in his tone, so devoid of warmth, so devoid of hope. Mirri lowers her head, nodding, her voice barely a whisper.")

		saynn("[say=luxe]My soul is rotten to the core. But that's who I am.[/say]")

		saynn("At least he understands it. Mirri's lips twitch, she blinks many times, struggling to keep her tough girl look.. but she holds on.. barely.")

		saynn("[say=mirri]Can you.. I mean.. do you.. d-do you want to.. disown me, dad?..[/say]")

		saynn("She looks at him with her sad eyes. Luxe nods. Decision was made..")

		saynn("[say=luxe]That's what's best for both of us.[/say]")

		saynn("Her ears flatten further, and her knees almost buckle.. but she nods again, forcing a weak smile.")

		saynn("[say=mirri]Well.. t-that's good.. that is.. I n-never liked b-being Blacktail anyway.. My tail isn't even black, haha..[/say]")

		saynn("Her laughter is brittle, hollow. She is breaking apart before your eyes, piece by piece. She closes her eyes against her tears and steadies her shaky breathing.")

		saynn("[say=mirri]So t-that.. settles it.. Guess I g-gotta start.. packing things..[/say]")

		saynn("Luxe's voice remains even.")

		saynn("[say=luxe]You can stay here until you find somewhere safe. And if you need credits, you can keep working on the market. It's what you're good at.[/say]")

		saynn("[say=mirri]Oh.. okay.. that makes things easier.. Thank you, da.. Luxe.[/say]")

		saynn("Her voice cracks on his name, foreign and strange on her tongue. She swallows hard and straightens her back.")

		saynn("[say=mirri]Guess I will go now..[/say]")

		saynn("Before she can turn fully, Luxe speaks again.")

		saynn("[say=luxe]Excuse me for shouting at you. That was.. unkind.[/say]")

		saynn("Mirri pauses and nods subtly.")

		saynn("[say=mirri]Well.. Sorry I almost shot you, Luxe.. Oh yeah.. I kinda.. stole your pills.[/say]")

		saynn("She fishes a pill bottle from her pouch and tosses it to him.")

		saynn("[say=mirri]I suggest you change the password on your drawer..[/say]")

		saynn("Luxe catches the pill bottle and stares at it.")

		saynn("[say=luxe]Plan B, huh. You were always a smart and resourceful girl, Mirri.[/say]")

		saynn("Mirri is shaking a bit, her tears keep wanting to escape..")

		saynn("[say=mirri]I knew that I would never bring myself to shoot you.. Take care, Luxe.. Stay a strong leader..[/say]")

		saynn("[say=luxe]Follow your dreams, Mirri. You're free to go.[/say]")

		saynn("She lets out a soft chuckle.. gives you and Luxe a last glance each.. and then steps out.")

		addButton("Continue", "See what happens next", "middle_mirri_leaves")
	if(state == "middle_mirri_leaves"):
		removeCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		saynn("With nothing better to do, you head for the exit too.. but Luxe stops you.")

		saynn("[say=luxe]You avoided a bloodshed inside an opposite faction. Faction that wants to enslave most of you.[/say]")

		saynn("[say=pc]I only helped guide you two a bit. And I'm an inmate, I have as much relation to AlphaCorp as your slaves have to Syndicate.[/say]")

		saynn("The more you disassociate yourself from AlphaCorp, the less likely he will change his mind and sell you off..")

		saynn("[say=luxe]But still, I wonder what made you do this. I fully expected you to pick a side.[/say]")

		saynn("[say=pc]I guess you will have to live with this question, Luxe.[/say]")

		saynn("He smiles.")

		saynn("[say=luxe]If you ever get caught, I will tell them to pick a better cage for you.[/say]")

		saynn("[say=pc]This made it all worth it.[/say]")

		saynn("Luxe nods.. and then suddenly tosses you a chip.")

		saynn("[say=luxe]Here is some extra, for all the trouble.[/say]")

		saynn("That credit chip is made out of gold.. Holy..")

		saynn("[say=luxe]You're free now. As much as any AlphaCorp slave is.[/say]")

		saynn("Which is to say, not really.")

		saynn("[say=pc]You're not gonna help me take off the collar?[/say]")

		saynn("He shakes his head.")

		saynn("[say=luxe]No.[/say]")

		saynn("Fair enough. Time to go.")

		addButton("Leave", "See what happens next", "middle_meetmirriafter")
	if(state == "middle_meetmirriafter"):
		removeCharacter("luxe")
		addCharacter("mirri")
		playAnimation(StageScene.Hug, "hug", {npc="mirri"})
		aimCameraAndSetLocName("market_intro")
		saynn("You step out of Luxe's office, a weight lifting from your shoulders.. but it's not relief. It's exhaustion. The echo of harsh words still hangs in your ears.")

		saynn("The corridor feels longer than ever.. but before you can take many steps, a pair of trembling paws yank you into a family lit room.")

		saynn("She wraps herself around you, her arms tight and desperate, her body shaking as she clings to your frame like a lifeline. The tears come instantly..")

		saynn("[say=mirri]I'm s-sorry.. I just.. I fucking need this..[/say]")

		saynn("Her voice cracks, the dam inside her finally breaking. Carefully, you return the embrace, your hands resting on her back as she sobs against your chest.")

		saynn("[say=pc]It's okay, Mirri. It's okay. That was a lot.[/say]")

		saynn("Her response is a choked, bitter laugh.")

		saynn("[say=mirri]A lot? T-that was my whole life shattering into pieces in one moment.. Everything..[/say]")

		saynn("Her voice is thick with grief, the weight of her words pressing down on both of you. You rub her back gently, your own throat tightening.")

		saynn("[say=pc]It was this.. or worse, Mirri. Bloodshed wasn't the answer.[/say]")

		saynn("[say=mirri]His words.. they hurt so much.. I knew they were coming.. and it still hurt so much..[/say]")

		saynn("She buries her face deeper into your shoulder.")

		saynn("[say=pc]Truth tends to do that.[/say]")

		saynn("[say=mirri]I.. I don't even know who I am anymore. I'm not Blacktail.. I'm not his daughter.. What's left? What am I even supposed to be now?[/say]")

		saynn("You pull back slightly, cupping her wet cheeks with your hands. Her sad, blue eyes meet yours, shimmering with tears.")

		saynn("[say=pc]Not that much has changed, Mirri.[/say]")

		saynn("[say=mirri]How can you say that?[/say]")

		saynn("[say=pc]You know who you are. You told me a million times.[/say]")

		saynn("You brush away some of her tears with your thumbs, your hands moving to scratch gently behind her ears. For a moment, her body relaxes.")

		saynn("[say=pc]I wanna hear it.[/say]")

		saynn("[say=mirri]I'm.. Mirri..[/say]")

		saynn("Her voice is fragile, searching.")

		saynn("[say=pc]Yes.[/say]")

		saynn("[say=mirri]The best slaver in the entire galaxy..[/say]")

		saynn("[say=pc]See? All of that is still true. You even have a digital proof.[/say]")

		saynn("Your ears hear a quiet purring emerging from her. Mirri's eyes are still sad.. but now with a spark of hope, faint but real.")

		saynn("[say=mirri]Maybe..[/say]")

		saynn("You smile and pat her on the head. She leans into your touch.")

		saynn("[say=mirri]I hated being part of this family anyway..[/say]")

		saynn("[say=pc]And now you're free of those chains. You can follow your own heart rather than trying to please a rotten one.[/say]")

		saynn("She chuckles softly and leans closer to nuzzle your face, her purring obvious.")

		saynn("[say=mirri]Dad never even called me good once.. not once..[/say]")

		saynn("Her voice breaks on the last word, and the tears threaten to start again. You pull her closer, whispering softly.")

		saynn("[say=pc]Mirri.. You are the best girl.[/say]")

		saynn("Her breath catches, her eyes widening slightly before she shuts them, resting her head against you again.")

		saynn("[say=mirri]Say that again..[/say]")

		saynn("[say=pc]Mirri..[/say]")

		saynn("[say=mirri]Pretty please?..[/say]")

		saynn("[say=pc]..you're a good girl.[/say]")

		saynn("The smallest of smiles touches her lips, trembling but genuine. She licks your face and smiles.")

		saynn("[say=mirri]What's a good girl like me supposed to do now, huh?[/say]")

		saynn("Her voice is light, teasing.. but there is still a raw edge to it.")

		saynn("[say=pc]Whatever you want, Mirri.[/say]")

		saynn("[say=mirri]I'm still wearing that dumb guard armor from your silly prison. Maybe I will become a real guard.. boss some sluts around..[/say]")

		saynn("[say=pc]I'm sure the prison can use someone with your skills.[/say]")

		saynn("She chuckles, the sound warmer now.")

		saynn("[say=mirri]But for now, I will stick to what I'm good at. I will be the presenter at the auction. So if you've got slaves, let's sell them..[/say]")

		saynn("Her playful smirk returns, though it's softer.")

		saynn("[say=mirri]I will even raise your cut to 20%, pretty {pc.boy}.[/say]")

		saynn("[say=pc]Just 20%?[/say]")

		saynn("Her grin widens, a hint of mischief glinting in her tear-streaked eyes.")

		saynn("[say=mirri]C'mon, kitty gotta eat! Tunya is very expensive lately.[/say]")

		saynn("Tunya huh.")

		saynn("[say=mirri]What, I can be cute sometimes~. Before I bring out the leash.[/say]")

		saynn("Now she sounds like her normal self.")

		addButton("Continue", "See what happens next", "middle_end")
	if(state == "middle_end"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("Mirri gives you a few more licks and then uses her feline abilities to slip from under your hands.")

		saynn("She looks around.")

		saynn("[say=mirri]..Should I trash this place before I leave? I always wanted to.[/say]")

		saynn("[say=pc]I don't think that's a good idea.[/say]")

		saynn("[say=mirri]Aw.. Well.. this is it then. Sorry for calling you my helper puppy, you're so much more than that. At least a doggy~.[/say]")

		saynn("She does a polite bow in front of you.")

		saynn("[say=mirri]See you around, soft {pc.boy}~. Go live your silly prison life.[/say]")

		saynn("[say=pc]You're not gonna help me take off my collar too?[/say]")

		saynn("[say=mirri]And end your suffering? Nah, I'm not that cruel~. You will have to do that yourself.[/say]")

		saynn("So much for helping the Syndicate.")

		saynn("[say=mirri]We can fuck though.[/say]")

		saynn("She sends you an air kiss and smiles wide.")

		saynn("(( This is where this content ends. Thank you for playing <3 ))")
		setFlag("SlaveAuctionModule.mirriNotOnPill", true)
		setFlag("SlaveAuctionModule.mirriCanSkipCombat", true)
		setFlag("SlaveAuctionModule.r6outcome", "middleground")
		setFlag("SlaveAuctionModule.customMirriGreeting", "Mirri.. Mirri.. I'm just Mirri now.. Feels weird to not add the family name. But that family was just holding me back. And now I'm free, thanks to you! How much for another 'good girl'~?")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "join_mirri"):
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		saynn("Screw Luxe. You step forward, positioning yourself beside Mirri, your eyes locked on Luxe. The catgirl spares you a quick glance, her lips curling in a faint, bitter smile.")

		saynn("[say=mirri]Glad you see it my way.[/say]")

		saynn("[say=pc]You're the one with the gun, after all.[/say]")

		saynn("Luxe doesn't seem to appreciate your sarcastic tone. His gaze flicks between you both, his sharp eyes narrowing. He leans back slightly, his frame finding the desk behind him.")

		saynn("[say=luxe]Hm.[/say]")

		saynn("[say=mirri]What's this? You giving up already? Go on, dad.. get on your knees. Maybe, maybe, I will even let you live.[/say]")

		saynn("Luxe closes his eyes, exhaling deeply. His breathing slows to a measured, deliberate rhythm. The faint glow of his golden fur tips fades into nothingness.")

		saynn("[say=mirri]Nice trick, dad. Now do I say or I will pull the trigger. I mean it.[/say]")

		saynn("Her threats don't touch the wolf even slightly. He is dead calm.. only his clawed digits tap on his desk.")

		saynn("[say=mirri]I mean it![/say]")

		addButton("Continue", "See what happens next", "mirri_sudden")
	if(state == "mirri_sudden"):
		playAnimation(StageScene.Solo, "defeat", {pc="mirri"})
		saynn("[say=luxe]You don't have the guts.[/say]")

		saynn("In a sudden motion, Luxe presses a hidden button beneath the desk. The holo-map flickers off, plunging the room into complete darkness. The faint sound of rushing air follows.. and before you can react..")

		saynn("[b]BOOM.[/b]")

		saynn("A gunshot erupts, momentarily illuminating the room with a bright flash. In that instant, you catch the sight of Luxe barreling forward, amber eyes burning with cold, furious intent.")

		saynn("[say=mirri]ARGH![/say]")

		saynn("The impact is deafening. A heavy thud reverberates through the room as Mirri crashes to the floor, her weapon sliding away into the void.")

		saynn("[say=mirri]YOU FUCK! THAT HURT.[/say]")

		saynn("The darkness swallows everything again, leaving you fumbling as the echoes of the blow settle.")

		saynn("[say=luxe]And stay down.[/say]")

		addButton("Continue", "See what happens next", "mirri_luxe_about_to_fight")
	if(state == "mirri_luxe_about_to_fight"):
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		saynn("You stumble around in the darkness, trying to find Mirri. You follow the hissing until you reach her. She is on the floor, holding onto her chest. Luckily, the armor softened a part of that blow.")

		saynn("[say=pc]Mirri?[/say]")

		saynn("[say=mirri]Don't worry about me.. where is the fucking gun..[/say]")

		saynn("It's nowhere near Mirri, that's for sure.")

		saynn("[say=luxe]Looking for this?[/say]")

		saynn("Luxe's cold voice cuts through the darkness. Then, slowly, his outline emerges as his golden fur reignites, casting a faint glow around him. He stands tall, one boot planted firmly atop Mirri's gun.")

		saynn("[say=mirri]You fuck..[/say]")

		saynn("[say=luxe]Looks like I'm selling two slaves tonight.[/say]")

		saynn("His tone.. ice.")

		saynn("[say=pc]You ain't selling shit.[/say]")

		saynn("With a kick, Luxe sends the gun sliding further into the darkness, out of sight. The wolf is the only light in the room..")

		saynn("[say=pc]But you did just buy yourself a one-way ticket straight to hell.[/say]")

		saynn("Luxe doesn't reply. His body shifts fluidly, his stance low and deadly, his eyes locking onto yours like a hunter marking prey.")

		saynn("Looks like you better not lose this one.. or your little adventure will be over [b]forever[/b].")

		addButton("Fight", "Start the fight", "start_fight_with_luxe")
	if(state == "mirri_fight_won"):
		playAnimation(StageScene.Duo, "stand", {npc="luxe", npcAction="defeat"})
		saynn("Luxe hits the floor with a mean growl, the impact of his massive frame makes the whole room vibrate. He is holding onto his chest, his fur glowing brighter with his heartbeat.")

		saynn("[say=mirri]Nice work.. Seriously. I'd be toast without you, {pc.name}.[/say]")

		saynn("Mirri isn't doing too well.. but she pushes herself up, stumbling towards her gun. On the way there, she flicks the hologram wall back on, flooding the room with its artificial glow.")

		saynn("[say=luxe]You two.. I've never seen anyone more stupid or pathetic in my life.[/say]")

		saynn("[say=mirri]Shut it, dad. You're the one on your knees.[/say]")

		saynn("She picks up her gun and joins you, standing near Luxe. He raises his head just enough to glare at her, his lips curling into a sneer.")

		saynn("[say=luxe]You think this ends here? You think the family will just let you walk away? They will skin you alive, both of you.[/say]")

		saynn("Mirri snarls, swinging the butt of her gun against his jaw with a sickening crack. Luxe growls, his golden fur flaring brighter, embers flying from the tips. The temperature in the room goes up a little..")

		saynn("[say=mirri]I'm not planning to run away. And that's not for you to worry about. Your plan didn't go exactly like you wanted, did it?[/say]")

		saynn("She steps forward, looming over him.. Better let her handle it from now on, it's her dad after all.")

		addButton("Continue", "See what happens next", "mirri_on_luxe")
	if(state == "mirri_on_luxe"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="mirri", npc="luxe"})
		saynn("Mirri plants her boot firmly against Luxe's burning chest, forcing him to stay down. She aims her gun directly at his head, her hand shaking subtly..")

		saynn("[say=mirri]Any last words?[/say]")

		saynn("Luxe shakes his head and just grunts as his body is slowly burning itself on its own. His fur tips look like little fire tongues..")

		saynn("Mirri squeezes the gun's handle tightly, her mean eyes full of hate.. and yet.. her shaky clawed digit does not pull the trigger.")

		saynn("[say=luxe]You were always weak, Mirri.. gh-h.. That's why you will never lead this family.[/say]")

		saynn("Her jaw tightens, her fangs bared as she growls. The gun trembles in her head, her finger brushing the trigger.. but she doesn't fire yet.")

		saynn("[say=mirri]Shut up.. Just shut up![/say]")

		saynn("Her hands shake uncontrollably, her eyes narrowed into animal slits, showing her fury.")

		saynn("[say=luxe]Weak.[/say]")

		saynn("With a guttural scream, she finally pulls the trigger.")

		saynn("[b]BANG[/b]. A gunshot rings in your ears.")

		saynn("But the bullet hole appears a few inches away from Luxe's head, on the floor. The wolf flinches.. but looks like Mirri wasn't aiming for him in the first place.")

		saynn("[say=mirri]Fuck. I can't do it.[/say]")

		saynn("She lowers her hand.. while Luxe lets out a soft chuckle, coughing out some steam in the process. Even while dying, he is a prick.")

		saynn("[say=pc]Want me to do it?[/say]")

		saynn("[say=mirri]No..[/say]")

		saynn("Luxe growls through gritted teeth, his claws scraping against Mirri's boot. With a sudden burst of strength, he shoves it off his chest, making her stumble back.")

		addButton("Continue", "See what happens next", "mirri_luxe_about_to_die")
	if(state == "mirri_luxe_about_to_die"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="luxe"})
		saynn("Catgirl looks.. disappointed.. in herself. She just watches as Luxe crawls towards his desk, breathing out more steam in the process.")

		saynn("[say=pc]He is gonna get his pills. You can't just watch him do it.[/say]")

		saynn("You head towards Luxe to stop him but Mirri stretches an arm out, holding you back without even looking at you.")

		saynn("[say=luxe]Told you.. S-she is a weak.. dumb.. useless.. stupid.. w-whore..[/say]")

		saynn("Luxe just keeps dragging himself inch by inch while the heat is slowly killing him, his fur sending off more fancy embers everywhere. Mirri's heart clearly hurts too as she is watching his dying dad struggle for his life.")

		saynn("[say=mirri]Need my help, daddy?[/say]")

		saynn("But maybe you're wrong. Her tone is laced with subtle mockery. Mockery that Luxe doesn't pick up on.")

		saynn("[say=luxe]No. I don't need you at all, I never needed you.. I never wanted you.. I hate you. You're a mistake.[/say]")

		saynn("The words stab deep.. but Mirri just has a small smirk on her face as Luxe reaches his desk, his claws fumbling at its surface. He inputs a code, opening one of the drawers. His shaking hands disappear inside, searching frantically.")

		saynn("[say=mirri]Looking for this, daddy~?[/say]")

		saynn("Luxe freezes.. and then twists his head towards her. His expression becomes enraged as he spots a pill bottle in Mirri's hand. His desperate claws tear through the drawer.. but he doesn't find his one.")

		saynn("[say=luxe]Y-You..[/say]")

		saynn("Mirri smiles cutely, her cunning eyes shining brightly.")

		saynn("[say=mirri]I can't bring myself to kill you. But oh lucky me, I don't have to save you either.[/say]")

		saynn("Luxe grabs his own gun from the drawer and quickly aims it at Mirri! You don't even have enough time to react before he pulls the trigger.")

		saynn("Click. Click. Click.")

		saynn("Silence.")

		saynn("[say=mirri]Wow. You really thought that I'm dumb. That's so rude~. Or maybe you're just this desperate? Poor thing. Trying to take my life even while barely clinging to his.[/say]")

		saynn("Luxe punches his desk out of pure rage and throws the empty gun out. He begins crawling towards Mirri, hatred burning in his eyes.. while his body is gradually giving up on him.")

		saynn("Mirri walks towards him again, meeting him halfway.")

		addButton("Continue", "See what happens next", "mirri_gives_chance")
	if(state == "mirri_gives_chance"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="mirri", npc="luxe"})
		saynn("Mirri presses her boot down harder on Luxe's chest, forcing a deep grunt from him. His claws scrape at her leg in vain, his golden fur flares violently, patches igniting into smoldering embers that begin to sear through his charred clothing. Each breath he exhales carries a wave of unbearable heat, the air around him shimmering.")

		saynn("[say=mirri]You're gonna die, dad. There is nothing you can do.[/say]")

		saynn("He tries to calm his breathing.. tries to keep his cool appearance.. but this process he can not stop anymore.. he is burning up. Mirri tilts her head slightly, watching his agony with a cold detachment, her paw fidgets with the pill bottle.")

		saynn("[say=mirri]Still.. I'm not heartless.[/say]")

		saynn("She crouches slightly, meeting his fierce, hate-filled eyes.")

		saynn("[say=mirri]I will give you the pills. I will let you keep living your miserable little life. But there is one condition.[/say]")

		saynn("She leans closer.")

		saynn("[say=mirri]Say it. Call me your daughter.[/say]")

		saynn("Luxe glares at her, his body trembling with rage, his voice little more than a crackling rasp as heat rises from his chest like smoke from a dying fire.")

		saynn("[say=luxe]You..[/say]")

		saynn("The embers intensify, creeping further across his form, his fur glowing like molten gold.")

		saynn("[say=luxe]..are..[/say]")

		saynn("His voice fails, but his glare does not. He shows off his sharp teeth as he spits his final venom.")

		saynn("[say=luxe]..a whore.[/say]")

		saynn("Mirri's eyes narrow. She lets out a soft laugh, her tail flicking behind her.")

		saynn("[say=mirri]Good bye, dad. I will not miss you.[/say]")

		saynn("With a small shrug, she slips the pill bottle into her pouch and rises. Luxe's body convulses under her, his skin glowing beneath the burning fur as the embers consume him. He huffs one last fiery breath, steam and smoke blowing from his mouth..")

		saynn("Then.. the room grows brighter and hotter as his body becomes a living inferno. His claws scrape uselessly against the floor before curling into fists, his strength fading into nothingness.. his life..")

		saynn("Mirri just quietly watches, her gaze lost in the roar of Luxe's burning body.")

		addButton("Continue", "See what happens next", "mirri_luxe_dead")
	if(state == "mirri_luxe_dead"):
		removeCharacter("luxe")
		playAnimation(StageScene.Duo, "stand", {npc="mirri", npcAction="sit"})
		saynn("The inferno flares one final time, and then it collapses in on itself. Mirri's boot clangs against the floor as Luxe's body disintegrates into ash, a hollowed-out shell that crumbles with a faint hiss as the embers die. The glow fades, leaving the room in silence, illuminated only by the soft blue light of the hologram map on the wall.")

		saynn("Mirri watches the pile of ash settle, her expression unreadable. She doesn't say a word as she steps over the remains of her father, her boots living faint prints in the gray dust.")

		saynn("She approaches Luxe's desk, her movements calm and deliberate. Slowly, she lowers herself into his massive, imposing chair. The leather cracks faintly as she leans back, one leg crossed over the other, her claws tapping lightly against the armrest. Her eyes scan the room, sharp and calculating, before they settle on you.")

		saynn("For a moment, neither of you speak. The silence is heavy, broken only by the faint hum of the hologram behind her. Her tail sways lazily, her mean face shows triumph.")

		saynn("[say=mirri]We won..[/say]")

		saynn("You glance at the pile of ash on the floor, the faint scorch marks on the wood floor still glowing softly.")

		saynn("[say=pc]I guess we did. But what will you do about the rest of the family?[/say]")

		saynn("She tilts her head to the side, her stare cold and calculated.")

		saynn("[say=mirri]Dad had a terrible accident. And, since I'm the best slaver.. they all will serve me now.[/say]")

		saynn("The corners of her lips raise slightly. Only now the weight of what just happened began to sink in.")

		saynn("[say=pc]I guess you're right then. We won.[/say]")

		saynn("The room feels different, heavier. The ashes of the old kind lie forgotten on the floor.. atop his throne sits the new queen. For better or worse, the Blacktail legacy is in her hands now.")

		saynn("[say=mirri]You've been a great help, I won't forget it.[/say]")

		saynn("[say=pc]You better not.[/say]")

		saynn("She chuckles softly.")

		saynn("[say=mirri]This chair was not made for my butt. Too big and too.. cold. I kinda prefer my current room, to be honest. Let's go. Oh, wait..[/say]")

		saynn("She pushes herself out of the chair, her movements fluid as ever.. but something catches her eye.. a faint glint in the open drawer. She reaches in and pulls out an urn, it's surface all cracked and clearly glued back together. She turns it over in her hands, her sharp eyes studying it in the light.")

		saynn("[say=mirri]Glued back together, just like his life was.[/say]")

		saynn("[say=pc]Fitting to let his ashes rest with hers, don't you think?[/say]")

		saynn("Mirri's ears flick back slightly, and for a moment, her expression softens. Then, just as quickly, the flicker of sentiment vanishes. Her lips twist into a sly smirk.")

		saynn("[say=mirri]Nah. I've got a better idea.[/say]")

		saynn("She steps away from the desk, the urn still in her hands. Her tail swishes behind her.")

		saynn("[say=mirri]Step back.[/say]")

		saynn("Before you can respond, she tosses the urn high into the air. Time seems to slow down as she draws her gun in one smooth motion, her eyes locking onto the fragile urn spinning against the faint blue glow.")

		saynn("[b]Bang.[/b]")

		saynn("The gunshot shatters the urn, making it explode midair in a burst of obsidian shards and a swirling cloud of grey ash.")

		saynn("Mirri holsters her gun and brushes some stray ash off of her armor. She turns to you, her smirk now fully formed.")

		saynn("[say=mirri]That's better. Let's go.[/say]")

		addButton("Follow", "Follow Mirri back to her room", "mirri_after_all")
	if(state == "mirri_after_all"):
		aimCameraAndSetLocName("market_intro")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("You return to Mirri's room. She inhales and exhales audibly.")

		saynn("[say=mirri]I feel so much better already..[/say]")

		saynn("She looks around.")

		saynn("[say=mirri]..Should I trash this place? I always wanted to.[/say]")

		saynn("[say=pc]I don't think that's a good idea.[/say]")

		saynn("[say=mirri]Aw.. Well.. this is it then.[/say]")

		saynn("Mirri gives you a kiss on the cheek.")

		saynn("[say=mirri]We still need slaves. So if you have any, I will be happy to help you sell them. I will even raise your cut to 20%..[/say]")

		saynn("[say=pc]Just 20%?[/say]")

		saynn("[say=mirri]Yes. Blacktail needs credits.[/say]")

		saynn("Better than nothing.")

		saynn("She does a polite bow in front of you.")

		saynn("[say=mirri]See you around, soft {pc.boy}~. Go live your silly prison life.[/say]")

		saynn("[say=pc]You're not gonna help me take off my collar?[/say]")

		saynn("[say=mirri]And end your suffering? Nah, I'm not that cruel. You will have to do that yourself.[/say]")

		saynn("So much for helping the Syndicate.")

		saynn("[say=mirri]We can fuck though.[/say]")

		saynn("She sends you an air kiss and smiles wide.")

		saynn("(( This is where this content ends. Thank you for playing <3 ))")
		setFlag("SlaveAuctionModule.mirriNotOnPill", true)
		setFlag("SlaveAuctionModule.mirriCanSkipCombat", true)
		setFlag("SlaveAuctionModule.r6outcome", "luxedead")
		setFlag("SlaveAuctionModule.customMirriGreeting", "We won! Holy shit! I destroyed that fucker, didn't I? With your help of course.. I'm a good girl, aren't I?")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "mirri_fight_lost"):
		playAnimation(StageScene.Duo, "defeat", {npc="luxe"})
		saynn("You hit the floor, unable to continue fighting. Your vision becomes blurry as the cold surface presses against your cheek, your body refuses to get up. Luxe looms above you, his golden glow casting jagged shadows across the office.")

		saynn("You catch glimpses of Mirri.. crumpled on the floor, clutching her rips, her face palace with shock and pain.")

		saynn("[say=luxe]Pathetic.[/say]")

		saynn("His voice is ice, devoid of triumph. The outcome was never a question for him.")

		saynn("[say=luxe]I gave you a chance. Both of you. But weakness..[/say]")

		saynn("He steps closer, leaning down to meet your fading gaze.")

		saynn("[say=luxe]..has no place in this family.[/say]")

		saynn("His boot strikes your head. Darkness swallows you whole..")

		addButton("Continue", "See what happens next", "mirri_lost_badend")
	if(state == "mirri_lost_badend"):
		playAnimation(StageScene.HangingDuo, "idle", {pc="pc", npc="mirri", bodyState={naked=true}, npcBodyState={naked=true, chains=[["normal", "neck", "npc", "pc", "neck"]]}})
		addCharacter("mirri", ["naked"])
		saynn("You wake up when a project light hits your face. Your eyes haven't adjusted yet.. but your ears pick up on a quiet hum of a crowd in front of you.")

		saynn("Your wrists.. cuffed above your head. You are completely naked. Beside you.. is Mirri.. stripped of her armor. Her tail hangs limp, her ears flattened, a sleek black slave collar is locked snugly around her neck, connected with a chain leash to yours. Her defiance is gone.. replaced by a hollow stare.")

		saynn("[say=mirri]..I'm sorry..[/say]")

		saynn("Her whisper barely reaches your ears.")

		saynn("Before you can respond, Luxe's booming voice silences the mysterious crowd.")

		saynn("[say=luxe]Ladies and gentlemen. Esteemed buyers. Welcome to Blacktail Market. Today, I present to you two.. regular slaves.[/say]")

		saynn("He is standing on the presenter platform, his golden fur shining under the harsh lights. Though he addresses the crowd, there is no performance in his voice. For him.. this is just a thing that has to be done..")

		saynn("[say=luxe]First, we have Mirri. A promising young slaver who completely forgot her place. And now, she can be yours, to please or serve, as you see fit.[/say]")

		saynn("Tears rush down Mirri's cheeks when she hears that.")

		saynn("[say=mirri]He is selling me.. he is selling his own daughter..[/say]")

		saynn("[say=luxe]Smart. Determined. But utterly useless without someone to leash her.[/say]")

		saynn("The crowd murmurs with interest. Mirri flinches at that description, her chains rattling.. but that's all that she can do..")

		saynn("[say=luxe]I will be honest. She is not our most.. quality.. product.. by any means. She is weak. So I will throw in a bonus, just for you, our dear customers.[/say]")

		saynn("A few laughs ripple through the bidders. Luxe doesn't wait for them to settle. He presents you.")

		saynn("[say=luxe]This one..[/say]")

		saynn("The projector focuses on you alone.")

		saynn("[say=luxe]Her little pet. Loyal, sure. But loyalty without power? Pointless.[/say]")

		saynn("The crowd stirs again, some bidders murmuring bids under their breath.")

		saynn("[say=luxe]Bidding starts at.. two hundred credits.[/say]")

		saynn("[say=mirri]Two hundred?!..[/say]")

		saynn("Mirri's outburst earns her a sharp impulse of electricity through her slave collar. She cries out from pain and collapses, her cheeks burning with humiliation while the shock makes her shake.")

		saynn("Luxe directs his next words to you two, his voice quiet.")

		saynn("[say=luxe]Be grateful I'm not paying someone to take you off my hands.[/say]")

		saynn("His words crush whatever defiance Mirri had left. SHe lowers her head, her body trembling.")

		saynn("The auction continues, Luxe's overall disinterest setting a grim tone. The bids come lazily, the crowd barely invested by the goods on display.")

		saynn("[sayMale]250. Great price for two future sextoys.[/sayMale]")

		saynn("[say=luxe]250 goes once. 250 goes twice. Sold.[/say]")

		saynn("And just like that.. a helper grabs your leashes.. and drags you offstage into the darkness.. towards your new owner..")

		saynn("[say=mirri]..he didn't even look at us..[/say]")

		saynn("Her voice cracks, barely audible. You glance at her.. but there is nothing to say.")

		saynn("Next moments are nothing but a blur. You're shoved into a transport pod.. the door closes behind you with a sharp hiss. The pod lurches forward, carrying you and Mirri toward an uncertain, likely grim future.")

		saynn("[b]BAD END[/b]: You and Mirri became slaves.")

		addButton("Restart", "Try again", "badend_restart")
		if (lostAtLeastOnce):
			addButton("Skip", "Skip to you winning the fight", "do_skip_luxe_fight")
		else:
			addDisabledButton("Skip", "Try at least once more")
	if(state == "join_luxe"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri", npcAction=["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"]})
		saynn("Mirri is a crazy bitch and there is no saving her. This choice was easy.")

		saynn("You glance at Luxe, then at Mirri, whose trembling hands clutch the gun. Her wild eyes dart between you and her father.")

		saynn("You step forward, moving deliberately to Luxe's side. Your expression hardens, meeting Mirri's shocked gaze.")

		saynn("[say=pc]Put the gun down, Mirri. It's over.[/say]")

		saynn("Her ears flick back sharply, her mouth quivering while she is trying to process what is happening.")

		saynn("[say=mirri]..You? No.. No, no no-no.. you did not just do that.. You did not just betray me..[/say]")

		saynn("Her voice cracks, disbelief is making her face muscles twitch.")

		saynn("[say=pc]Who said that I ever was on your side?[/say]")

		saynn("The catgirl slowly realizes.. that she is alone in this. Something in her shatters, her ears droop momentarily.. but her grip on the gun tightens, her only ally.")

		saynn("[say=mirri]You are.. so stupid..[/say]")

		saynn("[say=luxe]Whole world is against you, Mirri. Do the right thing for once.[/say]")

		saynn("[say=mirri]SHUT UP![/say]")

		saynn("Her arm jerks as she aims the gun back at Luxe. Her entire body shakes with barely contained fury.")

		saynn("[say=mirri]I HATE YOU. I HATE YOUR STUPID FAMILY, ALL OF THEM. I WILL KILL EVERY LAST BLACKTAIL. I WILL MURDER THEM ALL.[/say]")

		saynn("Luxe shows complete coldness, even at a gunpoint.")

		saynn("[say=luxe]Looks like you have decided to start with yourself first.[/say]")

		saynn("Mirri aims her gun at you next.")

		saynn("[say=mirri]AND YOU.. YOU LITTLE MISERABLE BACKSTABBING PILE OF SHIT.. I HATE YOU.[/say]")

		saynn("Her voice cracks more as fresh tears stream down her face, blending with the sheer rage.")

		saynn("[say=mirri]I HATE YOU MORE THAN I HATE MYSELF FOR BEING THIS STUPID.[/say]")

		saynn("[say=luxe]Then shoot.[/say]")

		saynn("Her aim flicks and she pulls the trigger.")

		saynn("[b]BANG.[/b]")

		saynn("The shot tears through tension like a blade. Sparks shower from the flickering holographic wall behind you.")

		saynn("[say=mirri]SHUT UP! SHUT UP! SHUT UP![/say]")

		saynn("The wall starts flickering on and off, casting chaotic shadows everywhere.")

		saynn("[say=mirri]SHUT UP! SHUT UP! SHUT UP!![/say]")

		saynn("Her screams are loud and annoying, more tears streaming down her cheeks as she points the gun back and forth between you and Luxe, fingers trembling. She is breaking down.. the cracks spreading too fast to contain.")

		saynn("[say=luxe]You were always weak, Mirri. Your mind and your body.[/say]")

		saynn("She is breathing heavily.")

		saynn("[say=mirri]..fuck.. you..[/say]")

		saynn("Looks like it's time to show Mirri her place. Gotta make sure not to lose this one.. or [b]bad things[/b] will surely happen to you.")

		addButton("Fight", "Start the fight", "luxe_fight_mirri")
	if(state == "luxe_fight_won"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri", npcAction="defeat"})
		saynn("Mirri hits the floor, unable to continue fighting. The gun slips from her grasp, sliding across the floor.")

		saynn("[say=mirri]F-FUCK!.. ugh..[/say]")

		saynn("She gasps for air, her heavy chest moving fast as she starts crawling toward the weapon. You calmly step forward and plant your {pc.foot} on her paw before she can reach it.")

		saynn("[say=pc]Bad girl. Such a bad, bad girl.[/say]")

		saynn("You nudge the gun further out of her reach, the sound of metal scraping against the floor echoing in the room. Her last hope is gone.")

		saynn("[say=mirri]Hh.. let go.. and g-go to hell..[/say]")

		saynn("[say=luxe]We will all meet there one day, Mirri.[/say]")

		saynn("Luxe approaches, standing tall over her defeated form. He places a heavy hand on your shoulder.")

		saynn("[say=luxe]Good job.[/say]")

		saynn("[say=mirri]GOOD JOB, YEAH. GOOD JOB FOR A SYNDICATE DOORMAT.[/say]")

		saynn("Her voice is raspy, laced with bitterness. Luxe produces a set of ropes and hands them to you.")

		saynn("[say=luxe]I will hold her. Tie her up, she doesn't need that armor anymore too.[/say]")

		saynn("[say=pc]Sure.[/say]")

		saynn("[say=mirri]What? I love this armor, hands off me, you fuckers..[/say]")

		saynn("Her voice cracks, desperation creeping in.. but there is no strength left in her to resist.")

		saynn("She thought she could take on the world..")

		addButton("Strip her", "Tie Mirri up and strip her naked", "luxe_strip_mirri")
	if(state == "luxe_strip_mirri"):
		playAnimation(StageScene.Hogtied, "idle", {pc="mirri", bodyState={naked=true}})
		addCharacter("mirri", ["naked"])
		saynn("Luxe is holding her pinned to the floor while you crouch down beside her, your hands brushing the edges of her armor.")

		saynn("She jerks slightly, trying to pull away, but she is too slow. You slide off her forearm guards, exposing more of her black fur.")

		saynn("[say=luxe]That.. is the armor of our enemies. Which makes you.. who?[/say]")

		saynn("[say=mirri]Fuck you.. hey-y..[/say]")

		saynn("Next.. her boots. You pull them off and toss them aside, exposing her hind paws, her toes curling as she is trying to break free.")

		saynn("[say=luxe]You won't need any of that.[/say]")

		saynn("[say=mirri]The fuck do you mean, quit it!.. Ghrrr-rh.. S-stupid..[/say]")

		saynn("Her leather corset is next.. which slides off as soon as you relax the lacing on its rear. Then you pull up her blue top, her cute perky tits are now out on display.")

		saynn("[say=mirri]You.. f-fucking.. p-perverts.. w-why are you doing this..[/say]")

		saynn("[say=luxe]Get used to it. Although, you were always a whore. So you will do just fine there.[/say]")

		saynn("Mirri begins to have her suspicions.. Seeing the ropes only confirmed them.")

		saynn("[say=mirri]Are you.. NO.. YOU ARE NOT. YOU'RE NOT GONNA DO THIS.[/say]")

		saynn("[say=luxe]I am. And I will.[/say]")

		saynn("The words hit her like a slap, her breath hitching.")

		saynn("[say=mirri]You're lying.. this is a bluff..[/say]")

		saynn("She only has her striped panties on now.. Luxe nods you to do it so you pull them down too, exposing her dry little pussy and tight tailhole, her tail now furiously wagging behind her. You shove her crumpled up panties into her mouth.. but she is quick to spit them out. Rude.")

		saynn("[say=mirri]You are NOT selling me. I am still BLACKTAIL![/say]")

		saynn("[say=luxe]Consider yourself disowned. Blacktail has no place for weak crazy sluts.[/say]")

		saynn("She shakes her head and violently thrashes against Luxe's hands while he keeps holding her down. You quickly begin tying her up, ropes going around her ankles and wrists, following the curves of her girly body to connect them together, hogtying her.")

		saynn("[say=mirri]What?.. No..[/say]")

		saynn("Tears begin collecting on the corners of her eyes. She is swaying from depressed to hysterical and back in mere seconds.")

		saynn("[say=luxe]You are not Blacktail anymore. You are nothing.[/say]")

		saynn("[say=mirri]No.. f-fuck you.. I'm s-still Blacktail.. You will fucking regret this! I'm gonna fucking kill you![/say]")

		saynn("[say=luxe]You're nothing but a product. The auction is gonna start soon.[/say]")

		saynn("She is crying again, the ropes now keep her completely helpless, sometimes rubbing against her exposed sensitive spots. You know that behind those teary eyes is a very cruel bitch, she is not gonna get any sympathy from you.")

		addButton("Continue", "See what happens next", "luxe_gives_pc_collar")
	if(state == "luxe_gives_pc_collar"):
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		saynn("You realize that you have a small problem.")

		saynn("[say=pc]Who's gonna sell her? We're down a presenter.[/say]")

		saynn("[say=luxe]You.[/say]")

		saynn("[say=pc]Me? But I'm not..[/say]")

		saynn("[say=luxe]You know what to do. You've seen how it's done.[/say]")

		saynn("He hands you an unlocked slave collar and a chain leash.")

		saynn("[say=luxe]Mirri couldn't do it without you. But you don't need her.[/say]")

		saynn("[say=pc]Do you really want me to sell your.. her?[/say]")

		saynn("He nods.")

		saynn("[say=luxe]Mirri is a mistake, always was. I'm not gonna kill her. But I'm not gonna let her stay.[/say]")

		saynn("Mirri is quietly sobbing, her body trembling against the ropes.")

		saynn("[say=mirri]I hate you.. both of you.. you don't have to do this..[/say]")

		saynn("Really? She is begging now after trying to murder you?")

		saynn("[say=pc]You're a psycho, Mirri. I wanted to do this from the day that I saw you.[/say]")

		addButton("Collar her", "Lock the slave collar around Mirri's neck", "luxe_lock_collar")
	if(state == "luxe_lock_collar"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri", npcBodyState={naked=true, leashedBy="pc"}})
		aimCameraAndSetLocName("market_market")
		removeCharacter("luxe")
		saynn("Mirri looks up at you, her once mean glare now dimmed by the tears streaming down her cheeks. Despite her protests, she doesn't thrash anymore. She seems to be worn out.. physically, emotionally, and mentally.")

		saynn("[say=pc]This is your doing. No one else's.[/say]")

		saynn("Her ears flatten against her head as her lips tremble, but she doesn't speak.")

		saynn("You lean closer.. and bring the unlocked slave collar around her neck.")

		saynn("[say=mirri]Don't..[/say]")

		saynn("[b]Click.[/b]")

		saynn("The collar snaps closed, the harsh metal click echoing around the room. You don't respond to her words and clip a leash to the ring on the front of her collar instead before giving it a gentle tug, enough to make her sit upright. Luxe watches, arms crossed, his face unreadable.")

		saynn("[say=luxe]You know what to do. Handle it cleanly and you will get every credit for her sale.[/say]")

		saynn("Wow. 100% of the credits for selling Mirri? That's a great deal. Clearly her ex-father doesn't want to have anything hers.")

		saynn("And with that, Luxe leaves his office, leaving you alone with Mirri. Her tone quickly changes.")

		saynn("[say=mirri]I will murder you.. you know..[/say]")

		saynn("Her voice is barely above a whisper.. but it is a very threatening whisper.")

		saynn("[say=pc]No you won't.[/say]")

		saynn("[say=mirri]You forgot that I'm a spy? I will find a way to escape.. and then I will come find you..[/say]")

		saynn("You yank on her leash, making her stand.")

		saynn("[say=pc]Let's go, slave.[/say]")

		saynn("The two of you leave Luxe's office, Mirri stepping behind you, the ropes allowing only small humiliating hops for her.")

		saynn("[say=mirri]I know the coordinates.. I know how to get to you.. it's all in my head..[/say]")

		saynn("You follow the corridors, heading towards the auction platform. Mirri is slow so you have to occasionally yank on the leash again.")

		saynn("[say=pc]Very scary.[/say]")

		saynn("[say=mirri]You're screwed, {pc.name}.. You are so.. dead.. or worse..[/say]")

		saynn("She sure barks a lot for a cat.")

		saynn("[say=pc]You couldn't even kill your dad when you had the chance.[/say]")

		saynn("[say=mirri]Oh, but he is not my dad now. Nothing holds me back anymore. Nothing can stop me.[/say]")

		saynn("You bring her to the auction platform. But today she will be taking a different spot, playing a different role. The irony..")

		saynn("[say=pc]Chains can, Mirri. And they will.[/say]")

		addButton("Chains", "Chain her to the ceiling", "luxe_do_chain")
	if(state == "luxe_do_chain"):
		playAnimation(StageScene.HangingDuo, "idle", {pc="mirri", npc="pc", bodyState={naked=true}})
		saynn("You position her in the right spot before taking her wrists and pulling them up above her head. She struggles faintly.. but her resistance is half-hearted at best.")

		saynn("[say=mirri]Chains, pff.. Whoever buys me is gonna regret it big time. I will make their life a living hell.[/say]")

		saynn("Somehow, you believe her.")

		saynn("You put the chained cuffs on her wrists and tug on the chains, forcing her arms to stretch upward. She is not fully exposed, her girly figure standing on her toes.")

		saynn("[say=pc]Ready to be sold off?[/say]")

		saynn("She rolls her watery eyes.")

		saynn("[say=mirri]..do your worst, bitch.[/say]")

		saynn("You stand on the presenter's platform. Behind the black curtains there is little quiet chatter, the bidders slowly arriving and taking their spots. Huh. So this is how it feels.")

		saynn("[say=pc]Show time.[/say]")

		saynn("You realize that presenting her so badly that she doesn't get sold.. might be a fun option too. Who knows what will happen then.. You probably won't get any credits though.")

		addButton("Auction", "Time to do this", "luxe_start_auction")
	if(state == "luxe_failed_to_sell"):
		saynn("The bidders begin to leave, the black curtains close.")

		saynn("You failed to sell Mirri.. Not a single bid was made.")

		saynn("[say=mirri]Wait! Are you fucking serious! You couldn't even do THIS right![/say]")

		saynn("You glance over at Mirri, still chained to the ceiling. Her ears are flat, her face burning, her tear-streaked cheeks are now flushed with anger, her claws scraping against the chains.")

		saynn("[say=mirri]You did this on purpose, didn't you?! You FUCKER! You f-fucking..[/say]")

		saynn("You shrug, refusing to meet her furious gaze. Before she can scream more, a pair of staff members approach her, their movements precise and practiced as they clip a leash to Mirri's collar and then uncuff her.")

		saynn("[say=mirri]Do you even realize what they are gonna do to me?! YOU.. F-fucking..[/say]")

		saynn("The staff yanks on her leash and she stumbles, her resistance weak but vocal.")

		saynn("[say=mirri]NO! Get your filthy hands off me![/say]")

		saynn("[sayMale]You know the rules. Unsold stock gets repurposed.[/sayMale]")

		saynn("They pull her toward one of the side corridors, the dimly lit path leading somewhere that's unknown to you. Mirri digs her paws into the floor.. but it's no use, the staff is too strong.")

		saynn("Mirri jerks her head toward you, her desperate eyes blazing.")

		saynn("[say=mirri]HEY! I'm talking to you! Look at me, you fuck![/say]")

		saynn("You watch the whole process.. but don't respond. Mirri tries to bite one of them.. but only gets dropped by her shock collar.")

		saynn("[say=mirri]ARGH!.. ALL YOU HAD TO DO WAS TO SELL ME.[/say]")

		saynn("She is squirming around on the floor, the electricity making her thrash against the ropes, some of them digging into her sensitive spots harder.")

		saynn("[say=mirri]YOU DID THIS TO ME! ON PURPOSE! You.. You FUCKING PIECE OF-..[/say]")

		saynn("Her words dissolve into incoherent curses as they drag her away. You watch as her silhouette vanishes into the shadows, her voice echoing faintly.. until silence settles over the market again..")

		saynn("Well.. That was that.")

		saynn("You didn't get any credits for that.. but it was pretty fucking worth it anyway.")

		addButton("Continue", "See what happens next", "luxe_badauction_after")
	if(state == "luxe_badauction_after"):
		GM.pc.setLocation("market_market")
		removeCharacter("mirri")
		addCharacter("luxe")
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		saynn("You stand at the edge of the stage, staring at the black curtains swaying gently as Luxe steps through, his expression unreadable.. cold as ever.")

		saynn("He approaches you.")

		saynn("[say=pc]I didn't quite manage to sell her.[/say]")

		saynn("His brows twitch for a second.")

		saynn("[say=luxe]Doesn't matter anymore. She was weak anyway.[/say]")

		saynn("[say=pc]So.. what happens now?[/say]")

		saynn("Without a word, he reaches into his pocket and retrieves a credit chip. Its surface is all polished and shiny.. it looks like it's made out of pure gold, wow. He tosses it to you, its weight surprisingly heavy in your hand.")

		saynn("[say=luxe]For your troubles. Blacktail Market's curtains are always open for more AlphaCorp merchandise.[/say]")

		saynn("His tone is casual, businesslike, as if everything that just happened was just a transaction. In a way, it was.")

		saynn("[say=pc]Is there a way you can remove my collar? Make me free?[/say]")

		saynn("His eyes narrow slightly as they scan your face.")

		saynn("[say=luxe]No.[/say]")

		saynn("Was worth a shot.")

		saynn("[say=luxe]You did well. But if you want to prove yourself to the Syndicate.. it will take more than this.[/say]")

		saynn("[say=pc]Sure. If you say so.[/say]")

		saynn("He nods.. and then steps off the stage, now with one less daughter.")

		saynn("You stand there a moment longer, the credit chip glinting in your palm. Luxe's silhouette fades behind the curtains, leaving behind only the echoes of his footsteps on the hollow wooden stage.")

		saynn("She was a bitch anyway. A kitten who thought she could become an alpha in a den of wolves.")

		saynn("And you? You're still here. Still standing.")

		saynn("She lost. And you won.")

		saynn("(( This is where this content ends. Thank you for playing <3 ))")
		setFlag("SlaveAuctionModule.r6outcome", "mirrigone")
		setFlag("SlaveAuctionModule.customLuxeGreeting", "Hey there.")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "luxe_after_sold"):
		saynn("You offer the bidders a polite bow, ending the auction.")

		saynn("Mirri's lips and eyes twitch, a slaver that got sold herself. The irony is strong here.. but you're afraid that she won't appreciate it. Who cares though.")

		saynn("A pair of staff members approach the freshly sold slave, their movements precise and practiced as they clip a leash to Mirri's collar and then uncuff her.")

		saynn("[say=mirri]Yeah, yeah.. do your thing. Get it over with already.[/say]")

		saynn("The staff yanks on her leash and she stumbles, growling in the process.")

		saynn("[say=mirri]EASY! You fuckers.. Ow..[/say]")

		saynn("She gives you a mean glare as she gets pulled by. Her cheeks are still tear-streaked from her previous tantrums. What a weird girl.")

		saynn("[say=mirri]You broke my heart, soft {pc.boy}. I won't forget it.[/say]")

		saynn("[say=pc]Good. Enjoy your new life.[/say]")

		saynn("[say=mirri]Oh, I will.[/say]")

		saynn("She gets pulled away into the darkness, to her new owner who gives her ass a firm smack.. and then quickly gets part of his ear bitten off by Mirri's sharp teeth. Ow. You get a feeling that she will do just fine.")

		saynn("The curtains begin to close.. giving you the last glimpses of those crazy blue glowing eyes.. before she is gone forever from your life.")

		addButton("Continue", "See what happens next", "luxe_mirrisold_good")
	if(state == "luxe_mirrisold_good"):
		GM.pc.setLocation("market_market")
		removeCharacter("mirri")
		addCharacter("luxe")
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		saynn("You stand at the edge of the stage, staring at the black curtains swaying gently as Luxe steps through, his expression unreadable.. cold as ever.")

		saynn("He approaches you.")

		saynn("[say=pc]She wasn't too upset in the end.[/say]")

		saynn("His brows twitch for a second.")

		saynn("[say=luxe]She might be weak.. but her mind is sharp. She will be fine, a new life is what she needed, as far away from me as possible.[/say]")

		saynn("This will do it, yeah.")

		saynn("[say=pc]So.. what happens now?[/say]")

		saynn("Without a word, he reaches into his pocket and retrieves a credit chip. Its surface is all polished and shiny.. it looks like it's made out of pure gold, wow. He tosses it to you, its weight surprisingly heavy in your hand.")

		saynn("[say=luxe]Her full price, as we agreed. Blacktail Market's curtains are always open for more AlphaCorp merchandise.[/say]")

		saynn("His tone is casual, businesslike, as if everything that just happened was just a transaction. In a way, it was.")

		saynn("[say=pc]Is there a way you can remove my collar? Make me free?[/say]")

		saynn("His eyes narrow slightly as they scan your face.")

		saynn("[say=luxe]No.[/say]")

		saynn("Was worth a shot.")

		saynn("[say=luxe]You did well. But if you want to prove yourself to the Syndicate.. it will take more than this.[/say]")

		saynn("[say=pc]Sure. If you say so.[/say]")

		saynn("He nods.. and then steps off the stage, now with one less daughter.")

		saynn("You stand there a moment longer, the credit chip glinting in your palm. Luxe's silhouette fades behind the curtains, leaving behind only the echoes of his footsteps on the hollow wooden stage.")

		saynn("She was a bitch anyway. A kitten who thought she could become an alpha in a den of wolves.")

		saynn("And you? You're still here. Still standing.")

		saynn("She lost. And you won.")

		saynn("(( This is where this content ends. Thank you for playing <3 ))")
		setFlag("SlaveAuctionModule.r6outcome", "mirrislave")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "luxe_fight_lost"):
		playAnimation(StageScene.Duo, "defeat", {npc="mirri", npcAction=["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"]})
		saynn("You hit the floor.. unable to continue fighting. Your breath is shallow, muscles are refusing to obey.. Which means.. you lost.")

		saynn("Mirri looms above you, gun in hand. Her chest rises and falls with exhaustion, though she hides it well. Her stance isn't as steady as before.. her legs are trembling a bit.")

		saynn("[say=mirri]Pathetic. You have always been useless.[/say]")

		saynn("[say=pc]Drop your gun and then we'll talk.[/say]")

		saynn("Her ears twitch, a mocking smirk curling her lips.")

		saynn("[say=mirri]Nah, soft {pc.boy}. You lost your privileges when you decided to DOUBLE CROSS ME. Now there is only one thing I will do with you.[/say]")

		saynn("Luxe exhales heavily, his gaze drifting to the floor. Mirri doesn't miss the subtle movement and aims her gun at him.")

		saynn("[say=mirri]Why are you sad, daddy? What's wrong? Your fuckbuddy turned out to be a weak ass slut?[/say]")

		saynn("[say=luxe]No.[/say]")

		saynn("Mirri reloads her gun in a single second, double checking that she has a bullet chambered.")

		saynn("[say=mirri]Look at me when I'm talking to you![/say]")

		saynn("Luxe lifts his head, meeting her gaze. His expression is unreadable.. eyes cold, calculating. It only seems to agitate her further.")

		saynn("[say=mirri]Here is how this is going to go. You're going to swear.. right now, on your life.. that I will be the next head of this family. Do it, or you die.[/say]")

		saynn("Luxe tilts his head slightly.")

		saynn("[say=luxe]No.[/say]")

		saynn("Mirri blinks many times, her eyes confused.")

		saynn("[say=mirri]Excuse me? I got a fucking gun pointed at you. Do you really wanna die?[/say]")

		saynn("Without a word, Luxe straightens and pushes off the desk, taking a deliberate step forward.")

		saynn("[say=mirri]Hey! HEY! Not a step closer, you fuck![/say]")

		saynn("But he doesn't stop. He moves toward her, his step that of a predator cornering its prey.")

		addButton("Continue", "See what happens next", "luxe_badend_choke")
	if(state == "luxe_badend_choke"):
		playAnimation(StageScene.Choking, "idle", {pc="luxe", npc="mirri"})
		saynn("Before Mirri can react, Luxe's hands clamp around her throat.")

		saynn("[say=mirri]Ghh-h..[/say]")

		saynn("Her gun slips from her grasp, dropping down to the floor. Instinctively, she claws at his hands, her sharp claws digging deep, drawing blood. Luxe doesn't flinch, doesn't loosen his grip. His fur begins to glow faintly, embers flickering off him like sparks from a dying fire.")

		saynn("[say=luxe]You are weak.[/say]")

		saynn("His voice is calm and steady..")

		saynn("[say=mirri]Khh..[/say]")

		saynn("[say=luxe]I should have done this many years ago. Excuse my slowness.[/say]")

		saynn("Her eyes widen in panic as she fights to pull his hands away, her body writhing in desperation.")

		saynn("[say=luxe]You stupid..[/say]")

		saynn("Her tail lashes wildly, batting against the wall and the floor, her body gradually betraying her. She gasps, choking as her strength fades, her claws raking uselessly at his unmoving grip. Luxe's glowing fur burns brighter, casting shadows everywhere..")

		saynn("[say=luxe]Useless..[/say]")

		saynn("Mirri's mouth is wide open but she can't produce a single noise, her eyes get heavier and heavier, her grip relaxing.. while Luxe just keeps strangling the life out of his daughter. Her tail droops down.. and stumbles upon something.. something cold..")

		saynn("[say=luxe]Whore..[/say]")

		saynn("Mirri's tail catches that something and tosses it up..")

		saynn("[b]BANG.[/b]")

		addButton("Continue", "See what happens next", "luxe_gets_killed_by_mirri")
	if(state == "luxe_gets_killed_by_mirri"):
		removeCharacter("luxe")
		playAnimation(StageScene.Solo, ["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"], {pc="mirri"})
		saynn("A deafening gunshot echoes around the room.")

		saynn("Luxe.. looks down at his chest.. and sees a bleeding hole.. golden-colored glowing blood already ruins his fancy Syndicate uniform.")

		saynn("[b]BANG. BANG.[/b]")

		saynn("Two more shots tear through him, his body jolting with each one.. Luxe's grip relaxes as he stumbles back, gasping softly..")

		saynn("Mirri coughs and hungrily grabs all the air she can, her neck now has obvious dark bruises all around it.")

		saynn("Luxe stares at her, clutching at his wounds as golden blood pours through his fingers. He opens his mouth.. but no words come out. His legs falter.. and he sinks to his knees.")

		saynn("[say=mirri]Khh.. See you in hell.. you fuck..[/say]")

		saynn("[b]BANG.[/b]")

		saynn("Luxe collapses onto the floor, golden blood leaking out of a gaping hole in his head. And then, his body suddenly catches fire.. In seconds, all that remains is ash, scattered across the wooden floor.")

		saynn("Mirri is still breathing heavily, her eyes crazy, darting around the room.. until they see you.")

		saynn("[say=mirri]You.[/say]")

		saynn("She puts the gun away.. and produces a chain leash instead.")

		saynn("[say=mirri]..are coming with me.[/say]")

		addButton("Continue", "See what happens next", "luxe_badend_market")
	if(state == "luxe_badend_market"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="mirri", pc="pc", bodyState={naked=true}})
		aimCameraAndSetLocName("market_market")
		saynn("Next moment you remember.. you are chained to the ceiling.")

		saynn("A powerful projector hits your face with a blast of light.")

		saynn("[say=mirri]WELCOME.. WELCOME TO THE FUCKING BLACKTAIL MARKET![/say]")

		saynn("You can't see.. but you can get a pretty good idea about where you are.")

		saynn("[say=mirri]MY NAME IS MIRRI BLACKTAIL AND I JUST MURDERED THE BIGGEST ASSHOLE OF MY LIFE![/say]")

		saynn("You squint against the light, catching a hazy glimpse of her.. Mirri Blacktail is standing on a raised platform, her stance triumphant, her eyes glowing with manic satisfaction.")

		saynn("[say=mirri]LET'S CELEBRATE THIS BY SELLING THIS STUPID WHORE. THIS TRAITOR WHO THOUGHT THEY COULD GET AWAY WITH BETRAYING ME. THIS TRAITOR.. WHO I LOVED DEARLY..[/say]")

		saynn("You squint more.. and see the bidders.. faceless figures. Shit..")

		saynn("[say=mirri]BUT YOU KNOW THE SAYING.. SOMETIMES YOU NEED TO KILL YOUR DARLINGS.. AND SO HERE I AM.[/say]")

		saynn("You tug on the chains but they don't give.. you're screwed and you know it.")

		saynn("[say=mirri]LET THE BIDDING BEGIN![/say]")

		saynn("Next moments are a total blur.. Distorted voices, numbers, Mirri yelling and laughing, one paw on her hip. She is in her element.")

		saynn("And then..")

		saynn("[say=mirri]SOLD! Five thousand credits, that's a great price for such a nice product![/say]")

		saynn("Mirri's grin fades slightly as she watches the staff approach you. For a brief moment, something flickers in her eyes.. an echo of the pain and anger that led her here. But it's gone just as quickly, replaced by smug satisfaction.")

		saynn("She steps closer to you, her voice dropping down to a private whisper.")

		saynn("[say=mirri]Goodbye, love. Try not to die too quickly.[/say]")

		saynn("You are getting dragged off by a leash towards your new owner.. next moment.. you are already on some unknown spaceship.. its engines humming ominously.")

		saynn("The doors close behind you.. sealing your fate.. The ship picks a direction and starts flying.. somewhere..")

		saynn("Freedom is gone, the remains of it that you had.. Mirri has won.. And now, you are nothing but someone's property, lost in the void forever..")

		saynn("[b]BAD END[/b]: You got sold off at a Blacktail Market.")

		addButton("Restart", "Try again", "badend_restart_luxe")
		if (lostAtLeastOnce):
			addButton("Skip", "Skip to you winning the fight", "do_skip_mirri_fight")
		else:
			addDisabledButton("Skip", "Try at least once more")

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

	if(_action == "middle_mirri_leaves"):
		processTime(3*60)
		GM.pc.addCredits(250)
		addMessage("You received 250 credits!")
		setFlag("SlaveAuctionModule.mirriNotBlacktail", true)
		addExperienceToPlayer(250)

	if(_action == "middle_meetmirriafter"):
		processTime(3*60)

	if(_action == "middle_end"):
		processTime(3*60)

	if(_action == "mirri_sudden"):
		processTime(3*60)

	if(_action == "mirri_luxe_about_to_fight"):
		processTime(3*60)

	if(_action == "start_fight_with_luxe"):
		runScene("FightScene", ["luxe", "finalFight"], "luxeFight")
		return

	if(_action == "mirri_on_luxe"):
		processTime(3*60)

	if(_action == "mirri_luxe_about_to_die"):
		processTime(3*60)

	if(_action == "mirri_gives_chance"):
		processTime(3*60)

	if(_action == "mirri_luxe_dead"):
		processTime(3*60)

	if(_action == "mirri_after_all"):
		processTime(3*60)

	if(_action == "mirri_lost_badend"):
		getCharacter("mirri").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("oldcollar"))
		getCharacter("mirri").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("inmatewristcuffs"))
		getCharacter("mirri").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("inmateanklecuffs"))

	if(_action == "badend_restart"):
		GM.pc.addPain(-GM.pc.getPain())
		GM.pc.addLust(-GM.pc.getLust())
		GM.pc.addStamina(GM.pc.getMaxStamina())
		setState("mirri_mans_up")
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		getCharacter("mirri").getInventory().clearSlot(InventorySlot.Neck)
		getCharacter("mirri").getInventory().clearSlot(InventorySlot.Wrists)
		getCharacter("mirri").getInventory().clearSlot(InventorySlot.Ankles)
		lostAtLeastOnce = true
		return

	if(_action == "do_skip_luxe_fight"):
		GM.pc.addPain(-GM.pc.getPain())
		GM.pc.addLust(-GM.pc.getLust())
		GM.pc.addStamina(GM.pc.getMaxStamina())
		getCharacter("mirri").getInventory().clearSlot(InventorySlot.Neck)
		getCharacter("mirri").getInventory().clearSlot(InventorySlot.Wrists)
		getCharacter("mirri").getInventory().clearSlot(InventorySlot.Ankles)
		setState("mirri_fight_won")
		return

	if(_action == "luxe_fight_mirri"):
		runScene("FightScene", ["mirri", "finalFight"], "mirriFight")
		return

	if(_action == "luxe_strip_mirri"):
		processTime(3*60)
		getCharacter("mirri").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ropeharness"))
		getCharacter("mirri").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ZiptiesWrist"))

	if(_action == "luxe_gives_pc_collar"):
		processTime(3*60)
		setFlag("SlaveAuctionModule.mirriNotBlacktail", true)

	if(_action == "luxe_lock_collar"):
		processTime(3*60)
		getCharacter("mirri").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("oldcollar"))
		getCharacter("mirri").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ZiptiesWrist"))

	if(_action == "luxe_do_chain"):
		processTime(3*60)
		getCharacter("mirri").getInventory().clearSlot(InventorySlot.Torso)

	if(_action == "luxe_start_auction"):
		runScene("SlaveAuctionScene", ["mirri", getModule("SlaveAuctionModule").getAuctionSettings(), "pc"], "slave_auction")
		return

	if(_action == "luxe_badauction_after"):
		processTime(3*60)
		GM.pc.addCredits(250)
		addMessage("You got 250 credits!")

	if(_action == "luxe_mirrisold_good"):
		processTime(3*60)
		GM.pc.addCredits(creditsToGive)
		addMessage("You received "+str(creditsToGive)+" credits!")

	if(_action == "badend_restart_luxe"):
		GM.pc.addPain(-GM.pc.getPain())
		GM.pc.addLust(-GM.pc.getLust())
		GM.pc.addStamina(GM.pc.getMaxStamina())
		setState("mirri_mans_up")
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		lostAtLeastOnce = true
		return

	if(_action == "do_skip_mirri_fight"):
		GM.pc.addPain(-GM.pc.getPain())
		GM.pc.addLust(-GM.pc.getLust())
		GM.pc.addStamina(GM.pc.getMaxStamina())
		setState("luxe_fight_won")
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "luxeFight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("mirri_fight_won")
			addExperienceToPlayer(250)
		else:
			setState("mirri_fight_lost")

	if(_tag == "mirriFight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("luxe_fight_won")
			addExperienceToPlayer(250)
		else:
			setState("luxe_fight_lost")

	if(_tag == "slave_auction"):
		processTime(2 * 60)
		var wasSold = _result[0]["wasSold"] if (_result.size() > 0 && _result[0].has("wasSold")) else true
		
		if(wasSold):
			var creditsAmount = _result[0]["winningBid"]
			var pcNewCredits:int = int(creditsAmount)
			creditsToGive = pcNewCredits
			
			setState("luxe_after_sold")
		
		else:
			setState("luxe_failed_to_sell")

func saveData():
	var data = .saveData()

	data["lostAtLeastOnce"] = lostAtLeastOnce
	data["creditsToGive"] = creditsToGive

	return data

func loadData(data):
	.loadData(data)

	lostAtLeastOnce = SAVE.loadVar(data, "lostAtLeastOnce", false)
	creditsToGive = SAVE.loadVar(data, "creditsToGive", 0)
