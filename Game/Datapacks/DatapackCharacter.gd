extends Reference
class_name DatapackCharacter

var id:String = "error"
var name:String = "New character"
var description:String = "No description provided"
var gender = Gender.Male
var pronounsGender = null
var hasChatColor:bool = false
var chatColor:Color = Color.white
var species:Array = []
var customSpeciesName:String = ""

var femininity:int = 50
var thickness:int = 50

var level:int = 0
var basePain:int = 100
var baseLust:int = 100
var baseStamina:int = 100
var stats:Dictionary = {
	Stat.Strength: 0,
	Stat.Agility: 0,
	Stat.Vitality: 0,
	Stat.Sexiness: 0,
}
var perks:Array = []

var bodyparts:Dictionary = {}

var characterType:String = CharacterType.Inmate
var inmateType:int = InmateType.Unknown

var pickedSkin:String = "EmptySkin"
var pickedSkinRColor:Color = Color.white
var pickedSkinGColor:Color = Color.lightgray
var pickedSkinBColor:Color = Color.darkgray

var equippedItems:Dictionary = {}

var attacks:Array = []

var personality:Dictionary = {}
var fetishes:Dictionary = {}
var lustInterests:Dictionary = {}

var portrait:DatapackImage = DatapackImage.new()
var portraitNaked:DatapackImage = DatapackImage.new()

var lootTableID = "base"
var lootCreditsChance:float = 50
var lootCreditsMin:int = 1
var lootCreditsMax:int = 5
var lootExtra:Array = []

var excludeEncounters:bool = false
var disableForget:bool = false
var disableBirth:bool = false
var disableMeet:bool = false

var restraintDodgeChanceMult:float = 0.9
var restraintStrugglePower:float = 1.0

func getPortrait(kind:Array):
	if(portrait.isEmpty() && portraitNaked.isEmpty()):
		return null
	
	if(kind.has("naked") && portraitNaked != null):
		if(!portraitNaked.isEmpty()):
			return portraitNaked.getTexture()
	if(!portrait.isEmpty()):
		return portrait.getTexture()
	return null

func getEditorName():
	return "id="+id+" name="+name

