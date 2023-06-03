extends Control

var perk
signal perkClicked(perkID)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setPerk(theperk: PerkBase):
	perk = theperk

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
	emit_signal("perkClicked", perk.id)


func _on_TextureButton_mouse_entered():
	if(perk == null):
		return
	GlobalTooltip.showTooltip(perk.getVisibleName(), "Cost: "+str(perk.getCost())+"\n"+perk.getVisibleDescription())


func _on_TextureButton_mouse_exited():
	GlobalTooltip.hideTooltip()
