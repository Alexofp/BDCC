extends Character

func _init():
	id = "taviDemonFuta"
	
	pickedSkin="TaviSkin"
	pickedSkinRColor=Color("ff57197c")
	pickedSkinGColor=Color("fffedaff")
	pickedSkinBColor=Color("ff00ff1c")
	npcSkinData={
	"hair": {"r": Color("ff7f1b9b"),"g": Color("ff00ff0f"),"b": Color("ff631c89"),},
	"horns": {"r": Color("ff23142a"),"g": Color("ff0c2d16"),},
	"penis": {"g": Color("ff44f45d"),"b": Color("ff0c6214"),},
	}
	
func _getName():
	return "Tavi"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A very tall demon-feline with a unique purple and green fur pattern and shining red/green eyes"

func getSpecies():
	return ["feline", "demon"]

func getThickness() -> int:
	return 110

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("tavihair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("demonhorns2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var penis = GlobalRegistry.createBodypart("equinepenis")
	penis.lengthCM = 25
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("demontail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("hoofs"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 8
	giveBodypartUnlessSame(breasts)
