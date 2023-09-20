extends Control

onready var perkNameLabel = $ScrollContainer/VBoxContainer/HBoxContainer/PanelContainer2/VBoxContainer/PerkNameLabel
onready var perkDescLabel = $ScrollContainer/VBoxContainer/HBoxContainer/PanelContainer2/VBoxContainer/PerkDescLabel
onready var togglePerkButton = $ScrollContainer/VBoxContainer/HBoxContainer/PanelContainer2/VBoxContainer/HBoxContainer/TogglePerkButton

onready var perksContainer = $ScrollContainer/VBoxContainer/HBoxContainer/PanelContainer/PerksContainer
onready var perksFlexGrid = $ScrollContainer/VBoxContainer/HBoxContainer/PanelContainer/PerksContainer/FlexGridContainer

var perkButtonScene = preload("res://UI/SkillsUI/PerkButton.tscn")

var selectedPerkID

func _ready():
	togglePerkButton.visible = false

func updatePerks():
	Util.delete_children(perksFlexGrid)

	var allPerks = GlobalRegistry.getPerksIDsBySkill(Skill.Start) + GlobalRegistry.getPerksIDsBySkill(Skill.Inherent)
	
	for perkID in allPerks:
		var perk: PerkBase = GlobalRegistry.getPerk(perkID)
		if(GM.pc.getSkillsHolder().hasPerkDisabledOrNot(perk.id)):
			if(perk.hiddenWhenUnlocked()):
				continue
		else:
			if(perk.hiddenWhenLocked()):
				continue
		
		var perkButton = perkButtonScene.instance()
		perksFlexGrid.add_child(perkButton)
		perkButton.setPerk(perk)
		var _ok = perkButton.connect("perkClicked", self, "onPerkButton")
		
func onPerkButton(perkID):
	selectedPerkID = perkID
	updatePerkText()

func updatePerkText():
	var perkID = selectedPerkID
	if(perkID == null || perkID == ""):
		return
	var perk: PerkBase = GlobalRegistry.getPerk(perkID)
	
	perkNameLabel.text = perk.getVisibleName()
	if(GM.pc.getSkillsHolder().isPerkDisabled(perkID)):
		perkNameLabel.text += " (Disabled)"
	
	perkDescLabel.bbcode_text = perk.getVisibleDescription()
	var extraText = perk.getMoreDescription()
	if(extraText!=""):
		perkDescLabel.bbcode_text += "\n\n"+extraText
	
	togglePerkButton.visible = false
	if(GM.pc.getSkillsHolder().hasPerkDisabledOrNot(perkID)):
		if(perk.toggleable()):
			togglePerkButton.visible = true

func _on_TogglePerkButton_pressed():
	GlobalTooltip.resetTooltips()
	if(selectedPerkID == null || selectedPerkID == ""):
		return
	
	GM.pc.getSkillsHolder().togglePerk(selectedPerkID)
	updatePerks()
	updatePerkText()
	
func _on_Inherent_perks_visibility_changed():
	if(visible):
		updatePerks()