func getEditVars():
	var attackListFancy = []
	for attackID in GlobalRegistry.getAttacks():
		var attackObj:Attack = GlobalRegistry.getAttack(attackID)
		if(attackObj.isPlayerAttack):
			continue
		attackListFancy.append([attackID, attackID+" = "+attackObj.getVisibleName()])
	var perkListFancy = []
	for perkID in GlobalRegistry.getPerks():
		var thePerk:PerkBase = GlobalRegistry.getPerk(perkID)
		perkListFancy.append([perkID, perkID+" = "+thePerk.getVisibleName()])
	
	return {
		"name": {
			name = "Name",
			type = "string",
			value = name,
		},
		"description": {
			name = "description",
			type = "bigString",
			value = description,
		},
		"gender": {
			name = "Gender",
			type = "selector",
			value = gender,
			values = [
				[Gender.Male, "Male"],
				[Gender.Female, "Female"],
				[Gender.Androgynous, "Androgynous"],
				[Gender.Other, "Other"],
			],
			noseparator=true,
		},
		"pronounsGender": {
			name = "Pronouns gender",
			type = "selector",
			value = pronounsGender,
			values = [
				[null, "Same as gender"],
				[Gender.Male, "Male"],
				[Gender.Female, "Female"],
				[Gender.Androgynous, "Androgynous"],
				[Gender.Other, "Other"],
			],
			#noseparator=true,
		},
		"femininity": {
			name = "Femininity",
			type = "number",
			int=true,
			value = femininity,
		},
		"thickness": {
			name = "Thickness",
			type = "number",
			int=true,
			value = thickness,
		},
		"hasChatColor": {
			name = "Enable custom chat color",
			type = "checkbox",
			value = hasChatColor,
			noseparator=true,
		},
		"chatColor": {
			name = "Custom chat color",
			type = "color",
			value = chatColor,
		},
		"characterType": {
			name = "Character type",
			type = "selector",
			values = CharacterType.getAllForDatapackCharacter(),
			value = characterType,
		},
		"inmateType": {
			name = "Inmate type (or unknown)",
			type = "selector",
			values = InmateType.getAllWithNames(),
			value = inmateType,
		},
		"species": {
			name = "Species",
			type = "addRemoveList",
			value = species,
			values = GlobalRegistry.getAllSpecies().keys(),
			collapsable = true,
		},
		"customSpeciesName": {
			name = "Custom species name (optional)",
			type = "string",
			value = customSpeciesName,
			addtoprev=true,
		},
		"skin": {
			name = "Base skin",
			type = "skin",
			skins = GlobalRegistry.getSkinsAllKeys(),
			value = {skin=pickedSkin, r=pickedSkinRColor, g=pickedSkinGColor, b=pickedSkinBColor},
			noBase = true,
		},
		"bodyparts": {
			name = "Bodyparts",
			type = "bodyparts",
			value = bodyparts,
			collapsable = true,
		},
		"equippedItems": {
			name = "Default equipment",
			type = "equippedItems",
			value = equippedItems,
			collapsable = true,
		},
		"attacks": {
			name = "Attacks",
			type = "addRemoveList",
			value = attacks,
			values = attackListFancy,
			collapsable = true,
		},
		"stats": {
			name = "Stats",
			type = "stats",
			value = stats,
			collapsable = true,
		},
		"level": {
			name = "Character level",
			type = "number",
			value = level,
			int=true,
			addtoprev = true,
		},
		"basePain": {
			name = "Base pain",
			type = "number",
			value = basePain,
			int=true,
			addtoprev = true,
		},
		"baseLust": {
			name = "Base lust",
			type = "number",
			value = baseLust,
			int=true,
			addtoprev = true,
		},
		"baseStamina": {
			name = "Base stamina",
			type = "number",
			value = baseStamina,
			int=true,
			addtoprev = true,
		},
		"restraintDodgeChanceMult": {
			name = "Restraint dodge chance (0.9 = default, <0.9 = harder to tie up, >0.9 = easier to tie up)",
			type = "number",
			value = restraintDodgeChanceMult,
			addtoprev = true,
			step = 0.01,
		},
		"restraintStrugglePower": {
			name = "Struggle power mult (1 = default, <1 = worse at struggling, >1 = better at struggling)",
			type = "number",
			value = restraintStrugglePower,
			addtoprev = true,
			step = 0.01,
		},
		"perks": {
			name = "Perks",
			type = "addRemoveList",
			value = perks,
			values = perkListFancy,
			collapsable = true,
		},
		"personality": {
			name = "Personality",
			type = "personality",
			value = personality,
			collapsable = true,
		},
		"fetishes": {
			name = "Fetishes",
			type = "fetishes",
			value = fetishes,
			collapsable = true,
		},
		"lustInterests": {
			name = "Likes/dislikes",
			type = "likesDislikes",
			value = lustInterests,
			collapsable = true,
		},
		"lootTable": {
			name = "Loot table",
			type = "lootTable",
			value = {
				baseTableID = lootTableID,
				creditsDropChance = lootCreditsChance,
				creditsMin = lootCreditsMin,
				creditsMax = lootCreditsMax,
				customLoot = lootExtra.duplicate(),
			},
			collapsable = true,
		},
		"portrait": {
			name = "Portrait (normal)",
			type = "image",
			value = portrait.getImage(),
		},
		"portraitNaked": {
			name = "Portrait (naked)",
			type = "image",
			value = portraitNaked.getImage(),
		},
		"excludeEncounters": {
			name = "Exclude from encounters",
			type = "checkbox",
			value = excludeEncounters,
			collapsable = true,
		},
		"disableForget": {
			name = "Disable ability to forget this character",
			type = "checkbox",
			value = disableForget,
			addtoprev = true,
			noseparator=true,
		},
		"disableMeet": {
			name = "Disable ability to meet this character",
			type = "checkbox",
			value = disableMeet,
			addtoprev = true,
			noseparator=true,
		},
		"disableBirth": {
			name = "Disable automatic child birth for this character",
			type = "checkbox",
			value = disableBirth,
			addtoprev = true,
			noseparator=true,
		},
	}

func applyEditVar(varid, value):
	if(varid == "name"):
		name = value
	if(varid == "description"):
		description = value
	if(varid == "gender"):
		gender = value
	if(varid == "pronounsGender"):
		pronounsGender = value
	if(varid == "femininity"):
		femininity = value
		return true
	if(varid == "thickness"):
		thickness = value
		return true
	if(varid == "hasChatColor"):
		hasChatColor = value
	if(varid == "chatColor"):
		chatColor = value
	if(varid == "species"):
		species = value
	if(varid == "customSpeciesName"):
		customSpeciesName = value
	if(varid == "bodyparts"):
		bodyparts = value
		return true
	if(varid == "skin"):
		pickedSkin = value["skin"]
		pickedSkinRColor = value["r"]
		pickedSkinGColor = value["g"]
		pickedSkinBColor = value["b"]
		return true
	if(varid == "characterType"):
		characterType = value
		#return true
	if(varid == "inmateType"):
		inmateType = value
		#return true
	if(varid == "equippedItems"):
		equippedItems = value
		return true
	if(varid == "attacks"):
		attacks = value
	if(varid == "personality"):
		personality = value
	if(varid == "fetishes"):
		fetishes = value
	if(varid == "lustInterests"):
		lustInterests = value
	if(varid == "stats"):
		stats = value
	if(varid == "perks"):
		perks = value
	if(varid == "level"):
		level = value
	if(varid == "basePain"):
		basePain = value
	if(varid == "baseLust"):
		baseLust = value
	if(varid == "baseStamina"):
		baseStamina = value
	if(varid == "portrait"):
		portrait.setImage(value)
	if(varid == "portraitNaked"):
		portraitNaked.setImage(value)
	if(varid == "lootTable"):
		lootTableID = value["baseTableID"]
		lootCreditsChance = value["creditsDropChance"]
		lootCreditsMin = value["creditsMin"]
		lootCreditsMax = value["creditsMax"]
		lootExtra = value["customLoot"].duplicate()
	if(varid == "excludeEncounters"):
		excludeEncounters = value
	if(varid == "disableForget"):
		disableForget = value
	if(varid == "disableBirth"):
		disableBirth = value
	if(varid == "disableMeet"):
		disableMeet = value
	if(varid == "restraintDodgeChanceMult"):
		restraintDodgeChanceMult = value
	if(varid == "restraintStrugglePower"):
		restraintStrugglePower = value
	
	return false

