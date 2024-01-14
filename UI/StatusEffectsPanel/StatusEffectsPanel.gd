extends PanelContainer
class_name StatusEffectsPanel

var uiblockScene = preload("res://UI/StatusEffectsPanel/EffectUIBlock.tscn")

var battleEffects = []
var statusEffects = []

export(bool) var showTooltipBelow = false
onready var flexContainer = $FlexGridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	clearStatusEffects()

func addEffect(col, text, desc, texture = null, isWide = false):
	var block = uiblockScene.instance()
	block.setColor(col)
	block.tooltipShouldBeWide = isWide
#	if(type == EffectType.Green):
#		block.makeGreen()
#	if(type == EffectType.Red):
#		block.makeRed()
#	if(type == EffectType.Purple):
#		block.makePurple()
	if(texture):
		block.setTexture(texture)
	block.setNameAndDesc(text, desc)
	block.connect("mouse_entered", self, "onBlockMouseEntered", [block])
	block.connect("mouse_exited", self, "onBlockMouseExited")
	
	
	flexContainer.add_child(block)
	return block

func addBattleEffect(type, text, desc, texture = null, isWideTooltip = false):
	var block = addEffect(type, text, desc, texture, isWideTooltip)
	flexContainer.move_child(block, 0)
	battleEffects.append(block)
	
func addStatusEffect(type, text, desc, texture = null, isWideTooltip = false):
	var block = addEffect(type, text, desc, texture, isWideTooltip)
	#flexContainer.move_child(block, 0)
	statusEffects.append(block)

func onBlockMouseEntered(block):
	GlobalTooltip.showTooltip(block.effectName, block.effectDesc, showTooltipBelow, false, block.tooltipShouldBeWide)

func onBlockMouseExited():
	GlobalTooltip.hideTooltip()

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
