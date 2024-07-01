extends SceneBase

var isFirstTime = false
var shyness = 0.0
var pawslut = 0.0
var grabCollar = false
var willHappenAnyway = false

func _init():
	sceneID = "articaS6CanteenTalkScene"

func _reactInit():
	isFirstTime = getFlag("ArticaModule.s6FirstTime", false)
	if(!isFirstTime):
		setState("intro")
	setFlag("ArticaModule.s6FirstTime", true)

func _run():
	if(state == "intro"):
		addCharacter("artica")
		playAnimation(StageScene.PawJobUnderTable, "start", {npc="pc", pc="artica"})
		saynn("You do the usual, grabbing a prisoner's meal before heading for Artica's table.")

		saynn("She seems to be.. under the table? Well, her head is. Artica is still sitting on the bench, just bending very low, her hands seem to be doing something with her hind paws.")

		saynn("[say=pc]Hey there.[/say]")

		saynn("[say=artica]EEP![/say]")

		saynn("Bonk.")

		saynn("Poor fluff hits the back of her head on the table.")

		saynn("[say=pc]Oops. Didn't mean to startle you.[/say]")

		var didMassage = getFlag("ArticaModule.s5GaveMassage", false)
		if (didMassage):
			saynn("Artica sits up and rubs the back of her head.")

			saynn("[say=artica]It's okay..[/say]")

		else:
			saynn("Artica finishes taking off the elastic bandage and sits up, her hand rubs the back of her head.")

			saynn("[say=artica]It's okay..[/say]")

		saynn("She pulls up her hind paw and takes a look at the pawpads, probably to make sure they're alright.")

		addButton("Continue", "See what happens next", "")
	if(state == ""):
		addCharacter("artica")
		playAnimation(StageScene.PawJobUnderTable, "start", {npc="pc", pc="artica"})
		saynn("You sit near Artica in the canteen.")

		shyness = getModule("ArticaModule").getShyness()
		pawslut = getModule("ArticaModule").getPawSlut()
		saynn("Shyness: "+str(getModule("ArticaModule").getShynessString())+"")

		if (pawslut  > 0.0):
			saynn(""+str(getModule("ArticaModule").getPawslutString())+"")

		if (shyness <= 0.0):
			saynn("Huh.. You notice that Artica's hands are under the table, doing something.")

			addButton("Under table", "(Next stage) See what it is that Artica is doing", "start_corrupt")
		if (!getFlag("ArticaModule.s6AskedLeg")):
			addButton("How is leg", "Ask Artica how is her leg doing", "ask_leg")
		else:
			if (!getFlag("ArticaModule.s6AskedRisha")):
				addButton("Risha", "Ask if Risha is still bullying Artica", "ask_risha")
		if (!getFlag("ArticaModule.s6AskedPaws")):
			addButton("Paws", "Ask Artica if she has interest in paws", "ask_paws")
		if (getFlag("ArticaModule.s6AskedRisha") && getFlag("ArticaModule.s6AskedPaws")):
			if (!getFlag("ArticaModule.s6AskedMood")):
				addButton("How's mood", "Just ask Artica about her overall mood", "ask_mood")
		addButton("Get kinky", "Show a list of lewd stuff that you can try to do", "get_kinky_menu")
		var eatLastDay = getFlag("ArticaModule.s6ateday", 0)
		if (GM.main.getDays() > eatLastDay):
			addButton("Eat together", "Just spend some time together", "just_eat_together")
		else:
			addDisabledButton("Eat together", "You already did that")
		addButton("Enough chat", "Time to go", "endthescene")
	if(state == "just_eat_together"):
		saynn("You and Artica spend some time together, casually chatting and consuming your meals.")

		if (shyness > 0.6):
			saynn("Not much has happened.. The fluff is still quite shy in your presence, avoiding eye contact and just staring at her tray.")

		elif (shyness > 0.0):
			saynn("Not much has happened.. but looks like the fluff is getting used to your presence more.")

		else:
			saynn("The fluff fidgets a lot and doesn't mind asking you certain questions.. mostly about how the prison works.. but also about you specifically.")

		addButton("Continue", "See what happens next", "")
	if(state == "get_kinky_menu"):
		if (shyness > 0.6):
			saynn("Artica is still quite shy. Doing some kinky things with her should help her to open up.")

		else:
			saynn("Your actions seem to help Artica to open up. What do you want to do with her?")

		addButton("Check beans", "Make sure Artica's hind leg is still alright", "kinky_checkbeans")
		addButton("Headpats", "Give Artica some headpats. For no reason in particular", "kinky_headpats")
		addButton("Force her", "The best way to force Artica out of her comfort zone is by shoving her face into your crotch!", "do_force_her")
		addButton("Back", "Go to the previous menu", "")
	if(state == "kinky_headpats"):
		playAnimation(StageScene.Grope, "pat", {pc="artica", npc="pc"})
		if (shyness > 0.7):
			saynn("You get up and approach Artica before giving her a pat on the head.")

			saynn("[say=artica]Eep..[/say]")

			saynn("She leans to the side and looks at you, confused and embarrassed.")

			saynn("[say=artica]W-wha?..[/say]")

			saynn("[say=pc]Just felt like giving you a pat, calm down fluff.[/say]")

			saynn("[say=artica]Oh-h..[/say]")

			saynn("Maybe you just need to pat her more to help her get used to it.")

		elif (shyness > 0.5):
			saynn("You approach Artica and decide to give her a small headpat.")

			saynn("[say=artica]Yip..[/say]")

			saynn("Her ears flick slightly as you give her a few more.")

			saynn("At least she doesn't recoil away.")

		elif (shyness > 0.3):
			saynn("You approach Artica and decide to give her a few pats on the head. The fluff smiles and leans into the pats, chrrrrring contently as you deliver one pat after another.")

			saynn("[say=pc]Adorable.[/say]")

			saynn("Her ears flick slightly as you give her a few more.")

			saynn("She seems to be getting used to this.")

		else:
			saynn("You approach Artica and give her a few good pats on the head. The fluff smiles and leans into the pats, chrrrrring contently as you deliver one pat after another, her ears bob up and down.")

			saynn("[say=artica]N-nya-ah..[/say]")

			saynn("Your free hand finds one of her ears and starts scritching behind it. That causes Artica's hind paw to move involuntarily. Looking at it, you find a perfect scratching spot.. Headpats coupled with scritches makes the fluff moan softly, her leg kicking the floor!")

		addButton("Continue", "See what happens next", "")
	if(state == "do_force_her"):
		playAnimation(StageScene.ChairCrotchSniff, "prepare", {pc="artica", npc="pc"})
		saynn("You know exactly what will make Artica stop being so shy. You doubt that she will be down for it.. feels like she never is. So you just gotta force a little.")

		saynn("[say=pc]Hey, Artica.[/say]")

		saynn("Her ears perk, hearing your strict voice. You get up and position yourself in front of the girl.")

		saynn("[say=artica]Eep?..[/say]")

		saynn("[say=pc]Look at me. Now.[/say]")

		saynn("She raises her gaze slowly. Eye contact makes her get all small and shy again. You sigh, annoyed. A threat of punishment might help here..")

		saynn("[say=pc]Look me in the eyes. And don't dare to pull away. Or I will have your muzzle sniffing my crotch.[/say]")

		saynn("[say=artica]Oh..[/say]")

		saynn("Artica starts to look up at you again, gradually shifting her gaze higher and higher.. until it collides with your stern one. Her deep cyan eyes are so.. cute.")

		saynn("At first, she is doing alright, holding eye contact. But very soon, her body begins to sway from side to side a bit.. her tail curling around the chair.. her hind paws standing on curling toes.. her eyes blinking a lot..")

		saynn("..until she can't take it anymore. Artica looks away.")

		saynn("Well..")

		addButton("Grab her", "Do what you promised to do", "kinky_force_sniff")
	if(state == "kinky_force_sniff"):
		playAnimation(StageScene.ChairCrotchSniff, "sniff", {pc="artica", npc="pc"})
		saynn("You walk up to Artica.. and grab her by the hair, forcing her to see your mean face..")

		saynn("[say=artica]Ow.. eep.. e-e.. ah.. w-wai-..[/say]")

		saynn("..before you yank her close, her snout gets pushed against your crotch.."+str(" against your {pc.penis}.." if GM.pc.hasPenis() else (" against your pussy.." if GM.pc.hasReachableVagina() else ""))+"")

		saynn("[say=artica]Agh!.. H-hey.. eep.. e-ep..[/say]")

		saynn("[say=pc]Sniff! I wanna hear you take in my scent, girl.[/say]")

		saynn("She tries to pull away.. tries. Artica is barely putting up any resistance, letting you drag her face over your crotch.")

		saynn("[say=artica]W-wai-.. nn.n..[/say]")

		saynn("[say=pc]SNIFF![/say]")

		saynn("Artica closes her eyes and audibly huffs in your scent.")

		saynn("[say=artica]Hh-h.. mhh-h..[/say]")

		if (GM.pc.hasPenis()):
			saynn("[say=pc]More. I want you to get some of that cock's odor.[/say]")

			saynn("Artica's snout is stuck into the area under your shaft and above your balls. Each time she breathes in, your strong scent fills her lungs..")
		
		elif (GM.pc.hasVagina()):
			saynn("[say=pc]More. I want you to get some of that pussy's odor.[/say]")

			saynn("Artica's snout is directly brushing against your needy pussy. Each time she breathes in, your strong horny scent fills her lungs..")

		else:
			saynn("[say=pc]More.[/say]")

			saynn("Artica's snout is directly brushing against your crotch. Each time she breathes in, your strong horny scent fills her lungs..")

		saynn("She keeps huffing and puffing but you don't let go. Eventually, her weak resistance begins to fade..")

		saynn("[say=artica]Mmm-m.. ah-.. ahm..[/say]")

		saynn("Artica is making cute muffled noises. The lack of resistance allows you to start grinding her face across your crotch.. making sure that your scent will stay with her for a while.")

		saynn("[say=artica]..nn-nh-h.. n-nya-ah.. gods..[/say]")

		saynn("The more she breathes it in, the more she melts from it.")

		saynn("After this.. treatment.. you finally pull away from her.")

		saynn("[say=pc]Now look at me.[/say]")

		saynn("Artica's eyes.. are sparkling with joy.. she looks a bit high even. The girl establishes eye contact with you, her cheeks blushing deeply.")

		saynn("Seconds pass.. but she doesn't look away. Hah. She is just squirming and moaning softly, her shorts bulging visibly.")

		saynn("[say=pc]Good girl. You're not shy anymore, are you?[/say]")

		saynn("[say=artica]Mhh-hm.. m-maybe.. ah..[/say]")

		saynn("Well, the progress is obvious.")

		addButton("Continue", "See what happens next", "")
	if(state == "kinky_checkbeans"):
		playAnimation(StageScene.CheckPaw, "tease", {pc="artica", npc="pc"})
		saynn("You get up and crouch near Artica's bench.")

		if (shyness > 0.6):
			saynn("[say=artica]Umm.m..[/say]")

			saynn("[say=pc]I wanna make sure your paw is alright.[/say]")

			saynn("[say=artica]But..but.. It's okay now..[/say]")

			saynn("[say=pc]I just wanna make sure, okay?[/say]")

			saynn("She pulls her leg up and holds her chin low, her gaze shaky, her paws shift nervously.")

			saynn("[say=artica]Mm.m.. okay..[/say]")

		else:
			saynn("[say=artica]What do you want to do..[/say]")

			saynn("[say=pc]Nothing much, just to check your paw.[/say]")

			saynn("She pulls her leg up onto the bench, her paws travel along it.")

			saynn("[say=artica]Mm.m.. sure..[/say]")

		saynn("What do you want to focus on?")

		addButton("Ankle", "Make sure her ankle is alright", "kinky_checkpaw_ankle")
		if (shyness > 0.5):
			addDisabledButton("Beans", "Artica is too shy to do this")
		else:
			addButton("Beans", "Give her cyan beans a few rubs", "kinky_checkpaw_beans")
	if(state == "kinky_checkpaw_ankle"):
		playAnimation(StageScene.CheckPaw, "check", {pc="artica", npc="pc"})
		saynn("While still crouching, you reach your left hand out, waiting for Artica to do the next move.")

		saynn("The girl looks around the canteen. The place is always busy.. but all of the inmates seem to be focussed on filling their bellies with anything remotely edible.. So Artica nods and then carefully lands her hind paw onto your offered palm.")

		saynn("Fluffy.. You do a quick visual check, inspecting her paw from most angles while she watches you do that. Everything seems to be okay.")

		saynn("[say=pc]I'm gonna warm your muscles a bit.[/say]")

		if (shyness > 0.4):
			saynn("[say=artica]O..ok.kay..[/say]")

		else:
			saynn("[say=artica]Okay.. You c-can do more than that.. if you w-want..[/say]")

		saynn("Your left hand keeps supporting her ankle while the second one starts traveling along it, following the curve, your digits combing her short white fur.")

		saynn("Instinctively or not, she starts curling her toes from that. You can feel the tension in her paw.. tension that you proceed to dissipate with your touches and rubs.")

		saynn("You don't dare to go lower, just focussing on kneading her ankle, your digits digging into her fur a bit.")

		saynn("[say=pc]Feels nice, doesn't it?[/say]")

		if (shyness > 0.4):
			saynn("[say=artica]Nn.. n..nyes?..[/say]")

			saynn("Nyes? What kind of answer is that.")

			saynn("[say=pc]I will take that as a yes.[/say]")

		else:
			saynn("[say=artica]It does..[/say]")

			saynn("[say=pc]I'm glad.[/say]")

		saynn("You continue doing that for a bit longer, making sure Artica's hind paw is properly warmed up.")

		saynn("[say=pc]Now the other one.[/say]")

		if (shyness > 0.4):
			saynn("[say=artica]Oh.. um.. m-m..m.. It wa-.. wasn't.. I.. I don-..[/say]")

			saynn("[say=pc]Hm? You think the other leg shouldn't be warmed up?[/say]")

			saynn("She blushes and starts swaying subtly on the bench, her tail curling around her waist, her hands struggling to find a resting place, sliding over her thighs. She doesn't seem to be pulling her hind paw away though.")

			saynn("[say=artica]M-maybe?.. It s-should.. m-mm.. y.yes..[/say]")

		else:
			saynn("[say=artica]Oh.. um.. o-okay..[/say]")

			saynn("Didn't take long to persuade her. Seems like your efforts are paying off.")

		saynn("You carefully place her hind paw onto the floor and reach your left hand out again, waiting for her to raise her other leg and then slowly lower it onto your palm.")

		saynn("And so you start rubbing her second hind paw, your digits exploring the fur and giving her ankle a little massage.")

		saynn("As you remove the tension, you notice her toes sprawling wide.. on both paws actually.. Artica's breathing gets a little deeper. Time flies..")

		saynn("[say=pc]There you go. Good as new.[/say]")

		saynn("[say=artica]Oh.. R-right.. Thank you..[/say]")

		saynn("You place her hind paw onto the floor and nod.")

		addButton("Continue", "See what happens next", "")
	if(state == "kinky_checkpaw_beans"):
		playAnimation(StageScene.CheckPaw, "beans", {pc="artica", npc="pc"})
		saynn("You reach your left hand out, waiting for Artica to do the next move. She does, trusting you with her hind paw that she lands onto your palm.")

		saynn("You start off by sliding your free hand along her ankle, following her fur direction.. until you reach the bottom part.. the paw itself.")

		saynn("Your digits teasingly brush over the main paw pad.. making the girl sway to the side a little.. her lips parted as she was trying to say something.")

		saynn("[say=artica]..a..am-m..[/say]")

		saynn("[say=pc]Just relax, it will feel good.[/say]")

		saynn("[say=artica]Okay.. yes-s..[/say]")

		saynn("You trace the outline cyan pad.. that kinda looks like a little bumpy heart.. before moving on to other ones and tracing them too, making the girl squirm subtly, her toes curling around your digits.")

		saynn("The texture on those beans is a little rough.. kinda like a dog's snout.. it feels nice to knead them and watch the girl react.")

		saynn("[say=artica]Am.. ah.. h-h.. mm-m.. nnn.n..[/say]")

		saynn("Her other hind paw keeps shifting around on the floor.. so after kneading this one plenty, you decide to switch and grab the other one!")

		saynn("[say=artica]E..eep..[/say]")

		saynn("She instinctively tries to free it.. but you hold it firmly with one hand while the second lands on the beans and starts caressing them. Gentle rubs and pokes make the fluff melt, more cute noises escape her maw.")

		saynn("[say=artica]N.n-n.. ah-h.. hah..[/say]")

		saynn("[say=pc]You're enjoying this, aren't you? Don't be shy.[/say]")

		saynn("The girl is panting softly, her cheeks blush red. You feel like you already know the answer.")

		saynn("[say=artica]M-maybe.. ahh-h..[/say]")

		saynn("You smile and just keep giving her beans a little massage, being careful to avoid the claws.")

		saynn("After the second paw is properly teased, you lower it gently onto the floor.")

		saynn("[say=pc]There we go.[/say]")

		saynn("[say=artica]T-thankies..[/say]")

		if (pawslut > 0.4):
			saynn("She seems to be getting interested in paws, huh..")

		addButton("Continue", "See what happens next", "")
		if (pawslut > 0.4):
			addButton("Switch?", "Maybe she will want to do the same with you", "kinky_checkpaw_switch")
		else:
			addDisabledButton("Switch?", "Artica is not interested in paws enough yet")
	if(state == "kinky_checkpaw_switch"):
		playAnimation(StageScene.CheckPaw, "beans", {pc="pc", npc="artica"})
		var isDigi = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsDigi)
		var isHoofs = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsHoofs)
		var pawname = ("foot" if (!isDigi  && !isHoofs) else ("paw" if isDigi else "hoof"))
		saynn("Seeing that Artica seems to like this.. you wonder if she would be down to try to do it herself.")

		saynn("[say=pc]Wanna switch?[/say]")

		saynn("The blushing fluff tilts her head.")

		saynn("[say=artica]Switch?..[/say]")

		saynn("You get up and place your "+str(pawname)+" onto the bench. Artica blinks many times, her eyes starting at it.")

		saynn("[say=artica]I.. I'm n-not.. s-sure..[/say]")

		saynn("You don't hear a no.")

		saynn("[say=pc]Not gonna force you. That's okay if you don't..[/say]")

		saynn("[say=artica]I can t-try..[/say]")

		saynn("Hah. You switch places. Artica crouches in front of you, for once, and carefully lifts your left "+str(pawname)+". She inspects it from up close.. her gaze seems intrigued.. almost hypnotized by the sight. She sniffs your "+str(pawname)+" and bites her lips.. before parting her maw wide and seemingly trying to fit your..")

		saynn("[say=pc]You don't have to eat it, silly.[/say]")

		saynn("The fluff blushes deeply and nuzzles your leg quickly before pulling away.")

		saynn("[say=artica]Oh.. s-sorry..[/say]")

		saynn("She snaps out of it and proceeds to instead gently rub your "+str(pawname)+" with her hands, her clawed digits caressing it.")

		saynn("When someone else's hand does this.. It tickles a lot.. you can see why Artica was squirming back then.")

		saynn("[say=artica]Is that.. okay?[/say]")

		saynn("[say=pc]Yeah, just don't do it too fast.[/say]")

		saynn("Artica nods and keeps kneading and rubbing your "+str(pawname)+", switching to the other one after some time.")

		saynn("Her touches are certainly becoming less shy as the time passes. Looks like the fluff is learning fast..")

		saynn("[say=pc]Good job, Artica.[/say]")

		saynn("She chrrrs happily.")

		addButton("Enough", "Enough fun", "")
		if (pawslut < 0.3):
			addDisabledButton("Let her lick", "Artica's is not into paws enough to do this")
		else:
			addButton("Let her lick", "Let her do what she wanted to do", "kinky_checkpaw_let_lick")
		if (pawslut < 0.4):
			addDisabledButton("Rub crotch", "Artica's is not into paws enough to do this")
		else:
			addButton("Rub crotch", "Rub her crotch with your foot", "kinky_checkpaw_rub_crotch")
	if(state == "kinky_checkpaw_let_lick"):
		playAnimation(StageScene.CheckPaw, "lick", {pc="pc", npc="artica"})
		var isDigi = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsDigi)
		var isHoofs = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsHoofs)
		var pawname = ("foot" if (!isDigi  && !isHoofs) else ("paw" if isDigi else "hoof"))
		var toesname = ("toes" if !isHoofs else "sole")
		saynn("She is getting good at this.. maybe you can trust Artica with something even more.. kinky.")

		saynn("[say=pc]You were trying to lick my "+str(pawname)+", weren't you?[/say]")

		saynn("[say=artica]I don't.. k-know.. mm.m.. maybe?..[/say]")

		saynn("Poor fluff's shyness shines through even now, after so many.. interactions between you and her.")

		saynn("[say=pc]Feel free to lick it.[/say]")

		saynn("You see sparks in her eyes.")

		saynn("[say=artica]Oh?..[/say]")

		saynn("[say=pc]If you don't want to, then let's..[/say]")

		saynn("Without much thought, Artica brings your "+str(pawname)+" closer to her face. She lets it rub against her lips.. before she parts them and gives your "+str(toesname)+" a quick lick.")

		saynn("It tickles.. in a cute way. You smile while watching Artica nuzzle and lick your "+str(pawname)+" more. Occasionally you feel her warm breath as she takes short pauses to sniff it.")

		saynn("[say=artica]Nh-hh..h..[/say]")

		saynn("Your hand lands on her hair and gentle strokes it, one of your digits reaches out to play with the dream catcher attached to her ear.")

		saynn("[say=pc]Good.. girl..[/say]")

		saynn("Her tongue travels along your "+str(pawname)+".. your "+str(toesname)+".. now with more confidence. The fluff seems to be enjoying this quite a bit.. you notice her shorts bulging as she completely gives in to this.")

		saynn("You start getting strange looks from inmates around.. so you should probably wrap this up for now.")

		saynn("[say=pc]You may stop now.[/say]")

		saynn("Artica nods and pulls away from your leg.")

		saynn("[say=artica]..t-thank.k.. you..[/say]")

		saynn("Thank you?")

		addButton("Continue", "See what happens next", "")
	if(state == "kinky_checkpaw_rub_crotch"):
		playAnimation(StageScene.CheckPaw, "crotch", {pc="pc", npc="artica"})
		var isDigi = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsDigi)
		var isHoofs = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsHoofs)
		var pawname = ("foot" if (!isDigi  && !isHoofs) else ("paw" if isDigi else "hoof"))
		var toesname = ("toes" if !isHoofs else "sole")
		saynn("[say=pc]I want to reward you, Artica.[/say]")

		saynn("[say=artica]Oh?..[/say]")

		saynn("You gently push her hands away with your leg.. before reaching for her crotch, your "+str(pawname)+" follows her thigh.. before gently bumping into.. something that is hiding under her shorts.")

		saynn("[say=pc]You seem to be packing, girl..[/say]")

		saynn("[say=artica]Eep..[/say]")

		saynn("She instinctively closes her legs.. but you keep thrusting your "+str(pawname)+" between them, your "+str(toesname)+" brushing against the growing bump.")

		saynn("[say=artica]Nnn..ngh.. too m-much..[/say]")

		saynn("[say=pc]Should I stop~?[/say]")

		saynn("You don't hear a response to your question.. just Artica's cute noises as you keep stroking her crotch through the shorts.. the friction of her inner thighs makes it pretty tiring though.")

		saynn("[say=pc]Open your legs. Now.[/say]")

		saynn("Artica whines.. but obeys your order and parts her legs, opening up a great view of her bulging shorts.. with 2 wet spots on them.. The fluff blushes deeply while you resume the teasing, your "+str(pawname)+" stroking that bump along its hidden length.")

		saynn("Poor girl is squirming under your onslaught.")

		saynn("[say=artica]Ah.. ah..ah-h.. p..please.. Nn..[/say]")

		saynn("She desperately tries to stay quiet to not attract any extra attention.. not very successfully.")

		saynn("[say=pc]Do you like this?[/say]")

		saynn("[say=artica]e..eep.. oh..ah-h.. Ngh-h.. so i-intense..[/say]")

		saynn("Your leg keeps stroking her bulge relentlessly.. your "+str(toesname)+" rubbing the wet spot that only gets more wet from that..")

		saynn("[say=pc]Artica? Do you like this?[/say]")

		saynn("[say=artica]Nh-h.. I-I.. I'm.. n-nh-h.not.. s-sure.. ah..[/say]")

		saynn("Pff. You're not sure if she is lying or just being incredibly shy. Suddenly, you stop moving your "+str(pawname)+", stealing the source of pleasure.")

		saynn("[say=artica]H-hey.. hnh-hh-h.. ah-h.. p-please.. h-h.. y-yes.. oh god..[/say]")

		saynn("[say=pc]Yes what?[/say]")

		saynn("She starts humping your leg.. so cute. But you don't let her get off, pulling your "+str(pawname)+" away as she does that.")

		saynn("[say=artica]P-p-please-e.. ah.. I d-do like this..[/say]")

		saynn("[say=pc]You like what?[/say]")

		saynn("She tries to catch your leg with her hands.. but you push them away.")

		saynn("[say=artica]I like.. paws.. feet.. hoofs.. y-yes.. nh-h.n.nn..[/say]")

		saynn("Aww. Finally. You stroke a girl's crotch a bit more.. before pushing your "+str(pawname)+" into her face.. where she starts to nuzzle it eagerly, the scent making her bulge throbbing.")

		saynn("As you do that, you start getting strange looks from other inmates.")

		saynn("[say=pc]Good girl. But let's not attract any more attention.. and avoid leaving any messes.[/say]")

		saynn("[say=artica]Huff-f.. nh..[/say]")

		saynn("You let the girl cooldown and give her lots of pats.")

		addButton("Continue", "See what happens next", "")
	if(state == "ask_leg"):
		saynn("[say=pc]How is your leg doing? Still hurting?[/say]")

		saynn("Artica idly rubs her ankle.")

		saynn("[say=artica]Mm.. It's doing better.. Thank you.[/say]")

		saynn("She rubs it a little more, her toes wiggling as she does that.")

		saynn("[say=artica]I guess working in the mine shafts isn't for me. Haha..[/say]")

		saynn("First time you heard her giggle. That's something.")

		addButton("Get used to it", "Tell her that she will get used to it", "leg_getused")
		addButton("Other ways", "Tell her that there are other ways to earn credits", "leg_otherways")
		addButton("Prostitution", "Tell her that she could start whoring herself out for credits instead", "leg_whore")
	if(state == "leg_getused"):
		saynn("[say=pc]You will get used to it, everyone does. Your muscles will become stronger, your paw pads will become harder, your fur will get dirtier.[/say]")

		saynn("Artica hears that and lowers her gaze, her ears droop, making the dream catcher dangle. She puts her hind paw onto the floor and strokes her tail instead.")

		saynn("[say=artica]Mm..[/say]")

		saynn("[say=pc]The only alternative seems to be what every lilac does. You know.. serving others.[/say]")

		saynn("You can hear the dream catcher dangling again.")

		saynn("[say=artica]Hm.m.. Yeah, seems so..[/say]")

		addButton("Continue", "See what happens next", "enough_talk")
	if(state == "leg_otherways"):
		saynn("[say=pc]There are other ways to earn credits.[/say]")

		saynn("Artica's ears perk, she tilts her head a bit.")

		saynn("[say=pc]You can get some for.. providing value to others. Yeah, that's a good way to put it.[/say]")

		saynn("[say=artica]Value? I don't really have anything of value..[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Happiness is valuable too.[/say]")

		saynn("Artica ooohs and then chrrrs at your response.")

		saynn("[say=artica]Ohh. Haha.[/say]")

		addButton("Continue", "See what happens next", "enough_talk")
	if(state == "leg_whore"):
		saynn("[say=pc]If smashing through rocks is too hard, you can always just choose to bounce on hard cocks instead, prostitute your body away.[/say]")

		saynn("Artica grabs tightly onto her paw, rubbing the cyan beans as a way to focus on something else.")

		saynn("[say=artica]Oh.. Um.. mm.m.. I don't know if that's a good idea..[/say]")

		saynn("You smile and reach over the table to grab her chin and make her look at you.")

		saynn("[say=pc]You got a cute face, Artica.[/say]")

		saynn("She blushes, her ears drooping.")

		saynn("[say=pc]And a very fuckable body~.[/say]")

		saynn("[say=artica]Umm.. hh..h.. I.. I g-gue.. s-s..[/say]")

		saynn("So cute to see her struggle with this. Artica clearly wants to look away.. but she doesn't dare to defy your touch, instead just playing with her paw beans more.")

		addButton("Continue", "See what happens next", "enough_talk")
	if(state == "ask_risha"):
		saynn("[say=pc]Is that big cat still bullying you?[/say]")

		saynn("Artica shrugs and quickly looks around.")

		saynn("[say=artica]Doesn't look like..[/say]")

		saynn("[say=pc]Good, you let me know if she returns.[/say]")

		saynn("The girl nods subtly.")

		saynn("[say=artica]You make me feel like.. I'm your pet. Haha.[/say]")

		saynn("She can be a cheeky fluff when she wants to, huh.")

		addButton("Just protecting", "Tell Artica that you just can't watch the weak ones getting bullied", "risha_justprotect")
		addButton("Who knows..", "Tell Artica that anything can happen in this life", "risha_whoknows")
		addButton("You are", "Tell Artica that she can consider herself your pet already", "risha_youare")
	if(state == "risha_justprotect"):
		saynn("[say=pc]Just trying to protect the ones who can't do it themselves.[/say]")

		saynn("Artica looks at her clawed paws.")

		saynn("[say=artica]I just.. I don't think I can.. m-mm.. fight well?[/say]")

		saynn("[say=pc]I can teach you a move or two. You have claws, you have teeth.[/say]")

		saynn("She shows you her sharp fangs. Corners of her mouth are trembling a bit. She is whining quietly.")

		saynn("[say=artica]I-I.. don't know..[/say]")

		saynn("To be fair, blood wouldn't look well on her snow-white fur.")

		addButton("Continue", "See what happens next", "enough_talk")
	if(state == "risha_whoknows"):
		saynn("[say=pc]You never know where life will bring you, heh.[/say]")

		saynn("Artica nods and paws the table.")

		saynn("[say=artica]That's very true.. Sometimes you lose control.. lose yourself even..[/say]")

		saynn("She reaches for her dream catcher and rubs it gently.")

		saynn("[say=artica]Mm..m.. yeah.. hard to follow the flow.. if the river became nothing but ice..[/say]")

		saynn("[say=pc]I can just feel that you lived in a tribe before.[/say]")

		saynn("She smiles.")

		saynn("[say=artica]Haha.. Yeah, things were wild..[/say]")

		addButton("Continue", "See what happens next", "enough_talk")
	if(state == "risha_youare"):
		saynn("[say=pc]Bark.[/say]")

		saynn("Artica tilts her head.")

		saynn("[say=artica]Mmm.. um?..[/say]")

		saynn("You repeat, with a strict voice and a stern look.")

		saynn("[say=pc]Bark for me, now.[/say]")

		saynn("[say=artica]Um.. y..yip?.. Yip-yip.p..[/say]")

		saynn("Not really barking.. but maybe that's how her species bark.")

		saynn("You reach over the table and grab her by the collar, pulling her head a little closer.")

		saynn("[say=pc]See, you are pretty much my pet already. If I so desire, you will be my pet, slut or just a slave. Right?[/say]")

		saynn("Artica eeps.. keeping her chin high, exposing more of her bright fluffy neck for you.")

		saynn("[say=artica]Mmm.. m.m.. I-I.. y-y.. ah..[/say]")

		saynn("[say=pc]What, gonna try to bite me~?[/say]")

		saynn("You see some obvious signs of fear in her cyan eyes. Poor fluff is shaking.")

		saynn("[say=artica]N-n.no..[/say]")

		saynn("Her shorts are bulging in the crotch region..")

		saynn("[say=pc]Yeah, you know better than that~. Relax. For some reason I feel like you will enjoy most of the things that I will do to you.[/say]")

		saynn("You let go of her collar and pat the girl instead.")

		addButton("Continue", "See what happens next", "enough_talk")
	if(state == "ask_paws"):
		saynn("[say=pc]You seem to have some interest in.. paws.[/say]")

		saynn("Artica tilts her head.")

		if (pawslut > 0.3):
			saynn("[say=artica]..Do I?.. Maybe only a little bit..[/say]")

		else:
			saynn("[say=artica]..Do I?.. I'm not really sure..[/say]")

		saynn("While glancing under the table, you can notice her rubbing her hind paws against each other.")

		addButton("Shrug", "Maybe you were wrong", "ask_paws_shrug")
		addButton("Tease her", "Play with the fluff", "ask_paws_tease")
	if(state == "ask_paws_shrug"):
		saynn("You shrug.")

		saynn("[say=pc]Just kinda felt like that. Maybe I'm wrong.[/say]")

		saynn("Artica lowers her gaze and copies your shrug.")

		saynn("[say=artica]Maybe..[/say]")

		addButton("Continue", "See what happens next", "enough_talk")
	if(state == "ask_paws_tease"):
		playAnimation(StageScene.PawJobUnderTable, "tease", {npc="pc", pc="artica"})
		var isDigi = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsDigi)
		var isHoofs = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsHoofs)
		var pawname = ("foot" if (!isDigi  && !isHoofs) else ("paw" if isDigi else "hoof"))
		var toesname = ("toes" if !isHoofs else "sole")
		saynn("Carefully, you slide your "+str(pawname)+" closer to Artica's, your "+str(toesname)+" pressing her two hind paws into the floor, trapping them.")

		saynn("[say=artica]..eep..[/say]")

		saynn("Then you proceed to gently knead her toes like that, sneakily, under the table.. all the while watching her cute shy face.")

		saynn("[say=pc]Something is wrong?[/say]")

		saynn("She shakes her head, making her dream catcher dangle.")

		saynn("[say=artica]..n.no.. all good..[/say]")

		saynn("That sounds like an invitation.")

		addButton("Tease more", "", "ask_paws_teasemore")
	if(state == "ask_paws_teasemore"):
		playAnimation(StageScene.PawJobUnderTable, "rub", {npc="pc", pc="artica"})
		var isDigi = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsDigi)
		var isHoofs = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsHoofs)
		var pawname = ("foot" if (!isDigi  && !isHoofs) else ("paw" if isDigi else "hoof"))
		var toesname = ("toes" if !isHoofs else "sole")
		saynn("Without saying anything, you slide your "+str(pawname)+" higher, following the curves of her digitigrade leg.")

		saynn("You tilt your head slightly and smile as your "+str(toesname)+" brush against Artica's inner thighs through the cloth of her shorts, getting dangerously close to a source of heat..")

		saynn("[say=artica]Kghm.. h-hh..[/say]")

		saynn("[say=pc]Yes, Artica?[/say]")

		saynn("As soon as she parts her lips to say something, you purposefully rub her crotch a little with your "+str(pawname)+"..")

		saynn("[say=artica]Ah~..[/say]")

		saynn("You can't help but to giggle.. which only works to make her cheeks even more red.")

		saynn("[say=pc]You don't have to tell me anything, your body already did~.[/say]")

		addButton("Enough", "That was fun", "enough_talk")
		addButton("Rub more", "Make that girl squiiirm", "ask_paws_teaseevenmore")
	if(state == "ask_paws_teaseevenmore"):
		playAnimation(StageScene.PawJobUnderTable, "fast", {npc="pc", pc="artica"})
		var isDigi = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsDigi)
		var isHoofs = GM.pc.bodypartHasTrait(BodypartSlot.Legs, PartTrait.LegsHoofs)
		var pawname = ("foot" if (!isDigi  && !isHoofs) else ("paw" if isDigi else "hoof"))
		var toesname = ("toes" if !isHoofs else "sole")
		saynn("Why not tease the girl even more, your "+str(pawname)+" gently lands on Artica's crotch and proceeds to rub it with its "+str(toesname)+".")

		saynn("[say=artica]Nh-h..[/say]")

		saynn("The more you do it, the more you feel something growing behind those shorts. You find its tip.. and focus on stroking it specifically.")

		saynn("[say=artica]Ah..h.hah..[/say]")

		saynn("Cute little moans leave her maw as she parts her legs more, her own hind paws curling and sprawling its toes, her body squirming from so much teasing.")

		saynn("[say=pc]You clearly like it~.[/say]")

		saynn("Inmates are walking past with trays full of prisoner food. Seeing them makes Artica cover her mouth and moan into her paw, her eyes closed.. as you just keep stroking that.. hard.. drippy.. bump.. between her legs.")

		saynn("[say=artica]nh-h.. ah.. so.. intense.. gods.. p-please..[/say]")

		saynn("You could stop there..")

		addButton("Enough", "That was fun", "enough_talk")
		addButton("Keep at it", "See what happens", "ask_paws_cum")
	if(state == "ask_paws_cum"):
		playAnimation(StageScene.PawJobUnderTable, "fast", {npc="pc", pc="artica", pcCum=true})
		
		saynn("Whatever it is that's in her pants.. it's grown to its full size, putting so much pressure onto the cloth that you begin to see some cyan through it. The girl is dripping eagerly, that bump that you are teasing is now throbbing softly.. while the fluff is actively squirming on that bench.")

		saynn("[say=artica]I'm.. ah..ah-h.. I'm g-gon.. p-please.. oh g-god.. ah..[/say]")

		saynn("You just keep smiling and stroking that bulge.. until Artica suddenly arches her back.")

		saynn("[say=artica]NHh-hH!..[/say]")

		saynn("Something in her shorts is throbbing wildly, the poor girl is struggling to contain herself, her clawed hind paws scratching the concrete, her tail spazzing out in the air, the dream catcher attached to her flicking ear is ringing softly.")

		saynn("[say=artica]Ah!.. ah.. Ahh-h..[/say]")

		saynn("Her body tries to arch itself but the bench and the table prevent that, her lusty eyes roll up high, her paws stop covering her moans and instead land on her twitching throbbing crotch..")

		saynn("[say=artica]I.. I.. I n-n.need to.. nh-h..[/say]")

		saynn("As soon as she can, Artica springs up and takes off towards the nearest bathroom.")

		saynn("Hah.")

		saynn("You look under the table.. Ooh.. What a mess.. Better switch to another table.")

		saynn("You do that and wait for Artica to come back.. She is still panting.")

		saynn("[say=artica]Uh.. ah..[/say]")

		saynn("[say=pc]Are you okay, fluff?[/say]")

		saynn("She keeps her eyes low.")

		saynn("[say=artica]Y-yeah.. just n-needed to..[/say]")

		saynn("[say=pc]I know. I know~.[/say]")

		saynn("Well, that was fun.")

		addButton("Continue", "See what happens next", "enough_talk")
	if(state == "ask_mood"):
		saynn("[say=pc]So, how is your mood, overall? Settled in by now?[/say]")

		saynn("Artica nods softly.")

		saynn("[say=artica]Yeah.. bit by bit, haha.[/say]")

		saynn("She says that.. but you still notice her body swaying slightly, her tail brushing the floor, her hind paws exploring the cold floor.. her nervousness.")

		saynn("[say=artica]I've been sitting here mostly.. maybe it's time to explore more..[/say]")

		saynn("[say=pc]Not the worst idea.[/say]")

		saynn("[say=artica]I'm just.. still kinda lost..[/say]")

		saynn("This would be a perfect opportunity to show her around!")

		addButton("Grab her hand", "Show her around the prison", "ask_mood_hand")
		addButton("Grab her collar", "Show her around the prison", "ask_mood_collar")
	if(state == "ask_mood_hand"):
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		aimCameraAndSetLocName("main_punishment_spot")
		if (grabCollar):
			saynn("Grabbing hands with people is too unsanitary so you just slip your digits under Artica's collar and pull her out of the canteen and into the main hall!")

			saynn("[say=artica]Eeep![/say]")

		else:
			saynn("Without saying much, you grab Artica's hand and pull her out of the canteen and into the main hall!")

			saynn("[say=artica]Eep..[/say]")

		saynn("Together, you climb to the main platform that has all the punishment devices with a bunch of benches nearby.")

		saynn("Artica inspects the sturdy-looking metal stocks. She tries but she can't even lift the top part of them.")

		if (grabCollar):
			saynn("[say=pc]If you misbehave, you might end up in these.[/say]")

			saynn("[say=artica]Really?..[/say]")

			saynn("[say=pc]Yeah. Lilac sluts end up there too occasionally, don't worry.[/say]")

			saynn("That makes her blush, fluffy tail curling around her leg.")

			saynn("[say=artica]In my tribe, the worst way to punish someone is through.. banishment.[/say]")

		else:
			saynn("[say=pc]If you misbehave, you might end up in these.[/say]")

			saynn("[say=artica]Really?..[/say]")

			saynn("[say=pc]Yeah. Just don't be too cocky with the staff or other inmates and you will be fine.[/say]")

			saynn("She nods subtly and keeps eyeing out the device, her tail curling around her leg.")

			saynn("[say=artica]In my tribe, the worst way to punish someone is through.. banishment.[/say]")

		saynn("You also point at where the bathroom, laundry and a vendomat are. Time to move on.")

		addButton("Medical", "Show Artica where the medical wing is", "ask_mood_show_medical")
	if(state == "ask_mood_show_medical"):
		aimCameraAndSetLocName("med_lobby_start")
		if (grabCollar):
			saynn("You grab Artica's collar again and bring her into the main lift.")

			saynn("[say=artica]Eep ..don't have to.. g-grab my collar..[/say]")

			saynn("[say=pc]You don't like that?[/say]")

			saynn("She tugs on it.")

			saynn("[say=artica]I.. um.. I'm not..[/say]")

			saynn("The lift arrives on the lower floor. You grab Artica's collar and pull her out into the lobby.")

			if (!getFlag("ArticaModule.s5GaveMassage", false)):
				saynn("[say=pc]Anyway, this is the medical. We were here already but I'm showing it to you again, just in case.[/say]")

			else:
				saynn("[say=pc]Anyway, this is the medical. Probably your first time here?[/say]")

			saynn("She looks around.")

			saynn("[say=artica]Mhm..[/say]")

			saynn("[say=pc]A place where you get your gaping used holes fixed up and your broken mind repaired.[/say]")

			saynn("[say=artica]Oh.. It can get that bad?..[/say]")

			saynn("Your smile says a lot.")

			saynn("[say=artica]Eep..[/say]")

			saynn("You also point to your right.")

			saynn("[say=pc]Nursery. Prepare to go there often.[/say]")

			saynn("[say=artica]..why?[/say]")

			saynn("[say=pc]You will see.[/say]")

			saynn("Artica blinks a lot. She might be regretting not staying in the canteen by now.")

			saynn("[say=artica]It all looks.. fancy. We didn't have anything like this.. just medical plants and.. rituals..[/say]")

		else:
			saynn("You grab Artica's hand again and bring her to the main lift. While it's busy moving you down to the right floor, the fluff keeps swaying from side to side and standing on her toes, her hand squeezing yours occasionally.")

			saynn("[say=artica]Do we have to.. hold hands?..[/say]")

			saynn("[say=pc]You don't like that?[/say]")

			saynn("[say=artica]A bit too.. strange.. haha.[/say]")

			saynn("The lift arrives on the lower floor, allowing you to step out into the busy medical wing lobby.")

			if (!getFlag("ArticaModule.s5GaveMassage", false)):
				saynn("[say=pc]Anyway, this is the medical. We were here already but I'm showing it to you again, just in case.[/say]")

			else:
				saynn("[say=pc]Anyway, this is the medical. Probably your first time here?[/say]")

			saynn("She looks around.")

			saynn("[say=artica]Mhm..[/say]")

			saynn("[say=pc]If something hurts.. or if you got something gaping, you go here.[/say]")

			saynn("[say=artica]Gaping.. A gaping wound?[/say]")

			saynn("[say=pc]Uh.. sure.[/say]")

			saynn("[say=artica]It can get that bad?..[/say]")

			saynn("Your silent nod says a lot.")

			saynn("[say=artica]Eep..[/say]")

			saynn("You also point to your right.")

			saynn("[say=pc]Nursery. If you're pregnant, you go there.[/say]")

			saynn("[say=artica]..pregnant?[/say]")

			saynn("[say=pc]Yeah.[/say]")

			saynn("Artica blinks a lot. She might be regretting not staying in the canteen by now.")

			saynn("[say=artica]It all looks.. fancy. We didn't have anything like this.. just medical plants and.. rituals..[/say]")

		addButton("Workshop", "Show her the workshop", "ask_mood_workshop")
	if(state == "ask_mood_workshop"):
		aimCameraAndSetLocName("eng_workshop")
		if (grabCollar):
			saynn("You grab Artica's collar again and pull her back into the lift. This time she idly tries to pry your digits off of it.. but you're not letting go that easy.")

			saynn("The doors open.")

			saynn("[say=artica]Oh.. mine shafts.. You're gonna make me work?[/say]")

			saynn("[say=pc]There are better ways to make you work. No, I'm showing you something else.[/say]")

		else:
			saynn("You grab Artica's hand again and pull her back into the lift. This time she idly tries to free her paw.")

			saynn("The doors open.")

			saynn("[say=artica]Oh.. mine shafts.. You're gonna make me work?[/say]")

			saynn("[say=pc]No, don't worry. I'm showing you something else.[/say]")

		saynn("You bring Artica to the workshop, a place with a bunch of work benches and engineers using them.")

		saynn("[say=artica]More equipment that we could only dream about.. We mostly just crafted things with our hands..[/say]")

		saynn("[say=pc]Well, welcome to the space age. How did you end up here even if you never saw something like this?[/say]")

		saynn("[say=artica]It's.. a.. a long..[/say]")

		saynn("The noises of all the machinery makes it hard to hear her. Better to move on.")

		addButton("Yard", "Show her the green area", "ask_mood_yard")
	if(state == "ask_mood_yard"):
		aimCameraAndSetLocName("yard_vaulthere")
		if (grabCollar):
			saynn("Your digits under her collar, you bring her up to the main floor.. This time you head towards the prison's yard.")

		else:
			saynn("Your hand holding hers, you bring her up to the main floor.. This time you head towards the prison's yard.")

		saynn("[say=artica]Ohh-h.. This feels much more.. familiar to me..[/say]")

		saynn("You follow the stone pathway, Artica fascinated by the pit-pat noises that her hind paws make when traveling over the stone tiles.")

		saynn("[say=artica]Brings back so many memories..[/say]")

		saynn("You show her the gym area.. but she doesn't seem to be interested in that. Instead, she draws you in closer to one of the deadends. It's not a deadend per say.. but there is no real way for you to scale this wall and get to the higher level.")

		saynn("[say=artica]I like this scent.. What is up there?..[/say]")

		saynn("[say=pc]Greenhouses I think. They grow stuff there. Inmates are not allowed.[/say]")

		saynn("[say=artica]Oh.. aw..[/say]")

		if (grabCollar):
			saynn("[say=pc]You can try sneaking in. Just don't complain later that you ended up in stocks.[/say]")

		else:
			saynn("[say=pc]You can try sneaking in. But you might get caught.[/say]")

		saynn("Artica nods and starts heading back, following the many pathways. Her ears perk as she hears a noise of running water.")

		saynn("[say=artica]Let's go there, please..[/say]")

		saynn("Might as well.")

		addButton("Waterfall", "Go check it out", "ask_mood_waterfall")
	if(state == "ask_mood_waterfall"):
		aimCameraAndSetLocName("yard_waterfall")
		GM.pc.setLocation("yard_waterfall")
		playAnimation(StageScene.Duo, "sit", {npc="artica", flipNPC=true})
		saynn("Artica rushes to the waterfall as soon as she sees it. There is a little water pond before it that the fluff stands near. She gets one of her hind paws wet, wiggling her toes in it.")

		saynn("[say=pc]You like waterfalls that much?[/say]")

		saynn("You decide to sit on the bench that's nearby.")

		saynn("[say=artica]There is something.. hypnotic.. about running water. The sound and how it looks.. But.. I also just miss my tribe..[/say]")

		saynn("[say=pc]Did something happen to it?[/say]")

		saynn("Artica looks at you for a second and then frowns and lowers her gaze. Her hand reaches to rub her little dreamcatcher that's attached to her ear.")

		saynn("[say=artica]Yes. The balance.. it was disturbed.. destroyed.. and Gods are not happy about that..[/say]")

		saynn("Huh. She seems.. upset. Strange.")

		saynn("[say=pc]Balance?[/say]")

		saynn("[say=artica]Right.. um.. I am one of Jogauni.. We are the guardians of the integral forces, the keepers of all things basic and vital.. Our Gods gave a task to us.. bring balance to the unordered chaos.[/say]")

		saynn("Artica watches the waterfall.. standing completely still. No usual fidgeting.. no swaying to the sides.")

		saynn("[say=artica]I come from a water tribe.. But there are also 7 others: fire, air, earth, shadow, light, metal, and wood.[/say]")

		saynn("Some of these seem to be opposites.. but at same time.. Some of them also compliment each other.")

		saynn("[say=artica]We are.. the preservers.. of elementals.. Used to be.. Before our planet was found.. and colonized.[/say]")

		saynn("Makes sense. AlphaCorp is not exactly known for their.. care for the environment.")

		saynn("[say=artica]Spaceships arrived.. Towns were built.. Resources were exploited.. Jogauni.. were too.. Our connection with nature.. our connection with our elements.. severed.[/say]")

		saynn("[say=pc]Technology isn't inherently bad.[/say]")

		saynn("[say=artica]I'm not saying it is.. Everything is well in moderation.. But constant expansion ruined the careful balance that Jogauni were trying to achieve.. We failed our Gods.[/say]")

		saynn("She looks at you again.")

		saynn("[say=artica]I fought back.. The only way I knew how.. It was fun actually. But now I'm here. Away from my tribe and my family.[/say]")

		saynn("Her paw reaches to her dreamcatcher again.")

		saynn("[say=artica]..my last memory.[/say]")

		addButton("Fought how?", "Artica doesn't seem like a warrior", "ask_mood_waterfall_foughthow")
		addButton("Religion", "Artica seems to be a religious fluff", "ask_mood_waterfall_relegion")
		addButton("Nod", "Don't ask any extra questions", "ask_mood_waterfall_nod")
	if(state == "ask_mood_waterfall_foughthow"):
		saynn("[say=pc]You were trying to fight an entire corporation? You had weapons to do it?[/say]")

		saynn("[say=artica]..we did have swords.. staves..[/say]")

		saynn("Not exactly the kind of weapons that you need to fight spaceships, huh.")

		saynn("[say=artica]We almost shoved them back too.. Jogauni consists of 8 different, sometimes opposite, tribes. Imbalance of power.. creates a new power of sorts..[/say]")

		saynn("She shrugs.")

		saynn("[say=artica]Sadly, they knew where to strike. They brought disarray.. turned the tribes against each other..[/say]")

		saynn("You look at her body.. she doesn't seem like a warrior who is capable of killing.")

		saynn("[say=pc]How did you fight back though? I'm curious.[/say]")

		saynn("Artica scratches behind her ear and under her chin.")

		saynn("[say=artica]Um.. You know.. Fighting propaganda.. spreading our own message to all the Jogauni.. There was no point in hiding..[/say]")

		saynn("Informational war is sometimes more effective than a normal one it seems.")

		saynn("[say=artica]I don't regret it though.. was fun while it lasted..[/say]")

		addButton("Religion", "Artica seems to be a religious fluff", "ask_mood_waterfall_relegion")
		addButton("Nod", "Don't ask any extra questions", "ask_mood_waterfall_nod")
	if(state == "ask_mood_waterfall_relegion"):
		saynn("[say=pc]Jogauni people seem to be quite.. religious?[/say]")

		saynn("She nods.")

		saynn("[say=artica]It's a big part of our culture.. Of who we are.[/say]")

		saynn("She says that and sighs, her gaze low, watching her snowy-white fur.")

		saynn("[say=artica]I feel like.. I'm somehow different though.[/say]")

		saynn("[say=pc]You don't share their beliefs?[/say]")

		saynn("Artica shrugs.")

		saynn("[say=artica]Something or someone created us, gave us a mission, I think.. But upholding the global balance for eternity, age after age.. it feels.. not sure.[/say]")

		saynn("Looks like she is questioning her purpose in life.")

		saynn("[say=pc]It feels boring to you?[/say]")

		saynn("She shrugs again and holds onto her dreamcatcher.")

		saynn("[say=artica]I don't wanna say that.. I saw a mystical being with my own eyes once, it saved my life..[/say]")

		saynn("[say=pc]Do what's fun for you, Artica. Can't go wrong with that.[/say]")

		saynn("She offers you a little smile.")

		saynn("[say=artica]Maybe..[/say]")

		addButton("Fought how?", "Artica doesn't seem like a warrior", "ask_mood_waterfall_foughthow")
		addButton("Nod", "Don't ask any extra questions", "ask_mood_waterfall_nod")
	if(state == "ask_mood_waterfall_nod"):
		saynn("You nod and just watch the waterfall with Artica.")

		saynn("So weird.. it makes a lot of noise.. and yet.. It's calming.")

		saynn("[say=artica]Sorry about all this.. I guess sometimes I just want to be one with nature again.. It was great back then, I didn't even need to wear any clothes.. haha. Unlike now..[/say]")

		saynn("She looks down at her lilac inmate uniform.")

		saynn("Seems like a good opportunity to help her.. open up.")

		addButton("Encourage", "Encourage Artica to be one with nature for a bit", "ask_mood_waterfall_encourage")
		addButton("No clothes?", "Ask why she doesn't need clothes", "ask_mood_waterfall_noclothes")
	if(state == "ask_mood_waterfall_noclothes"):
		saynn("[say=pc]You didn't need clothes on your planet? Was it a warm one?[/say]")

		saynn("She shakes her head.")

		saynn("[say=artica]Far from it.. We have.. had.. very warm summers.. but also very harsh winters. Luckily, my fur helps against the latter..[/say]")

		saynn("[say=pc]Your fur doesn't seem that long.[/say]")

		saynn("[say=artica]It's not, haha.. But I had something happen to me.. Can't really show what without.. mm-m.. undressing..[/say]")

		addButton("Encourage", "Encourage Artica to be one with nature for a bit", "ask_mood_waterfall_encourage")
	if(state == "ask_mood_waterfall_encourage"):
		saynn("[say=pc]Well, why not. You can be with nature again, for a little bit.[/say]")

		saynn("Artica blushes softly and stands up on her toes, her tail swishing behind her.")

		saynn("[say=artica]I.. I don't know.. It's what got me into trouble to begin with..[/say]")

		addButton("Comfort her", "Tell her that it will be okay. Only you are here", "ask_mood_waterfall_comfort")
		addButton("Will happen anyway", "Tell her that she won't be able to keep her clothes forever anyway", "ask_mood_waterfall_happenanyway")
	if(state == "ask_mood_waterfall_comfort"):
		playAnimation(StageScene.Duo, "sit", {npc="artica", npcBodyState={naked=true,hard=true}, flipNPC=true})
		addCharacter("artica", ["naked"])
		if (willHappenAnyway):
			saynn("[say=pc]It will happen anyway, Artica. Someone will tear your uniform to pieces one day, no point in hiding what's between your legs.[/say]")

		else:
			saynn("[say=pc]It will be okay, Artica. No one is here, besides me. And I can close my eyes if you want.[/say]")

		saynn("Artica stays quiet for a bit, just swaying from side to side, her toes curling, her tail twitches nervously.")

		if (willHappenAnyway):
			saynn("[say=artica]..I g-guess you're r-right..[/say]")

		else:
			saynn("[say=artica]Well..[/say]")

		saynn("Her upper paws reach for her shirt and begin to unbutton it. As she starts sliding the cloth off of her shoulders, you notice some fancy dark cyan patterns on her fur.. and the only one you can clearly recognize is a.. snowflake?")

		saynn("Shirt is gone, resting on the stones. From this angle you only see her back.. cyan fur.. same color as the long stripe on her muzzle.")

		saynn("It's clearly not enough for her.. Artica tugs on the rubber band of her shorts, deliberating if she should do it. Her gaze inspects the greenery around her.. before she finally commits to it.")

		saynn("She pulls her shorts down slightly.. and then wiggles her cute round butt out of them. As the cloth drops to the floor, a nice view opens up to your eyes, her swishing tail occasionally offering you a glimpse of her bits.. both male and female ones..")

		saynn("Artica breathes in deeply, fresh air filling her lungs as she spreads her arms a bit.")

		saynn("[say=artica]Ah..h-h..[/say]")

		saynn("You let her enjoy the moment.")

		addButton("Snowflake?", "Wasn't Artica from the water tribe..", "ask_mood_waterfall_watertribe")
		addButton("Enough nudity", "Tell her to dress up", "ask_mood_waterfall_dressup")
		addButton("Grab her throat", "Enough playing nice. The sight makes you horny for more. Way more", "ask_mood_waterfall_grabthroat")
	if(state == "ask_mood_waterfall_grabthroat"):
		playAnimation(StageScene.Choking, "idle", {pc="pc", npc="artica", npcBodyState={naked=true}})
		saynn("Finally, you got her where you wanted. Artica is alone, vulnerable and even with her cock and pussy out. The stars aligned for this perfect moment.")

		saynn("You get up and slowly approach her, your eyes full of intention.")

		saynn("[say=artica]Oh, h-hey-.. NH-Hh-![/say]")

		saynn("As soon as she notices you behind her, your hand darts out, firmly wrapping around her throat.")

		saynn("Her eyes widen in surprise, she gasps softly but any air gets caught in her throat as your digits cut off the supply.")

		saynn("[say=artica]Nn-.. n..h..[/say]")

		saynn("You lean in closer, a low growl escapes your lips.. while Artica's ones tremble from fear.")

		saynn("[say=pc]You were right to be afraid, Artica. Happy dreams never become a reality here, only bad ends. Don't worry though..[/say]")

		saynn("Another few silent gasps leave her maw, her shaking hands grab onto the one that is choking her.. desperately trying to pull it off.")

		saynn("[say=pc]I won't kill you.. If you behave that is.[/say]")

		saynn("All the while, your free hand lands on her tits and squeezes one tight.. before sliding down along her gray belly and reaching her thighs. The absolute shock made the fluff lose any lust that she had, her {artica.penis} went soft.. and the pussy that is hiding behind her balls is barely wet. The scent is quite inviting though..")

		saynn("[say=pc]I just want to.. turn you into who you really are..[/say]")

		saynn("She stands on her toes, her tail spazzing out. She is shaking her head a bit.. her scared eyes.. quickly getting weaker, the adrenaline seems to be running out fast..")

		saynn("[say=pc]A whore.[/say]")

		saynn("And with that, you relax the grip a bit, letting the fluff catch some much-needed air.")

		saynn("[say=artica]Kh-h.. h-h.. l-let.. kh-h.. g-go.. pp-p..please..[/say]")

		addButton("Let go", "This was enough for now", "rough_letgo")
		addButtonWithChecks("Breed", "Breed the scared fluff", "rough_breed", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Get bred", "Use her cock for your pleasure", "rough_get_bred", [], [[ButtonChecks.HasReachableVagina]])
	if(state == "rough_get_bred"):
		playAnimation(StageScene.SexCowgirlChoke, "inside", {pc="artica", npc="pc", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		saynn("You ignore her pleading. She just doesn't know how much fun are gonna have with her.")

		saynn("Gradually, you lower the fluff down to the floor.. before straddling her, one of your hands still holding that throat, making sure Artica is always feeling the pressure there.")

		saynn("You look down at her sheath.. and let out a sigh, the terrified state left her mostly limp.")

		saynn("[say=artica]P-please.. I w-won't.. t-t..tell..[/say]")

		saynn("Nuh-uh. You use your hand to spread your {pc.pussyStretch} pussy, offering a glorious lewd display to the fluff.")

		saynn("[say=pc]I'm not walking away without your pups in here.[/say]")

		saynn("Artica gulps audibly, her toes curling. She is still trying to break free, even now. The tip of her canine cock is peeking out of its sheath.. which allows you to start gently grinding it with your pussy.")

		saynn("[say=artica]Nh-h.. pp-please.. n-no..[/say]")

		saynn("You shush the fluff and keep slowly moving your hips back and forth, your wet pussy sliding along the growing shaft, spreading its juices.")

		saynn("[say=pc]Such a subby slut..[/say]")

		saynn("Even just this feels good, little moans begin escaping your mouth"+str(", your own {pc.penis} getting hard too from all this.." if GM.pc.hasPenis() else "")+". You notice a bump on her cock near the base, a deflated knot.. fun..")

		saynn("And so, after forcefully getting the girl hard, you position yourself above, your slick dripping pussy hovering just above the twitching tip of Artica's {artica.penis}. Her eyes widen in shock as she feels your folds testing the waters, gently pressing down on her length. Artica's breath catching in her throat as she still struggles against your grasp.. but you keep her well-pinned, your mean eyes sending fear down her spine.")

		saynn("She is ready..")

		addButton("Ride her", "That cock is looking way too juicy not to ride it", "rough_get_bred_ride")
	if(state == "rough_get_bred_ride"):
		playAnimation(StageScene.SexCowgirlChoke, "sex", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("With a sly grin on your face, you guide Artica's canine cock down your wet, awaiting pussy. But as soon as the drippy pointy tip slides inside your kitty, you suddenly bring your whole body down, using sheer force of domination to shove the rest of that shaft in.")

		saynn("[say=artica]Ah! N-no-n-no-o.. S.sstop.. p-please. e-eep..[/say]")

		saynn("So whiny, that girl is. You clench your hand around that throat a little harder to keep Artica at bay while you proceed to raise yourself.. and then slam your pussy down onto her hard cock again.. and then again, faster.. establishing a cycle.")

		saynn("[say=pc]Mm~.. Shut up, I will ride your cock as much as I want.[/say]")

		saynn("You're holding her pinned.. but Artica is still squirming a lot, her chest swaying, tits bouncing, legs wiggling, toes sprawling wide. But that doesn't stop you from riding her cock more, the shaft sliding inside you, making you moan while it hits the g-spot"+str(", your own cock is out and bobbing up and down as you do this" if GM.pc.hasPenis() else "")+".")

		addButton("Faster", "Ride that girl even harder", "rough_get_bred_ride_harder")
	if(state == "rough_get_bred_ride_harder"):
		playAnimation(StageScene.SexCowgirlChoke, "fast", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("More moans escape your mouth as you increase the pace of your movements, riding that juicy cock harder and faster. Artica's throbbing shaft leaks with plenty of precum inside your cunt which are mixing with your own slick juices as you impale yourself on its length.")

		saynn("[say=artica]A-ah-h..ah..ah.. T-too m-much.. It's.. ah.. p-please..[/say]")

		saynn("That constant pleading gets annoying fast.. so you increase the grip on her throat until only silent gasps start coming out.")

		saynn("[say=pc]Shut up and cum inside me already, slut..[/say]")

		saynn("She desperately tries to pull your hand away from her neck.. while also trying to pull herself away from you.. but you just keep yanking her back into place and slamming yourself onto her great cock.. Soon, the knot at its base starts to inflate with blood, so much that it doesn't easily fit inside you anymore, instead just slapping against your cunt, stretching it out more.")

		saynn("The fluff is getting weaker as you choke her.. but she is also close.. just like you.")

		addButton("Get knotted", "Force it in", "rough_get_bred_ride_cum")
	if(state == "rough_get_bred_ride_cum"):
		playAnimation(StageScene.SexCowgirlChoke, "inside", {pc="artica", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Artica's eyes are rolling up, her tongue is out and drooling as you keep trying to fit that swell knot inside your {pc.vaginaStretch} pussy. You keep bouncing on it.. making that orb stretch your folds more and more.. until it suddenly slips inside!")

		saynn("Fuck, your legs are shaking as you feel Artica's full member inside you, it's tip has broken into your womb.")

		saynn("[say=pc]F-fu-uck~..[/say]")

		saynn("The stimulation is too much.. It doesn't take long for your pussy to start clenching around the shaft.. shaft that is throbbing inside you..")

		saynn("[say=artica]Nh-hh-h..h.n.n.nnH!..[/say]")

		saynn("You can't ride the girl anymore as you are knotted.. but the sensations alone are enough to bring both of you over the edge. You throw your head back and let out a passionate noise as Artica's cock starts pumping your pussy full of her hot, potent seed, filling your womb up completely.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your locked cock is throbbing inside its cage as well.. before releasing a few strings of seed onto Artica's belly, marking her fur.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your bobbing cock is throbbing as well.. before releasing a few long strings of seed onto Artica's belly, marking her fur.")

		saynn("Bathing in this immense amount of pleasure, you lose your firm grip on Artica's neck, letting her breath heavily..")

		saynn("[say=artica]Kh-h.. hh-hh..h..ah..ah.kh..[/say]")

		saynn("Poor fluff is arching her back, her cock still pulsing inside.. making you moan even as your orgasm starts to fade.")

		if (GM.pc.isVisiblyPregnant()):
			saynn("[say=pc]T-there we go.. See my pregnant belly? Next time I want your pups in there~.[/say]")

		else:
			saynn("[say=pc]T-there we go.. See my belly? It's gonna have your pups~.[/say]")

		saynn("As you try to escape her knot.. Artica gasps and squirms more, her toes curling, tail spazzing.")

		saynn("[say=artica]Nh-h.. uff-fh..[/say]")

		saynn("[say=pc]Guess I'm gonna be your cockwarmer for a little longer.[/say]")

		saynn("You lean forward and grab Artica's chin. She is blushing deeply.. but you do see the subtle resentment in her expression.")

		saynn("[say=pc]Try and tell someone. See what happens~.[/say]")

		addButton("Get up", "Try to escape the knot", "rough_get_bred_ride_escape")
	if(state == "rough_get_bred_ride_escape"):
		playAnimation(StageScene.SexCowgirlChoke, "tease", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Artica's knot takes some time to deflate.. as each time you tug on it, the orb seems to be filling up with blood again.. but eventually you manage to yank it out of your used pussy, making it release a torrent of the fluff's seed.. directly onto her lilac uniform that was lying nearby..")

		saynn("[say=pc]Oops~.[/say]")

		saynn("Artica sees that.. and whines.. before grabbing her clothes anyway and running away without even saying goodbye. Oh well.")

		saynn("That was fun at least.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rough_breed"):
		playAnimation(StageScene.Choking, "tease", {pc="pc", npc="artica", bodyState={exposedCrotch=true, hard=true}, npcBodyState={naked=true}})
		saynn("You ignore her pleading and use your free hand to pull her balls up, revealing a dry cunt.")

		saynn("[say=artica]P-please.. I w-won't.. t-t..tell..[/say]")

		saynn("A few of your digits slip between her cyan folds, piercing her tight slit.. and proceeding to thrust them in and out.")

		saynn("[say=pc]Sh-h.. Focus on getting wet, slut.[/say]")

		saynn("Her own cock is still mostly in its sheath.. but yours is hard as a rock. Artica sees that.. and shakes her head more, her body tensing up around your digits, her pussy gripping them..")

		saynn("But you just keep finger-fucking her, until her twitching cunt gives up.. and becomes slightly more wet..")

		saynn("[say=artica]W-wai-.. h-hh.. I'm n-not r-rea.. d-d..[/say]")

		saynn("Too late.")

		addButton("Take her", "Time for the fun part", "rough_breed_fuck")
	if(state == "rough_breed_fuck"):
		playAnimation(StageScene.Choking, "sex", {pc="pc", npc="artica", bodyState={exposedCrotch=true, hard=true}, npcBodyState={naked=true}})
		var pcHasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		saynn("With a desperate whine, she tries to break free.. but her efforts end up being useless as you guide your {pc.penis} under hers and put pressure on her quivering pussy..")

		saynn("Then, with a sudden thrust, you enter her, the intruding cock spreading her delicate cyan folds and plunges deep into her.. tight, clenching slit.")

		saynn("[say=artica]Agh.. h-h..[/say]")

		saynn("Terror floods her mind as you start fucking her raw, pulling back slightly.. just to ram your dick inside, her pussy clenching instinctively around your shaft as you do that, a futile attempt to resist the forced act.")

		saynn("[say=artica]Ah! I-it's too much!.. I can't.. p-please.. M.m-mercy..[/say]")

		saynn("Any cries of protest are silenced by the noise of the waterfall. Your free hand grabs her leg and raises it high, giving you more free access to her slit while the second keeps a firm grip on the neck, putting extra pressure on it when you feel Artica trying to escape.")

		saynn("Even though the fluff is resisting as much as she can, her body begins to betray her, the inner cyan walls becoming slick as your member slides through them, her juices coating the intruding length. At the same time, her own cock is still mostly hiding in its sheath.. but more of it is coming out as Artica seems to be approaching something.. Just like you.")

		saynn("[say=artica]P-please!.. S-stop.. ngh-h.. ah..ah.. t-too much..[/say]")

		if (pcHasKnot):
			saynn("The knot on your cock is inflating.. it's pushing on Artica's folds, failing to fit.. so you gotta make it fit.")

			addButton("Knot her", "Breed the fluff", "rough_breed_breed")
		else:
			addButton("Cum inside", "Breed the fluff", "rough_breed_breed")
	if(state == "rough_breed_breed"):
		playAnimation(StageScene.Choking, "inside", {pc="pc", npc="artica", pcCum=true, npcCum=true, bodyState={exposedCrotch=true, hard=true}, npcBodyState={naked=true, hard=true}})
		var pcHasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		if (pcHasKnot):
			saynn("With a final, relentless thrust, your fat orb slips past Artica's tight pussy entrance, stretching her out to an extreme level and tying her to your cock.")

			saynn("[say=artica]Oh gods!.. Ah-h!.. T-too much.. It's too much!.. Ah.h.h-h..[/say]")

		else:
			saynn("With a final, relentless thrust, you ram your cock as deep as that tight pussy allows, stretching her out and breaking into her babymaker.")

			saynn("[say=artica]Oh gods.. it's too intense.. Ah.h-h..[/say]")

		saynn("Her hot inner walls clench hard around your throbbing member, her pussy releasing a shower of transparent fluids.. Her own cock pulses and releases its pent-up seed onto her belly as you make sure to trap it angled that way.")

		saynn("Finally, with a mean growl, your hot sticky seed is spilling into Artica's quivering mess of a pussy as she trembles before you. Her eyes rolling high up as she feels your {pc.cum} stuffing her womb full, her toes and tail twitching after each throb.")

		saynn("[say=pc]Grr-r.. Enjoy the first batch of pups, slut.[/say]")

		saynn("[say=artica]Nh-h.. ah.. ah.ah.. fuh-h.. nn-n..[/say]")

		if (pcHasKnot):
			saynn("You look her right into the sorry eyes, your cock still fully inside her, the knot preventing most of the leakage. Her legs are.. shaking.. though..")

		else:
			saynn("You look her right into the sorry eyes, your cock still fully inside her, some of your seed already dripping down onto her snowy fur.")

		addButton("Pull out", "Breeding well done", "rough_breed_pullout")
	if(state == "rough_breed_pullout"):
		playAnimation(StageScene.Choking, "inside", {pc="pc", npc="artica", bodyState={exposedCrotch=true, hard=true}, npcBodyState={naked=true, hard=true}})
		var pcHasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		if (pcHasKnot):
			saynn("You wait for the knot to deflate.. before yanking it out with full force, causing a flood of your seed that leaves quite a mess on her fur.")

			saynn("[say=artica]EEP!.. ah.. h-h..[/say]")

		else:
			saynn("You let the girl be your cock warmer for a bit.. before pulling your cock out, causing a bigger flood of your seed that leaves quite a mess.")

			saynn("[say=artica]Ah..[/say]")

		saynn("You let go of her neck.. allowing Artica to flop onto the ground. She is panting heavily, her used pussy still twitching and dripping excessively, her soft cock pulsing after the release.")

		saynn("[say=pc]Go and cry to someone, see what happens.[/say]")

		saynn("She reaches for her uniform.. and notices that it's soaked with cum.. Still, she grabs it and just escapes when given the chance.")

		saynn("Well, time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rough_letgo"):
		playAnimation(StageScene.SexStart, "start", {npc="artica", npcBodyState={naked=true}})
		saynn("As you let go of Artica's throat, she falls to the floor, coughing and whining, her hands rubbing the marks that your digits left on her neck, above her collar.")

		saynn("You just look down at her, your mean eyes piercing her terrified gaze.")

		saynn("[say=pc]Try to tell anyone. And see what happens.[/say]")

		addButton("Continue", "See what happens next", "rough_artica_runs_away")
	if(state == "rough_artica_runs_away"):
		removeCharacter("artica")
		playAnimation(StageScene.Solo, "stand")
		saynn("After catching her breath somewhat, Artica grabs her uniform.. and dashes away.")

		saynn("Well, time to go then.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "ask_mood_waterfall_watertribe"):
		playAnimation(StageScene.Duo, "sit", {npc="artica", npcBodyState={naked=true,hard=true}})
		saynn("[say=pc]Is that a snowflake pattern on your shoulder? I thought you're from the water tribe.[/say]")

		saynn("Without thinking about it, Artica tries to look at her shoulder.. which makes her lean and turn towards you, giving you a great view of her sheath.. a half-hard canine member peeking out of it, bobbing up and down while the fluff wiggles around.")

		saynn("[say=artica]I am from the water tribe.. But I'm an Ice Jogauni..[/say]")

		saynn("While trying to recall if Ice was one of the 8 tribes, Artica realizes that you're looking directly at her crotch. She blushes deeply and tries to cover her sheath up.")

		saynn("[say=artica]Eep..[/say]")

		saynn("You chuckle softly.")

		saynn("[say=pc]Ice Jogauni?[/say]")

		saynn("[say=artica]Y-yeah.. It's a l-long story..[/say]")

		saynn("Her paws squeeze her sheath and balls.. which only seems to make her get harder.")

		addButton("Hear the story", "Encourage her to tell you her story", "ask_mood_waterfall_hearstory")
		addButton("Enough nudity", "Tell her to dress up", "ask_mood_waterfall_dressup")
		addButton("Grab her throat", "Enough playing nice. The sight makes you horny for more. Way more", "ask_mood_waterfall_grabthroat")
	if(state == "ask_mood_waterfall_hearstory"):
		saynn("[say=pc]I'm curious. Really.[/say]")

		saynn("Artica's lips are trembling. She releases the situation she got herself in.. standing naked in front of you..")

		saynn("[say=pc]Or we can talk about something else.[/say]")

		saynn("[say=artica]I was young.. um..[/say]")

		saynn("The fluff stays quiet for a bit, trying to focus.")

		saynn("[say=artica]Very young.. had gray fur like my others from my tribal village..[/say]")

		saynn("She rubs the fur on her shoulders and thighs.")

		saynn("[say=artica]Winter that year was harsh.. when we were out on a hunt, I ended up lost.. started freezing..[/say]")

		saynn("She rubs her nose, accidentally revealing her cyan nipple.. that has a cute little piercing on it.")

		saynn("[say=artica]Next.. I barely remember myself.. There was a cave.. I followed it.. I don't know.. I was scared.. but it wasn't getting any warmer in there.. I remember the fear that I had..[/say]")

		saynn("Her paws rub her trembling body. Her tail is curling around her waist.. she stands high on her toes.")

		saynn("[say=artica]Everything was a blur.. I was close to passing out.. Only ice everywhere..[/say]")

		saynn("Artica looks somewhere far away, her unblinking gaze focussed completely.. She starts trying to back away from whatever she is looking at.. but then freezes in places, her paws spread, revealing her bits.")

		saynn("[say=artica]Flash of light.. Some kind of.. Being.. it grabbed me.. Ah..[/say]")

		saynn("She gasps and arches her back, completely exposing herself, her chest puffed out forward.")

		saynn("[say=artica]Ice.. bending.. like snakes.. wrapping all around me.. fear..[/say]")

		saynn("Artica is struggling.. against air.. trying to pull her paws free..")

		saynn("[say=artica]I was terrified.. I felt.. some kind of energy flowing through me.. Energy that was.. doing something to me.. changing me.[/say]")

		saynn("She slowly kneels and wraps her hands around her body.")

		saynn("[say=artica]When the creature vanished.. I realized.. my fur was.. white.[/say]")

		saynn("Her gaze jumps at you.")

		saynn("[say=artica]And the cold.. it wasn't bothering me anymore..[/say]")

		saynn("She slowly gets up, her paws still covering herself.")

		saynn("[say=pc]What do you think it was? Magic? Gods?[/say]")

		saynn("She shrugs.")

		saynn("[say=artica]I can't explain it..[/say]")

		saynn("Both of you stay quiet for some time. No matter how mysterious it might seem.. the proof is right here.. standing near you.")

		saynn("[say=artica]I'm glad I didn't die that day.. haha..[/say]")

		saynn("She smiles.. Her smile is contagious.")

		addButton("Continue", "Time to wrap up probably", "ask_mood_waterfall_dressup")
		addButton("Grab her throat", "Enough playing nice. The sight makes you horny for more. Way more", "ask_mood_waterfall_grabthroat")
	if(state == "ask_mood_waterfall_dressup"):
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		addCharacter("artica")
		saynn("[say=pc]Well.. I think you might want to dress up again. Before anyone sees you.[/say]")

		saynn("Her ears perk at a random noise.. before she quickly grabs her clothes and starts putting them on.")

		saynn("[say=artica]Y-yeah..[/say]")

		saynn("You get up and walk up to the blushing fluff.")

		saynn("[say=pc]Well, this is it. This is most of the prison.[/say]")

		saynn("[say=artica]Thank you.. it was fun..[/say]")

		saynn("You nod.")

		saynn("[say=pc]See you around.[/say]")

		saynn("[say=artica]I will be in the canteen.. probably..[/say]")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_corrupt"):
		runScene("articaS7FirstShowerScene")
		setFlag("ArticaModule.corruptionBegan", true)
		endScene()
		return

	if(_action == "ask_leg"):
		setFlag("ArticaModule.s6AskedLeg", true)
		getModule("ArticaModule").removeShy(0.05)

	if(_action == "ask_risha"):
		setFlag("ArticaModule.s6AskedRisha", true)
		getModule("ArticaModule").removeShy(0.1)

	if(_action == "ask_paws"):
		setFlag("ArticaModule.s6AskedPaws", true)
		getModule("ArticaModule").removeShy(0.1)

	if(_action == "ask_mood"):
		setFlag("ArticaModule.s6AskedMood", true)

	if(_action == "just_eat_together"):
		processTime(15*60)
		setFlag("ArticaModule.s6ateday", GM.main.getDays())
		setFlag("Canteen_PlayerAteToday", true)
		GM.pc.afterEatingAtCanteen()
		getModule("ArticaModule").removeShy(0.1)

	if(_action == "kinky_checkbeans"):
		processTime(3*60)
		#getModule("ArticaModule").removeShy(0.03)
		#getModule("ArticaModule").addPawslut(0.03)

	if(_action == "kinky_headpats"):
		processTime(5*60)
		getModule("ArticaModule").removeShy(0.07)

	if(_action == "kinky_force_sniff"):
		processTime(10*60)
		getModule("ArticaModule").removeShy(1.0)

	if(_action == "kinky_checkpaw_ankle"):
		processTime(15*60)
		getModule("ArticaModule").removeShy(0.05)

	if(_action == "kinky_checkpaw_beans"):
		processTime(15*60)
		getModule("ArticaModule").removeShy(0.05)
		getModule("ArticaModule").addPawslut(0.03)

	if(_action == "kinky_checkpaw_switch"):
		processTime(15*60)
		getModule("ArticaModule").removeShy(0.05)
		getModule("ArticaModule").addPawslut(0.06)

	if(_action == "kinky_checkpaw_let_lick"):
		processTime(15*60)
		getModule("ArticaModule").removeShy(0.05)
		getModule("ArticaModule").addPawslut(0.1)

	if(_action == "kinky_checkpaw_rub_crotch"):
		processTime(15*60)
		getModule("ArticaModule").removeShy(0.1)
		getModule("ArticaModule").addPawslut(0.1)

	if(_action == "leg_otherways"):
		getModule("ArticaModule").removeShy(0.05)

	if(_action == "leg_whore"):
		getModule("ArticaModule").removeShy(0.05)
		getModule("ArticaModule").addPawslut(0.02)

	if(_action == "enough_talk"):
		processTime(10*60)
		setState("")
		return

	if(_action == "risha_whoknows"):
		getModule("ArticaModule").removeShy(0.05)

	if(_action == "risha_youare"):
		getModule("ArticaModule").removeShy(0.05)

	if(_action == "ask_paws_shrug"):
		getModule("ArticaModule").removeShy(0.05)

	if(_action == "ask_paws_teasemore"):
		processTime(5*60)
		getModule("ArticaModule").removeShy(0.05)
		getModule("ArticaModule").addPawslut(0.05)

	if(_action == "ask_paws_teaseevenmore"):
		processTime(5*60)
		getModule("ArticaModule").removeShy(0.05)
		getModule("ArticaModule").addPawslut(0.05)

	if(_action == "ask_paws_cum"):
		processTime(15*60)
		getModule("ArticaModule").removeShy(0.05)
		getModule("ArticaModule").addPawslut(0.1)

	if(_action == "ask_mood_hand"):
		processTime(10*60)
		getModule("ArticaModule").removeShy(0.05)
		grabCollar = false

	if(_action == "ask_mood_collar"):
		processTime(10*60)
		getModule("ArticaModule").removeShy(0.1)
		grabCollar = true
		setState("ask_mood_hand")
		return

	if(_action == "ask_mood_show_medical"):
		processTime(3*60)

	if(_action == "ask_mood_workshop"):
		processTime(15*60)

	if(_action == "ask_mood_yard"):
		processTime(10*60)

	if(_action == "ask_mood_waterfall"):
		processTime(5*60)

	if(_action == "ask_mood_waterfall_comfort"):
		processTime(3*60)
		getModule("ArticaModule").removeShy(0.2)
		setState("ask_mood_waterfall_comfort")
		return

	if(_action == "ask_mood_waterfall_happenanyway"):
		processTime(3*60)
		getModule("ArticaModule").removeShy(0.2)
		setState("ask_mood_waterfall_comfort")
		willHappenAnyway = true
		return

	if(_action == "ask_mood_waterfall_grabthroat"):
		setFlag("ArticaModule.s6GrabbedThroat", true)
		getModule("ArticaModule").removeShy(1.0)

	if(_action == "rough_letgo"):
		processTime(3*60)

	if(_action == "rough_breed"):
		setFlag("ArticaModule.s6HadRoughSex", true)
		setFlag("ArticaModule.s6HadRoughSexCameInside", true)

	if(_action == "rough_get_bred"):
		setFlag("ArticaModule.s6HadRoughSex", true)

	if(_action == "rough_get_bred_ride"):
		processTime(6*60)
		GM.pc.gotVaginaFuckedBy("artica")

	if(_action == "rough_get_bred_ride_harder"):
		processTime(3*60)

	if(_action == "rough_get_bred_ride_cum"):
		processTime(3*60)
		GM.pc.gotVaginaFuckedBy("artica")
		GM.pc.cummedInVaginaByAdvanced("artica", {knotted=true})
		if(GM.pc.hasReachablePenis() || GM.pc.isWearingChastityCage()):
			getCharacter("artica").cummedOnBy("pc")
		else:
			getCharacter("artica").cummedOnBy("pc", FluidSource.Vagina)
		GM.pc.orgasmFrom("artica")

	if(_action == "rough_get_bred_ride_escape"):
		processTime(10*60)

	if(_action == "rough_breed_fuck"):
		processTime(3*60)

	if(_action == "rough_breed_breed"):
		getCharacter("artica").cummedInVaginaBy("pc")
		getCharacter("artica").cummedOnBy("artica")
		GM.pc.orgasmFrom("artica")

	if(_action == "rough_breed_pullout"):
		processTime(10*60)

	if(_action == "ask_mood_waterfall_hearstory"):
		setFlag("ArticaModule.s6HeardStory", true)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isFirstTime"] = isFirstTime
	data["shyness"] = shyness
	data["pawslut"] = pawslut
	data["grabCollar"] = grabCollar
	data["willHappenAnyway"] = willHappenAnyway

	return data

func loadData(data):
	.loadData(data)

	isFirstTime = SAVE.loadVar(data, "isFirstTime", false)
	shyness = SAVE.loadVar(data, "shyness", 0.0)
	pawslut = SAVE.loadVar(data, "pawslut", 0.0)
	grabCollar = SAVE.loadVar(data, "grabCollar", false)
	willHappenAnyway = SAVE.loadVar(data, "willHappenAnyway", false)
