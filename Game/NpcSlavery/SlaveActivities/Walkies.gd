extends SlaveActivityBase

var petWants = ""
var petLastWant = ""
var petPossibleWants = [
	["shower", 1.0],
	["food", 1.0],
	["play", 1.0],
	["train", 1.0],
	["pee", 0.3],
]
var wantCooldown = 3

var puppyPoints = 0

func getNeedText():
	if(getSlave().getWorkEfficiency() <= 0.1):
		return "Your pet is [b]tired[/b]. Time to end the walkies."
	if(petWants == "shower"):
		return "Your pet wants to be [b]washed[/b] (showers)"
	if(petWants == "food"):
		return "Your pet is [b]hungry[/b] (canteen)"
	if(petWants == "play"):
		return "Your pet wants to [b]play[/b] (yard area)"
	if(petWants == "train"):
		return "Your pet wants to be [b]trained[/b] (yard area)"
	if(petWants == "pee"):
		return "Your pet needs to [b]pee[/b] (showers/yard)"
	return "Your pet doesn't want anything currently. Walk around until a new need arises."

func generateNextWant():
	petWants = RNG.pickWeightedPairs(petPossibleWants)
	while(petWants == petLastWant):
		petWants = RNG.pickWeightedPairs(petPossibleWants)

func getRequiredPuppyPoints() -> int:
	var puppySkill = getSlave().getSlaveSkill(SlaveType.Pet)
	return 1 + int(sqrt(puppySkill+1)*1.5)

func generateNextWantIfNeeded(chanceToGenerate = 20):
	if(petWants != ""):
		return
	if(wantCooldown > 0):
		wantCooldown -= 1
		return
	if(RNG.chance(chanceToGenerate)):
		generateNextWant()
		wantCooldown = 5

func satisfyWant(theWant):
	#if(getSlave().getWorkEfficiency() <= 0.1):
	#	petWants = ""
	#	return
	if(theWant == petWants):
		GM.main.addMessage("Pet's want is satisfied!")
		petLastWant = petWants
		petWants = ""
		puppyPoints += 1
		getSlave().addExperience(10)

func onPat():
	puppyPoints += 1
	getSlave().addExperience(5)

func onEnd():
	if(puppyPoints >= getRequiredPuppyPoints()):
		if(getSlave().levelupSpecialization(SlaveType.Pet)):
			GM.main.addMessage("Your pet got trained enough to reach the next pet skill rank.")
		elif(getSlave().getSlaveSkill(SlaveType.Pet) >= 15):
			getSlave().addExperience(50)
			GM.main.addMessage("Your pet received 50 slave experience for great walkies.")

func _init():
	id = "Walkies"
	
func getVisibleName():
	return "On walkies"

func onStart(_args = []):
	pass

func onNewDay():
	pass

func preventsStatsDecay():
	return false

func preventsNormalInteractions():
	return true

func getActivityText():
	return "You shouldn't see this!"

func hoursPassed(_howMuch):
	return

func getCustomInteractAnimInfo():
	return [StageScene.Solo, "stand", {pc="pc"}]

func saveData():
	var data = .saveData()
	
	data["petWants"] = petWants
	data["petLastWant"] = petLastWant
	data["puppyPoints"] = puppyPoints
	
	return data

func loadData(_data):
	.loadData(_data)
	
	petWants = SAVE.loadVar(_data, "petWants", "")
	petLastWant = SAVE.loadVar(_data, "petLastWant", "")
	puppyPoints = SAVE.loadVar(_data, "puppyPoints", 0)
