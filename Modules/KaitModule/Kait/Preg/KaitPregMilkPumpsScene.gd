extends SceneBase

var breastPumpID = ""
var milkAm = 0.0

func _init():
	sceneID = "KaitPregMilkPumpsScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("Pick which breast pump do you want to use.. If any.")

		addButton("Cancel", "You changed your mind", "endthescene")
		addButton("Use hands", "No pump is gonna be used", "do_pick_nobreastpump")
		addPumpButtons("do_pick_breastpump")
		if (false):
			addButton("Nope", "You shouldn't see this", "do_pick_breastpump")
	if(state == "do_milk"):
		playAnimation(StageScene.Grope, "tease", {pc="kait", npc="pc"})
		saynn("You give Kait a quick full-body glance.")

		saynn("Her shirt is really tight.. her pregnant belly is what's mostly doing it.. but her relatively bigger breasts also don't help.")

		saynn("You notice two dark, wet spots on the fabric.. right where her chest is.")

		saynn("[say=pc]How are your breasts?[/say]")

		saynn("[say=kait]Itchy.. they feel full.[/say]")

		saynn("[say=pc]I can help with that. C'mon.[/say]")

		saynn("You pull out some breast pumps and show them to her.")

		saynn("Her ears perk up, she bites her lip.")

		saynn("[say=pc]You will have to undress. Can't do it through the cloth.[/say]")

		saynn("[say=kait]Alright.[/say]")

		addButton("Continue", "See what happens next", "do_put_pump_on")
	if(state == "do_put_pump_on"):
		#addCharacter("kait", ["naked"])
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="kait", npcBodyState={hard=true}})
		saynn("She slowly undoes some buttons and opens her shirt, exposing her swollen breasts. They are heavy and full, resting on her huge belly. Her dark nipples are looking perky and shiny. Perfect.")

		saynn("Gently, you cup one of her breasts in your hand, making her inhale softly. You place the first pump's cup over her nipple, making sure it's holding on by itself. Then you do the same for the other. She is watching you, her breathing getting a little faster.")

		saynn("[say=kait]Okay.. okay.. You can turn them on.[/say]")

		saynn("So impatient, this kitty.")

		saynn("[say=pc]Don't want you to fall. Come here.[/say]")

		saynn("You embrace the snow leopard from behind and help her land her fluffy butt onto the floor.")

		saynn("Then, you finally click the switches. A soft whirring starts. The pumps suck all the excess air out, tightly securing themselves around Kait's breasts.. and then they begin their steady rhythm, tugging on Kait's nips. Her back arches slightly.")

		saynn("[say=kait]Ah.. mhhm..[/say]")

		saynn("You just support her from behind, your hands jump to her fluffy hips.")

		saynn("Kait's eyes get shut, her lip gets bitten again. The pumps are fruitlessly tugging away on her chest.. but only for a bit.")

		saynn("Soon, the first thin stream of milk starts to flow into the cup. And then the second one joins, pulled from her enlarged nipples.")

		saynn("[say=kait]Ah.. it's so strong..[/say]")

		saynn("[say=pc]Too much?[/say]")

		saynn("[say=kait]No.. it's good.. very good..[/say]")

		saynn("She leans back into you, her tail curling around your waist. You place your chin on her shoulder and just watch her body and her reaction. She is switching between being very tense and relaxed, her lips producing cute little moans as the pumps keep working.")

		saynn("The pumps pull more and more of that sweet nectar, filling the bottles bit by bit. The streams of milk that were previously small are now much thicker, steady. Kait is panting softly, squirming in your hands, giving in to the sensations.")

		saynn("[say=kait]Mmm.. can feel it.. pulling it all out.. my nips are so tingly.. ah..[/say]")

		saynn("The whole room is filled with the scent of an aroused kitty. As well as the whirring noise of the pumps and the cute little gasps and moans.")

		addButton("Continue", "See what happens next", "do_actually_milk_pumps")
	if(state == "do_actually_milk_pumps"):
		saynn("The pumps managed to milk Kait's breasts for "+str(Util.roundF(milkAm))+" ml of milk!")

		saynn("You hold Kait tight. Her breasts start to look softer, less painfully full. The flow of milk begins to slow down to a trickle.. then to just a few drops.. Her nips look very sensitive.")

		saynn("[say=pc]I think this is it.[/say]")

		saynn("[say=kait]Mhh.. I think so too.. ah..[/say]")

		saynn("You turn off the pumps and begin to carefully remove them. Kait winces a little as the cool air rushes under the cups, surrounding her dark nips.")

		saynn("Kait looks at the result.. lots of milk now sloshing inside the pump's bottles.")

		saynn("[say=kait]I made this.. my body did.. hah..[/say]")

		saynn("[say=pc]And it will be able to do it again soon.[/say]")

		saynn("She chuckles.")

		saynn("[say=kait]Thank you. This is.. exactly what I needed.[/say]")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("You put the breast pumps away. The milking is done!")

		addButton("Continue", "See what happens next", "endthescene_getbackpump")
	if(state == "milk_no_pump"):
		playAnimation(StageScene.GropeBehind, "idle", {pc="kait", npc="pc"})
		saynn("You give Kait a quick full-body glance.")

		saynn("Her shirt is really tight.. her pregnant belly is what's mostly doing it.. but her relatively bigger breasts also don't help.")

		saynn("You notice two dark, wet spots on the fabric.. right where her chest is.")

		saynn("[say=pc]How are your breasts?[/say]")

		saynn("[say=kait]Itchy.. they feel full.[/say]")

		saynn("[say=pc]I can help with that. Come here.[/say]")

		saynn("You embrace the snow leopard from behind and begin to unbutton her shirt.. one button at a time.")

		addButton("Continue", "See what happens next", "grope_floor")
	if(state == "grope_floor"):
		#addCharacter("kait", ["naked"])
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="kait", npcBodyState={hard=true}})
		saynn("Once you have revealed her chest, you help her to gradually kneel on the floor, her back still against your chest. Better than risking her legs giving up.")

		saynn("Once you are done with the shirt, you wrap your arms around her, your hands coming to rest on her swollen breasts. They feel warm and soft under your palms. Kait lets out a soft sigh.")

		saynn("[say=kait]This is nice..[/say]")

		saynn("You start by gently cupping her breasts, just holding them at first. Your digits trace small circles around her nipples, making her shiver in your arms.")

		saynn("[say=kait]They're.. so sensitive..[/say]")

		saynn("You keep caressing her curves, your fingers brushing over her nips as they get hard under your touch.")

		saynn("[say=pc]Feeling a little better?[/say]")

		saynn("[say=kait]Sure.. but.. still itchy..[/say]")

		saynn("Sounds like an invitation.")

		addButton("Continue", "See what happens next", "do_grope_breasts")
	if(state == "do_grope_breasts"):
		playAnimation(StageScene.BreastGroping, "grope", {pc="pc", npc="kait", npcBodyState={hard=true}})
		saynn("You stop gently caressing her chest and instead start to actually grope them, your fingers kneading the soft breasts, sinking into the fur a bit. Kait instantly lets out a little gasp, pressing her back against you.")

		saynn("[say=kait]Ohh.. yes.. like that..[/say]")

		saynn("You keep squeezing her breasts, again and again.. until it happens.")

		saynn("A tiny fountain of milk squirts out from one of her nipples. Kait moans.")

		saynn("[say=kait]Ah..[/say]")

		saynn("You keep going and soon the other nipple spawns a similar fountain. Of course, you keep going, your hands working away at her breasts. Every time you squeeze, another little squirt of milk shoots out, powerful but thin. The more you knead her chest, the more she leaks.")

		saynn("[say=kait]Mmm.. ah.. hah.. I'm so milky..[/say]")

		saynn("She is squirming a bit now, her breathing getting faster.")

		saynn("You keep milking her, your hands massaging.. encouraging the flow.. And it works, Kait's milk is flowing faster, little streaming of it running down from her enlarged, dark areolas, dripping down to the floor. Kait throws her head back and moans into the air.")

		saynn("[say=kait]Feels.. so good.. ah.. mhh.. yes-s..[/say]")

		saynn("It continues like that for a while.. You can feel her breasts gradually lose a bit of their volume in your hands, the fullness going away. Your hands get tired but you don't stop.")

		saynn("[say=kait]Mhh.. ah..[/say]")

		saynn("Eventually, the flow begins to slow down.. streams turning into rare trickles..")

		saynn("[say=kait]I think that's it..[/say]")

		addButton("Continue", "See what happens next", "grope_after")
	if(state == "grope_after"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="kait", npcBodyState={naked=true, hard=true}})
		saynn("You give her breasts one last gentle squeeze.. and then stop.")

		saynn("Kait lets out a sigh of satisfaction.")

		saynn("[say=kait]So much better.. thank you..[/say]")

		saynn("You pull your hands away.. but they're still a bit wet with her milk. You quickly lick them clean, why not.. tastes sweet.")

		saynn("After that, you help Kait to put the shirt back over her pregnant belly.")

		addButton("Continue", "See what happens next", "endthescene")
