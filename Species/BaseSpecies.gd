extends Reference
class_name Species

const Any = "any"
const AnyNPC = "anynpc" # Dynamic npcs can generate with bodyparts that are tagged with this
const Human = "human"
const Feline = "feline"
const Dragon = "dragon"
const Canine = "canine"
const Equine = "equine"
const Demon = "demon"
const Unknown = "unknown"

var id = "error"

func _init():
	pass
	
func getVisibleName():
	return "Error"
	
func getVisibleDescription():
	return "Not implemented, Let the developer know"

func getDefaultLegs(_gender):
	return "plantilegs"

func getDefaultBreasts(_gender):
	if(_gender in [Gender.Male]):
		return "malebreasts"
	
	return "humanbreasts"

func getDefaultHair(_gender):
	return "baldhair"
	
func getDefaultTail(_gender):
	return null

func getDefaultBody(_gender):
	return "anthrobody"

func getDefaultHead(_gender):
	return "humanhead"
	
func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultEars(_gender):
	return "felineears"

func getDefaultHorns(_gender):
	return null

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "humanpenis"
	else:
		return null

func getDefaultVagina(_gender):
	if(_gender in [Gender.Female, Gender.Androgynous]):
		return "vagina"
	else:
		return null

func getDefaultAnus(_gender):
	return "anus"

func getDefaultForSlot(slot, _gender):
	if(slot == BodypartSlot.Legs):
		return getDefaultLegs(_gender)
	if(slot == BodypartSlot.Breasts):
		return getDefaultBreasts(_gender)
	if(slot == BodypartSlot.Hair):
		return getDefaultHair(_gender)
	if(slot == BodypartSlot.Tail):
		return getDefaultTail(_gender)
	if(slot == BodypartSlot.Body):
		return getDefaultBody(_gender)
	if(slot == BodypartSlot.Head):
		return getDefaultHead(_gender)
	if(slot == BodypartSlot.Arms):
		return getDefaultArms(_gender)
	if(slot == BodypartSlot.Ears):
		return getDefaultEars(_gender)
	if(slot == BodypartSlot.Horns):
		return getDefaultHorns(_gender)
	if(slot == BodypartSlot.Penis):
		return getDefaultPenis(_gender)
	if(slot == BodypartSlot.Vagina):
		return getDefaultVagina(_gender)
	if(slot == BodypartSlot.Anus):
		return getDefaultAnus(_gender)
	
	return null

# A hackish method to tie together two gender types, sorry
func getDefaultForSlotForNpcGender(slot, npcgender):
	var normalGender = NpcGender.toNormalGender(npcgender)
	
	if(slot in [BodypartSlot.Penis]):
		if(npcgender in [NpcGender.Peachboy]):
			normalGender = Gender.Female
		if(npcgender in [NpcGender.Herm, NpcGender.Shemale]):
			normalGender = Gender.Male
	if(slot in [BodypartSlot.Vagina]):
		if(npcgender in [NpcGender.Peachboy, NpcGender.Herm]):
			normalGender = Gender.Female
		if(npcgender in [NpcGender.Shemale]):
			normalGender = Gender.Male
	if(slot in [BodypartSlot.Breasts]):
		if(npcgender in [NpcGender.Shemale, NpcGender.Herm]):
			normalGender = Gender.Female
		if(npcgender in [NpcGender.Peachboy]):
			normalGender = Gender.Male
	
	return getDefaultForSlot(slot, normalGender)

# Allows to pick these bodyparts even if they're from another species. Useful for mods
func getAllowedBodyparts():
	return []

func isPlayable():
	return false

# [[amount, weight], [amount, weight]]
func getEggCellOvulationAmount():
	return [
		[1, 10.0],
		[2, 1.0],
	]

# How often is this species will show up in procedural encounters. 0 = never, 0-1 = less often, 1 = default chance, >1 = more often
func npcGenerationWeight():
	if(!isPlayable() || id == "error"):
		return 0.0
	return 1.0

func canBeUsedForNPCType(_npcType):
	return true

func getSkinType():
	return SkinType.Fur

func generateSkinColors():
	return ColorUtils.generateGenericFurryColors()

func onDynamicNpcCreation(_npc, _args):
	# Some examples of what you can do here
	
	## Will make every generated npc bald if uncommented
	#_npc.giveBodypartUnlessSame(GlobalRegistry.createBodypart("baldhair"))
	
	## Will make the npc pink and have an empty skin if uncommented
	#_npc.pickedSkinRColor = Color.pink
	#_npc.pickedSkinGColor = Color.pink
	#_npc.pickedSkinBColor = Color.pink
	#_npc.pickedSkin = "EmptySkin"
	pass

# Disables ability to generate npcs of this species with a mane
func supportsMane():
	return false
