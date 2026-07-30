extends "res://Scenes/SceneBase.gd"

var randomName:String = ""
var randomNameGender:int = Gender.Other

func _init():
	sceneID = "CharacterNameGeneratorScene"

func _run():
	if(state == ""):
		if(randomName == ""):
			saynn("Choose which dictionary to use for name generation.")
		else:
			saynn("Random name: [color="+getColorStringForGender(randomNameGender)+"]" + randomName + "[/color]")

		addButton("Any", "Generate a random feminine or masculine name", "generate_name_any")
		addButton("Feminine", "Generate a random feminine name", "generate_name_fem")
		addButton("Masculine", "Generate a random masculine name", "generate_name_masc")

		if(randomName != ""):
			addButtonAt(10, "Confirm", "Proceed with selected name", "confirm")
		else:
			addDisabledButtonAt(10, "Confirm", "You need to generate a name first")
		addButtonAt(11, "Cancel", "Enter a name manually", "cancel")

func _react(_action: String, _args):
	if(_action == "confirm"):
		endScene({random_name=randomName,random_name_gender=randomNameGender})
		return
	if(_action == "cancel"):
		endScene({})
		return

	if(_action == "generate_name_any"):
		randomName = RNG.randomFemaleName() if RNG.chance(50) else RNG.randomMaleName()
		randomNameGender = Gender.Androgynous
		return
	if(_action == "generate_name_fem"):
		randomName = RNG.randomFemaleName()
		randomNameGender = Gender.Female
		return
	if(_action == "generate_name_masc"):
		randomName = RNG.randomMaleName()
		randomNameGender = Gender.Male
		return

func getColorStringForGender(gender:int):
	if(gender == Gender.Male):
		return "#5696EA"
	if(gender == Gender.Female):
		return "#FF837A"
	if(gender == Gender.Androgynous):
		return "#BA82FF"
	if(gender == Gender.Other):
		return "#77D86C"
	return "#FF0000"

func saveData():
	var data = .saveData()
	
	data["randomName"] = randomName
	data["randomNameGender"] = randomNameGender

	return data
	
func loadData(data):
	.loadData(data)
	
	randomName = SAVE.loadVar(data, "randomName", "")
	randomNameGender = SAVE.loadVar(data, "randomNameGender", Gender.Other)