func saveData():
	return {
		"name": name,
		"description": description,
		"gender": gender,
		"pronounsGender": pronounsGender,
		"femininity": femininity,
		"thickness": thickness,
		"hasChatColor": hasChatColor,
		"chatColor": chatColor.to_html(),
		"species": species,
		"customSpeciesName": customSpeciesName,
		"bodyparts": bodyparts,
		"pickedSkin": pickedSkin,
		"pickedSkinRColor": pickedSkinRColor.to_html(),
		"pickedSkinGColor": pickedSkinGColor.to_html(),
		"pickedSkinBColor": pickedSkinBColor.to_html(),
		"characterType": characterType,
		"inmateType": inmateType,
		"equippedItems": equippedItems,
		"attacks": attacks,
		"personality": personality,
		"fetishes": fetishes,
		"lustInterests": lustInterests,
		"stats": stats,
		"perks": perks,
		"level": level,
		"basePain": basePain,
		"baseLust": baseLust,
		"baseStamina": baseStamina,
		"portrait": portrait.saveData(),
		"portraitNaked": portraitNaked.saveData(),
		"lootTableID": lootTableID,
		"lootCreditsChance": lootCreditsChance,
		"lootCreditsMin": lootCreditsMin,
		"lootCreditsMax": lootCreditsMax,
		"lootExtra": lootExtra,
		"excludeEncounters": excludeEncounters,
		"disableForget": disableForget,
		"disableBirth": disableBirth,
		"disableMeet": disableMeet,
		"restraintDodgeChanceMult": restraintDodgeChanceMult,
		"restraintStrugglePower": restraintStrugglePower,
	}

func loadData(data):
	name = loadVar(data, "name", "No name")
	description = loadVar(data, "description", "No description provided")
	gender = loadVar(data, "gender", Gender.Male)
	pronounsGender = loadVar(data, "pronounsGender", null)
	femininity = loadVar(data, "femininity", 50)
	thickness = loadVar(data, "thickness", 50)
	hasChatColor = loadVar(data, "hasChatColor", false)
	chatColor = Color(loadVar(data, "chatColor", "ffffff"))
	species = loadVar(data, "species", [])
	customSpeciesName = loadVar(data, "customSpeciesName", "")
	bodyparts = loadVar(data, "bodyparts", {})
	pickedSkin = loadVar(data, "pickedSkin", "EmptySkin")
	pickedSkinRColor = Color(SAVE.loadVar(data, "pickedSkinRColor", "ffffff"))
	pickedSkinGColor = Color(SAVE.loadVar(data, "pickedSkinGColor", "cccccc"))
	pickedSkinBColor = Color(SAVE.loadVar(data, "pickedSkinBColor", "999999"))
	characterType = loadVar(data, "characterType", CharacterType.Inmate)
	inmateType = loadVar(data, "inmateType", InmateType.Unknown)
	equippedItems = loadVar(data, "equippedItems", {})
	attacks = loadVar(data, "attacks", [])
	personality = loadVar(data, "personality", {})
	fetishes = loadVar(data, "fetishes", {})
	lustInterests = loadVar(data, "lustInterests", {})
	stats = loadVar(data, "stats", {})
	perks = loadVar(data, "perks", [])
	level = loadVar(data, "level", 0)
	basePain = loadVar(data, "basePain", 100)
	baseLust = loadVar(data, "baseLust", 100)
	baseStamina = loadVar(data, "baseStamina", 100)
	portrait.loadData(loadVar(data, "portrait", PoolByteArray()))
	portraitNaked.loadData(loadVar(data, "portraitNaked", PoolByteArray()))
	lootTableID = loadVar(data, "lootTableID", "base")
	lootCreditsChance = loadVar(data, "lootCreditsChance", 50)
	lootCreditsMin = loadVar(data, "lootCreditsMin", 1)
	lootCreditsMax = loadVar(data, "lootCreditsMax", 5)
	lootExtra = loadVar(data, "lootExtra", [])
	excludeEncounters = loadVar(data, "excludeEncounters", false)
	disableForget = loadVar(data, "disableForget", false)
	disableBirth = loadVar(data, "disableBirth", false)
	disableMeet = loadVar(data, "disableMeet", false)
	restraintDodgeChanceMult = loadVar(data, "restraintDodgeChanceMult", 0.9)
	restraintStrugglePower = loadVar(data, "restraintStrugglePower", 1.0)

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue

