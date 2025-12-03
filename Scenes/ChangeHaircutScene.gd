extends "res://Scenes/SceneBase.gd"

var savedPage:int = 0

func _init():
	sceneID = "ChangeHaircutScene"

func _run():
	if(state == ""):
		if(!GM.pc.isBlindfolded()):
			saynn("You look at yourself in the mirror. There is a comb, scissors and a few others things around that you can use to change how your hair looks.")
		else:
			saynn("You try to look at yourself in the mirror but then you realize that you can't see anything. Awkward. You feel around and fine a comb, scissors and a few others things around that you can use to change how your hair looks.")
		
		addButton("Leave", "You're satisfied with your current haircut", "endthescene")
		addButton("Change Haircut", "Change your haircut", "changehaircutmenu")
		addButton("Change Skin!", "Change your skin and colors", "changeskin")


	if(state == "changehaircutmenu"):
		savedPage = 0
		saynn("Pick the haircut that you want")

	if(state == "changehair"):
		saynn("You humm as you work on your hair, using the instant hair grower and scissors to shape the way your hair looks")

	if(state == "changehaircutmenu" || state == "changehair"):
		addButton("BACK", "This one is good", "")
	
		var activeHaircutBodypartId:String = ""
		if(GM.pc.hasBodypart(BodypartSlot.Hair)):
			var theHaircut:Bodypart = GM.pc.getBodypart(BodypartSlot.Hair)
			activeHaircutBodypartId = theHaircut.id

		for bodypartID in GlobalRegistry.getBodypartsIdsBySlot(BodypartSlot.Hair):
			var bodypart:Bodypart = GlobalRegistry.getBodypartRef(bodypartID)
			var theHaircutIsActive:bool = (bodypart.id == activeHaircutBodypartId)
			var theHaircutName:String = (("["+bodypart.getName()+"]") if theHaircutIsActive else bodypart.getName())
			var theHaircutDesc:String = "This is your current haircut" if(theHaircutIsActive) else "Change your haircut to this one"
			
			addButton(theHaircutName, theHaircutDesc, "changehair", [bodypartID])

		if(savedPage != 0):
			GM.ui.setCurrentPage(savedPage)


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "changeskin"):
		runScene("ChangeSkinScene")
		endScene()
		return
	
	if(_action == "changehair"):
		savedPage = GM.ui.getCurrentPage()

		var savedRColor = Color.white
		var savedGColor = Color.white
		var savedBColor = Color.white
		if(GM.pc.hasBodypart(BodypartSlot.Hair)):
			var theHair:Bodypart = GM.pc.getBodypart(BodypartSlot.Hair)
			savedRColor = theHair.pickedRColor
			savedGColor = theHair.pickedGColor
			savedBColor = theHair.pickedBColor

		var newHair = GlobalRegistry.createBodypart(_args[0])
		if(newHair != null):
			newHair.pickedRColor = savedRColor
			newHair.pickedGColor = savedGColor
			newHair.pickedBColor = savedBColor
			GM.pc.giveBodypartUnlessSame(newHair)
	
	setState(_action)

func saveData():
	var data = .saveData()

	data["savedPage"] = savedPage

	return data
	
func loadData(data):
	.loadData(data)

	savedPage = SAVE.loadVar(data, "savedPage", 0)