func addPumpButtons(go_id):
	var pumps = GM.pc.getInventory().getItemsWithTag(ItemTag.BreastPump)
	for pump in pumps:
		addButton(pump.getVisibleName(), pump.getVisibleDescription(), go_id, [pump])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		fixUniform("kait")
		endScene()
		return

	if(_action == "do_pick_nobreastpump"):
		breastPumpID = ""
		setState("milk_no_pump")
		return

	if(_action == "do_pick_breastpump"):
		var pump = _args[0]
		breastPumpID = pump.getUniqueID()
		#GM.pc.getInventory().removeItem(pump)
		#getCharacter("kait").getInventory().forceEquipRemoveOther(pump)
		setState("do_milk")
		return

	if(_action == "do_put_pump_on"):
		processTime(15*60)
		openShirt("kait")
		var pump = GM.pc.getInventory().getItemByUniqueID(breastPumpID)
		if(pump):
			GM.pc.getInventory().removeItem(pump)
			getCharacter("kait").getInventory().forceEquipRemoveOther(pump)

	if(_action == "grope_floor"):
		openShirt("kait")

	if(_action == "grope_after"):
		fixUniform("kait")

	if(_action == "do_actually_milk_pumps"):
		var pump = getCharacter("kait").getInventory().getItemByUniqueID(breastPumpID)
		var howMuchTransferred = getCharacter("kait").getBodypart(BodypartSlot.Breasts).getFluids().transferTo(pump, 1.0)
		#addMessage("The pump managed to milk Kait's breasts for "+str(Util.roundF(howMuchTransferred))+" ml")
		milkAm = howMuchTransferred
		GM.pc.addSkillExperience(Skill.Milking, 30)
		getCharacter("kait").addEffect(StatusEffect.SoreNipplesAfterMilking)
		getCharacter("kait").updateAppearance()

	if(_action == "endthescene_getbackpump"):
		fixUniform("kait")
		var pump = getCharacter("kait").getInventory().getItemByUniqueID(breastPumpID)
		getCharacter("kait").getInventory().removeEquippedItem(pump)
		GM.pc.getInventory().addItem(pump)
		endScene()
		return

	if(_action == "do_grope_breasts"):
		processTime(15*60)

	if(_action == "grope_after"):
		getCharacter("kait").milk(1.0)
		GM.pc.addSkillExperience(Skill.Milking, 30)
		getCharacter("kait").addEffect(StatusEffect.SoreNipplesAfterMilking)

	setState(_action)

func saveData():
	var data = .saveData()

	data["breastPumpID"] = breastPumpID
	data["milkAm"] = milkAm

	return data

func loadData(data):
	.loadData(data)

	breastPumpID = SAVE.loadVar(data, "breastPumpID", "")
	milkAm = SAVE.loadVar(data, "milkAm", 0.0)
