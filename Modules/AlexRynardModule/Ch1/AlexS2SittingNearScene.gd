extends SceneBase

var howManyTimes = 0

func _init():
	sceneID = "AlexS2SittingNearScene"

func _initScene(_args = []):
	addCharacter("alexrynard")
	howManyTimes = getFlag("AlexRynardModule.ch1HowManyTimesIdled", 0)
	
	if(howManyTimes == 0):
		setState("first_time")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	if(howManyTimes == 1):
		setState("time2")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	if(howManyTimes == 2):
		setState("time3")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	if(howManyTimes == 3):
		setState("time4")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	if(howManyTimes == 4):
		setState("time5")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	if(howManyTimes == 5):
		setState("time6")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	if(howManyTimes == 6):
		setState("time7")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	if(howManyTimes == 7):
		setState("time8")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	if(howManyTimes == 8):
		setState("time9")
		increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		return
	else:
		setState("time9")
		# increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")
		if(true):
			return
	
	setState(RNG.pick([
	"time2",
	"time3",
	]))
	increaseFlag("AlexRynardModule.ch1HowManyTimesIdled")

func _run():
	if(state == ""):
		addCharacter("alexrynard")
	if(state == "first_time"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Alex is still working on fixing a giant pile of datapads, one by one.")

		saynn("The last time didn't go so well.. but still.. Why not keep him some company?")

		saynn("You sit down on one of the chairs and just proceed to watch him work. Reaction doesn't take long, Alex stops doing what he was doing and looks at you.")

		saynn("[say=alexrynard]Came to bug me again?[/say]")

		saynn("[say=pc]I promise I won't.[/say]")

		saynn("He grumbles and furrows his brows.")

		saynn("[say=alexrynard]Fine. Just don't snore. None of this is gonna be interesting.[/say]")

		saynn("[say=pc]Beats working in the mineshaft all day.[/say]")

		saynn("[say=alexrynard]I bet.[/say]")

		saynn("And so you just.. sit nearby.. and watch Alex.")

		saynn("He grabs one of the datapads and does a quick visual check. Seeing that there is no obvious damage, he tries to power it on. But the device doesn't boot. Alex then pries open a battery cover and finds that the battery has started leaking. He grumbles a little and goes ahead and replaces it, making the thing finally turn on.")

		saynn("A fixed datapad gets placed into the bin.. and then another.. and another..")

		addButton("Continue", "Time flies", "after_first_time")
	if(state == "after_first_time"):
		saynn("Literal hours are passing by. And not much is changing. Alex is fixing up broken devices one by one while you just sit nearby. It's not exactly thrilling.. but at least he is not grumpy at you?")

		saynn("[say=alexrynard]I'm going on a little break. So scatter off please, I don't want you touching anything.[/say]")

		saynn("Aw, there it is. Well, might as well obey.")

		addButton("Continue", "That was fun", "endthescene")
	if(state == "time2"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Alex is here.. and he seems to be working on that giant pile of broken datapads again.. so why not sit nearby.")

		saynn("He sighs as you do that. The guy clearly starts to see the trend.")

		saynn("[say=alexrynard]Don't you have something better to do?[/say]")

		saynn("[say=pc]Nope.[/say]")

		saynn("[say=alexrynard]Fair.[/say]")

		saynn("[say=pc]Should I leave?[/say]")

		saynn("[say=alexrynard]I don't care, do whatever. As long as I can work.[/say]")

		saynn("You offer him a little smile and just stay quiet, letting the foxy focus.")

		saynn("He grabs one of the datapads and checks it. The thing has cracks all over it, screen, case, buttons. Seeing it makes Alex grumble.")

		saynn("[say=alexrynard]Risha's job clearly.[/say]")

		saynn("The device looks truly unsalvageable, almost like it was sat on. But Alex still begins to unscrew the front panel to see what can be saved.")

		saynn("[say=alexrynard]Battery is.. okay.. Screen is obviously ruined.. Motherboard.. some of it can be reused.. Crystal seems to be fine too..[/say]")

		saynn("Takes him forever.. but in the end he salvages some of the components, sending the rest to the red bin.")

		saynn("With nothing better to do, you continue watching..")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "toolate"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="stand"})
		saynn("Time flies.. So fast in fact, that you become quite sleepy.")

		saynn("You put your elbows on the table and support your head. Your drowsy eyes keep watching Alex work.. until they begin to close on their own..")

		saynn("But just before your chin hits the table, you hear a voice that makes you snap out of it.")

		saynn("[say=alexrynard]Up. My shift is over.[/say]")

		saynn("Right.. You yawn and rub your eyes quickly before getting up.")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "aftersomefixing"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="stand"})
		saynn("Time flies. Alex is fixing the datapads one after another while you just watch. But the pile doesn't seem to get any smaller..")

		saynn("[say=alexrynard]Break time. Don't touch anything.[/say]")

		saynn("You weren't planning to. The guy will return soon anyway.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time3"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You sit on one of the chairs and just watch Alex work.")

		saynn("Not much happens this time. He just fixes some more datapads.")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "time4"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Another day, another set of broken datapads.")

		saynn("You take your usual seat, far away to not disturb the foxy.. and just watch him work.")

		saynn("It looks like he has given up, accepting your constant presence.")

		saynn("[say=alexrynard]This won't make me eager to fuck you, just saying. Not that many things will.[/say]")

		saynn("You shrug and smile.")

		saynn("[say=pc]Sure.[/say]")

		saynn("He looks at you.. and sighs.. returning to his monumental task.")

		saynn("[say=pc]Might I help you though?[/say]")

		saynn("[say=alexrynard]No.[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("One stare.. enough to make you go quiet. Oh well, it was worth a try.")

		saynn("Alex grabs his screwdriver and begins fixing the next broken device.. Time to idle.")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "time5"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You decide to watch Alex working some more. You don't even know why anymore. But.. life does give you a good reason this time.")

		saynn("Alex grabs one of the datapads with a cracked screen.. and begins to search for something on his work table. Something that is clearly not there.")

		saynn("[say=alexrynard]Where did I leave the damn thing..[/say]")

		saynn("Huh. You would offer your help to him.. but you know his answer already.. so you just do it anyway.")

		saynn("You look around. All other work tables seem to be empty. But.. then you notice something shiny under the one that Alex is sitting behind.")

		saynn("A screwdriver! You see it. But how should you do it?")

		addButton("Tell him", "Tell Alex where the screwdriver is", "time5_tell")
		addButton("Give him", "Grab the screwdriver and give it to him", "time5_give")
	if(state == "time5_tell"):
		saynn("[say=pc]I see it. Under your table.[/say]")

		saynn("Alex looks down and sees the tool near his feet.")

		saynn("[say=alexrynard]Right.[/say]")

		saynn("He leans down and grabs it.")

		saynn("Awkward silence settles in.")

		saynn("[say=alexrynard]Thanks.[/say]")

		saynn("[say=pc]No problem.[/say]")

		saynn("And.. he just returns to repairing.")

		saynn("At least you helped him this time! And he wasn't even mad.")

		saynn("For some reason, you are now smiling while watching him work.")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "time5_give"):
		playAnimation(StageScene.Duo, "allfours", {npc="alexrynard", npcAction="sit"})
		saynn("This is your chance to help him!")

		saynn("You quickly get off the chair and climb under his table. You grab the tool and sneak out the table.. ending up between the foxy's legs.. on all fours.")

		saynn("[say=alexrynard]What are you..[/say]")

		saynn("You offer him the lost screwdriver.")

		saynn("[say=pc]Here, I found it.[/say]")

		saynn("He.. blinks a few times while seeing you in that pose.. and then frowns.")

		saynn("[say=alexrynard]Get out of there, now.[/say]")

		addButton("Get out", "Do as he says", "time5_give_getout")
	if(state == "time5_give_getout"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You get out from under his table after he grabs his tool.")

		saynn("[say=alexrynard]Don't ever do that again.[/say]")

		saynn("He snarls, showing his sharp fangs.")

		saynn("[say=pc]Why not?[/say]")

		saynn("[say=alexrynard]You're gonna cut your hands on some metal shavings, get an infection and fucking die. That's 'why not'.[/say]")

		saynn("That.. does make sense.. even if he was pretty rude about it.")

		saynn("You sit on your chair and lower your gaze. Alex is still kinda angry. He starts unscrewing the back panel of the broken datapad.. before stopping again.")

		saynn("[say=alexrynard]But yeah. Thanks.[/say]")

		saynn("[say=pc]No problem..[/say]")

		saynn("Looks like he is not entirely against receiving help. You return to watching him work..")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "time6"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("As is tradition by now, you sit near Alex.. and begin watching him work. He still sighs softly each time you join him.")

		saynn("He repairs a few more datapad while you make sure no tool goes missing. None of them do, sadly. Alex seems to now carefully put them back where they belong to when he is finished using them.")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "time7"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Alex is fixing datapads one at the time while you sit nearby and offer him a cozy quiet company.")

		saynn("This time though, things are anything but quiet.")

		saynn("[sayMale]Hey there. Can you help me here? I need these two pieces welded.[/sayMale]")

		saynn("Another engineer is standing near Alex, holding two metal sheets.")

		saynn("[say=alexrynard]Sure.[/say]")

		saynn("Foxy puts on some welding goggles and instinctively grabs his trusty welding tool.. before realizing that you are still staring.")

		if (GM.pc.isBlindfolded()):
			saynn("[say=alexrynard]Oh, you're blindfolded already. Stay that way.[/say]")

			saynn("Huh?")

			saynn("You realize why seconds later as you begin to see a somewhat bright flash even through the fabric of your blindfold. Alex quickly welds the two pieces together and hands them back to the other engineer.")

			saynn("After.. It's work as usual. Your curiosity makes you ask something.")

			saynn("[say=pc]What would you have done if I wasn't blindfolded?[/say]")

			saynn("A few seconds later, you hear a chuckle.")

			saynn("[say=alexrynard]I would've blindfolded you myself. I don't have any more goggles.[/say]")

			saynn("Right.. Wait. So he has a blindfold then? Kinky.")

			addButton("Continue", "See what happens next", "skiphours_check")
		else:
			saynn("[say=alexrynard]You wanna go blind? I only have one pair of goggles.[/say]")

			saynn("Yeah, no.")

			saynn("[say=pc]I can hold my eyes closed.[/say]")

			saynn("Alex shakes his head.")

			saynn("[say=alexrynard]Like I can trust you with that. Here is what we are gonna do.[/say]")

			saynn("He grabs a leather blindfold from one of his pouches.")

			saynn("[say=alexrynard]Stay still.[/say]")

			saynn("Looks like.. he wants to blindfold you?")

			addButton("Let him", "Let Alex put a blindfold over your eyes", "time7_letblindfold")
			addButton("No blindfolds!", "What does he think he is doing?", "time7_noblindfold")
	if(state == "time7_letblindfold"):
		saynn("You let him do it because.. why not? It's for your own safety anyway.")

		saynn("Alex carefully positions the leather blindfold over your eyes and then ties it behind your head. Not too tight but also not loose enough to slip off.")

		saynn("You realize seconds later the reason behind that blindfold as you begin to see a somewhat bright flash even through its fabric. Alex welds the two pieces together and hands them back to the other engineer.")

		saynn("[sayMale]Thanks, that was quick.[/sayMale]")

		saynn("[say=alexrynard]Uh huh.[/say]")

		saynn("After that.. he returns to fixing the datapads.. Wait..")

		saynn("[say=pc]What about..[/say]")

		saynn("[say=alexrynard]You can keep it.[/say]")

		saynn("Looks like you have received a gift. Or maybe he just grew tired of your constant stare?")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "time7_noblindfold"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="sit"})
		saynn("[say=pc]No blindfolds, you're not putting it on me.[/say]")

		saynn("Alex shrugs.")

		saynn("[say=alexrynard]Go for a walk then. I'm not destroying your eyes.[/say]")

		saynn("Well.. fine. You get up and prepare to leave.")

		saynn("Still.. the guy didn't have extra goggles but he had a blindfold? Huh.")

		addButton("Leave", "Time to go", "endthescene")
	if(state == "time8"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You sit near Alex. Looks like he is back to repairing the broken devices.")

		if (GM.pc.isBlindfolded()):
			saynn("He notices your blindfold.")

			saynn("[say=alexrynard]You're still wearing it?[/say]")

			saynn("[say=pc]Yeah, is that a problem?[/say]")

			saynn("[say=alexrynard]It is. But not mine.[/say]")

		saynn("Not much happens today. But half-way through the day some guard has arrived to drop off more of these broken datapads, making the pile bigger than it was..")

		saynn("[say=alexrynard]Really? Are you using them as weapons or something?[/say]")

		saynn("The guard shrugs and just walks away.")

		saynn("[say=alexrynard]Right..[/say]")

		saynn("[say=pc]I can..[/say]")

		saynn("[say=alexrynard]No.[/say]")

		saynn("Looks like he would rather die than let you help him with anything.")

		saynn("After some time, Alex sighs and looks at you.")

		saynn("[say=alexrynard]There is a toolbox in the staff-only room on one of the work benches. Bring it to me. I will open the door remotely.[/say]")

		if (GM.pc.isBlindfolded()):
			saynn("You can't exactly see where you are going.. but you will surely try! As this is your chance to shine.")

		else:
			saynn("Oh. Looks like this is your chance to shine!")

		addButton("Toolbox", "Go grab it", "time8_toolbox")
	if(state == "time8_toolbox"):
		aimCameraAndSetLocName("eng_breakroom")
		playAnimation(StageScene.Solo, "stand")
		saynn("You get up and walk out of the workshop and into the staff-only area. Alex opens all the right doors for you, allowing you to easily find your way around.")

		saynn("Oh, there is that workbench with the toolbox. You walk up to it. Your hands grab the toolbox by the handle and try to lift it..")

		saynn("You suddenly realize why he made you bring it rather than grabbing it himself, the thing is fucking heavy.")

		saynn("While trying to lift it off the bench.. your eyes stumble upon some schematics that are pinned to the board above it.")

		saynn("Huh. These are the schematics of the datapads that Alex is repairing. Each part is labeled. Strangely enough, you recognize most of them by now. Cool.")

		saynn("But, there are also some other schematics there. Like the little portal device that you saw on the portal panties.. But also some other prototypes that you have never seen.")

		addButton("Bring toolbox", "Bring the heavy thing back to Alex", "time8_bringtoolbox")
	if(state == "time8_bringtoolbox"):
		aimCameraAndSetLocName("eng_workshop")
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		if (GM.pc.getStat(Stat.Strength) < 10):
			saynn("Even though the toolbox is heavy, you still manage to bring it back to Alex just fine, thanks to your high strength.")

		else:
			saynn("You don't have much strength.. so bringing Alex that toolbox turned out to be a whole journey. Your hands are shaking by the end of it.. but you just about manage.")

		saynn("[say=alexrynard]Thanks.[/say]")

		saynn("He grabs a few different tools from it and begins repairing the freshly-arrived datapads.")

		saynn("[say=pc]Is there anything else I can do?[/say]")

		saynn("[say=alexrynard]Nope.[/say]")

		saynn("Aw. There goes that. You flop onto your chair and return to watching him work.")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "time9"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="stand"})
		saynn("You sit on your chair, preparing to watch Alex work.")

		saynn("But soon enough, some other engineer approaches him.")

		saynn("[sayMale]There was an accident in the mines. I need you Alex.[/sayMale]")

		saynn("[say=alexrynard]Can't it wait? I just started here.[/say]")

		saynn("[sayMale]It can't.[/sayMale]")

		saynn("He looks at his table with lots of broken datapads and tools. Then he looks at you.")

		saynn("[say=pc]I can help maybe?[/say]")

		saynn("Could be your chance for a bigger adventure.")

		saynn("[say=alexrynard]No, you stay and guard this, okay? And don't touch anything.[/say]")

		saynn("Yeah, that makes sense.")

		saynn("[say=pc]Alright. Fine.[/say]")

		saynn("Alex nods towards his college and they two walk away, leaving you alone..")

		addButton("Continue", "See what happens next", "time9_boring")
	if(state == "time9_boring"):
		removeCharacter("alexrynard")
		playAnimation(StageScene.Solo, "sit")
		saynn("You sit still and guard the tools and a pile of broken devices.. Somehow this is more boring than watching Alex work.")

		saynn("Some time passes.. Whatever happened in the mines, looks like it will take a while.")

		saynn("Huh. The datapad that Alex was working on.. Looks like it's just missing the battery.")

		saynn("Hmm..")

		saynn("No, you shouldn't do this.")

		saynn("He doesn't need help, he said it many times.")

		addButton("Replace battery", "Might as well..", "time9_battery")
	if(state == "time9_battery"):
		saynn("You find a spare battery and slot it into the datapad before trying to turn it on.")

		saynn("And luckily, it seems to work fine! You put the battery cover on it and place the datapad into the bin of fixed datapads.")

		saynn("You catch yourself after that. You should probably stop now before it's too late..")

		saynn("But that pile is so big he surely won't notice if you help a bit more, right?")

		saynn("You grab the next broken datapad. This one has a cracked screen.. means you will have to replace the matrix. Shouldn't be too hard though, you saw Alex do this a million times.")

		saynn("You grab the screwdriver, unscrew the panel, carefully disconnect the little wires and take out the broken screen before replacing it with a new one and doing the same actions in reverse order.")

		saynn("And.. yep, it works. Yay. You put it into the bin and grab the next one!")

		addButton("Continue", "See what happens next", "time9_domore")
	if(state == "time9_domore"):
		saynn("A few hours have passed by now. Is Alex really trusting you this much? Makes sense, considering you proved many times already that you are willing to do nothing for many hours.")

		saynn("Not every datapad is repairable with your skills.. but you do your best, replacing batteries, broken buttons and cracked screens. Makes you wonder why they don't use better materials to make these things.")

		saynn("You probably fixed about.. 6 pieces? Wow, and that barely put a dent into it. The pile is just.. never-ending.")

		saynn("Wait, you hear someone coming. You quickly place everything back where it was.. at least, how you think it should be..")

		addButton("Continue", "See what happens next", "time9_alexreturns")
	if(state == "time9_alexreturns"):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="stand"})
		saynn("Alex returns and takes his spot behind the work table.")

		saynn("[say=pc]Welcome back.[/say]")

		saynn("[say=alexrynard]Mhm.[/say]")

		saynn("He sounds very tired. Looks tired too. His oil-stained hand blindly reaches for one of the tools.. but finds one that it didn't expect.")

		saynn("[say=alexrynard]Huh..[/say]")

		saynn("Oh no. He checks the current datapad.. and that confirms his suspicions.")

		saynn("[say=alexrynard]You tried to fix some?[/say]")

		saynn("No point in lying..")

		saynn("[say=pc]Yeah, I repaired the ones with the obvious..[/say]")

		saynn("He cuts you off, his tone growly.")

		saynn("[say=alexrynard]Did I ask you to do that?[/say]")

		saynn("[say=pc]But the pile..[/say]")

		saynn("[say=alexrynard]Did. I. Ask?[/say]")

		saynn("You shake your head.")

		saynn("[say=alexrynard]So why did you do that?[/say]")

		saynn("His voice makes you feel.. little. You can only shrug..")

		saynn("[say=pc]What's the big deal? I just wanted to help.[/say]")

		saynn("[say=alexrynard]Help? You realize that I now have to go through the whole bin to check them? Make sure you didn't fuck up any of them?[/say]")

		saynn("He sighs.")

		saynn("[say=alexrynard]What if they explode in someone's face? You're not an engineer, you don't have the full knowledge.[/say]")

		saynn("[say=pc]You could have taught me.[/say]")

		saynn("[say=alexrynard]Taught you? How can I trust you with anything? Especially now?[/say]")

		saynn("He sighs again.")

		saynn("[say=alexrynard]That was my mistake.[/say]")

		saynn("You.. are not sure how to react. For some reason it hurts.. Alex lowers his gaze, his tone calm.. but anxious.")

		saynn("[say=alexrynard]Go away.[/say]")

		saynn("Looks like it's best not to touch him anymore for now.")

		addButton("Leave", "Time to go", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "after_first_time"):
		processTime(60*60*5)

	if(_action == "skiphours_check"):
		processTime(RNG.randi_range(6,9) * 60 * 60)
		
		if(GM.main.isVeryLate()):
			setState("toolate")
		else:
			setState("aftersomefixing")
		return

	if(_action == "time5_tell"):
		processTime(5*60)

	if(_action == "time5_give"):
		processTime(5*60)

	if(_action == "time5_give_getout"):
		processTime(60)

	if(_action == "time7_letblindfold"):
		processTime(3*60)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))

	if(_action == "time7_noblindfold"):
		processTime(20*60)

	if(_action == "time8_toolbox"):
		processTime(2*60)

	if(_action == "time8_bringtoolbox"):
		processTime(10*60)
		if(GM.pc.getStat(Stat.Strength) < 10):
			GM.pc.addStamina(-50)

	if(_action == "time9_boring"):
		processTime(20*60)

	if(_action == "time9_battery"):
		processTime(5*60)

	if(_action == "time9_domore"):
		processTime(2*60*60)

	if(_action == "time9_alexreturns"):
		processTime(2*60)
		increaseFlag("PortalPantiesModule.Alex_BusyDays")
		setFlag("AlexRynardModule.ch1FirstFuckup", true)

	setState(_action)

func saveData():
	var data = .saveData()

	data["howManyTimes"] = howManyTimes

	return data

func loadData(data):
	.loadData(data)

	howManyTimes = SAVE.loadVar(data, "howManyTimes", 0)
