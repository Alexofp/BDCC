extends "res://Scenes/SceneBase.gd"

#var minigameScene = preload("res://Game/Minigames/Struggling/StrugglingGameControl.tscn")
var minigameScene = preload("res://Game/Minigames/Struggling/StrugglingGame.tscn")

func _init():
	sceneID = "MeScene"

func _run():
	if(state == ""):
		#GM.pc.cummedInVaginaBy("nova")
		if(GM.main.getFlag(Flag.Game_CompletedPrologue)):
			var genderSTR = "a male"
			if(GM.pc.getGender() == Gender.Female):
				genderSTR = "a female"
			if(GM.pc.getGender() == Gender.Androgynous):
				genderSTR = "an androgynous"
			if(GM.pc.getGender() == Gender.Other):
				genderSTR = "a non-gender"
			var badThingName = "was imprisoned for the crime of theft"
			if(GM.main.getFlag(Flag.Player_Crime_Type) == Flag.Crime_Type.Innocent):
				badThingName = "was wrongly imprisoned"
			if(GM.main.getFlag(Flag.Player_Crime_Type) == Flag.Crime_Type.Murder):
				badThingName = "was imprisoned for the crime of murder"
			if(GM.main.getFlag(Flag.Player_Crime_Type) == Flag.Crime_Type.Prostitution):
				badThingName = "was imprisoned for the crime of prositution"
			saynn(GM.pc.getName() +" is "+genderSTR+" "+GM.pc.getSpeciesFullName() + " that "+badThingName+". Sentence length is indefinite")
		
		sayn("[b]Personal information:[/b]")
		sayn("Name: "+GM.pc.getName())
		sayn("Species: "+GM.pc.getSpeciesFullName())
		sayn("Gender: "+Gender.genderToString(GM.pc.getGender()).capitalize())
		sayn("Pronouns: "+Gender.genderToPronouns(GM.pc.getPronounGender()))
		
		sayn("Femininity: "+str(GM.pc.getFemininity())+"%")
		sayn("Thickness: "+str(GM.pc.getThickness())+"%")
		
		sayn("")
		
		sayn("[b]Bio information:[/b]")
		sayn("Intoxication: "+str(round(GM.pc.getIntoxicationLevel()*100.0))+"%")
		sayn("Intoxication tolerance: "+str(round(GM.pc.getIntoxicationTolerance()*100.0))+"%")
		var menstrualCycle: MenstrualCycle = GM.pc.getMenstrualCycle()
		if(menstrualCycle != null && menstrualCycle.hasAnyWomb()):
			sayn("Menstruation cycle: "+str(CycleStage.getVisibleActionName(menstrualCycle.getCurrentStage())))
			sayn("Cycle length: "+str(Util.roundF(menstrualCycle.getCycleLength()/60.0/60.0/24.0, 1))+" days")
			sayn("Visible pregnant: "+str(menstrualCycle.isVisiblyPregnant()))
			sayn("Is in heat: "+str(menstrualCycle.isInHeat()))
			sayn("Estimate chance of becoming pregnant after sex: "+str(Util.roundF(menstrualCycle.getRoughChanceOfBecomingPregnant(), 1))+"%")
			sayn("Fertility: "+str(Util.roundF(GM.pc.getFertility()*100.0, 1))+"%")
		if(GM.pc.hasPenis()):
			sayn("Virility: "+str(Util.roundF(GM.pc.getVirility()*100.0, 1))+"%")
		sayn("")
		
		var bodyparts = GM.pc.getBodyparts()
		for bodypartSlot in bodyparts:
			var slotName = BodypartSlot.getVisibleName(bodypartSlot)
			var bodypart: Bodypart = bodyparts[bodypartSlot]
			sayn("[b]"+slotName+"[/b]")
			
			if(bodypart == null):
				sayn("Nothing")
				continue
				
			sayn("Type: "+bodypart.getName())
			for attribData in bodypart.getAttributesText():
				sayn(attribData[0]+": "+str(attribData[1]))
			if(bodypart.getOrifice() != null):
				sayn("Orifice type: "+bodypart.getOrificeName())
				for attribData in bodypart.getOrifice().getAttributesText():
					sayn(attribData[0]+": "+str(attribData[1]))
			if(bodypart.getFluidProduction() != null):
				for attribData in bodypart.getFluidProduction().getAttributesText():
					sayn(attribData[0]+": "+str(attribData[1]))
		
		sayn("")
		
		sayn("[b]Stats:[/b]")
		for statID in Stat.getAll():
			var howmuch = GM.pc.getStat(statID)
			var statObject:StatBase = GlobalRegistry.getStat(statID)
			sayn(statObject.getVisibleName()+": "+str(howmuch))
				
		sayn("")
		sayn("[b]Skills:[/b]")
		var skills = GM.pc.getSkillsHolder().getSkills()
		if(skills.size() == 0):
			sayn("No learned skills")
		for skillID in skills:
			var skill: SkillBase = skills[skillID]
			sayn(skill.getVisibleName()+": level "+str(skill.getLevel()))
				
				
		addButton("Close", "Continue on your way", "endthescene")
		addButtonUnlessLate("Wait here", "Spend some time idling", "wait")
		addButton("Masturbate", "Do the thing", "domasturbate")
		addButton("Gender", "Pick your gender", "pickgender")
		addButton("Pronouns", "Pick your pronouns", "pickpronouns")
		if(!getFlag(Flag.Game_PickedStartingPerks, false)):
			addButton("Pick Perks!", "Pick your starting perks. You can only do this once", "pickstartingperks")
		#addButton("[debug] Struggle", "Test the struggle minigame", "teststruggle")
		
	if(state == "domasturbate"):
		saynn("You remove some stress by masturbating (temporary text)")
		
		addButton("Continue", "Good", "")
		
	if(state == "teststruggle"):
		var game = minigameScene.instance()
		game.setDifficulty(4)
		game.connect("minigameCompleted", self, "onMinigameTest")
		GM.ui.addCustomControl("minigame", game)

		addButton("Continue", "Good", "")

	if(state == "pickgender"):
		say("Pick your character's gender. This will affect the color of your speech and how others treat you. This can be changed at any point")
		
		addButton("Male", "You're a guy", "setgender", [Gender.Male])
		addButton("Female", "You're a girl", "setgender", [Gender.Female])
		addButton("Androgynous", "Somewhere in between", "setgender", [Gender.Androgynous])
		addButton("Other", "Something else", "setgender", [Gender.Other])
		addButton("back", "Keep your current gender", "")

	if(state == "pickpronouns"):
		say("Pick your character's pronouns. This can be changed at any point")
		addButton("Same as gender", "Use your gender's pronouns", "setpronouns", [null])
		addButton("Male", "He/his", "setpronouns", [Gender.Male])
		addButton("Female", "She/her", "setpronouns", [Gender.Female])
		addButton("Androgynous", "They/their", "setpronouns", [Gender.Androgynous])
		addButton("Other", "It/its", "setpronouns", [Gender.Other])
		addButton("back", "Keep your pronouns", "")
	
	if(state == "wait"):
		saynn("Choose how long do you want wait.")
		
		addButton("5 minutes", "Wait this much", "dowait", [5*60])
		addButton("15 minutes", "Wait this much", "dowait", [15*60])
		addButton("30 minutes", "Wait this much", "dowait", [30*60])
		addButton("1 hour", "Wait this much", "dowait", [1*60*60])
		addButton("2 hours", "Wait this much", "dowait", [2*60*60])
		addButton("3 hours", "Wait this much", "dowait", [3*60*60])
		addButton("back", "Don't wait", "")

func onMinigameTest(_score):
	GM.main.pickOption("", [])

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "setgender"):
		GM.pc.setGender(_args[0])
		setState("")
		return
		
	if(_action == "setpronouns"):
		GM.pc.setPronounGender(_args[0])
		setState("")
		return
	
	if(_action == "domasturbate"):
		runScene("MasturbationScene")
		endScene()
		return
		#processTime(5*60)
		#GM.pc.orgasmFrom("pc")
	
	if(_action == "dowait"):
		var newt = _args[0]
		
		GM.main.processTime(newt)
		
		setState("")
		return
	
	if(_action == "pickstartingperks"):
		setFlag(Flag.Game_PickedStartingPerks, true)
		runScene("PickStartingPerksScene")
		setState("")
		return
	
	setState(_action)
