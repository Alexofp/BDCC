extends Control
class_name StatusEffectsPanel

var uiblockScene = preload("res://UI/StatusEffectsPanel/EffectUIBlock.tscn")

var battleEffects = []
var statusEffects = []

enum EffectType {Normal, Green, Red}

onready var optionTooltip = $CanvasLayer/TooltipDisplay
onready var flexContainer = $FlexGridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	addBattleEffect(EffectType.Normal, "Bleeding", "You bleed", "res://UI/StatusEffectsPanel/images/bleeding.png")
	addBattleEffect(EffectType.Green, "Bleeding", "You bleed", "res://UI/StatusEffectsPanel/images/bleeding.png")
	addBattleEffect(EffectType.Red, "Bleeding", "You bleed", "res://UI/StatusEffectsPanel/images/bleeding.png")
	#clearBattleEffects()
	#addBattleEffect(EffectType.Red, "Bleeding 2", "You bleed 2", "res://UI/StatusEffectsPanel/images/bleeding.png")

func addBattleEffect(type, text, desc, texture = null):
	var block = uiblockScene.instance()
	if(type == EffectType.Green):
		block.makeGreen()
	if(type == EffectType.Red):
		block.makeRed()
	if(texture):
		block.setTexture(texture)
	block.setNameAndDesc(text, desc)
	block.connect("mouse_entered", self, "onBlockMouseEntered", [block])
	block.connect("mouse_exited", self, "onBlockMouseExited")
	battleEffects.append(block)
	
	flexContainer.add_child(block)
	flexContainer.move_child(block, 0)

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
