extends PanelContainer
class_name StatusEffectsPanel

var uiblockScene = preload("res://UI/StatusEffectsPanel/EffectUIBlock.tscn")

var battleEffects = []
var statusEffects = []

enum EffectType {Normal, Green, Red, Purple}

onready var optionTooltip = $CanvasLayer/TooltipDisplay
onready var flexContainer = $FlexGridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	addBattleEffect(EffectType.Normal, "Bleeding", "You bleed", "res://UI/StatusEffectsPanel/images/bleeding.png")
	addBattleEffect(EffectType.Green, "Bleeding", "You bleed", "res://UI/StatusEffectsPanel/images/bleeding.png")
	addBattleEffect(EffectType.Red, "Bleeding", "You bleed", "res://UI/StatusEffectsPanel/images/bleeding.png")
	#clearBattleEffects()
	#addBattleEffect(EffectType.Red, "Bleeding 2", "You bleed 2", "res://UI/StatusEffectsPanel/images/bleeding.png")
	addStatusEffect(EffectType.Red, "status Bleeding 2", "You bleed 2", "res://UI/StatusEffectsPanel/images/bleeding.png")
	clearStatusEffects()

func addEffect(type, text, desc, texture = null):
	var block = uiblockScene.instance()
	if(type == EffectType.Green):
		block.makeGreen()
	if(type == EffectType.Red):
		block.makeRed()
	if(type == EffectType.Purple):
		block.makePurple()
	if(texture):
		block.setTexture(texture)
	block.setNameAndDesc(text, desc)
	block.connect("mouse_entered", self, "onBlockMouseEntered", [block])
	block.connect("mouse_exited", self, "onBlockMouseExited")
	
	
	flexContainer.add_child(block)
	return block

func addBattleEffect(type, text, desc, texture = null):
	var block = addEffect(type, text, desc, texture)
	flexContainer.move_child(block, 0)
	battleEffects.append(block)
	
func addStatusEffect(type, text, desc, texture = null):
	var block = addEffect(type, text, desc, texture)
	#flexContainer.move_child(block, 0)
	statusEffects.append(block)

func onBlockMouseEntered(block):
	optionTooltip.set_is_active(true)
	optionTooltip.set_text(block.effectName, block.effectDesc)

func onBlockMouseExited():
	optionTooltip.set_is_active(false)

func clearBattleEffects():
	for b in battleEffects:
		flexContainer.remove_child(b)
		b.queue_free()
	battleEffects = []

func clearStatusEffects():
	for b in statusEffects:
		flexContainer.remove_child(b)
		b.queue_free()
	statusEffects = []
