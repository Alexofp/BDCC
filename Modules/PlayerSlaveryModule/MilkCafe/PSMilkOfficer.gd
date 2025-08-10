extends Character

func _init():
	id = "psmilkofficer"
	npcHasMenstrualCycle = false
	
	pickedSkin="LoyalSkin"
	pickedSkinRColor=Color("ff4d2728")
	pickedSkinGColor=Color("ff26140e")
	pickedSkinBColor=Color("ff803122")
	npcSkinData={
	"hair": {"r": Color("ff7c5643"),"g": Color("ff895231"),"b": Color("ff3f5e9e"),},
	"ears": {"skin": "wolfearspierced2","g": Color("ff2d4eb4"),"b": Color("ff868cc0"),},
	"penis": {"skin": "Weiny","g": Color("ff3272fa"),"b": Color("ff37197b"),},
	}
	
	
func _getName():
	return "Officer"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A strong male wolf."

func getSpecies():
	return [Species.Canine]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("combedbackhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 25
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("caninetail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["OfficialClothes"]

#func getLootTable(_battleName):
#	return InmateLoot.new()
