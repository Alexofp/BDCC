extends PanelContainer

var skill: SkillBase
var tierData
var level
var tierIndex

onready var flexGrid = $VBoxContainer/FlexGridContainer
onready var levelLabel = $VBoxContainer/LevelLabel
var perkButtonScene = preload("res://UI/SkillsUI/PerkButton.tscn")

signal perkClicked(perkID)

func _ready():
	pass # Replace with function body.

func setSkillAndTier(theskill, theTierData, thetierIndex):
	skill = theskill
	tierData = theTierData
	tierIndex = thetierIndex
	level = tierData[0]
	
	levelLabel.text = "Unlocks at skill level "+str(level)
	
	updatePerks()


func updatePerks():
	Util.delete_children(flexGrid)

	var allPerks = GlobalRegistry.getPerksIDsBySkill(skill.id)
	
	for perkID in allPerks:
		var perk: PerkBase = GlobalRegistry.getPerk(perkID)
		
		if(perk.getSkillTier() != tierIndex):
			continue
			
		if(GM.pc.getSkillsHolder().hasPerkDisabledOrNot(perk.id)):
			if(perk.hiddenWhenUnlocked()):
				continue
		else:
			if(perk.hiddenWhenLocked()):
				continue
		
		var perkButton = perkButtonScene.instance()
		flexGrid.add_child(perkButton)
		perkButton.setPerk(perk)
		var _ok = perkButton.connect("perkClicked", self, "onPerkButton")
		
func onPerkButton(perkID):
	emit_signal("perkClicked", perkID)
