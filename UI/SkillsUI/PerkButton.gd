extends Control

var perk
signal perkClicked(perkID)
var showCost:bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setPerk(theperk: PerkBase, shouldShowCost:bool = true):
	perk = theperk
	showCost = shouldShowCost

	if(GM.pc.getSkillsHolder().hasPerk(perk.id)):
		modulate = Color.green
	elif(GM.pc.getSkillsHolder().isPerkDisabled(perk.id)):
		modulate = Color.yellow
	elif(!GM.pc.getSkillsHolder().canUnlockPerk(perk.id)):
		modulate = Color.red
	else:
		modulate = Color.white
	
	$PerkButtonRect.texture = load(perk.getPicture())


func _on_TextureButton_pressed():
	emit_signal("perkClicked", perk.id if perk != null else "")


func _on_TextureButton_mouse_entered():
	if(perk == null):
		return
	GlobalTooltip.showTooltip(perk.getVisibleName(), (("Cost: "+str(perk.getCost())+"\n") if showCost else "")+perk.getVisibleDescription())


func _on_TextureButton_mouse_exited():
	GlobalTooltip.hideTooltip()

func setSkippedPerk():
	$PerkButtonRect.texture = preload("res://UI/SkillsUI/sprites/perkSkip.png")
